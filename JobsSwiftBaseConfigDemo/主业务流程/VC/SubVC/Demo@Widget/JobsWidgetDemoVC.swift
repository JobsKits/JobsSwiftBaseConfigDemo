//
//  JobsWidgetDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月20日，星期一.
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
import SnapKit

final class JobsWidgetDemoVC: BaseVC {
    private enum WidgetFamily: Int {
        case small
        case medium
        case large

        var summary: String {
            switch self {
            case .small:
                return "小号：一眼读取核心状态".tr
            case .medium:
                return "中号：展示状态与下一步行动".tr
            case .large:
                return "大号：承载更完整的信息层级与时间线摘要".tr
            }
        }
    }

    private var widgetFamily = WidgetFamily.medium
    private var counter = 8

    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byAlwaysBounceVertical(YES)
            .byShowsVerticalScrollIndicator(NO)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalToSuperview()
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var contentView: UIView = {
        UIView()
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalTo(self.scrollView.contentLayoutGuide)
                make.width.equalTo(self.scrollView.frameLayoutGuide)
            }
    }()

    private lazy var introLabel: UILabel = {
        UILabel()
            .byText("宿主联调页：切换 Widget family，修改状态，观察时间线快照如何重新排版。".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byNumberOfLines(0)
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(20)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var familyControl: UISegmentedControl = {
        UISegmentedControl(items: ["小号".tr, "中号".tr, "大号".tr])
            .bySelectedSegmentIndex(WidgetFamily.medium.rawValue)
            .onJobsChange { [weak self] (control: UISegmentedControl) in
                guard let self,
                      let family = WidgetFamily(rawValue: control.selectedSegmentIndex) else { return }
                self.apply(family, status: "family：已切换为\(control.titleForSegment(at: control.selectedSegmentIndex) ?? "--")")
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.introLabel.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(20)
                make.height.equalTo(42)
            }
    }()

    private lazy var previewCard: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.systemIndigo)
            .byCornerRadius(22)
            .byClipsToBounds(YES)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.familyControl.snp.bottom).offset(18)
                make.left.right.equalToSuperview().inset(20)
                make.height.equalTo(174)
            }
    }()

    private lazy var previewEyebrowLabel: UILabel = {
        UILabel()
            .byText("WIDGETKIT · PREVIEW")
            .byTextColor(JobsCor.white.withAlphaComponent(0.72))
            .byFont(JobsFont.systemFont(ofSize: 11, weight: .semibold))
            .byAddTo(previewCard) { make in
                make.top.left.equalToSuperview().offset(16)
            }
    }()

    private lazy var previewTitleLabel: UILabel = {
        UILabel()
            .byText("演武堂 · 小组件".tr)
            .byTextColor(JobsCor.white)
            .byFont(JobsFont.systemFont(ofSize: 20, weight: .bold))
            .byAddTo(previewCard) { [unowned self] make in
                make.top.equalTo(self.previewEyebrowLabel.snp.bottom).offset(6)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var previewTimeLabel: UILabel = {
        UILabel()
            .byText("--:--:--")
            .byTextColor(JobsCor.white)
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 30, weight: .bold))
            .byAddTo(previewCard) { [unowned self] make in
                make.top.equalTo(self.previewTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var previewCounterLabel: UILabel = {
        UILabel()
            .byTextColor(JobsCor.white.withAlphaComponent(0.86))
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byAddTo(previewCard) { [unowned self] make in
                make.top.equalTo(self.previewTimeLabel.snp.bottom).offset(3)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var previewDescriptionLabel: UILabel = {
        UILabel()
            .byTextColor(JobsCor.white.withAlphaComponent(0.72))
            .byFont(JobsFont.systemFont(ofSize: 12, weight: .regular))
            .byNumberOfLines(2)
            .byAddTo(previewCard) { make in
                make.left.right.bottom.equalToSuperview().inset(16)
            }
    }()

    private lazy var increaseButton: UIButton = {
        UIButton.sys()
            .byTitle("计数 +1".tr, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .bold))
            .byBackgroundColor(JobsCor.systemBlue)
            .byCornerRadius(12)
            .onTap { [weak self] _ in
                guard let self else { return }
                counter = counter >= 12 ? 1 : counter + 1
                refreshPreview(status: "宿主状态：计数已更新".tr)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.previewCard.snp.bottom).offset(16)
                make.left.equalToSuperview().offset(20)
                make.right.equalTo(self.contentView.snp.centerX).offset(-6)
                make.height.equalTo(46)
            }
    }()

    private lazy var refreshButton: UIButton = {
        UIButton.sys()
            .byTitle("刷新时间线".tr, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .bold))
            .byBackgroundColor(JobsCor.systemPurple)
            .byCornerRadius(12)
            .onTap { [weak self] _ in
                self?.refreshPreview(status: "时间线：已手动重载预览".tr)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.previewCard.snp.bottom).offset(16)
                make.left.equalTo(self.contentView.snp.centerX).offset(6)
                make.right.equalToSuperview().inset(20)
                make.height.equalTo(46)
            }
    }()

    private lazy var timelineLabel: UILabel = {
        UILabel()
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.increaseButton.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var footnoteLabel: UILabel = {
        UILabel()
            .byText("真正上桌面：在 Xcode 新建 Widget Extension → 宿主与 Extension 配置 App Group → 写入共享数据 → 通过 WidgetCenter 重载时间线 → 长按桌面添加。\n\niOS 不允许 App 直接弹出系统小组件库；本页专注演示 family 自适应、状态更新和时间线节奏。".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
            .byNumberOfLines(0)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.timelineLabel.snp.bottom).offset(14)
                make.left.right.equalToSuperview().inset(20)
                make.bottom.equalToSuperview().inset(24)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "iOS Widget Demo".tr)
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        setupUI()
        apply(.medium, status: "时间线：已生成当前快照".tr)
    }
}

private extension JobsWidgetDemoVC {
    private func setupUI() {
        [
            scrollView,
            contentView,
            introLabel,
            familyControl,
            previewCard,
            previewEyebrowLabel,
            previewTitleLabel,
            previewTimeLabel,
            previewCounterLabel,
            previewDescriptionLabel,
            increaseButton,
            refreshButton,
            timelineLabel,
            footnoteLabel
        ].forEach { $0.byVisible(YES) }
    }

    private func apply(_ family: WidgetFamily, status: String) {
        widgetFamily = family
        familyControl.bySelectedSegmentIndex(family.rawValue)
        previewCard.byRemakeConstraints { [unowned self] make in
            make.top.equalTo(self.familyControl.snp.bottom).offset(18)
            if family == .small {
                make.centerX.equalToSuperview()
                make.size.equalTo(CGSize(width: 170, height: 170))
            } else {
                make.left.right.equalToSuperview().inset(20)
                make.height.equalTo(family == .medium ? 174 : 310)
            }
        }
        refreshPreview(status: status)
        UIView.animate(withDuration: 0.24) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }

    private func refreshPreview(status: String) {
        let time = currentTimeText()
        previewTimeLabel.byText(time)
        previewCounterLabel.byText("今日进度 \(counter) / 12".tr)
        previewDescriptionLabel.byText(widgetFamily.summary)
        timelineLabel.byText("\(status) · \(time)")
    }

    private func currentTimeText() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: Date())
    }
}
