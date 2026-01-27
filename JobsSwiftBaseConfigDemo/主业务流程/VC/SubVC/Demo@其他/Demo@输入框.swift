//
//  UITextFieldDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 9/27/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import ObjectiveC
import GKNavigationBarSwift
import JobsInheritance
import JobsByUIKit
import JobsTextTools
import JobsScale
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
            .jobs_onBeginEditing { value in
                print("✍️ email begin:", value)
            }
            .jobs_onInput(limit: 8) { [weak self] char, value, mode, isLimited in
                guard let self else { return }
                let trimmed = value.trimmingCharacters(in: .whitespaces)
                if trimmed != value {
                    self.emailTF.text = trimmed
                }
                let current = self.emailTF.text ?? trimmed
                let ok = current.count >= 3 && current.contains("@")
                print("📧 char='\(char)' value='\(current)' mode=\(mode) limited=\(isLimited) ok=\(ok)")
            }
            .jobs_onEndEditing { value in
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
            .jobs_onBeginEditing { value in
                print("✍️ password begin:", value)
            }
            .jobs_onInput(limit: 5) { [weak self] char, value, mode, isLimited in
                guard let self else { return }
                let current = self.passwordTF.text ?? value
                print("🔐 char='\(char)' value='\(current)' mode=\(mode) limited=\(isLimited)")
            }
            .jobs_onEndEditing { value in
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
