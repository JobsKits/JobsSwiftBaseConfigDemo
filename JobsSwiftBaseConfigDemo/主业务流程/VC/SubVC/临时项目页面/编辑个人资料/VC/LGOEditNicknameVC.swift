//
//  LGOEditNicknameVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 11/14/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import GKNavigationBarSwift
import JobsInheritance
import JobsByUIKit
import JobsTextTools
import JobsSwiftBaseDefines

final class LGOEditNicknameVC: BaseVC {
    /// 昵称输入框
    private lazy var nicknameField: UITextField = {
        UITextField()
            // 基础视觉
            .byPlaceholder("请输入昵称 长度12个字符".tr)
            .byTextColor(.label)
            .byFont(.systemFont(ofSize: 16))
            .byTextAlignment(.natural)
            .byBorderStyle(.roundedRect)
            .byClearButtonMode(.whileEditing)
            // 键盘
            .byKeyboardType(.default)
            .byKeyboardAppearance(.dark)
            .byReturnKeyType(.next)
            .byEnablesReturnKeyAutomatically(true)
            // 智能输入
            .byAutocapitalizationType(.none)
            .byAutocorrectionType(.no)
            .bySpellCheckingType(.no)
            .bySmartQuotesType(.no)
            .bySmartDashesType(.no)
            .bySmartInsertDeleteType(.no)
            // 编辑属性
            .byAllowsEditingTextAttributes(true)
            .byDefaultTextAttributes([.kern: 0.5]) // 字距
            .byTypingAttributes([.foregroundColor: UIColor.label])
            /// 效果@等于父系方法UIControl.byAddAction.editingChanged，只不过比父系方法先调用
            .byOnInput(limit: 12) { [weak self] char, value, mode, isLimited ,text ,tf in
                // text 就是当前 UITextField.text（保证不是 nil，空就是 ""）
                // value 仍然是“本次变更后的值”（由监听器计算出来的 new）
                // char：删除/回车时为 ""
                // mode：space/delete/return/normal
                // isLimited：是否设置了限制（limit != nil）
                guard let self else { return }
                // 1) 超限提示
                tipLabel.byVisible(isLimited)
                // 2) 去掉首尾空白（避免“只输入空格也能保存”）
                let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
                if trimmed != value {
                    // 这里会触发下一次 shouldChange，但一般不会形成死循环（因为 trimmed 稳定）
                    nicknameField.text = trimmed
                }
                // 3) 控制按钮 enable
                let current = nicknameField.text ?? trimmed
                btn.isEnabled = !current.isEmpty
                print("✏️ char='\(char)' value='\(value)' mode=\(mode) limited=\(isLimited) text='\(current)'")
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(44)
            }
    }()

    private lazy var btn: UIButton = {
        UIButton.sys()
            /// 普通字符串@设置主标题
            .byTitle("保存".tr, for: .normal)
            .byTitleColor(.systemBlue, for: .normal)
            .byTitleFont(.systemFont(ofSize: 12, weight: .medium))
            /// 事件触发@点按
            .onTap { [weak self] sender in
                guard let self else { return }
                jobsDismissKeyboard()
            }
    }()
    /// 底部说明文字
    private lazy var tipLabel: UILabel = {
        UILabel()
            .byText("长度限制12个字节，仅免费修改1次")
            .byFont(.systemFont(ofSize: 12))
            .byTextColor(.red)
            .byNumberOfLines(0)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(nicknameField.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(.systemGroupedBackground)
        jobsSetupGKNav(
            title: "编辑昵称".tr,
            rightButtons: [btn]
        )
        nicknameField.byVisible(YES)
        tipLabel.byVisible(NO)
    }
}
