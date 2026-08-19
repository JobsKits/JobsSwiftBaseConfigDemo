//
//  JobsAppDoorInputView.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import UIKit
import JobsByUIKit
import JobsCountdownButton
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsSwiftGraphicCaptcha
import SnapKit

public final class JobsAppDoorInputView: UIView {
    public let field: JobsAppDoorField
    public let textField: UITextField
    public private(set) var countryCode = "+86"
    public var text: String { textField.text ?? "" }
    public var onTextChanged: (() -> Void)?
    public var onCountryCodeRequest: (() -> Void)?
    public var onVerificationCodeRequest: (() -> Void)?

    private let captchaConfig: JobsAppDoorGraphicCaptchaConfig
    private let verificationCodeDuration: Int
    private var countryCodeButton: UIButton?
    private var verificationButton: UIButton?
    private var captchaView: JobsSwiftGraphicCaptchaView?

    private lazy var iconView: UIImageView = {
        UIImageView.jobsMake { _ in }
            .byContentMode(.scaleAspectFit)
            .byTintColor(JobsAppDoorPalette.gold)
            .byAddTo(self) { make in
                make.left.equalToSuperview().offset(17)
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize(width: 16, height: 16))
            }
    }()

    public init(
        field: JobsAppDoorField,
        captchaConfig: JobsAppDoorGraphicCaptchaConfig = .defaultConfig,
        verificationCodeDuration: Int = 60
    ) {
        self.field = field
        self.captchaConfig = captchaConfig
        self.verificationCodeDuration = max(1, verificationCodeDuration)
        self.textField = UITextField.jobsMake { _ in }
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setCountry(flag: String, code: String) {
        countryCode = code.hasPrefix("+") ? code : "+\(code)"
        countryCodeButton?.byTitle("\(flag) \(countryCode)", for: .normal)
    }

    public func validateGraphicCaptcha() -> Bool {
        guard field == .graphicCaptcha else { return true };return captchaView?.validateInput(text) ?? false
    }

    public func startVerificationCountdown() {
        verificationButton?.countdownStart()
    }
}

private extension JobsAppDoorInputView {
    func setupView() {
        byBackgroundColor(JobsCor.clear)
            .byBorderColor(JobsAppDoorPalette.fieldStroke)
            .byBorderWidth(1)
            .byCornerRadius(25)
            .byClipsToBounds(true)
        iconView.byImage(iconImage())
        textField
            .byPlaceholder(placeholder())
            .byPlaceholderColor(JobsAppDoorPalette.placeholder)
            .byPlaceholderFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(JobsCor.white)
            .byTintColor(JobsCor.white)
            .byAutocorrectionType(.no)
            .byAutocapitalizationType(.none)
            .byClearButtonMode(.whileEditing)
            .byReturnKeyType(.done)
            .byKeyboardType(keyboardType())
            .bySecureTextEntry(isSecureField())
            .byOnInput { [weak self] _, _, _, _, _, _ in
                self?.onTextChanged?()
            }
            .onReturn { textField in
                textField.resignFirstResponder()
            }
            .byAddTo(self) { make in
                make.top.bottom.equalToSuperview()
                make.left.equalTo(self.iconView.snp.right).offset(8)
                make.right.equalToSuperview().inset(self.accessoryWidth())
            }
        configureAccessory()
    }

