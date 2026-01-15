//
//  LinkCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/18/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
import SnapKit
import NSObject_Rx          // 自动提供 disposeBag
import JobsByUIKit
// MARK: - 单一 Cell（支持 Delegate / RAC / RightAligned）
final class LinkCell: UITableViewCell, HasDisposeBag {
    enum Mode { case delegate, rac, rightAligned }   // ← 新增 rightAligned
    static let reuseID = "LinkCell"
    // ============================== UI（懒加载：内部完成 add + 约束） ==============================
    private lazy var titleLabel: UILabel = { [unowned self] in
        UILabel()
            .byFont(.systemFont(ofSize: 13, weight: .medium))
            .byTextColor(.secondaryLabel)
            .byNumberOfLines(1)
            .byAddTo(self.contentView) { make in
                make.top.equalToSuperview().offset(12)
                make.left.equalToSuperview().offset(16)
                make.right.lessThanOrEqualToSuperview().offset(-16)
            }
    }()

    private lazy var cardView: UIView = { [unowned self] in
        UIView()
            .byBgColor(.systemGray6)
            .byCornerRadius(10)
            .byClipsToBounds(true)
            .byAddTo(self.contentView) { make in
                make.top.equalTo(self.titleLabel.snp.bottom).offset(8)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-16)
                make.bottom.equalToSuperview().offset(-12)
            }
    }()

    private lazy var textView: UITextView = { [unowned self] in
        UITextView()
            .byEditable(false)
            .bySelectable(true)               // 最终由 configure 调整
            .byTextAlignment(.center)
            .byBgColor(.clear)
            .byTextContainerInset(UIEdgeInsets(top: 14, left: 12, bottom: 6, right: 12))
            .byAddTo(self.cardView) { make in
                make.top.left.right.equalToSuperview()
            }
    }()

    private lazy var attachmentLabel: UILabel = { [unowned self] in
        UILabel()
            .byTextAlignment(.center)
            .byNumberOfLines(1)
            .byAddTo(self.cardView) { make in
                make.top.equalTo(self.textView.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(12)
                make.bottom.equalToSuperview().inset(12)
            }
    }()
    // ============================== Init ==============================
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.byBgColor(.clear)
        // 唤起懒加载（不改变视觉状态）
        titleLabel.byAlpha(1)
        cardView.byAlpha(1)
        textView.byAlpha(1)
        attachmentLabel.byAlpha(1)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    // ============================== 配置入口 ==============================
    func configure(title: String,
                   runs: [JobsRichRun],
                   paragraphStyle: NSMutableParagraphStyle,
                   phoneText: String,
                   phoneURL: String,
                   attachmentRuns: [JobsRichRun],
                   attachmentParagraphStyle: NSMutableParagraphStyle,
                   mode: Mode,
                   vc: RichTextDemoVC) {
        // 懒加载可能尚未唤起，保险再“点”一次
        titleLabel.byAlpha(1); cardView.byAlpha(1); textView.byAlpha(1); attachmentLabel.byAlpha(1)
        titleLabel.byText(title)
        // 复用安全：清理旧状态
        textView.byDelegate(nil)
            .byDataDetectorTypes([])
            .bySelectable(mode == .delegate || mode == .rightAligned) // rightAligned 也保留系统 link 的可交互能力
        // 主富文本
        textView.richTextBy(runs, paragraphStyle: paragraphStyle)

        // 给“电话”片段打 .jobsAction + 颜色/下划线（无论哪种模式都打标，命中时按 preferJobsAction 优先）
        if let ms = textView.attributedText?.mutableCopy() as? NSMutableAttributedString {
            let full = ms.string as NSString
            let range = full.range(of: phoneText)
            if range.location != NSNotFound {
                ms.addAttributes([
                    .jobsAction: phoneURL,
                    .foregroundColor: UIColor.red,
                    .underlineStyle: NSUnderlineStyle.single.rawValue,
                    .underlineColor: UIColor.blue
                ], range: range)
                textView.byAttributedText(ms)
            }
        }
        // 附件文案
        attachmentLabel.richTextBy(attachmentRuns, paragraphStyle: attachmentParagraphStyle)
        // 手势：先清旧，再加新
        textView.gestureRecognizers?.forEach { textView.removeGestureRecognizer($0) }
        // ✅ 使用的手势 DSL：byConfig / byCancelsTouchesInView / byTaps / byTouches …
        let tap = textView.jobs_addGesture(UITapGestureRecognizer
            .byConfig { gr in
                print("Tap 触发 on: \(String(describing: gr.view))")
            }
            .byCancelsTouchesInView(false)
            .byTaps(1)
            .byTouches(1))
        switch mode {
        case .delegate:
            // 仅处理自定义“电话”；系统 link（专属客服）交给 UITextViewDelegate
            tap!.event
                .subscribe(onNext: { [weak self, weak vc] (gr: UITapGestureRecognizer) in
                    guard let self, let vc else { return }
                    if let url = self.urlAtTap(in: self.textView, gesture: gr, preferJobsAction: true) {
                        self.handle(url: url, on: vc)
                    }
                })
                .disposed(by: disposeBag)
            textView.byDelegate(vc)
        case .rac:
            // 自管“专属客服”+“电话”
            tap!.event
                .subscribe(onNext: { [weak self, weak vc] (gr: UITapGestureRecognizer) in
                    guard let self, let vc else { return }
                    guard let url = self.urlAtTap(in: self.textView, gesture: gr, preferJobsAction: true) else { return }
                    self.handle(url: url, on: vc, racCustomerAlert: true)
                })
                .disposed(by: disposeBag)
        case .rightAligned:
            // 和 delegate 一致：系统 link 仍走 UITextViewDelegate；自定义电话走手势
            tap!.event
                .subscribe(onNext: { [weak self, weak vc] (gr: UITapGestureRecognizer) in
                    guard let self, let vc else { return }
                    if let url = self.urlAtTap(in: self.textView, gesture: gr, preferJobsAction: true) {
                        self.handle(url: url, on: vc)
                    }
                })
                .disposed(by: disposeBag)
            textView.byDelegate(vc)
        }
    }
    // ============================== 命中算法（优先 .jobsAction） ==============================
    private func urlAtTap(in textView: UITextView,
                          gesture: UITapGestureRecognizer,
                          preferJobsAction: Bool) -> URL? {
        let lm = textView.layoutManager
        let tc = textView.textContainer
        var p  = gesture.location(in: textView)
        p.x -= textView.textContainerInset.left
        p.y -= textView.textContainerInset.top

        let glyph = lm.glyphIndex(for: p, in: tc)
        guard glyph < lm.numberOfGlyphs else { return nil }

        var usedRect = lm.lineFragmentUsedRect(forGlyphAt: glyph, effectiveRange: nil, withoutAdditionalLayout: true)
        usedRect.origin.x += textView.textContainerInset.left
        usedRect.origin.y += textView.textContainerInset.top
        guard usedRect.contains(gesture.location(in: textView)) else { return nil }

        let char = lm.characterIndexForGlyph(at: glyph)
        guard char < textView.attributedText.length else { return nil }

        let attrs = textView.attributedText.attributes(at: char, effectiveRange: nil)

        if preferJobsAction,
           let action = attrs[.jobsAction] as? String,
           let url = URL(string: action) { return url }

        if let v = attrs[.link] as? URL { return v }
        if let s = attrs[.link] as? String, let url = URL(string: s) { return url }
        return nil
    }
    // ============================== URL 处理 ==============================
    private func handle(url: URL,
                        on vc: UIViewController,
                        racCustomerAlert: Bool = false) {
        if url.scheme == "click", url.host == "customer" {
            if racCustomerAlert {
                UIAlertController
                    .makeAlert("重命名", "请输入新的名称")
                    .byAddTextField(placeholder: "新名称") { alert, tf, input, oldText, isDeleting in
                        log("━━━━━━━━━━━━━━━━━━━━")
                        log("旧文本 = ",oldText)
                        log("新文本 = ",tf.text)
                        log("本次输入 = ",input)
                        log("是否删除  = ",isDeleting)

                        let ok = alert.actions.first { $0.title == "确定" }
                        ok?.isEnabled = !tf.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                    }
                    .byAddCancel { _ in                          // ✅ 一个回调（只给 action）
                        print("Cancel tapped")
                    }                                 // 可省略回调
                    .byAddOK{ alert, _ in                   // 需要拿到 alert 时用 withAlert
                        let name = alert.textField(at: 0)?.text ?? ""
                        print("new name =", name)
                    }
                    .byTintColor(.systemBlue)
                    .byPresent(vc)

            };return
        }
        if url.scheme == "tel" || url.scheme == "telprompt" {
            #if targetEnvironment(simulator)
            let ac = UIAlertController(title: "提示",
                                       message: "模拟器不支持拨号：\(url.absoluteString)",
                                       preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "确定", style: .default))
            vc.present(ac, animated: true)
            #else
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            #endif
        }
    }
}
