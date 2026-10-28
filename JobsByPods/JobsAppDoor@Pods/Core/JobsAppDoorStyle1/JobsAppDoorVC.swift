//
//  JobsAppDoorVC.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import UIKit
import JobsByUIKit
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit

public final class JobsAppDoorVC: JobsAppDoorBaseVC {

    public private(set) var currentMode: JobsAppDoorMode = .login

    private var hasRunEntranceAnimation = false
    private var keyboardVisible = false
    private var keyboardLift: CGFloat = 0
    private var startsInRegisterMode = false
    private var panelTopConstraint: Constraint?
    private var panelHeightConstraint: Constraint?

    private lazy var panelView: UIView = {
        UIView
            .jobsMake { _ in }
            .byBackgroundColor(JobsAppDoorPalette.panelBackground)
            .byCornerRadius(8)
            .byClipsToBounds(true)
            .byAddTo(view) { [unowned self] make in
                make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(20)
                make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(20)
                panelTopConstraint = make.top.equalToSuperview().offset(panelTop(for: .login)).constraint
                panelHeightConstraint = make.height.equalTo(panelHeight(for: .login)).constraint
            }
    }()

    private lazy var formView = JobsAppDoorFormView(mode: .login,
                                                    configuration: configuration,
                                                    showsModeSwitcher: false)

    private lazy var railButton: UIButton = {
        UIButton.sys()
            .jobsAppDoorAppearance(title: verticalTitle(for: .register),
                                   titleColor: JobsAppDoorPalette.gold,
                                   font: JobsFont.systemFont(ofSize: 13,
                                                             weight: .medium),
                                   backgroundColor: JobsAppDoorPalette.cardBackground,
                                   cornerRadius: 0)
            .byImage(JobsAppDoorResource.image(named: "AppDoorBackLogin")
                ?? JobsAppDoorResource.image(named: "Lock"),
                     for: .normal)
            .byImagePlacement(.top,
                              padding: 8)
            .byTitleAlignment(.center)
            .byNumberOfLines(0)
            .onTap { [weak self] _ in
                guard let self else {
                    return
                }
                switchMode(to: currentMode == .login ? .register : .login)
            }
            .byAddTo(panelView)
    }()

    public override func submissionStateDidChange(_ state: JobsAppDoorSubmissionState) {
        formView.applySubmissionState(state)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        bindForm()
        if startsInRegisterMode {
            switchMode(to: .register)
        }
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        panelTopConstraint?.update(offset: panelTop(for: currentMode))
        panelHeightConstraint?.update(offset: panelHeight(for: currentMode))
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard !hasRunEntranceAnimation else {
            return
        }
        hasRunEntranceAnimation = true
        runEntrancePop(views: [logoView, panelView, customerServiceButton])
    }

    override func handleKeyboardOffset(_ offset: CGFloat,
                                       keyboardVisible: Bool) {
        self.keyboardVisible = keyboardVisible
        keyboardLift = keyboardVisible ? min(108,
                                             offset * 0.32) : 0
        panelTopConstraint?.update(offset: panelTop(for: currentMode))
        updateLogoVisibility(animated: true)
        UIView.jobsAnimateWithOptions(0.25,
                                      options: [.curveEaseOut, .beginFromCurrentState],
                                      animations: {
            self.view.layoutIfNeeded()
        })
    }

    public func toRegister() {
        guard isViewLoaded else {
            startsInRegisterMode = true
            return
        }
        switchMode(to: .register)
    }
}

private extension JobsAppDoorVC {

