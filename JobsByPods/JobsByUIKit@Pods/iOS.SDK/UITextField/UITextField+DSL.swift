//
//  UITextField+DSL.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/3/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC.runtime
import JobsSwiftBlock
// MARK: ✏️ UITextField 链式配置
public extension UITextField {
    // MARK: 🌸 基础文本属性
    @discardableResult
    func byPlaceholder(_ placeholder: String?) -> Self {
        self.placeholder = placeholder
        return self
    }

    @discardableResult
    func byText(_ text: String?) -> Self {
        self.text = text
        return self
    }

    @discardableResult
    func byTextColor(_ color: UIColor?) -> Self {
        self.textColor = color
        return self
    }

    @discardableResult
    func byFont(_ font: UIFont?) -> Self {
        self.font = font
        return self
    }

    @discardableResult
    func byTextAlignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }

    @discardableResult
    func byBorderStyle(_ style: UITextField.BorderStyle) -> Self {
        self.borderStyle = style
        return self
    }
    // MARK: 🧱 占位/背景样式
    @available(iOS 6.0, *)
    @discardableResult
    func byAttributedText(_ attributedText: NSAttributedString?) -> Self {
        self.attributedText = attributedText
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func byAttributedPlaceholder(_ attributedPlaceholder: NSAttributedString?) -> Self {
        self.attributedPlaceholder = attributedPlaceholder
        return self
    }

    @discardableResult
    func byBackground(_ image: UIImage?) -> Self {
        self.background = image
        return self
    }

    @discardableResult
    func byDisabledBackground(_ image: UIImage?) -> Self {
        self.disabledBackground = image
        return self
    }
    // MARK: 🧠 输入控制行为
    @discardableResult
    func byClearsOnBeginEditing(_ clears: Bool) -> Self {
        self.clearsOnBeginEditing = clears
        return self
    }

    @discardableResult
    func byClearsOnInsertion(_ clears: Bool) -> Self {
        self.clearsOnInsertion = clears
        return self
    }

    @discardableResult
    func byAdjustsFontSizeToFitWidth(_ adjusts: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjusts
        return self
    }

    @discardableResult
    func byMinimumFontSize(_ size: CGFloat) -> Self {
        self.minimumFontSize = size
        return self
    }

    @discardableResult
    func bySecureTextEntry(_ secure: Bool) -> Self {
        self.isSecureTextEntry = secure
        return self
    }
    // MARK: ⌨️ 键盘行为
    @discardableResult
    func byKeyboardType(_ type: UIKeyboardType) -> Self {
        self.keyboardType = type
        return self
    }

    @discardableResult
    func byKeyboardAppearance(_ appearance: UIKeyboardAppearance) -> Self {
        self.keyboardAppearance = appearance
        return self
    }

    @discardableResult
    func byReturnKeyType(_ type: UIReturnKeyType) -> Self {
        self.returnKeyType = type
        return self
    }

    @discardableResult
    func byEnablesReturnKeyAutomatically(_ enabled: Bool) -> Self {
        self.enablesReturnKeyAutomatically = enabled
        return self
    }
    // MARK: 🧠 智能输入特性
    @discardableResult
    func byAutocapitalizationType(_ type: UITextAutocapitalizationType) -> Self {
        self.autocapitalizationType = type
        return self
    }

    @discardableResult
    func byAutocorrectionType(_ type: UITextAutocorrectionType) -> Self {
        self.autocorrectionType = type
        return self
    }

    @discardableResult
    func bySpellCheckingType(_ type: UITextSpellCheckingType) -> Self {
        self.spellCheckingType = type
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func bySmartQuotesType(_ type: UITextSmartQuotesType) -> Self {
        self.smartQuotesType = type
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func bySmartDashesType(_ type: UITextSmartDashesType) -> Self {
        self.smartDashesType = type
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func bySmartInsertDeleteType(_ type: UITextSmartInsertDeleteType) -> Self {
        self.smartInsertDeleteType = type
        return self
    }

    @available(iOS 17.0, *)
    @discardableResult
    func byInlinePredictionType(_ type: UITextInlinePredictionType) -> Self {
        self.inlinePredictionType = type
        return self
    }
    // MARK: 🧠 iOS 18+ 新特性
    @available(iOS 18.0, *)
    @discardableResult
    func byMathExpressionCompletionType(_ type: UITextMathExpressionCompletionType) -> Self {
        self.mathExpressionCompletionType = type
        return self
    }

    @available(iOS 18.0, *)
    @discardableResult
    func byWritingToolsBehavior(_ behavior: UIWritingToolsBehavior) -> Self {
        self.writingToolsBehavior = behavior
        return self
    }

    @available(iOS 18.0, *)
    @discardableResult
    func byAllowedWritingToolsResultOptions(_ options: UIWritingToolsResultOptions) -> Self {
        self.allowedWritingToolsResultOptions = options
        return self
    }
    // MARK: 🔠 内容类型 / 密码规则
    @discardableResult
    func byTextContentType(_ type: UITextContentType?) -> Self {
        self.textContentType = type
        return self
    }

    @available(iOS 12.0, *)
    @discardableResult
    func byPasswordRules(_ rules: UITextInputPasswordRules?) -> Self {
        self.passwordRules = rules
        return self
    }
    // MARK: 🎨 左右视图 / 清除按钮
    @discardableResult
    func byClearButtonMode(_ mode: UITextField.ViewMode) -> Self {
        self.clearButtonMode = mode
        return self
    }

    @discardableResult
    func byLeftView(_ view: UIView?, mode: UITextField.ViewMode = .always) -> Self {
        self.leftView = view
        self.leftViewMode = mode
        return self
    }

    @discardableResult
    func byRightView(_ view: UIView?, mode: UITextField.ViewMode = .always) -> Self {
        self.rightView = view
        self.rightViewMode = mode
        return self
    }

    @available(iOS 7.0, *)
    @discardableResult
    func byDefaultTextAttributes(_ attrs: [NSAttributedString.Key : Any]) -> Self {
        self.defaultTextAttributes = attrs
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func byAllowsEditingTextAttributes(_ allows: Bool) -> Self {
        self.allowsEditingTextAttributes = allows
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func byTypingAttributes(_ attrs: [NSAttributedString.Key : Any]?) -> Self {
        self.typingAttributes = attrs
        return self
    }

    @discardableResult
    func byInputView(_ view: UIView?) -> Self {
        self.inputView = view
        return self
    }

    @discardableResult
    func byInputAccessoryView(_ view: UIView?) -> Self {
        self.inputAccessoryView = view
        return self
    }
    // ⚠️ delegate 弱引用属性：仅便捷设置，别强持有
    @discardableResult
    func byDelegate(_ delegate: UITextFieldDelegate?) -> Self {
        self.delegate = delegate
        return self
    }

    @available(iOS 10.0, *)
    @discardableResult
    func byDynamicTextStyle(_ style: UIFont.TextStyle) -> Self {
        self.font = .preferredFont(forTextStyle: style)
        self.adjustsFontForContentSizeCategory = true
        return self
    }
    /// 链式监听“发送/回车”键
    // ================================== Return 键回调（兼容 iOS 12+） ==================================
    @discardableResult
    func onReturn(_ handler: @escaping jobsByTextFieldBlock) -> Self {
        // 先存起来（低版本 target-action 需要）
        _jobs_onReturnHandler = handler

        if #available(iOS 14.0, *) {
            // iOS14+: UIAction
            let action = UIAction(
                title: "",
                image: nil,
                identifier: nil,
                discoverabilityTitle: nil,
                attributes: [],
                state: .off
            ) { [weak self] _ in
                guard let self else { return }
                handler(self)
            }
            addAction(action, for: .editingDidEndOnExit)
        } else {
            // iOS13-: target-action
            addTarget(self, action: #selector(_jobs_handleReturn), for: .editingDidEndOnExit)
        };return self
    }
}

private extension UITextField {
    struct _JobsAssoc {
        static var onReturnKey: UInt8 = 0
    }
    var _jobs_onReturnHandler: (jobsByTextFieldBlock)? {
        get { objc_getAssociatedObject(self, &_JobsAssoc.onReturnKey) as? (jobsByTextFieldBlock) }
        set { objc_setAssociatedObject(self, &_JobsAssoc.onReturnKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC) }
    }
    @objc func _jobs_handleReturn() {
        _jobs_onReturnHandler?(self)
    }
}
// MARK: - 左侧图标 & 纯留白
public extension UITextField {
    /// 设置左侧图标，并精确控制：leading（到边距）和 spacing（到文字）
    @discardableResult
    func byLeftIcon(
        _ image: UIImage?,
        tint: UIColor? = nil,
        size: CGSize = .init(width: 18, height: 18),
        leading: CGFloat = 12,      // 图标距 TextField 左边缘
        spacing: CGFloat = 8        // 图标与文字之间
    ) -> Self {
        guard let image else {
            leftView = nil
            leftViewMode = .never
            return self
        }

        let containerW = leading + size.width + spacing
        let containerH = max(24, size.height)    // 高度随便给，系统会垂直居中
        let container = UIView(frame: CGRect(x: 0, y: 0, width: containerW, height: containerH))

        self.byLeftView(container.byAddSubviewRetSuper(UIImageView().byImage(tint == nil ? image : image.withRenderingMode(.alwaysTemplate))
            .byTintColor(tint)
            .byContentMode(.scaleAspectFit)
            .byFrame(CGRect(origin: .zero, size: size))
             // 把图标放到带 leading 的位置
            .byCenter(CGPoint(x: leading + size.width / 2, y: container.bounds.midY))
            .byAutoresizingMask([.flexibleTopMargin, .flexibleBottomMargin])),mode:.always)

        return self
    }
    /// 仅设置左侧留白（没有图标），常用于单纯增加文本左内边距
    @discardableResult
    func byLeftPadding(_ padding: CGFloat) -> Self {
        let spacer = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 1))
        spacer.isUserInteractionEnabled = false
        leftView = spacer
        leftViewMode = .always
        return self
    }
}
