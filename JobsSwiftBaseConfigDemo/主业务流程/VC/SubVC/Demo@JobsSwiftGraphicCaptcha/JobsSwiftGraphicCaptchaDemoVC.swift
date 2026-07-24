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
import JobsSwiftNumberStepper
import GKNavigationBarSwift
import SnapKit

private enum JobsSwiftGraphicCaptchaDemoOption: Int, CaseIterable {
    case uppercaseLetter
    case lowercaseLetter
    case number
    case chinese
    case uppercaseLowercase
    case uppercaseNumber
    case uppercaseChinese
    case lowercaseNumber
    case lowercaseChinese
    case numberChinese
    case uppercaseLowercaseNumber
    case lowercaseNumberChinese
    case uppercaseLowercaseChinese
    case uppercaseNumberChinese
    case all

    var title: String {
        switch self {
        /// 单项：英文大写
        case .uppercaseLetter:
            return "英文大写"
        /// 单项：英文小写
        case .lowercaseLetter:
            return "英文小写"
        /// 单项：阿拉伯数字
        case .number:
            return "阿拉伯数字"
        /// 单项：汉字
        case .chinese:
            return "汉字"
        /// 两两混合：英文大写和英文小写
        case .uppercaseLowercase:
            return "英文大写 + 英文小写"
        /// 两两混合：英文大写和阿拉伯数字
        case .uppercaseNumber:
            return "英文大写 + 阿拉伯数字"
        /// 两两混合：英文大写和汉字
        case .uppercaseChinese:
            return "英文大写 + 汉字"
        /// 两两混合：英文小写和阿拉伯数字
        case .lowercaseNumber:
            return "英文小写 + 阿拉伯数字"
        /// 两两混合：英文小写和汉字
        case .lowercaseChinese:
            return "英文小写 + 汉字"
        /// 两两混合：阿拉伯数字和汉字
        case .numberChinese:
            return "阿拉伯数字 + 汉字"
        /// 三三混合：英文大写、英文小写和阿拉伯数字
        case .uppercaseLowercaseNumber:
            return "英文大写 + 英文小写 + 阿拉伯数字"
        /// 三三混合：英文小写、阿拉伯数字和汉字
        case .lowercaseNumberChinese:
            return "英文小写 + 阿拉伯数字 + 汉字"
        /// 三三混合：英文大写、英文小写和汉字
        case .uppercaseLowercaseChinese:
            return "英文大写 + 英文小写 + 汉字"
        /// 三三混合：英文大写、阿拉伯数字和汉字
        case .uppercaseNumberChinese:
            return "英文大写 + 阿拉伯数字 + 汉字"
        /// 全部混合：四种字符单位
        case .all:
            return "英文大写 + 英文小写 + 阿拉伯数字 + 汉字"
        }
    }

    var characterUnits: JobsSwiftGraphicCaptchaCharacterUnit {
        switch self {
        /// 单项：英文大写
        case .uppercaseLetter:
            return .uppercaseLetter
        /// 单项：英文小写
        case .lowercaseLetter:
            return .lowercaseLetter
        /// 单项：阿拉伯数字
        case .number:
            return .number
        /// 单项：汉字
        case .chinese:
            return .chinese
        /// 两两混合：英文大写和英文小写
        case .uppercaseLowercase:
            return [.uppercaseLetter, .lowercaseLetter]
        /// 两两混合：英文大写和阿拉伯数字
        case .uppercaseNumber:
            return [.uppercaseLetter, .number]
        /// 两两混合：英文大写和汉字
        case .uppercaseChinese:
            return [.uppercaseLetter, .chinese]
        /// 两两混合：英文小写和阿拉伯数字
        case .lowercaseNumber:
            return [.lowercaseLetter, .number]
        /// 两两混合：英文小写和汉字
        case .lowercaseChinese:
            return [.lowercaseLetter, .chinese]
        /// 两两混合：阿拉伯数字和汉字
        case .numberChinese:
            return [.number, .chinese]
        /// 三三混合：英文大写、英文小写和阿拉伯数字
        case .uppercaseLowercaseNumber:
            return [.uppercaseLetter, .lowercaseLetter, .number]
        /// 三三混合：英文小写、阿拉伯数字和汉字
        case .lowercaseNumberChinese:
            return [.lowercaseLetter, .number, .chinese]
        /// 三三混合：英文大写、英文小写和汉字
        case .uppercaseLowercaseChinese:
            return [.uppercaseLetter, .lowercaseLetter, .chinese]
        /// 三三混合：英文大写、阿拉伯数字和汉字
        case .uppercaseNumberChinese:
            return [.uppercaseLetter, .number, .chinese]
        /// 全部混合：四种字符单位
        case .all:
            return [.uppercaseLetter, .lowercaseLetter, .number, .chinese]
        }
    }

    var config: JobsSwiftGraphicCaptchaConfig {
        let groupCount = characterUnits.rawValue.nonzeroBitCount
        return JobsSwiftGraphicCaptchaConfig(
            caseSensitive: true,
            characterUnits: characterUnits,
            mixedGroupCount: groupCount > 1 ? groupCount : 0
        )
    }
}

