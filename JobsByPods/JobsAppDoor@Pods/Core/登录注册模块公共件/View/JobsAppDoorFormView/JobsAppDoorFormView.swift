//
//  JobsAppDoorFormView.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import UIKit
import JobsByUIKit
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit

public final class JobsAppDoorFormView: UIView {
    public let configuration: JobsAppDoorConfig
    public private(set) var mode: JobsAppDoorMode
    public var onModeRequest: ((JobsAppDoorMode) -> Void)?
    public var onSubmit: ((JobsAppDoorMode, JobsAppDoorFormValues) -> Void)?
    public var onHome: (() -> Void)?
    public var onCountryCodeRequest: ((JobsAppDoorInputView) -> Void)?
    public var onVerificationCodeRequest: ((JobsAppDoorInputView) -> Void)?

    private let showsModeSwitcher: Bool
    private var orderedFields: [JobsAppDoorField] = []
    private var inputViews: [JobsAppDoorField: JobsAppDoorInputView] = [:]
    private var remembersPassword = true

    private lazy var contentView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.clear)
            .byAddTo(self)
    }()

    private lazy var titleLabel: UILabel = {
        UILabel()
            .byTextColor(JobsCor.white)
            .byTextAlignment(.center)
            .byFont(JobsFont.systemFont(ofSize: 20, weight: .regular))
            .byAddTo(contentView)
    }()

    private lazy var fieldsStack: UIStackView = {
        UIStackView()
            .byAxis(.vertical)
            .byAlignment(.fill)
            .byDistribution(.fill)
            .bySpacing(20)
            .byAddTo(contentView)
    }()

    private lazy var rememberButton: UIButton = {
        UIButton.sys()
            .jobsAppDoorAppearance(
                title: JobsAppDoorResource.text("记住我"),
                titleColor: JobsAppDoorPalette.fieldStroke,
                font: JobsFont.systemFont(ofSize: 12, weight: .regular),
                backgroundColor: JobsCor.clear,
                cornerRadius: 0
            )
            .byImage(rememberImage(selected: true), for: .normal)
            .byImagePlacement(.left, padding: 4)
            .jobsAppDoorSingleLineTitle()
            .byContentHorizontalAlignment(.left)
            .onTap { [weak self] sender in
                guard let self else { return }
                remembersPassword.toggle()
                sender.byImage(rememberImage(selected: remembersPassword), for: .normal)
            }
    }()

    private lazy var forgotButton: UIButton = {
        UIButton.sys()
            .jobsAppDoorAppearance(
                title: JobsAppDoorResource.text("忘记密码"),
                titleColor: JobsAppDoorPalette.gold,
                font: JobsFont.systemFont(ofSize: 12, weight: .regular),
                backgroundColor: JobsCor.clear,
                cornerRadius: 0
            )
            .byImage(
                JobsAppDoorResource.image(named: "AppDoorQuestion")
                    ?? JobsAppDoorResource.image(named: "codeDecode"),
                for: .normal
            )
            .byImagePlacement(.left, padding: 4)
            .jobsAppDoorSingleLineTitle()
            .byContentHorizontalAlignment(.right)
            .onTap { [weak self] _ in
                self?.onModeRequest?(.forgotPassword)
            }
    }()

    private lazy var loginOptionsStack: UIStackView = {
        UIStackView(arrangedSubviews: [rememberButton, forgotButton])
            .byAxis(.horizontal)
            .byAlignment(.fill)
            .byDistribution(.fillEqually)
            .bySpacing(8)
            .byAddTo(contentView)
    }()

    private lazy var submitButton: UIButton = {
        UIButton.sys()
            .jobsAppDoorAppearance(
                title: submitTitle(),
                titleColor: submitTitleColor(),
                font: JobsFont.systemFont(ofSize: 15, weight: .semibold),
                backgroundColor: submitBackgroundColor(enabled: false),
                cornerRadius: 25
            )
            .onTap { [weak self] _ in
                self?.submitTapped()
            }
            .byAddTo(contentView)
    }()

    private lazy var homeButton: UIButton = {
        UIButton.sys()
            .jobsAppDoorAppearance(
                title: JobsAppDoorResource.text("返回首页"),
                titleColor: homeTitleColor(),
                font: JobsFont.systemFont(ofSize: 15, weight: .semibold),
                backgroundColor: JobsCor.clear,
                cornerRadius: 0
            )
            .onTap { [weak self] _ in
                self?.onHome?()
            }
            .byAddTo(contentView)
    }()

    private lazy var modeButton: UIButton = {
        UIButton.sys()
            .jobsAppDoorAppearance(
                title: verticalModeTitle(),
                titleColor: railTitleColor(),
                font: JobsFont.systemFont(ofSize: 13, weight: .medium),
                backgroundColor: railBackgroundColor(),
                cornerRadius: 0
            )
            .byImage(
                JobsAppDoorResource.image(named: "AppDoorBackLogin")
                    ?? JobsAppDoorResource.image(named: "Lock"),
                for: .normal
            )
            .byImagePlacement(.top, padding: 8)
            .byTitleAlignment(.center)
            .byNumberOfLines(0)
            .onTap { [weak self] _ in
                guard let self else { return }
                onModeRequest?(mode == .login ? .register : .login)
            }
            .byAddTo(self)
    }()

    private lazy var validationLabel: UILabel = {
        UILabel()
            .byTextColor(JobsAppDoorPalette.gold)
            .byTextAlignment(.center)
            .byFont(JobsFont.systemFont(ofSize: 10, weight: .medium))
            .byNumberOfLines(1)
            .byAddTo(contentView)
    }()

    public init(
        mode: JobsAppDoorMode,
        configuration: JobsAppDoorConfig,
        showsModeSwitcher: Bool
    ) {
        self.mode = mode
        self.configuration = configuration
        self.showsModeSwitcher = showsModeSwitcher
        super.init(frame: .zero)
        setupView()
        apply(mode: mode)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var preferredHeight: CGFloat {
        switch mode {
        /// 登录卡片沿用 OC 侧屏幕比例
        case .login:
            return configuration.loginContentHeight
        /// 注册卡片高度跟随启用的字段数量
        case .register:
            return configuration.registerContentHeight
        /// 找回密码卡片沿用 OC 侧屏幕比例
        case .forgotPassword:
            return configuration.forgotPasswordContentHeight
        }
    }

    public var values: JobsAppDoorFormValues {
        JobsAppDoorFormValues(
            username: inputViews[.username]?.text ?? "",
            password: inputViews[.password]?.text ?? "",
            confirmPassword: inputViews[.confirmPassword]?.text ?? "",
            countryCode: inputViews[.phone]?.countryCode ?? "+86",
            phone: inputViews[.phone]?.text ?? "",
            smsCode: inputViews[.smsCode]?.text ?? "",
            graphicCaptcha: inputViews[.graphicCaptcha]?.text ?? "",
            remembersPassword: remembersPassword
        )
    }

    public func apply(mode: JobsAppDoorMode) {
        self.mode = mode
        titleLabel
            .byText(title())
            .byFont(titleFont())
        fieldsStack.bySpacing(mode == .login ? 20 : 12)
        submitButton.jobsAppDoorAppearance(
            title: submitTitle(),
            titleColor: submitTitleColor(),
            font: JobsFont.systemFont(ofSize: 15, weight: .semibold),
            backgroundColor: submitBackgroundColor(enabled: false),
            cornerRadius: 25
        )
        homeButton.jobsAppDoorAppearance(
            title: JobsAppDoorResource.text("返回首页"),
            titleColor: homeTitleColor(),
            font: JobsFont.systemFont(ofSize: 15, weight: .semibold),
            backgroundColor: JobsCor.clear,
            cornerRadius: 0
        )
        loginOptionsStack.byHidden(mode != .login)
        validationLabel.byText("")
        rebuildFields()
        refreshRailAppearance()
        installLayout()
        refreshSubmitState()
    }
}

