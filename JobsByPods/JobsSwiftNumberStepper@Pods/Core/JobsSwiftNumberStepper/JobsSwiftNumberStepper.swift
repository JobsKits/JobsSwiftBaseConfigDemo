//
//  JobsSwiftNumberStepper.swift
//  JobsSwiftNumberStepper
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit

public final class JobsSwiftNumberStepper: UIControl {
    public private(set) var value = 0
    public private(set) var minimumValue: Int?
    public private(set) var maximumValue: Int?
    public private(set) var stepValue = 1

    public private(set) lazy var decreaseButton: UIButton = {
        makeStepButton(title: "−", accessibilityLabel: "减少") { [weak self] in
            self?.decrease()
        }
    }()

    public private(set) lazy var textField: UITextField = {
        UITextField.jobsMake { _ in }
            .byText("0")
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 17, weight: .semibold))
            .byTextAlignment(.center)
            .byBorderStyle(.none)
            .byKeyboardType(.numbersAndPunctuation)
            .byAutocapitalizationType(.none)
            .byAutocorrectionType(.no)
            .byClearButtonMode(.never)
            .byDelegate(self)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(8)
            .onJobsChange { [weak self] (textField: UITextField) in
                self?.handleTextChanged(textField)
            }
    }()

    public private(set) lazy var increaseButton: UIButton = {
        makeStepButton(title: "+", accessibilityLabel: "增加") { [weak self] in
            self?.increase()
        }
    }()

    private lazy var contentStackView: UIStackView = {
        UIStackView(arrangedSubviews: [
            decreaseButton,
            textField,
            increaseButton
        ])
        .byAxis(.horizontal)
        .byAlignment(.fill)
        .byDistribution(.fill)
        .bySpacing(8)
        .byAddTo(self) { make in
            make.edges.equalToSuperview()
        }
    }()

    public override var isEnabled: Bool {
        didSet {
            refreshAvailability()
            textField.byEnabled(isEnabled)
        }
    }

    public override var intrinsicContentSize: CGSize {
        CGSize(width: 170, height: 44)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        configure(value: 0)
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        configure(value: 0)
    }

    @discardableResult
    public func configure(value: Int,
                          minimumValue: Int? = nil,
                          maximumValue: Int? = nil,
                          stepValue: Int = 1) -> Self {
        setBounds(minimumValue: minimumValue, maximumValue: maximumValue)
        self.stepValue = stepValue > 0 ? stepValue : 1
        setValue(value, sendActions: false)
        return self
    }

    public func setBounds(minimumValue: Int?, maximumValue: Int?) {
        if let minimumValue, let maximumValue {
            self.minimumValue = Swift.min(minimumValue, maximumValue)
            self.maximumValue = Swift.max(minimumValue, maximumValue)
        } else {
            self.minimumValue = minimumValue
            self.maximumValue = maximumValue
        }
        refreshKeyboardType()
        setValue(value, sendActions: false)
    }

    public func setValue(_ value: Int, sendActions: Bool = false) {
        let boundedValue = bounded(value)
        let changed = self.value != boundedValue
        self.value = boundedValue
        syncText()
        refreshAvailability()
        if sendActions, changed {
            self.sendActions(for: .valueChanged)
        }
    }
}

private extension JobsSwiftNumberStepper {
    func setupSubviews() {
        contentStackView.byVisible(YES)
        decreaseButton.snp.makeConstraints { make in
            make.width.equalTo(44)
        }
        increaseButton.snp.makeConstraints { make in
            make.width.equalTo(44)
        }
        textField.accessibilityLabel = "数值"
    }