final class JobsSwiftGraphicCaptchaDemoVC: BaseVC {
    private var selectedOption = JobsSwiftGraphicCaptchaDemoOption.all
    private var optionButtons: [UIButton] = []
    private var optionRowViews: [UIView] = []
    private var optionScrollViews: [UIScrollView] = []
    private var optionStackViews: [UIStackView] = []
    private var optionTitleLabels: [UILabel] = []

    private lazy var captchaView: JobsSwiftGraphicCaptchaView = {
        let captchaView = JobsSwiftGraphicCaptchaView()
            .byCornerRadius(12)
            .byMasksToBounds(true)
            .byBorderColor(JobsCor.systemGray4)
            .byBorderWidth(0.5)
        captchaView.refreshHandler = { [weak self] text in
            self?.resultLabel
                .byText("当前验证码：\(text)")
                .byTextColor(JobsCor.secondaryLabel)
        };return captchaView
    }()

    private lazy var optionRowsView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.clear)
    }()

    private lazy var lengthLabel: UILabel = {
        UILabel()
            .byText("长度：".tr)
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 15))
    }()

    private lazy var lengthStepper: JobsSwiftNumberStepper = {
        JobsSwiftNumberStepper()
            .configure(value: 4, minimumValue: 4, maximumValue: 8)
            .onJobsChange { [weak self] (stepper: JobsSwiftNumberStepper) in
                self?.lengthChanged(stepper)
            }
    }()

    private lazy var inputField: UITextField = {
        UITextField()
            .byBorderStyle(.roundedRect)
            .byClearButtonMode(.whileEditing)
            .byAutocapitalizationType(.none)
            .byAutocorrectionType(.no)
            .byPlaceholder("输入图形验证码".tr)
    }()

    private lazy var resultLabel: UILabel = {
        UILabel()
            .byText("等待输入校验".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byTextAlignment(.center)
            .byNumberOfLines(2)
    }()

    private lazy var refreshButton: UIButton = {
        UIButton.sys()
            .byConfiguration(
                UIButton.Configuration.filled()
                    .byTitle("刷新".tr)
                    .byCornerStyle(.medium)
            )
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .onTap { [weak self] _ in
                self?.refreshCaptcha()
            }
    }()

    private lazy var validateButton: UIButton = {
        UIButton.sys()
            .byConfiguration(
                UIButton.Configuration.filled()
                    .byTitle("校验".tr)
                    .byCornerStyle(.medium)
            )
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .onTap { [weak self] _ in
                self?.validateCaptcha()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "图形验证码".tr)
        setupSubviews()
        buildOptionRows(in: optionRowsView)
        applyOption(.all)
    }
}

private extension JobsSwiftGraphicCaptchaDemoVC {
    var optionGroups: [(title: String, options: [JobsSwiftGraphicCaptchaDemoOption])] {
        [
            ("单个演示", [.uppercaseLetter, .lowercaseLetter, .number, .chinese]),
            ("两两混合", [.uppercaseLowercase, .uppercaseNumber, .uppercaseChinese,
                         .lowercaseNumber, .lowercaseChinese, .numberChinese]),
            ("三三混合", [.uppercaseLowercaseNumber, .lowercaseNumberChinese,
                         .uppercaseLowercaseChinese, .uppercaseNumberChinese]),
            ("全部混合", [.all])
        ]
    }

    func setupSubviews() {
        captchaView.byAddTo(view) { [unowned self] make in
            make.left.right.equalToSuperview().inset(32)
            if view.jobs_hasVisibleTopBar() {
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(18)
            } else {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(18)
            }
            make.height.equalTo(72)
        }
        optionRowsView.byAddTo(view) { [unowned self] make in
            make.top.equalTo(captchaView.snp.bottom).offset(18)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(166)
        }
        lengthLabel.byAddTo(view) { [unowned self] make in
            make.top.equalTo(optionRowsView.snp.bottom).offset(14)
            make.left.equalTo(captchaView)
            make.height.equalTo(32)
        }
        lengthStepper.byAddTo(view) { [unowned self] make in
            make.right.equalTo(captchaView)
            make.centerY.equalTo(lengthLabel)
            make.width.equalTo(170)
            make.height.equalTo(44)
        }
        inputField.byAddTo(view) { [unowned self] make in
            make.top.equalTo(lengthLabel.snp.bottom).offset(14)
            make.left.right.equalTo(captchaView)
            make.height.equalTo(44)
        }
        resultLabel.byAddTo(view) { [unowned self] make in
            make.top.equalTo(inputField.snp.bottom).offset(10)
            make.left.right.equalTo(inputField)
            make.height.equalTo(36)
        }
        refreshButton.byAddTo(view) { [unowned self] make in
            make.top.equalTo(resultLabel.snp.bottom).offset(14)
            make.left.equalTo(inputField)
            make.width.equalTo(inputField).multipliedBy(0.45)
            make.height.equalTo(42)
        }
        validateButton.byAddTo(view) { [unowned self] make in
            make.top.width.height.equalTo(refreshButton)
            make.right.equalTo(inputField)
        }
    }

