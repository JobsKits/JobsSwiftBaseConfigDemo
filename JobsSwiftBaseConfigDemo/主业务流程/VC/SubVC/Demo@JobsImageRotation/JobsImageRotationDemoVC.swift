//
//  JobsImageRotationDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsImageRotation
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import Jobsl10n
import SnapKit
import GKNavigationBarSwift

final class JobsImageRotationDemoVC: BaseVC {
    private lazy var descriptionLabel: UILabel = {
        UILabel()
            .byText("无刻度、固定时针，仅分针绕圆心旋转；方向与速度由外界传入。".tr)
            .byFont(JobsFont.systemFont(ofSize: 15))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byTextAlignment(.center)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(24)
                make.left.right.equalToSuperview().inset(24)
            }
    }()

    private lazy var clockwiseClockView: JobsClockIconView = {
        JobsClockIconView()
            .byTintColor(JobsCor.systemBlue)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(descriptionLabel.snp.bottom).offset(24)
                make.centerX.equalToSuperview().offset(-72)
                make.size.equalTo(CGSize(width: 84, height: 84))
            }
    }()

    private lazy var counterclockwiseClockView: JobsClockIconView = {
        JobsClockIconView(
            direction: .counterclockwise,
            interval: 0.05
        )
            .byTintColor(JobsCor.systemPurple)
            .byAddTo(view) { [unowned self] make in
                make.top.size.equalTo(self.clockwiseClockView)
                make.centerX.equalToSuperview().offset(72)
            }
    }()

    private lazy var clockwiseLabel: UILabel = {
        UILabel()
            .byText("默认顺时针 · 6 秒/周".tr)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .medium))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.clockwiseClockView.snp.bottom).offset(10)
                make.centerX.equalTo(self.clockwiseClockView)
            }
    }()

    private lazy var counterclockwiseLabel: UILabel = {
        UILabel()
            .byText("逆时针 · 3 秒/周".tr)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .medium))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.counterclockwiseClockView.snp.bottom).offset(10)
                make.centerX.equalTo(self.counterclockwiseClockView)
            }
    }()

    private lazy var startButton: UIButton = {
        makeControlButton(title: "开始".tr, backgroundColor: JobsCor.systemGreen) { [weak self] _ in
            self?.startRotations()
        }
        .byAddTo(view) { [unowned self] make in
            make.top.equalTo(clockwiseLabel.snp.bottom).offset(28)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(44)
        }
    }()

    private lazy var pauseButton: UIButton = {
        makeControlButton(title: "暂停".tr, backgroundColor: JobsCor.systemOrange) { [weak self] _ in
            self?.pauseRotations()
        }
        .byAddTo(view) { [unowned self] make in
            make.top.width.height.equalTo(startButton)
            make.left.equalTo(startButton.snp.right).offset(12)
            make.right.equalToSuperview().inset(24)
        }
    }()

    private lazy var resumeButton: UIButton = {
        makeControlButton(title: "继续".tr, backgroundColor: JobsCor.systemBlue) { [weak self] _ in
            self?.resumeRotations()
        }
        .byAddTo(view) { [unowned self] make in
            make.top.equalTo(startButton.snp.bottom).offset(12)
            make.left.width.height.equalTo(startButton)
        }
    }()

    private lazy var stopButton: UIButton = {
        makeControlButton(title: "停止并复位".tr, backgroundColor: JobsCor.systemRed) { [weak self] _ in
            self?.stopRotations()
        }
        .byAddTo(view) { [unowned self] make in
            make.top.width.height.equalTo(resumeButton)
            make.left.right.equalTo(pauseButton)
        }
    }()

    private lazy var statusLabel: UILabel = {
        UILabel()
            .byText("等待开始".tr)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(resumeButton.snp.bottom).offset(20)
                make.left.right.equalToSuperview().inset(24)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "动态时钟图标@JobsImageRotation".tr)
        view.byBackgroundColor(JobsCor.systemBackground)
        [
            descriptionLabel,
            clockwiseClockView,
            counterclockwiseClockView,
            clockwiseLabel,
            counterclockwiseLabel,
            startButton,
            pauseButton,
            resumeButton,
            stopButton,
            statusLabel
        ].forEach { $0.byVisible(YES) }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startRotations()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopRotations()
    }
}

private extension JobsImageRotationDemoVC {
    func makeControlButton(
        title: String,
        backgroundColor: UIColor,
        action: @escaping (UIButton) -> Void
    ) -> UIButton {
        UIButton.sys()
            .byTitle(title, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(backgroundColor)
            .byCornerRadius(10)
            .onTap(action)
    }

    func startRotations() {
        clockwiseClockView.start()
        counterclockwiseClockView.start()
        statusLabel.byText("旋转中：顺时针 6 秒/周｜逆时针 3 秒/周".tr)
    }

    func pauseRotations() {
        clockwiseClockView.pause()
        counterclockwiseClockView.pause()
        statusLabel.byText("已暂停".tr)
    }

    func resumeRotations() {
        clockwiseClockView.resume()
        counterclockwiseClockView.resume()
        statusLabel.byText("已继续".tr)
    }

    func stopRotations() {
        clockwiseClockView.stop()
        counterclockwiseClockView.stop()
        statusLabel.byText("已停止并复位".tr)
    }
}