    func configureAccessory() {
        switch field {
        /// 处理密码及确认密码明密文切换分支
        case .password, .confirmPassword:
            let button = UIButton.sys()
                .byImage(passwordImage(isSecure: true), for: .normal)
                .byTintColor(JobsAppDoorPalette.fieldStroke)
                .onTap { [weak self] sender in
                    guard let self else { return }
                    textField.byToggleSecureTextEntry()
                    sender.byImage(passwordImage(isSecure: textField.isSecureTextEntry), for: .normal)
                }
                .byAddTo(self) { make in
                    make.right.equalToSuperview().inset(8)
                    make.centerY.equalToSuperview()
                    make.size.equalTo(CGSize(width: 36, height: 36))
                }
            button.byVisible(true)
        /// 处理手机国码选择分支
        case .phone:
            let button = UIButton.sys()
                .jobsAppDoorAppearance(
                    title: "🇨🇳 +86",
                    titleColor: JobsAppDoorPalette.fieldStroke,
                    font: JobsFont.systemFont(ofSize: 12, weight: .semibold),
                    backgroundColor: JobsCor.clear,
                    cornerRadius: 0
                )
                .onTap { [weak self] _ in
                    self?.onCountryCodeRequest?()
                }
                .byAddTo(self) { make in
                    make.left.equalTo(self.iconView.snp.right).offset(4)
                    make.centerY.equalToSuperview()
                    make.size.equalTo(CGSize(width: 70, height: 36))
                }
            countryCodeButton = button
            textField.snp.remakeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.left.equalTo(button.snp.right)
                make.right.equalToSuperview().inset(8)
            }
        /// 处理短信验证码倒计时分支
        case .smsCode:
            let button = UIButton.sys()
                .jobsAppDoorAppearance(
                    title: JobsAppDoorResource.text("获取验证码"),
                    titleColor: JobsAppDoorPalette.darkGoldText,
                    font: JobsFont.systemFont(ofSize: 10, weight: .semibold),
                    backgroundColor: JobsAppDoorPalette.gold.withAlphaComponent(0.92),
                    cornerRadius: 17
                )
                .byTitleAlignment(.center)
                .byNumberOfLines(1)
                .byTitleAdjustsFontSizeToFitWidth(true)
                .byTitleMinimumScaleFactor(0.7)
                .byCountdown { config in
                    config.renderOnInit = false
                    config.clickableWhileRunning = false
                    config.mode = .down(from: verificationCodeDuration)
                    config.renderLegacy = { seconds, countdownButton in
                        countdownButton.byTitle(JobsAppDoorResource.countdownText(seconds: seconds), for: .normal)
                    }
                    if #available(iOS 15.0, *) {
                        config.renderConfiguration = { seconds, configuration in
                            var configuration = configuration
                            configuration.title = JobsAppDoorResource.countdownText(seconds: seconds)
                            return configuration
                        }
                    }
                    config.onFinish = { countdownButton, _ in
                        countdownButton.jobsAppDoorAppearance(
                            title: JobsAppDoorResource.text("获取验证码"),
                            titleColor: JobsAppDoorPalette.darkGoldText,
                            font: JobsFont.systemFont(ofSize: 10, weight: .semibold),
                            backgroundColor: JobsAppDoorPalette.gold.withAlphaComponent(0.92),
                            cornerRadius: 17
                        )
                    }
                }
                .onTap { [weak self] sender in
                    guard let self else { return }
                    onVerificationCodeRequest?()
                    sender.countdownStart()
                }
                .byAddTo(self) { make in
                    make.right.equalToSuperview().inset(6)
                    make.centerY.equalToSuperview()
                    make.size.equalTo(CGSize(width: 96, height: 32))
                }
            verificationButton = button
        /// 处理图形验证码分支
        case .graphicCaptcha:
            let captchaView = JobsSwiftGraphicCaptchaView()
                .byCornerRadius(8)
                .byClipsToBounds(true)
                .byAddTo(self) { make in
                    make.right.equalToSuperview().inset(6)
                    make.centerY.equalToSuperview()
                    make.size.equalTo(CGSize(width: 104, height: 34))
                }
            captchaView.config = captchaConfig.resolvedConfig
            self.captchaView = captchaView
        /// 用户名字段无右侧附加控件
        case .username:
            break
        }
    }

    func placeholder() -> String {
        switch field {
        /// 处理用户名占位文案
        case .username:
            return JobsAppDoorResource.text("用户名")
        /// 处理密码占位文案
        case .password:
            return JobsAppDoorResource.text("密码")
        /// 处理确认密码占位文案
        case .confirmPassword:
            return JobsAppDoorResource.text("确认密码")
        /// 处理手机号占位文案
        case .phone:
            return JobsAppDoorResource.text("手机号")
        /// 处理短信验证码占位文案
        case .smsCode:
            return JobsAppDoorResource.text("短信验证码")
        /// 处理图形验证码占位文案
        case .graphicCaptcha:
            return JobsAppDoorResource.text("图形验证码")
        }
    }

    func iconImage() -> UIImage? {
        let resourceName: String
        let symbolName: String
        switch field {
        /// 处理用户名图标
        case .username:
            resourceName = "用户名称"
            symbolName = "person"
        /// 处理密码图标
        case .password, .confirmPassword:
            resourceName = "Lock"
            symbolName = "lock"
        /// 处理手机号图标
        case .phone:
            resourceName = "手机号码"
            symbolName = "phone"
        /// 处理短信验证码图标
        case .smsCode:
            resourceName = "AppDoorVerifyCode"
            symbolName = "message"
        /// 处理图形验证码图标
        case .graphicCaptcha:
            resourceName = "codeEncode"
            symbolName = "character.cursor.ibeam"
        };return JobsAppDoorResource.image(named: resourceName)
            ?? UIImage(systemName: symbolName)
    }

    func passwordImage(isSecure: Bool) -> UIImage? {
        JobsAppDoorResource.image(named: isSecure ? "闭眼" : "睁眼")
            ?? UIImage(systemName: isSecure ? "eye.slash" : "eye")
    }

    func keyboardType() -> UIKeyboardType {
        switch field {
        /// 手机号与短信验证码使用数字键盘
        case .phone, .smsCode:
            return .numberPad
        /// 其它字段使用默认键盘
        default:
            return .default
        }
    }

    func isSecureField() -> Bool {
        switch field {
        /// 密码类字段默认密文输入
        case .password, .confirmPassword:
            return true
        /// 其它字段默认明文输入
        default:
            return false
        }
    }

    func accessoryWidth() -> CGFloat {
        switch field {
        /// 密码类字段预留明密文按钮
        case .password, .confirmPassword:
            return 48
        /// 手机号字段由国码按钮改写左侧约束
        case .phone:
            return 8
        /// 短信与图形验证码预留右侧能力区
        case .smsCode, .graphicCaptcha:
            return 112
        /// 用户名不预留右侧能力区
        case .username:
            return 10
        }
    }
}