    func setupLayout() {
        logoView.configure(style: .wide)
        logoView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(panelView.snp.top).offset(-50)
            make.size.equalTo(CGSize(width: 150, height: 50))
        }
        installPanelLayout(mode: .login)
        customerServiceButton.snp.makeConstraints { make in
            make.top.equalTo(panelView.snp.bottom).offset(12)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(118)
            make.height.equalTo(38)
        }
        panelView.byVisible(true)
        logoView.byVisible(true)
        customerServiceButton.byVisible(true)
    }

    func bindForm() {
        formView.configureGraphicCaptcha = configureGraphicCaptcha
        formView.onModeRequest = { [weak self] mode in
            self?.switchMode(to: mode)
        }
        formView.onSubmit = { [weak self] mode, values in
            self?.dispatchSubmit(mode: mode,
                                 values: values)
        }
        formView.onHome = { [weak self] in
            self?.finishToHome()
        }
        formView.onCountryCodeRequest = { [weak self] inputView in
            self?.openCountryCodePicker(for: inputView)
        }
        formView.onVerificationCodeRequest = { [weak self] _ in
            guard let self else {
                return
            }
            verificationCodeHandler?(formView.values)
        }
    }

    func installPanelLayout(mode: JobsAppDoorMode) {
        railButton.snp.remakeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(64)
            switch mode {
            /// 登录态侧轨位于右侧
            case .login:
                make.right.equalToSuperview()
            /// 注册与找回密码态侧轨位于左侧
            case .register, .forgotPassword:
                make.left.equalToSuperview()
            }
        }
        if formView.superview == nil {
            formView.byAddTo(panelView)
        }
        formView.snp.remakeConstraints { make in
            make.top.bottom.equalToSuperview()
            switch mode {
            /// 登录表单位于侧轨左侧
            case .login:
                make.left.equalToSuperview()
                make.right.equalTo(self.railButton.snp.left)
            /// 注册与找回密码表单位于侧轨右侧
            case .register, .forgotPassword:
                make.left.equalTo(self.railButton.snp.right)
                make.right.equalToSuperview()
            }
        }
        panelView.bringSubviewToFront(railButton)
    }

    func switchMode(to mode: JobsAppDoorMode) {
        guard mode != currentMode else {
            return
        }
        cancelSubmission()
        view.endEditing(true)
        keyboardLift = 0
        keyboardVisible = false
        view.layoutIfNeeded()
        currentMode = mode
        formView.apply(mode: mode)
        panelTopConstraint?.update(offset: panelTop(for: mode))
        panelHeightConstraint?.update(offset: panelHeight(for: mode))
        installPanelLayout(mode: mode)
        refreshRailAppearance()
        updateLogoVisibility(animated: false)
        UIView.jobsAnimateWithSpring(0.7,
                                     delay: 0.1,
                                     dampingRatio: 1,
                                     initialVelocity: 0.1,
                                     options: [.curveEaseInOut, .beginFromCurrentState],
                                     animations: {
            self.view.layoutIfNeeded()
        })
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

    func verticalTitle(for mode: JobsAppDoorMode) -> String {
        let title: String
        switch mode {
        /// 登录侧轨文案
        case .login:
            title = JobsAppDoorResource.text("登录")
        /// 注册侧轨文案
        case .register:
            title = JobsAppDoorResource.text("注册")
        /// 找回密码侧轨文案
        case .forgotPassword:
            title = JobsAppDoorResource.text("返回登录")
        }
        return title.map(String.init).joined(separator: "\n")
    }

    func refreshRailAppearance() {
        let loginMode = currentMode == .login
        railButton
            .jobsAppDoorAppearance(title: verticalTitle(for: loginMode ? .register : .login),
                                   titleColor: loginMode ? JobsAppDoorPalette.gold : JobsAppDoorPalette.cardBackground,
                                   font: JobsFont.systemFont(ofSize: loginMode ? 13 : 12,
                                                             weight: .medium),
                                   backgroundColor: loginMode ? JobsAppDoorPalette.cardBackground : JobsAppDoorPalette.fieldStroke,
                                   cornerRadius: 0)
            .byImagePlacement(.top,
                              padding: 8)
            .byTitleAlignment(.center)
            .byNumberOfLines(0)
    }

    func panelTop(for mode: JobsAppDoorMode) -> CGFloat {
        return panelFrame(for: mode).minY
    }

    func panelHeight(for mode: JobsAppDoorMode) -> CGFloat {
        return panelFrame(for: mode).height
    }

    func panelFrame(for mode: JobsAppDoorMode) -> CGRect {
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
                               keyboardLift: keyboardLift,
                               footerHeight: 62)
    }
}
