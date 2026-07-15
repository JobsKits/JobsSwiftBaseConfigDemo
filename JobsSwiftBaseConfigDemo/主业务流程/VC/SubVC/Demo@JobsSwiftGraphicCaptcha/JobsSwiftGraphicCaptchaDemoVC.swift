//
//  JobsSwiftGraphicCaptchaDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsByUIKit
import JobsInheritance
import JobsSwiftDSL
import JobsSwiftGraphicCaptcha
import GKNavigationBarSwift
import SnapKit

final class JobsSwiftGraphicCaptchaDemoVC: BaseVC {
    private var mixedModeTopConstraint: Constraint?
    private var mixedModeHeightConstraint: Constraint?
    private var captchaTopConstraint: Constraint?

    private lazy var modeControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["混合", "大小写", "不敏感", "数字", "汉字"])
        control.selectedSegmentIndex = 0
        control.byAddTarget(self, action: #selector(modeChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var mixedModeControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["两两混合", "三三混合", "全部混合"])
        control.selectedSegmentIndex = 2
        control.byAddTarget(self, action: #selector(mixedModeChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var captchaView: JobsSwiftGraphicCaptchaView = {
        let view = JobsSwiftGraphicCaptchaView()
        view.byCornerRadius(12)
        view.byMasksToBounds(true)
        view.byBorderColor(JobsCor.systemGray4)
        view.byBorderWidth(0.5)
        view.refreshHandler = { [weak self] text in
            self?.resultLabel.byText("当前验证码：\(text)")
            self?.resultLabel.byTextColor(JobsCor.secondaryLabel)
        };return view
    }()

    private lazy var inputField: UITextField = {
        let textField = UITextField()
        textField.byBorderStyle(.roundedRect)
        textField.byClearButtonMode(.whileEditing)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.byPlaceholder("输入验证码".tr)
        return textField
    }()

    private lazy var resultLabel: UILabel = {
        UILabel()
            .byText("当前验证码：".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byNumberOfLines(2)
    }()

    private lazy var refreshButton: UIButton = {
        UIButton.sys()
            .byTitle("刷新".tr, for: .normal)
            .onTap { [weak self] _ in
                self?.captchaView.refreshCaptcha()
            }
    }()

    private lazy var validateButton: UIButton = {
        UIButton.sys()
            .byTitle("校验".tr, for: .normal)
            .onTap { [weak self] _ in
                self?.validateCaptcha()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "图形验证码".tr)
        setupSubviews()
        applyMode(index: modeControl.selectedSegmentIndex)
    }
}

private extension JobsSwiftGraphicCaptchaDemoVC {
    func setupSubviews() {
        modeControl.byAddTo(view)
        mixedModeControl.byAddTo(view)
        captchaView.byAddTo(view)
        inputField.byAddTo(view)
        resultLabel.byAddTo(view)
        refreshButton.byAddTo(view)
        validateButton.byAddTo(view)
        modeControl.snp.makeConstraints { [unowned self] make in
            make.left.right.equalToSuperview().inset(16)
            if view.jobs_hasVisibleTopBar() {
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(18)
            } else {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(18)
            }
            make.height.equalTo(34)
        }
        mixedModeControl.snp.makeConstraints { make in
            mixedModeTopConstraint = make.top.equalTo(modeControl.snp.bottom).offset(10).constraint
            make.left.right.equalTo(modeControl)
            mixedModeHeightConstraint = make.height.equalTo(34).constraint
        }
        captchaView.snp.makeConstraints { make in
            captchaTopConstraint = make.top.equalTo(mixedModeControl.snp.bottom).offset(22).constraint
            make.left.right.equalToSuperview().inset(32)
            make.height.equalTo(72)
        }
        inputField.snp.makeConstraints { make in
            make.top.equalTo(captchaView.snp.bottom).offset(18)
            make.left.right.equalTo(captchaView)
            make.height.equalTo(44)
        }
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(inputField.snp.bottom).offset(12)
            make.left.right.equalTo(inputField)
        }
        refreshButton.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(18)
            make.left.equalTo(inputField)
            make.height.equalTo(42)
            make.width.equalTo(inputField).multipliedBy(0.45)
        }
        validateButton.snp.makeConstraints { make in
            make.top.height.width.equalTo(refreshButton)
            make.right.equalTo(inputField)
        }
    }

    @objc func modeChanged(_ sender: UISegmentedControl) {
        applyMode(index: sender.selectedSegmentIndex)
    }

    @objc func mixedModeChanged(_ sender: UISegmentedControl) {
        modeControl.selectedSegmentIndex = 0
        applyMode(index: 0)
    }

    func applyMode(index: Int) {
        let isMixedMode = index == 0
        mixedModeControl.byHidden(!isMixedMode)
        mixedModeTopConstraint?.update(offset: isMixedMode ? 10 : 0)
        mixedModeHeightConstraint?.update(offset: isMixedMode ? 34 : 0)
        captchaTopConstraint?.update(offset: isMixedMode ? 22 : 18)
        switch index {
        case 1:
            captchaView.config = .letterCaseSensitiveConfig
        case 2:
            captchaView.config = .letterCaseInsensitiveConfig
        case 3:
            captchaView.config = .numberConfig
        case 4:
            captchaView.config = .chineseConfig
        default:
            captchaView.config = currentMixedConfig()
        }
        inputField.byText(nil)
        view.layoutIfNeeded()
    }

    func currentMixedConfig() -> JobsSwiftGraphicCaptchaConfig {
        switch mixedModeControl.selectedSegmentIndex {
        case 0:
            return .twoMixedConfig
        case 1:
            return .threeMixedConfig
        default:
            return .fullMixedConfig
        }
    }

    func validateCaptcha() {
        let passed = captchaView.validateInput(inputField.text)
        resultLabel.byText(passed ? "校验通过" : "校验失败：\(captchaView.captchaText)")
        resultLabel.byTextColor(passed ? JobsCor.systemGreen : JobsCor.systemRed)
    }
}