    func makeStepButton(title: String,
                        accessibilityLabel: String,
                        action: @escaping () -> Void) -> UIButton {
        let button = UIButton.sys()
            .byTitle(title, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 24, weight: .medium))
            .byTitleColor(JobsCor.label, for: .normal)
            .byTitleColor(JobsCor.tertiaryLabel, for: .disabled)
            .onTap { _ in
                action()
            }
        if #available(iOS 15.0, tvOS 15.0, *) {
            button.byConfiguration(
                UIButton.Configuration.gray()
                    .byTitle(title)
                    .byBaseForegroundColor(JobsCor.label)
                    .byCornerStyle(.medium)
            )
        } else {
            button
                .byBackgroundColor(JobsCor.secondarySystemFill, for: .normal)
                .byBackgroundColor(JobsCor.tertiarySystemFill, for: .highlighted)
            button.layer.cornerRadius = 8
            button.layer.masksToBounds = true
        }
        button.accessibilityLabel = accessibilityLabel
        return button
    }

    func bounded(_ candidate: Int) -> Int {
        let lowerBounded = minimumValue.map { Swift.max(candidate, $0) } ?? candidate
        return maximumValue.map { Swift.min(lowerBounded, $0) } ?? lowerBounded
    }

    func decrease() {
        let result = value.subtractingReportingOverflow(stepValue)
        if result.overflow {
            if let minimumValue {
                setValue(minimumValue, sendActions: true)
            };return
        }
        setValue(result.partialValue, sendActions: true)
    }

    func increase() {
        let result = value.addingReportingOverflow(stepValue)
        if result.overflow {
            if let maximumValue {
                setValue(maximumValue, sendActions: true)
            };return
        }
        setValue(result.partialValue, sendActions: true)
    }

    func canDecrease() -> Bool {
        guard isEnabled else { return false }
        if let minimumValue {
            return value > minimumValue
        }
        let result = value.subtractingReportingOverflow(stepValue)
        return !result.overflow
    }

    func canIncrease() -> Bool {
        guard isEnabled else { return false }
        if let maximumValue {
            return value < maximumValue
        }
        let result = value.addingReportingOverflow(stepValue)
        return !result.overflow
    }

    func refreshAvailability() {
        let decreaseEnabled = canDecrease()
        let increaseEnabled = canIncrease()
        decreaseButton
            .byEnabled(decreaseEnabled)
            .byAlpha(decreaseEnabled ? 1 : 0.35)
        increaseButton
            .byEnabled(increaseEnabled)
            .byAlpha(increaseEnabled ? 1 : 0.35)
    }

    func refreshKeyboardType() {
        let acceptsNegativeValue = minimumValue.map { $0 < 0 } ?? true
        textField.byKeyboardType(acceptsNegativeValue ? .numbersAndPunctuation : .numberPad)
    }

    func syncText() {
        textField.byText(String(value))
        textField.accessibilityValue = String(value)
    }

    func handleTextChanged(_ textField: UITextField) {
        guard let text = textField.text,
              !text.isEmpty,
              text != "-",
              let candidate = Int(text),
              bounded(candidate) == candidate else { return }
        setValue(candidate, sendActions: true)
    }

    func isValidIntegerText(_ text: String) -> Bool {
        if text.isEmpty { return true }
        let acceptsNegativeValue = minimumValue.map { $0 < 0 } ?? true
        if text == "-" { return acceptsNegativeValue }
        let digits = text.hasPrefix("-") ? String(text.dropFirst()) : text
        if text.hasPrefix("-"), !acceptsNegativeValue { return false }
        guard !digits.isEmpty,
              digits.unicodeScalars.allSatisfy({ $0.value >= 48 && $0.value <= 57 }),
              Int(text) != nil else { return false };return true
    }
}

extension JobsSwiftNumberStepper: UITextFieldDelegate {
    public func textField(_ textField: UITextField,
                          shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool {
        guard let currentText = textField.text,
              let stringRange = Range(range, in: currentText) else { return false }
        let candidate = currentText.replacingCharacters(in: stringRange, with: string)
        return isValidIntegerText(candidate)
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, let candidate = Int(text) {
            setValue(candidate, sendActions: true)
        } else {
            syncText()
        }
    }
}
