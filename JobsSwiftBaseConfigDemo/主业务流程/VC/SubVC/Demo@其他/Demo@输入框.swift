//
//  Demo@输入框.swift
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

import SnapKit
import ObjectiveC
import GKNavigationBarSwift
import JobsScale
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import JobsInheritance
import JobsSwiftBaseDefines

final class UITextFieldDemoVC: BaseVC {

    private lazy var emailTF: UITextField = {
        UITextField()
            .byPlaceholder("请输入邮箱（去空格 / 最长 8）")
            .byFont(.systemFont(ofSize: 16))
            .byTextColor(.label)
            .byKeyboardType(.emailAddress)
            .byReturnKeyType(.next)
            .byClearButtonMode(.whileEditing)
            .byDelegate(self)
            .byLeftView(UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 1)))
            .byLeftViewMode(.always)
            // MARK: Jobs 输入监听（无 Rx）—— 邮箱：去空格 + 最长 8 + 简单规则
            .byBeginEditing { value in
                print("✍️ email begin:", value)
            }
            /// 效果@等于父系方法UIControl.byAddAction.editingChanged，只不过比父系方法先调用
            .byOnInput(limit: 8) { [weak self] char, value, mode, isLimited ,text ,tf in
                // text 就是当前 UITextField.text（保证不是 nil，空就是 ""）
                // value 仍然是“本次变更后的值”（由监听器计算出来的 new）
                // char：删除/回车时为 ""
                // mode：space/delete/return/normal
                // isLimited：是否设置了限制（limit != nil）
                guard let self else { return }
                let trimmed = value.trimmingCharacters(in: .whitespaces)
                if trimmed != value {
                    self.emailTF.text = trimmed
                }
                let current = self.emailTF.text ?? trimmed
                let ok = current.count >= 3 && current.contains("@")
                print("📧 char='\(char)' value='\(current)' mode=\(mode) limited=\(isLimited) ok=\(ok)")
            }
            .byEndEditing { value in
                print("✅ email end:", value)
            }
            .byAddTo(view) {[unowned self] make in
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-16)
                make.height.equalTo(44)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
            .byBorderColor(.cyan)
            .byBorderWidth(0.5)
            .byMasksToBounds(YES)
            .byClipsToBounds(YES)
            .byCornerRadius(8.h)
    }()

    private lazy var passwordTF: UITextField = {
        UITextField()
            .byPlaceholder("请输入密码（最长 5）")
            .byFont(.systemFont(ofSize: 16))
            .byTextColor(.label)
            .byKeyboardType(.default)
            .byReturnKeyType(.done)
            .byClearButtonMode(.whileEditing)
            .byDelegate(self)
            .byLeftView(UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 1)))
            .byLeftViewMode(.always)
            .bySecureTextEntry(true)
            // MARK: Jobs 输入监听（无 Rx）—— 密码：最长 5，只做监听
            .byBeginEditing { value in
                print("✍️ password begin:", value)
            }
            /// 效果@等于父系方法UIControl.byAddAction.editingChanged，只不过比父系方法先调用
            .byOnInput(limit: 5) { [weak self] char, value, mode, isLimited ,text ,tf in
                // text 就是当前 UITextField.text（保证不是 nil，空就是 ""）
                // value 仍然是“本次变更后的值”（由监听器计算出来的 new）
                // char：删除/回车时为 ""
                // mode：space/delete/return/normal
                // isLimited：是否设置了限制（limit != nil）
                guard let self else { return }
                let current = self.passwordTF.text ?? value
                print("🔐 char='\(char)' value='\(current)' mode=\(mode) limited=\(isLimited)")
            }
            .byEndEditing { value in
                print("✅ password end:", value)
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(emailTF.snp.bottom).offset(16)
                make.left.right.height.equalTo(emailTF)
            }
            .byBorderColor(.cyan)
            .byBorderWidth(0.5)
            .byMasksToBounds(YES)
            .byClipsToBounds(YES)
            .byCornerRadius(8.h)
    }()

    // 自定义 inputView（示例：日期选择器，只为展示 byInputView 用法）
    private lazy var datePicker: UIDatePicker = {
        return UIDatePicker()
            .byPreferredDatePickerStyle(.wheels)
            .byDatePickerMode(.date)
    }()

    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(
            title: "UITextField 全量演示"
        )
        emailTF.byVisible(YES)
        passwordTF.byVisible(YES)
    }
}

extension UITextFieldDemoVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === emailTF {
            passwordTF.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        };return true
    }
}
