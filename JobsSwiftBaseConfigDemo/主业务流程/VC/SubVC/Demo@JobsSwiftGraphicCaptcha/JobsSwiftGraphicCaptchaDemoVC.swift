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

private struct JobsSwiftGraphicCaptchaDemoUnit {
    let title: String
    let characterUnit: JobsSwiftGraphicCaptchaCharacterUnit
}

private struct JobsSwiftGraphicCaptchaDemoOption: Equatable {
    let title: String
    let characterUnits: JobsSwiftGraphicCaptchaCharacterUnit

    var characterGroupCount: Int {
        characterUnits.rawValue.nonzeroBitCount
    }

    var config: JobsSwiftGraphicCaptchaConfig {
        return JobsSwiftGraphicCaptchaConfig(
            caseSensitive: true,
            characterUnits: characterUnits,
            mixedGroupCount: characterGroupCount > 1 ? characterGroupCount : 0
        )
    }
}

final class JobsSwiftGraphicCaptchaDemoVC: BaseVC {
    private var selectedOption = JobsSwiftGraphicCaptchaDemoOption(
        title: "英文大写 + 英文小写 + 阿拉伯数字 + 简体汉字 + 繁体汉字",
        characterUnits: [.uppercaseLetter, .lowercaseLetter, .number,
                         .simplifiedChinese, .traditionalChinese]
    )
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
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.clear)
    }()

    private lazy var lengthLabel: UILabel = {
        UILabel.jobsMake { _ in }
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
        UITextField.jobsMake { _ in }
            .byBorderStyle(.roundedRect)
            .byClearButtonMode(.whileEditing)
            .byAutocapitalizationType(.none)
            .byAutocorrectionType(.no)
            .byPlaceholder("输入图形验证码".tr)
    }()

    private lazy var resultLabel: UILabel = {
        UILabel.jobsMake { _ in }
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
        applyOption(selectedOption)
    }
}

private extension JobsSwiftGraphicCaptchaDemoVC {
    var optionGroups: [(title: String, options: [JobsSwiftGraphicCaptchaDemoOption])] {
        let units = [
            JobsSwiftGraphicCaptchaDemoUnit(title: "英文大写", characterUnit: .uppercaseLetter),
            JobsSwiftGraphicCaptchaDemoUnit(title: "英文小写", characterUnit: .lowercaseLetter),
            JobsSwiftGraphicCaptchaDemoUnit(title: "阿拉伯数字", characterUnit: .number),
            JobsSwiftGraphicCaptchaDemoUnit(title: "简体汉字", characterUnit: .simplifiedChinese),
            JobsSwiftGraphicCaptchaDemoUnit(title: "繁体汉字", characterUnit: .traditionalChinese)
        ]
        let groupTitles = ["单个演示", "两两混合", "三三混合", "四四混合", "全部混合"]
        return groupTitles.enumerated().map { index, groupTitle in
            let groupCount = index + 1
            let options = combinations(units, count: groupCount).map { combination in
                JobsSwiftGraphicCaptchaDemoOption(
                    title: combination.map(\.title).joined(separator: " + "),
                    characterUnits: combination.reduce(into: []) { result, unit in
                        result.formUnion(unit.characterUnit)
                    }
                )
            };return (groupTitle, options)
        }
    }

    func combinations(_ units: [JobsSwiftGraphicCaptchaDemoUnit],
                      count: Int) -> [[JobsSwiftGraphicCaptchaDemoUnit]] {
        guard count > 0 else { return [[]] }
        guard units.count >= count else { return [] }
        if count == units.count { return [units] }
        let head = units[0]
        let tail = Array(units.dropFirst())
        let includingHead = combinations(tail, count: count - 1).map { [head] + $0 }
        let excludingHead = combinations(tail, count: count)
        return includingHead + excludingHead
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
            make.height.equalTo(210)
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
            let rowView = UIView.jobsMake { _ in }
                .byBackgroundColor(JobsCor.clear)
            optionRowViews.append(rowView)
            let titleLabel = UILabel.jobsMake { _ in }
                .byText(group.title.tr)
                .byTextColor(JobsCor.secondaryLabel)
                .byFont(JobsFont.systemFont(ofSize: 13, weight: .medium))
                .byTextAlignment(.left)
            optionTitleLabels.append(titleLabel)
            let scrollView = UIScrollView.jobsMake { _ in }
                .byAlwaysBounceHorizontal(true)
                .byAlwaysBounceVertical(false)
                .byShowsHorizontalScrollIndicator(false)
                .byShowsVerticalScrollIndicator(false)
                .byDirectionalLockEnabled(true)
                .byContentInsetAdjustmentBehavior(.never)
            optionScrollViews.append(scrollView)
            let stackView = UIStackView.jobsMake { _ in }
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
            .byTag(option.characterUnits.rawValue)
        optionButtons.append(button)
        return button
    }

    func applyOption(_ option: JobsSwiftGraphicCaptchaDemoOption) {
        selectedOption = option
        let groupCount = option.characterGroupCount
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
        for button in optionButtons {
            let selected = button.tag == option.characterUnits.rawValue
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
