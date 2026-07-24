//
//  JobsAppDoorStyle2VC.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import UIKit
import JobsByUIKit
import JobsSwiftDSL
import SnapKit

public final class JobsAppDoorStyle2VC: JobsAppDoorBaseVC {
    public private(set) var currentMode: JobsAppDoorMode = .login

    private var hasRunEntranceAnimation = false
    private var keyboardVisible = false
    private var centerXConstraints: [JobsAppDoorMode: Constraint] = [:]
    private var topConstraints: [JobsAppDoorMode: Constraint] = [:]

    private lazy var loginForm = makeForm(mode: .login)
    private lazy var registerForm = makeForm(mode: .register)
    private lazy var forgotPasswordForm = makeForm(mode: .forgotPassword)

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard !hasRunEntranceAnimation else { return }
        hasRunEntranceAnimation = true
        runEntrancePop(views: [logoView, loginForm, customerServiceButton])
    }

    override func handleKeyboardOffset(_ offset: CGFloat, keyboardVisible: Bool) {
        self.keyboardVisible = keyboardVisible
        let top = cardTop(for: currentMode)
        topConstraints[currentMode]?.update(
            offset: keyboardVisible ? top - min(112, offset * 0.34) : top
        )
        updateLogoVisibility(animated: true)
        UIView.jobsAnimateWithOptions(
            0.25,
            options: [.curveEaseOut, .beginFromCurrentState],
            animations: { self.view.layoutIfNeeded() }
        )
    }
}

public typealias JobsAppDoorVC_Style2 = JobsAppDoorStyle2VC

private extension JobsAppDoorStyle2VC {
    func setupLayout() {
        install(form: loginForm, mode: .login, initialOffset: 0)
        install(form: registerForm, mode: .register, initialOffset: offscreenOffset)
        install(form: forgotPasswordForm, mode: .forgotPassword, initialOffset: offscreenOffset)
        logoView.configure(style: .square)
        logoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(loginForm.snp.top).offset(-50)
            make.size.equalTo(CGSize(width: 82, height: 82))
        }
        registerForm.byHidden(true)
        forgotPasswordForm.byHidden(true)
        installCustomerServiceConstraint(below: loginForm)
        logoView.byVisible(true)
        loginForm.byVisible(true)
        customerServiceButton.byVisible(true)
    }

    func install(form: JobsAppDoorFormView, mode: JobsAppDoorMode, initialOffset: CGFloat) {
        form.byAddTo(view) { make in
            self.centerXConstraints[mode] = make.centerX.equalToSuperview().offset(initialOffset).constraint
            self.topConstraints[mode] = make.top.equalToSuperview().offset(self.cardTop(for: mode)).constraint
            make.width.equalToSuperview().offset(-40)
            make.height.equalTo(self.cardHeight(for: mode))
        }
    }

    func makeForm(mode: JobsAppDoorMode) -> JobsAppDoorFormView {
        let form = JobsAppDoorFormView(
            mode: mode,
            configuration: configuration,
            showsModeSwitcher: true
        )
        form.onModeRequest = { [weak self] mode in
            self?.switchMode(to: mode)
        }
        form.onSubmit = { [weak self] mode, values in
            self?.dispatchSubmit(mode: mode, values: values)
        }
        form.onHome = { [weak self] in
            self?.finishToHome()
        }
        form.onCountryCodeRequest = { [weak self] inputView in
            self?.openCountryCodePicker(for: inputView)
        }
        form.onVerificationCodeRequest = { [weak self, weak form] _ in
            guard let self, let form else { return }
            verificationCodeHandler?(form.values)
        };return form
    }

    func switchMode(to mode: JobsAppDoorMode) {
        guard mode != currentMode else { return }
        view.endEditing(true)
        keyboardVisible = false
        view.layoutIfNeeded()

        let previousMode = currentMode
        let previousForm = form(for: previousMode)
        let nextForm = form(for: mode)
        currentMode = mode
        nextForm.byHidden(false)
        topConstraints[mode]?.update(offset: cardTop(for: mode))
        view.layoutIfNeeded()

        centerXConstraints[previousMode]?.update(offset: -offscreenOffset)
        centerXConstraints[mode]?.update(offset: 0)
        installCustomerServiceConstraint(below: nextForm)
        if mode == .login {
            runEntrancePop(views: [logoView])
        } else {
            logoView.byAlpha(0)
        }
        if mode == .forgotPassword {
            customerServiceButton.byAlpha(0)
        }

        UIView.jobsAnimateWithSpring(
            2,
            delay: 0.1,
            dampingRatio: 0.3,
            initialVelocity: 10,
            options: [.curveEaseInOut, .beginFromCurrentState],
            animations: {
                if mode != .forgotPassword {
                    self.customerServiceButton.byAlpha(1)
                }
                self.view.layoutIfNeeded()
            },
            completion: { [weak previousForm] _ in
                previousForm?.byHidden(true)
            }
        )
    }

    func installCustomerServiceConstraint(below form: JobsAppDoorFormView) {
        customerServiceButton.snp.remakeConstraints { make in
            make.top.equalTo(form.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalTo(118)
            make.height.equalTo(38)
        }
    }

    func updateLogoVisibility(animated: Bool) {
        let alpha: CGFloat = currentMode == .login && !keyboardVisible ? 1 : 0
        guard animated else {
            logoView.byAlpha(alpha)
            return
        }
        UIView.jobsAnimateWithOptions(
            0.2,
            options: [.curveEaseOut, .beginFromCurrentState],
            animations: { self.logoView.byAlpha(alpha) }
        )
    }

    func form(for mode: JobsAppDoorMode) -> JobsAppDoorFormView {
        switch mode {
        /// 登录独立卡片
        case .login:
            return loginForm
        /// 注册独立卡片
        case .register:
            return registerForm
        /// 找回密码独立卡片
        case .forgotPassword:
            return forgotPasswordForm
        }
    }

    var offscreenOffset: CGFloat {
        max(UIScreen.main.bounds.width, view.bounds.width)
    }

    func cardTop(for mode: JobsAppDoorMode) -> CGFloat {
        switch mode {
        /// 登录卡片使用屏幕四分之一位置
        case .login:
            return configuration.loginContentY
        /// 注册卡片随字段数量垂直居中
        case .register:
            return configuration.registerContentY
        /// 找回密码卡片使用屏幕四分之一位置
        case .forgotPassword:
            return configuration.forgotPasswordContentY
        }
    }

    func cardHeight(for mode: JobsAppDoorMode) -> CGFloat {
        switch mode {
        /// 登录卡片沿用 OC 侧屏幕比例
        case .login:
            return configuration.loginContentHeight
        /// 注册卡片高度跟随字段数量
        case .register:
            return configuration.registerContentHeight
        /// 找回密码卡片沿用 OC 侧屏幕比例
        case .forgotPassword:
            return configuration.forgotPasswordContentHeight
        }
    }
}
