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
    private var keyboardLift: CGFloat = 0
    private var heightConstraints: [JobsAppDoorMode: Constraint] = [:]
    private var centerXConstraints: [JobsAppDoorMode: Constraint] = [:]
    private var topConstraints: [JobsAppDoorMode: Constraint] = [:]

    private lazy var loginForm = makeForm(mode: .login)
    private lazy var registerForm = makeForm(mode: .register)
    private lazy var forgotPasswordForm = makeForm(mode: .forgotPassword)

    public override func submissionStateDidChange(_ state: JobsAppDoorSubmissionState) {
        loginForm.applySubmissionState(state)
        registerForm.applySubmissionState(state)
        forgotPasswordForm.applySubmissionState(state)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for mode in [JobsAppDoorMode.login, .register, .forgotPassword] {
            topConstraints[mode]?.update(offset: cardTop(for: mode))
            heightConstraints[mode]?.update(offset: cardHeight(for: mode))
            if mode != currentMode, form(for: mode).isHidden {
                centerXConstraints[mode]?.update(offset: offscreenOffset)
            }
        }
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard !hasRunEntranceAnimation else {
            return
        }
        hasRunEntranceAnimation = true
        runEntrancePop(views: [logoView, loginForm, customerServiceButton])
    }

    override func handleKeyboardOffset(_ offset: CGFloat,
                                       keyboardVisible: Bool) {
        self.keyboardVisible = keyboardVisible
        keyboardLift = keyboardVisible ? min(112,
                                             offset * 0.34) : 0
        topConstraints[currentMode]?.update(offset: cardTop(for: currentMode))
        updateLogoVisibility(animated: true)
        UIView.jobsAnimateWithOptions(0.25,
                                      options: [.curveEaseOut, .beginFromCurrentState],
                                      animations: {
            self.view.layoutIfNeeded()
        })
    }
}

public typealias JobsAppDoorVC_Style2 = JobsAppDoorStyle2VC

private extension JobsAppDoorStyle2VC {

    func setupLayout() {
        install(form: loginForm,
                mode: .login,
                initialOffset: 0)
        install(form: registerForm,
                mode: .register,
                initialOffset: offscreenOffset)
        install(form: forgotPasswordForm,
                mode: .forgotPassword,
                initialOffset: offscreenOffset)
        logoView.configure(style: .square)
        logoView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
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

    func install(form: JobsAppDoorFormView,
                 mode: JobsAppDoorMode,
                 initialOffset: CGFloat) {
        form.byAddTo(view) { make in
            self.centerXConstraints[mode] = make.centerX.equalTo(self.view.safeAreaLayoutGuide).offset(initialOffset).constraint
            self.topConstraints[mode] = make.top.equalToSuperview().offset(self.cardTop(for: mode)).constraint
            make.width.equalTo(self.view.safeAreaLayoutGuide).offset(-40)
            self.heightConstraints[mode] = make.height.equalTo(self.cardHeight(for: mode)).constraint
        }
    }

    func makeForm(mode: JobsAppDoorMode) -> JobsAppDoorFormView {
        let form = JobsAppDoorFormView(mode: mode,
                                       configuration: configuration,
                                       showsModeSwitcher: true)
        form.configureGraphicCaptcha = configureGraphicCaptcha
        form.onModeRequest = { [weak self] mode in
            self?.switchMode(to: mode)
        }
        form.onSubmit = { [weak self] mode, values in
            self?.dispatchSubmit(mode: mode,
                                 values: values)
        }
        form.onHome = { [weak self] in
            self?.finishToHome()
        }
        form.onCountryCodeRequest = { [weak self] inputView in
            self?.openCountryCodePicker(for: inputView)
        }
        form.onVerificationCodeRequest = { [weak self, weak form] _ in
            guard let self, let form else {
                return
            }
            verificationCodeHandler?(form.values)
        }
        return form
    }

    func switchMode(to mode: JobsAppDoorMode) {
        guard mode != currentMode else {
            return
        }
        cancelSubmission()
        view.endEditing(true)
        keyboardVisible = false
        keyboardLift = 0
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

        UIView.jobsAnimateWithSpring(2,
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
        })
    }

    func installCustomerServiceConstraint(below form: JobsAppDoorFormView) {
        customerServiceButton.snp.remakeConstraints { make in
            make.top.equalTo(form.snp.bottom).offset(8)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
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
        UIView.jobsAnimateWithOptions(0.2,
                                      options: [.curveEaseOut, .beginFromCurrentState],
                                      animations: {
            self.logoView.byAlpha(alpha)
        })
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
        view.bounds.width
    }

    func cardTop(for mode: JobsAppDoorMode) -> CGFloat {
        return cardFrame(for: mode).minY
    }

    func cardHeight(for mode: JobsAppDoorMode) -> CGFloat {
        return cardFrame(for: mode).height
    }

    func cardFrame(for mode: JobsAppDoorMode) -> CGRect {
        let layout = configuration.contentLayout(in: view.bounds.inset(by: view.safeAreaInsets))
        let preferredY: CGFloat
        let preferredHeight: CGFloat
        switch mode {
        case .login:
            preferredY = layout.loginY
            preferredHeight = layout.loginHeight
        case .register:
            preferredY = layout.registerY
            preferredHeight = configuration.registerContentHeight
        case .forgotPassword:
            preferredY = layout.forgotY
            preferredHeight = layout.forgotHeight
        }
        return formLayoutFrame(preferredY: preferredY,
                               preferredHeight: preferredHeight,
                               keyboardLift: mode == currentMode ? keyboardLift : 0,
                               footerHeight: 58)
    }
}
