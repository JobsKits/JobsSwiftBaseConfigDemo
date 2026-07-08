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

import JobsByUIKit
import JobsInheritance
import JobsSwiftDSL
import JobsSwiftGraphicCaptcha
import GKNavigationBarSwift
import SnapKit

final class JobsSwiftGraphicCaptchaDemoVC: BaseVC {
    private lazy var modeControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["混合", "大小写", "不敏感", "数字", "汉字"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(modeChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var captchaView: JobsSwiftGraphicCaptchaView = {
        let view = JobsSwiftGraphicCaptchaView()
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.systemGray4.cgColor
        view.layer.borderWidth = 0.5
        view.refreshHandler = { [weak self] text in
            self?.resultLabel.text = "当前验证码：\(text)"
            self?.resultLabel.textColor = .secondaryLabel
        };return view
    }()

    private lazy var inputField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.placeholder = "输入验证码"
        return textField
    }()

    private lazy var resultLabel: UILabel = {
        UILabel()
            .byText("当前验证码：")
            .byTextColor(.secondaryLabel)
            .byFont(.systemFont(ofSize: 15, weight: .medium))
            .byNumberOfLines(2)
    }()

    private lazy var refreshButton: UIButton = {
        UIButton(type: .system)
            .byTitle("刷新", for: .normal)
            .onTap { [weak self] _ in
                self?.captchaView.refreshCaptcha()
            }
    }()

    private lazy var validateButton: UIButton = {
        UIButton(type: .system)
            .byTitle("校验", for: .normal)
            .onTap { [weak self] _ in
                self?.validateCaptcha()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "图形验证码")
        setupSubviews()
        applyMode(index: modeControl.selectedSegmentIndex)
    }
}

private extension JobsSwiftGraphicCaptchaDemoVC {
    func setupSubviews() {
        view.addSubview(modeControl)
        view.addSubview(captchaView)
        view.addSubview(inputField)
        view.addSubview(resultLabel)
        view.addSubview(refreshButton)
        view.addSubview(validateButton)

        modeControl.snp.makeConstraints { [unowned self] make in
            make.left.right.equalToSuperview().inset(16)
            if view.jobs_hasVisibleTopBar() {
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(18)
            } else {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(18)
            }
            make.height.equalTo(34)
        }

        captchaView.snp.makeConstraints { make in
            make.top.equalTo(modeControl.snp.bottom).offset(22)
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

    func applyMode(index: Int) {
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
            captchaView.config = .mixedConfig
        }
        inputField.text = nil
    }

    func validateCaptcha() {
        let passed = captchaView.validateInput(inputField.text)
        resultLabel.text = passed ? "校验通过" : "校验失败：\(captchaView.captchaText)"
        resultLabel.textColor = passed ? .systemGreen : .systemRed
    }
}
