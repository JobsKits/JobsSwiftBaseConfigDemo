//
//  UITextView+监控输入.swift
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
import JobsSwiftBlock
/// 🎯 重点：UITextView.onChange（RAC 版本，挂在 UITextView 上）
public extension UITextView {
    /// 监听文本变化（Rx 方案）
    /// - Parameters:
    ///   - emitDuringComposition: 是否在 IME 合成期（markedTextRange != nil）也回调，默认 false
    ///   - distinct: 文本相同是否去重
    ///   - handler: (tv, inputDiff, oldText, isDeleting)
    @discardableResult
    func onChange(
        emitDuringComposition: Bool = false,
        distinct: Bool = true,
        _ handler: @escaping TVOnChange
    ) -> Self {
        // 安装 deleteBackward 广播（一次）
        UITextView.enableDeleteBackwardBroadcast()
        // 重绑时先清理
        _tv_onChangeBag = DisposeBag()
        // 是否合成期过滤
        let baseStream = rx.text.orEmpty
            .filter { [weak self] _ in
                guard let self else { return true }
                return emitDuringComposition || self.markedTextRange == nil
            }

        let textChanged = (distinct ? baseStream.distinctUntilChanged() : baseStream)
            .share(replay: 1, scope: .whileConnected)
        // old/new 配对：old = 初始 + 之前的 new
        let oldText = Observable.just(text ?? "").concat(textChanged)
        let pair: Observable<(String, String)> = Observable.zip(oldText, textChanged) // (old, new)
        // 回调（不要在参数列表里做 (old, new) 解构，编译器在这里经常跪）
        pair
            .withUnretained(self)
            .subscribe(onNext: { tv, pair in
                let (old, new) = pair
                let isDeleting = new.count < old.count
                let input = new._jobs_insertedSubstring(comparedTo: old)
                handler(tv, input, old, isDeleting)
            })
            .disposed(by: _tv_onChangeBag)
        return self
    }
}

public extension UITextView {
    var _tv_backspaceBag: DisposeBag {
        get { _tv_getOrSetAssociated(key: &JobsTVKeys.backspaceBag) { _ in DisposeBag() } }
        set { objc_setAssociatedObject(self, &JobsTVKeys.backspaceBag, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    var _tv_onChangeBag: DisposeBag {
        get { _tv_getOrSetAssociated(key: &JobsTVKeys.onChangeBag) { _ in DisposeBag() } }
        set { objc_setAssociatedObject(self, &JobsTVKeys.onChangeBag, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    @inline(__always)
    func _tv_getOrSetAssociated<T>(key: UnsafeRawPointer, _ make: (UITextView) -> T) -> T {
        if let v = objc_getAssociatedObject(self, key) as? T { return v }
        let v = make(self)
        objc_setAssociatedObject(self, key, v, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return v
    }
}
// 计算 new 相比 old “插入的子串”，在中间插入/替换场景也能尽量正确
private extension String {
    func _jobs_insertedSubstring(comparedTo old: String) -> String {
        if self == old { return "" }
        let a = Array(self)
        let b = Array(old)
        // 前缀对齐
        var i = 0
        while i < min(a.count, b.count), a[i] == b[i] { i += 1 }
        // 后缀对齐
        var j = 0
        while j < min(a.count - i, b.count - i),
              a[a.count - 1 - j] == b[b.count - 1 - j] { j += 1 }
        if self.count >= old.count, i <= a.count - j {
            return String(a[i..<(a.count - j)])
        } else {
            return "" // 删除或替换导致整体变短时，这里返回空串
        }
    }
}
