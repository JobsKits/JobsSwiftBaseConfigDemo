//
//  LiveInputBar.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftDSL
import JobsScale
import JobsSwiftBaseDefines
import SnapKit

// ============================== InputBar（换行输入 + 独立发送） ==============================
final class LiveInputBar: UIView {
    static let preferredHeight: CGFloat = 64

    private static let placeholder = "说点什么…".tr

    /// 对外回调：只由输入框右侧的发送按钮触发
    var onSend: ((String) -> Void)?
    /// 是否在发送后清空文本（默认 true）
    var autoClearAfterSend: Bool = true
    /// 是否在发送后收起键盘（默认 true）
    var autoResignAfterSend: Bool = true

    private lazy var sendButton: UIButton = {
        UIButton.sys()
            .byTitle("发送".tr)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byTitleColor(JobsCor.white)
            .byBackgroundColor(JobsCor.systemBlue)
            .byCornerRadius(8)
            .onTap { [weak self] _ in
                self?.emitSend()
            }
            .byAddTo(self) { make in
                make.trailing.equalToSuperview().inset(12.w)
                make.centerY.equalToSuperview()
                make.width.equalTo(58.w)
                make.height.equalTo(40.h)
            }
    }()

    private lazy var textView: UITextView = {
        UITextView.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 16))
            .byTextColor(JobsCor.label)
            .byKeyboardType(.default)
            .byEditable(true)
            .bySelectable(true)
            .byTextContainerInset(UIEdgeInsets(top: 7, left: 8, bottom: 7, right: 8))
            .byLineFragmentPadding(0)
            .byRoundedBorder(
                color: JobsCor.systemGray4,
                width: 1,
                radius: 8,
                background: JobsCor.systemBackground
            )
            .byPlaceHolder(Self.placeholder)
            .byPlaceHolderCor(JobsCor.placeholderText)
            .byPlaceHolderFont(JobsFont.systemFont(ofSize: 16))
            .byAddTo(self) { [unowned self] make in
                make.leading.equalToSuperview().offset(12.w)
                make.trailing.equalTo(sendButton.snp.leading).offset(-8.w)
                make.top.bottom.equalToSuperview().inset(6.h)
            }
    }()

    private lazy var topLine: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.separator)
            .byAddTo(self) { make in
                make.top.leading.trailing.equalToSuperview()
                make.height.equalTo(0.5)
            }
    }()

    override var intrinsicContentSize: CGSize {
        .init(width: UIView.noIntrinsicMetric, height: Self.preferredHeight)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        byBackgroundColor(JobsCor.systemBackground)
        isUserInteractionEnabled = true
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        topLine.byVisible(YES)
        sendButton.byVisible(YES)
        textView.byVisible(YES)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    /// 点击真实发送按钮后，保留多行文本并追加到留言列表。
    private func emitSend() {
        let text = (textView.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }
        onSend?(text)
        if autoClearAfterSend {
            textView
                .byText(nil)
                .byPlaceHolder(Self.placeholder)
        }
        if autoResignAfterSend { textView.resignFirstResponder() }
    }
}

extension LiveInputBar {
    @discardableResult
    func onSend(_ handler: @escaping (String) -> Void) -> Self {
        self.onSend = handler
        return self
    }
    @discardableResult
    func byAutoClearAfterSend(_ flag: Bool) -> Self {
        self.autoClearAfterSend = flag;
        return self
    }
    @discardableResult
    func byAutoResignAfterSend(_ flag: Bool) -> Self {
        self.autoResignAfterSend = flag;
        return self
    }
}
