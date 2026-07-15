//
//  JobsCoreMotionDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import CoreMotion
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit
import GKNavigationBarSwift

final class JobsCoreMotionDemoVC: BaseVC {
    private let motionManager = CMMotionManager.make()

    private lazy var statusLabel: UILabel = {
        UILabel()
            .byText("正在等待陀螺仪数据…".tr)
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 17, weight: .medium))
            .byTextColor(JobsCor.label)
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(14)
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview().inset(20)
                make.centerY.equalToSuperview()
                make.height.equalTo(220)
            }
    }()

    deinit {
        motionManager.byStopAllUpdates()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "CoreMotion DSL Demo".tr)
        view.byBackgroundColor(JobsCor.systemBackground)
        statusLabel.byVisible(YES)
        startGyroscope()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        motionManager.byStopAllUpdates()
    }

    private func startGyroscope() {
        guard motionManager.isGyroAvailable else {
            statusLabel.byText("当前设备不支持陀螺仪；请使用真机运行。".tr)
            return
        }
        motionManager
            .byGyroUpdateInterval(1.0 / 30.0)
            .byStartGyroUpdates(to: .main) { [weak self] data, error in
                guard let self else { return }
                if let error {
                    statusLabel.byText(error.localizedDescription.tr)
                    return
                }
                guard let rate = data?.rotationRate else { return }
                statusLabel.byText(
                    String(format: "一链式陀螺仪监听\n\nx: %.4f\ny: %.4f\nz: %.4f", rate.x, rate.y, rate.z).tr
                )
            }
    }
}
