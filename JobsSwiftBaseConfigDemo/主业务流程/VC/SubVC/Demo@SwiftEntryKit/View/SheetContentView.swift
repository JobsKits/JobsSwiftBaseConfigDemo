//
//  SheetContentView.swift
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
import JobsSwiftBaseDefines
import SnapKit
import SwiftEntryKit

// MARK: - 自定义底部表单（键盘联动）
final class SheetContentView: UIView, UITextFieldDelegate {
    private lazy var titleLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("底部表单（键盘联动）".tr)
            .byFont(JobsFont.boldSystemFont(ofSize: 18))
            .byTextColor(JobsCor.label)
            .byAddTo(self) { make in
                make.top.equalToSuperview().inset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()
    private lazy var textField: UITextField = {
        UITextField.jobsMake { _ in }
            .byPlaceholder("输入点什么…".tr)
            .byBorderStyle(.roundedRect)
            .byAddTo(self) { [unowned self] make in
                make.top.equalTo(titleLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(40)
            }
    }()
    private lazy var confirmBtn: UIButton = {
        UIButton.sys()
            .byTitle("确定".tr)
            .onTap { [weak self] (_: UIButton) in
                self?.endEditing(true)
                SwiftEntryKit.dismiss()
            }
            .byAddTo(self) { [unowned self] make in
                make.top.equalTo(textField.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(44)
                make.bottom.equalToSuperview().inset(20)
            }
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.byBackgroundColor(JobsCor.secondarySystemBackground)
        titleLabel.byVisible(YES)
        textField.byVisible(YES)
        confirmBtn.byVisible(YES)
    }
    required init?(coder: NSCoder) { fatalError() }
}
