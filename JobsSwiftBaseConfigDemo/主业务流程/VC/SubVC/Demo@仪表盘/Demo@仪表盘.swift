//
//  Demo@仪表盘.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsBy3rdTools
import JobsTextTools
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

final class FTDashboadDemoVC: BaseVC {
    private let horizontalInset: CGFloat = 20
    private var didInitProgress = false
    private lazy var dashboardView: FTDashboardView = {
        FTDashboardView()
            .byLineWidth(16)
            .byTrackColor(JobsCor.label.withAlphaComponent(0.18))
            .byProgressColor(JobsCor.systemGreen)
            .byTickCount(11)
            .byNeedleInnerRadiusRatio(0.42)
            .byNeedleOuterInset(12)
            .byCenterDotRadius(10)
            .byDraggable(YES)
            .byValueFormatter { p in
                let value = Int(round(p * 100))
                return "\(value)"
            }
            .onProgressChanged { [weak self] progress in
                self?.slider.byValue(Float(progress))
            }
            .byAddTo(view) { [unowned self] make in
                make.centerX.equalToSuperview()
                make.width.height.equalTo(260)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()

    private lazy var slider: UISlider = {
        UISlider()
            .byMinimumValue(0)
            .byMaximumValue(1)
            .byValue(0.44)
            .onJobsChange{ [weak self] (s: UISlider) in
                guard let self else { return }
                dashboardView.setProgress(CGFloat(s.value), animated: true, duration: 0.25)
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(dashboardView.snp.bottom).offset(24)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "仪表盘".tr)
        dashboardView.byVisible(YES)
        slider.byVisible(YES)
    }
    /// 关键：布局完成后，再做一次初始 setProgress，避免首帧角度/中心未就位导致乱晃
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard !didInitProgress else { return }
        didInitProgress = true
        dashboardView.setProgress(CGFloat(slider.value), animated: false)
    }
}
