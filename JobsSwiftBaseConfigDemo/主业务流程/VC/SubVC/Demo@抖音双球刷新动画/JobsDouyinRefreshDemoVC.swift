//
//  JobsDouyinRefreshDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsInheritance
import JobsByUIKit
import JobsFuseAnimation
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

final class JobsDouyinRefreshDemoVC: BaseVC {
    private var simulatedRefreshWorkItem: DispatchWorkItem?

    private lazy var hintLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("红、绿双球交叉换位并错峰跳跃；组件可独立用于下拉刷新、加载态或空白页。".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 15))
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom).offset(36)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(36)
                }
                make.left.right.equalToSuperview().inset(28)
            }
    }()

    private lazy var animationCardView: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(24)
            .byShadowColor(JobsCor.black)
            .byShadowOpacity(0.10)
            .byShadowRadius(18)
            .byShadowOffset(CGSize(width: 0, height: 10))
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(hintLabel.snp.bottom).offset(36)
                make.centerX.equalToSuperview()
                make.width.equalTo(240)
                make.height.equalTo(176)
            }
    }()

    private lazy var refreshView: JobsDouyinRefreshView = {
        JobsDouyinRefreshView(
            config: JobsDouyinRefreshConfig(
                dotDiameter: 18,
                horizontalTravel: 32,
                jumpHeight: 11,
                cycleDuration: 0.84
            )
        )
        .byAddTo(animationCardView) { make in
            make.center.equalToSuperview()
        }
    }()

    private lazy var statusLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("正在刷新…".tr)
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
            .byTextAlignment(.center)
            .byNumberOfLines(1)
            .byAddTo(animationCardView) { [unowned self] make in
                make.top.equalTo(refreshView.snp.bottom).offset(22)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var startButton: UIButton = {
        makeControlButton(title: "开始 / 继续", color: JobsCor.systemGreen)
            .onTap { [weak self] _ in
                guard let self else { return }
                simulatedRefreshWorkItem?.cancel()
                statusLabel.byText("正在刷新…".tr)
                if refreshView.isAnimating {
                    refreshView.byResume()
                } else {
                    refreshView.byStart()
                }
            }
    }()

    private lazy var pauseButton: UIButton = {
        makeControlButton(title: "暂停", color: JobsCor.systemOrange)
            .onTap { [weak self] _ in
                self?.simulatedRefreshWorkItem?.cancel()
                self?.statusLabel.byText("刷新已暂停".tr)
                self?.refreshView.byPause()
            }
    }()

    private lazy var stopButton: UIButton = {
        makeControlButton(title: "停止", color: JobsCor.systemRed)
            .onTap { [weak self] _ in
                self?.simulatedRefreshWorkItem?.cancel()
                self?.statusLabel.byText("刷新已停止".tr)
                self?.refreshView.byStop()
            }
    }()

    private lazy var controlsStackView: UIStackView = {
        UIStackView.jobsMake { _ in }
            .byAxis(.horizontal)
            .byAlignment(.fill)
            .byDistribution(.fillEqually)
            .bySpacing(12)
            .byAddArrangedSubviews([startButton, pauseButton, stopButton])
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(animationCardView.snp.bottom).offset(32)
                make.left.right.equalToSuperview().inset(28)
                make.height.equalTo(46)
            }
    }()

    private lazy var simulateButton: UIButton = {
        UIButton.sys()
            .byTitle("模拟一次 2 秒刷新".tr)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTitleColor(JobsCor.white)
            .byBackgroundColor(JobsCor.systemBlue)
            .byCornerRadius(12)
            .onTap { [weak self] _ in
                self?.beginSimulatedRefresh()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(controlsStackView.snp.bottom).offset(16)
                make.left.right.equalTo(controlsStackView)
                make.height.equalTo(48)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "抖音双球刷新动画".tr)
        hintLabel.byVisible(YES)
        animationCardView.byVisible(YES)
        refreshView.byVisible(YES)
        statusLabel.byVisible(YES)
        controlsStackView.byVisible(YES)
        simulateButton.byVisible(YES)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        beginSimulatedRefresh()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        simulatedRefreshWorkItem?.cancel()
        refreshView.byStop()
    }

    private func makeControlButton(title: String, color: UIColor) -> UIButton {
        UIButton.sys()
            .byTitle(title.tr)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byTitleColor(JobsCor.white)
            .byBackgroundColor(color)
            .byCornerRadius(10)
    }

    private func beginSimulatedRefresh() {
        simulatedRefreshWorkItem?.cancel()
        statusLabel.byText("正在刷新…".tr)
        refreshView.byStart()
        let workItem = DispatchWorkItem { [weak self] in
            guard let self else { return }
            statusLabel.byText("刷新完成，点击按钮可再次演示".tr)
            refreshView.byStop()
        }
        simulatedRefreshWorkItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: workItem)
    }
}