private extension JobsAppDoorFormView {
    func setupView() {
        byBackgroundColor(showsModeSwitcher ? JobsAppDoorPalette.cardBackground : JobsCor.clear)
            .byCornerRadius(showsModeSwitcher ? 8 : 0)
            .byClipsToBounds(showsModeSwitcher)
        contentView.byVisible(true)
        titleLabel.byVisible(true)
        fieldsStack.byVisible(true)
        loginOptionsStack.byVisible(true)
        validationLabel.byVisible(true)
        submitButton.byVisible(true)
        homeButton.byVisible(true)
        if showsModeSwitcher {
            modeButton.byVisible(true)
        }
    }

    func installLayout() {
        if showsModeSwitcher {
            modeButton.snp.remakeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(64)
                switch mode {
                /// 登录侧轨位于卡片右侧
                case .login:
                    make.right.equalToSuperview()
                /// 注册与找回密码侧轨位于卡片左侧
                case .register, .forgotPassword:
                    make.left.equalToSuperview()
                }
            }
        }
        contentView.snp.remakeConstraints { make in
            make.top.bottom.equalToSuperview()
            guard showsModeSwitcher else {
                make.left.right.equalToSuperview()
                return
            }
            switch mode {
            /// 登录表单位于右侧轨道左边
            case .login:
                make.left.equalToSuperview()
                make.right.equalTo(modeButton.snp.left)
            /// 注册与找回密码表单位于左侧轨道右边
            case .register, .forgotPassword:
                make.left.equalTo(modeButton.snp.right)
                make.right.equalToSuperview()
            }
        }
        titleLabel.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(mode == .login ? 20 : 14)
            make.centerX.equalToSuperview()
            make.height.equalTo(mode == .login ? 24 : 20)
            make.left.greaterThanOrEqualToSuperview().offset(20)
            make.right.lessThanOrEqualToSuperview().inset(20)
        }
        fieldsStack.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(mode == .login ? 20 : 14)
            make.left.right.equalToSuperview().inset(20)
        }
        loginOptionsStack.snp.remakeConstraints { make in
            make.top.equalTo(fieldsStack.snp.bottom).offset(18)
            make.left.right.equalTo(fieldsStack).inset(17)
            make.height.equalTo(28)
        }
        homeButton.snp.remakeConstraints { make in
            make.left.right.equalTo(fieldsStack)
            make.height.equalTo(mode == .login ? 20 : 22)
            let bottomInset: CGFloat = mode == .login && showsModeSwitcher ? 28 : 18
            make.bottom.equalToSuperview().inset(bottomInset)
        }
        submitButton.snp.remakeConstraints { make in
            make.left.right.equalTo(fieldsStack)
            make.height.equalTo(50)
            make.bottom.equalTo(homeButton.snp.top).offset(-12)
        }
        validationLabel.snp.remakeConstraints { make in
            make.left.right.equalTo(fieldsStack)
            make.bottom.equalTo(submitButton.snp.top).offset(-2)
            make.height.equalTo(14)
        }
    }

    func rebuildFields() {
        fieldsStack.arrangedSubviews.forEach { view in
            fieldsStack.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        orderedFields = fieldsForMode()
        for field in orderedFields {
            let inputView = inputViews[field] ?? makeInputView(field: field)
            inputViews[field] = inputView
            fieldsStack.addArrangedSubview(inputView)
            inputView.snp.makeConstraints { make in
                make.height.equalTo(50)
            }
        }
    }

    func makeInputView(field: JobsAppDoorField) -> JobsAppDoorInputView {
        let inputView = JobsAppDoorInputView(
            field: field,
            captchaConfig: configuration.registerConfig.graphicCaptchaConfig,
            verificationCodeDuration: configuration.verificationCodeDuration
        )
        inputView.onTextChanged = { [weak self] in
            self?.validationLabel.byText("")
            self?.refreshSubmitState()
        }
        inputView.onCountryCodeRequest = { [weak self, weak inputView] in
            guard let self, let inputView else { return }
            onCountryCodeRequest?(inputView)
        }
        inputView.onVerificationCodeRequest = { [weak self, weak inputView] in
            guard let self, let inputView else { return }
            onVerificationCodeRequest?(inputView)
        };return inputView
    }

    func fieldsForMode() -> [JobsAppDoorField] {
        switch mode {
        /// 登录只需用户名和密码
        case .login:
            return [.username, .password]
        /// 注册按配置追加手机绑定与图形验证码
        case .register:
            var fields: [JobsAppDoorField] = [.username, .password, .confirmPassword]
            if configuration.registerConfig.showsMobileBinding {
                fields.append(contentsOf: [.phone, .smsCode])
            }
            if configuration.registerConfig.showsGraphicCaptcha {
                fields.append(.graphicCaptcha)
            };return fields
        /// 找回密码需要账号、手机验证和新密码
        case .forgotPassword:
            var fields: [JobsAppDoorField] = [.username, .phone, .smsCode, .password]
            if configuration.registerConfig.showsGraphicCaptcha {
                fields.append(.graphicCaptcha)
            };return fields
        }
    }

    func refreshRailAppearance() {
        guard showsModeSwitcher else { return }
        modeButton
            .jobsAppDoorAppearance(
                title: verticalModeTitle(),
                titleColor: railTitleColor(),
                font: JobsFont.systemFont(ofSize: mode == .login ? 13 : 12, weight: .medium),
                backgroundColor: railBackgroundColor(),
                cornerRadius: 0
            )
            .byImagePlacement(.top, padding: 8)
            .byTitleAlignment(.center)
            .byNumberOfLines(0)
    }

    func refreshSubmitState() {
        let valid = validationMessage(includeEmptyMessage: false) == nil
        submitButton
            .jobsAppDoorAppearance(
                title: submitTitle(),
                titleColor: submitTitleColor(),
                font: JobsFont.systemFont(ofSize: 15, weight: .semibold),
                backgroundColor: submitBackgroundColor(enabled: valid),
                cornerRadius: 25
            )
            .byEnabled(valid)
            .byAlpha(valid ? 1 : 0.45)
    }

    func submitTapped() {
        if let message = validationMessage(includeEmptyMessage: true) {
            validationLabel.byText(message)
            return
        }
        validationLabel.byText("")
        onSubmit?(mode, values)
    }

    func validationMessage(includeEmptyMessage: Bool) -> String? {
        let hasEmptyValue = orderedFields.contains { field in
            inputViews[field]?.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty != false
        }
        if hasEmptyValue {
            return includeEmptyMessage ? JobsAppDoorResource.text("请完整填写表单") : JobsAppDoorResource.text("")
        }
        if mode == .register,
           inputViews[.password]?.text != inputViews[.confirmPassword]?.text {
            return JobsAppDoorResource.text("两次输入的密码不一致")
        }
        if orderedFields.contains(.graphicCaptcha),
           inputViews[.graphicCaptcha]?.validateGraphicCaptcha() != true {
            return JobsAppDoorResource.text("图形验证码错误")
        };return nil
    }

    func title() -> String {
        switch mode {
        /// 登录标题
        case .login:
            return JobsAppDoorResource.text("登录")
        /// 注册标题
        case .register:
            return JobsAppDoorResource.text("注册")
        /// 找回密码标题
        case .forgotPassword:
            return JobsAppDoorResource.text("忘记密码")
        }
    }

    func titleFont() -> UIFont {
        mode == .login
            ? JobsFont.systemFont(ofSize: 20, weight: .regular)
            : JobsFont.systemFont(ofSize: 18, weight: .semibold)
    }

    func submitTitle() -> String {
        switch mode {
        /// 登录提交文案
        case .login:
            return JobsAppDoorResource.text("登录")
        /// 注册提交文案
        case .register:
            return JobsAppDoorResource.text("注册")
        /// 找回密码提交文案
        case .forgotPassword:
            return JobsAppDoorResource.text("重置密码")
        }
    }

    func verticalModeTitle() -> String {
        let title = mode == .login
            ? JobsAppDoorResource.text("去注册")
            : JobsAppDoorResource.text("返回登录")
        return title.map(String.init).joined(separator: "\n")
    }

    func railTitleColor() -> UIColor {
        mode == .login ? JobsAppDoorPalette.gold : JobsAppDoorPalette.cardBackground
    }

    func railBackgroundColor() -> UIColor {
        mode == .login ? JobsAppDoorPalette.cardBackground : JobsAppDoorPalette.fieldStroke
    }

    func submitTitleColor() -> UIColor {
        showsModeSwitcher ? JobsCor.white : JobsAppDoorPalette.darkGoldText
    }

    func submitBackgroundColor(enabled: Bool) -> UIColor {
        if showsModeSwitcher {
            return JobsCor.systemPink.withAlphaComponent(enabled ? 0.85 : 0.35)
        };return JobsAppDoorPalette.gold.withAlphaComponent(enabled ? 0.92 : 0.42)
    }

    func homeTitleColor() -> UIColor {
        showsModeSwitcher ? JobsCor.white : JobsAppDoorPalette.gold
    }

    func rememberImage(selected: Bool) -> UIImage? {
        JobsAppDoorResource.image(named: selected ? "记住密码" : "没有记住密码")
            ?? UIImage(systemName: selected ? "checkmark.circle.fill" : "circle")
    }
}
