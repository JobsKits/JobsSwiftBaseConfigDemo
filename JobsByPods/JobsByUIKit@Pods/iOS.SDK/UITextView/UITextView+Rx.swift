//
//  UITextView+Rx.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/2/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import RxSwift
import RxCocoa
import RxRelay
// MARK: 让返回值可继续接 Rx 操作符
public struct TextInputStream: ObservableConvertibleType {
    public typealias Element = String
    let source: Observable<String>
    let validator: (String) -> Bool
    public func asObservable() -> Observable<String> { source }
    public var isValid: Observable<Bool> { source.map(validator) }
}
// MARK: - 语义扩展：tv.linkTap（省略 .rx）
public extension UITextView {
    var linkTap: Observable<URL> { rx.linkTap.asObservable() }
}
// MARK: - 全局关联 Key（用于 objc_setAssociatedObject）
public extension Reactive where Base: UITextView {
    /// Rx 扩展：点击富文本链接触发 URL 事件
    var linkTap: ControlEvent<URL> {
        // 👇 强类型拿 proxy，杜绝 .empty() 分支
        let proxy: _LinkTapProxy
        if let p = objc_getAssociatedObject(base, &kProxyKey) as? _LinkTapProxy {
            proxy = p
        } else {
            let p = _LinkTapProxy()            // ← 来自“原文件”，访问级别必须 ≥ internal
            proxy = p
            objc_setAssociatedObject(base, &kProxyKey, p, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            // 交互配置（避免系统吞掉自定义 tap）
            base.isEditable = false
            base.isSelectable = false
            base.isScrollEnabled = false
            base.dataDetectorTypes = []
            base.isUserInteractionEnabled = true
            base.delaysContentTouches = false

            let tap = UITapGestureRecognizer(target: p, action: #selector(_LinkTapProxy.handleTap(_:)))
            tap.cancelsTouchesInView = true
            tap.delegate = p
            base.addGestureRecognizer(tap)
            objc_setAssociatedObject(base, &kTapKey, tap, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }

        return ControlEvent(events: proxy.relay.asObservable())
    }
}
// MARK: - 私有代理（手势 + 命中计算）
public final class _LinkTapProxy: NSObject, UIGestureRecognizerDelegate {
    let relay = PublishRelay<URL>()
    @objc func handleTap(_ gr: UITapGestureRecognizer) {
        guard let tv = gr.view as? UITextView else { return }
        // 1) 将点击点转换到 textContainer 坐标，并考虑 inset
        let lm  = tv.layoutManager
        let tc  = tv.textContainer
        var pt  = gr.location(in: tv)
        pt.x   -= tv.textContainerInset.left
        pt.y   -= tv.textContainerInset.top
        // 2) glyph → char index
        let glyphIndex = lm.glyphIndex(for: pt, in: tc)
        let charIndex  = lm.characterIndexForGlyph(at: glyphIndex)
        guard charIndex < tv.attributedText.length else { return }
        // 3) 命中检测：点击必须落在该 glyph 的有效 rect 内（避免空白区域误触）
        var usedRect = lm.lineFragmentUsedRect(forGlyphAt: glyphIndex, effectiveRange: nil, withoutAdditionalLayout: true)
        usedRect.origin.x += tv.textContainerInset.left
        usedRect.origin.y += tv.textContainerInset.top
        guard usedRect.contains(gr.location(in: tv)) else { return }
        // 4) 取属性（支持 URL 或 String）
        var eff = NSRange(location: 0, length: 0)
        let attrs = tv.attributedText.attributes(at: charIndex, effectiveRange: &eff)

        if let v = attrs[NSAttributedString.Key.link] {
            if let url = v as? URL {
                relay.accept(url)
            } else if let s = v as? String, let url = URL(string: s) {
                relay.accept(url)
            }
        }
    }
    // 与系统手势并发，避免被内建选择/链接手势抢走
    public func gestureRecognizer(_ g: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith other: UIGestureRecognizer) -> Bool { true }
}
// MARK: 🧩 Reactive 扩展（基础事件）
public extension Reactive where Base: UITextView {
    /// 删除键（空文本也会触发）
    var didPressDelete: ControlEvent<Void> {
        let src = NotificationCenter.default.rx
            .notification(UITextView.didPressTextViewDeleteNotification, object: base)
            .map { _ in () }
        return ControlEvent(events: src)
    }
    /// Return（注意：UITextView 默认回车是“换行”而非“结束编辑”，
    /// 如需把回车当“完成”，建议使用 shouldChangeTextIn delegate 或键盘 toolbar）
    var didPressReturnAsNewline: ControlEvent<Void> {
        let src = base.rx.didChange
            .withLatestFrom(base.rx.text.orEmpty) { _, text in text }
            .map { _ in () }
        return ControlEvent(events: src)
    }
}
// MARK: 🧠 入口：textView 版 textInput
public extension Reactive where Base: UITextView {
    func textInput(
        maxLength: Int? = nil,
        formatter: ((String) -> String)? = nil,
        validator: @escaping (String) -> Bool = { _ in true },
        distinct: Bool = true
    ) -> RxTextViewInput {

        let rawText = base.rx.text.asObservable()
        let textOrEmpty = base.rx.text.orEmpty.asObservable()
        let trimmed = textOrEmpty.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }

        let began = base.rx.didBeginEditing.map { true }.asObservable()
        let ended = base.rx.didEndEditing.map { false }.asObservable()
        let isEditing = Observable.merge(began, ended)
            .startWith(base.isFirstResponder)

        let deleteEvt = base.rx.didPressDelete.asObservable()
        let didChangeEvt = base.rx.didChange // ControlEvent<Void>

        let bag = DisposeBag()

        let process: (String) -> String = { input in
            var s = input
            if let f = formatter { s = f(s) }
            if let m = maxLength, s.count > m {
                s = String(s.unicodeScalars.prefix(m).map(Character.init))
            };return s
        }

        textOrEmpty
            .map(process)
            .withLatestFrom(textOrEmpty) { processed, original in (processed, original) }
            .filter { $0.0 != $0.1 }
            .map { $0.0 }
            .bind(to: base.rx.text)
            .disposed(by: bag)

        let validity = trimmed
            .map(validator)
            .distinctUntilChanged()

        let formattedBinder = Binder<String>(base) { tv, value in
            let v = process(value)
            if tv.text != v { tv.text = v }
        }

        let textOut: Observable<String?> = distinct ? rawText.distinctUntilChanged { ($0 ?? "") == ($1 ?? "") } : rawText
        let textOrEmptyOut: Observable<String> = distinct ? textOrEmpty.distinctUntilChanged() : textOrEmpty
        let trimmedOut: Observable<String> = distinct ? trimmed.distinctUntilChanged() : trimmed

        return RxTextViewInput(
            text: textOut,
            textOrEmpty: textOrEmptyOut,
            trimmed: trimmedOut,
            isEditing: isEditing.distinctUntilChanged(),
            didPressDelete: deleteEvt,
            didChange: didChangeEvt,
            isValid: validity,
            formattedBinder: formattedBinder
        )
    }
    /// UITextView 与 BehaviorRelay<String> 双向绑定
    func bindTwoWay(_ relay: BehaviorRelay<String>) -> Disposable {
        let d1 = self.text.orEmpty
            .distinctUntilChanged()
            .bind(onNext: { relay.accept($0) })

        let d2 = relay
            .distinctUntilChanged()
            .bind(to: self.text)

        return Disposables.create(d1, d2)
    }
}