    func buildOptionRows(in containerView: UIView) {
        optionRowViews.forEach { $0.byRemoveFromSuperview() }
        optionButtons.removeAll()
        optionRowViews.removeAll()
        optionScrollViews.removeAll()
        optionStackViews.removeAll()
        optionTitleLabels.removeAll()
        let groups = optionGroups
        var previousRow: UIView?
        for (index, group) in groups.enumerated() {
            let rowView = UIView()
                .byBackgroundColor(JobsCor.clear)
            optionRowViews.append(rowView)
            let titleLabel = UILabel()
                .byText(group.title.tr)
                .byTextColor(JobsCor.secondaryLabel)
                .byFont(JobsFont.systemFont(ofSize: 13, weight: .medium))
                .byTextAlignment(.left)
            optionTitleLabels.append(titleLabel)
            let scrollView = UIScrollView()
                .byAlwaysBounceHorizontal(true)
                .byAlwaysBounceVertical(false)
                .byShowsHorizontalScrollIndicator(false)
                .byShowsVerticalScrollIndicator(false)
                .byDirectionalLockEnabled(true)
                .byContentInsetAdjustmentBehavior(.never)
            optionScrollViews.append(scrollView)
            let stackView = UIStackView()
                .byAxis(.horizontal)
                .byDistribution(.fill)
                .byAlignment(.fill)
                .bySpacing(8)
            optionStackViews.append(stackView)
            group.options.forEach { option in
                stackView.byAddArrangedSubview(optionButton(for: option))
            }
            rowView.byAddTo(containerView) { make in
                make.left.right.equalToSuperview()
                make.height.equalTo(34)
                if let previousRow {
                    make.top.equalTo(previousRow.snp.bottom).offset(10)
                } else {
                    make.top.equalToSuperview()
                }
                if index == groups.count - 1 {
                    make.bottom.equalToSuperview()
                }
            }
            titleLabel.byAddTo(rowView) { make in
                make.left.top.bottom.equalToSuperview()
                make.width.equalTo(72)
            }
            scrollView.byAddTo(rowView) { make in
                make.left.equalTo(titleLabel.snp.right).offset(8)
                make.top.right.bottom.equalToSuperview()
            }
            stackView.byAddTo(scrollView) { make in
                make.edges.equalTo(scrollView.contentLayoutGuide)
                make.height.equalTo(scrollView.frameLayoutGuide)
            }
            previousRow = rowView
        }
    }

    func optionButton(for option: JobsSwiftGraphicCaptchaDemoOption) -> UIButton {
        let button = UIButton.sys()
            .byConfiguration(
                UIButton.Configuration.plain()
                    .byTitle(option.title.tr)
                    .byBaseForegroundColor(JobsCor.secondaryLabel)
                    .byBackground(
                        UIBackgroundConfiguration.clear()
                            .byBackgroundColor(JobsCor.systemGray6)
                            .byCornerRadius(8)
                    )
                    .byContentInsets(NSDirectionalEdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14))
            )
            .byTitleFont(JobsFont.systemFont(ofSize: 13, weight: .medium))
            .onTap { [weak self] _ in
                self?.applyOption(option)
            }
        optionButtons.append(button)
        return button
    }

    func applyOption(_ option: JobsSwiftGraphicCaptchaDemoOption) {
        selectedOption = option
        let groupCount = option.characterUnits.rawValue.nonzeroBitCount
        if lengthStepper.value < groupCount {
            lengthStepper.setValue(groupCount)
        }
        var config = option.config
        config.length = lengthStepper.value
        captchaView.config = config
        inputField.byText(nil)
        resultLabel
            .byText("等待输入校验".tr)
            .byTextColor(JobsCor.secondaryLabel)
        for (index, button) in optionButtons.enumerated() {
            let selected = JobsSwiftGraphicCaptchaDemoOption.allCases[index] == option
            button
                .bySelected(selected)
                .byConfiguration { configuration in
                    configuration
                        .byBaseForegroundColor(selected ? JobsCor.white : JobsCor.secondaryLabel)
                        .byBackground(
                            configuration.background
                                .byBackgroundColor(selected ? JobsCor.systemBlue : JobsCor.systemGray6)
                                .byCornerRadius(8)
                        )
                }
        }
    }

    func lengthChanged(_ stepper: JobsSwiftNumberStepper) {
        applyOption(selectedOption)
    }

    func refreshCaptcha() {
        captchaView.refreshCaptcha()
        inputField.byText(nil)
        resultLabel
            .byText("已刷新".tr)
            .byTextColor(JobsCor.systemBlue)
    }

    func validateCaptcha() {
        let passed = captchaView.validateInput(inputField.text)
        resultLabel
            .byText(passed ? "校验通过".tr : "校验失败".tr)
            .byTextColor(passed ? JobsCor.systemGreen : JobsCor.systemRed)
    }
}
