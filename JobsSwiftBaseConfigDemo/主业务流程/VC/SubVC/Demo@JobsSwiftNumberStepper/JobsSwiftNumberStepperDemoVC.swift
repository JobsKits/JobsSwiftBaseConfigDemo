//
//  JobsSwiftNumberStepperDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import GKNavigationBarSwift
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsSwiftNumberStepper
import SnapKit

final class JobsSwiftNumberStepperDemoVC: BaseVC {
    private var cardViews: [UIView] = []
    private var titleLabels: [UILabel] = []
    private var detailLabels: [UILabel] = []
    private var valueLabels: [UILabel] = []
    private var numberSteppers: [JobsSwiftNumberStepper] = []

    private lazy var scrollView: UIScrollView = {
        UIScrollView.jobsMake { _ in }
            .byAlwaysBounceVertical(true)
            .byShowsVerticalScrollIndicator(false)
            .byKeyboardDismissMode(.interactive)
            .byAddTo(view) { [unowned self] make in
                make.left.right.bottom.equalToSuperview()
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()

    private lazy var contentStackView: UIStackView = {
        UIStackView.jobsMake { _ in }
            .byAxis(.vertical)
            .byAlignment(.fill)
            .byDistribution(.fill)
            .bySpacing(14)
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalTo(scrollView.contentLayoutGuide).inset(16)
                make.width.equalTo(scrollView.frameLayoutGuide).offset(-32)
            }
    }()

    private lazy var introLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("减号 + 整数输入框 + 加号。上下限均为可选配置；到达已设置的边界时，对应按钮会自动禁用并置灰。".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byNumberOfLines(0)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "数字步进输入".tr)
        setupScenarios()
    }
}

private extension JobsSwiftNumberStepperDemoVC {
    func setupScenarios() {
        contentStackView.byAddArrangedSubview(introLabel)
        addScenario(
            title: "不设置边界",
            detail: "minimumValue = nil，maximumValue = nil",
            value: 0
        )
        addScenario(
            title: "仅设置下限",
            detail: "minimumValue = 4；当前值到 4 时减号不可点",
            value: 4,
            minimumValue: 4
        )
        addScenario(
            title: "仅设置上限",
            detail: "maximumValue = 8；当前值到 8 时加号不可点",
            value: 8,
            maximumValue: 8
        )
        addScenario(
            title: "同时设置上下限",
            detail: "输入框只接受整数，结束编辑后自动收敛到 4...8",
            value: 6,
            minimumValue: 4,
            maximumValue: 8
        )
    }

    func addScenario(title: String,
                     detail: String,
                     value: Int,
                     minimumValue: Int? = nil,
                     maximumValue: Int? = nil) {
        let cardView = UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(12)
        let titleLabel = UILabel.jobsMake { _ in }
            .byText(title.tr)
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
        let detailLabel = UILabel.jobsMake { _ in }
            .byText(detail.tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13))
            .byNumberOfLines(0)
        let valueLabel = UILabel.jobsMake { _ in }
            .byText("当前值：\(value)")
            .byTextColor(JobsCor.systemBlue)
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 14, weight: .medium))
        let numberStepper = JobsSwiftNumberStepper()
            .configure(
                value: value,
                minimumValue: minimumValue,
                maximumValue: maximumValue
            )
            .onJobsChange { (stepper: JobsSwiftNumberStepper) in
                valueLabel.byText("当前值：\(stepper.value)")
            }

        cardViews.append(cardView)
        titleLabels.append(titleLabel)
        detailLabels.append(detailLabel)
        valueLabels.append(valueLabel)
        numberSteppers.append(numberStepper)

        contentStackView.byAddArrangedSubview(cardView)
        titleLabel.byAddTo(cardView) { make in
            make.top.left.right.equalToSuperview().inset(16)
        }
        detailLabel.byAddTo(cardView) { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.left.right.equalTo(titleLabel)
        }
        numberStepper.byAddTo(cardView) { make in
            make.top.equalTo(detailLabel.snp.bottom).offset(14)
            make.left.equalTo(titleLabel)
            make.width.equalTo(190)
            make.height.equalTo(44)
            make.bottom.equalToSuperview().inset(16)
        }
        valueLabel.byAddTo(cardView) { make in
            make.left.equalTo(numberStepper.snp.right).offset(12)
            make.right.lessThanOrEqualTo(titleLabel)
            make.centerY.equalTo(numberStepper)
        }
    }
}
