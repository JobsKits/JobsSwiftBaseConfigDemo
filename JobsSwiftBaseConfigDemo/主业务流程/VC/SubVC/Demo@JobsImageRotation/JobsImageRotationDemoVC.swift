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
            .byText("同一张时钟图，分别演示默认顺时针与逆时针；Timer 间隔越小，旋转越快。".tr)
            .byFont(JobsFont.systemFont(ofSize: 15))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byTextAlignment(.center)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(24)
                make.left.right.equalToSuperview().inset(24)
            }
    }()

    private lazy var clockwiseButton: UIButton = {
        UIButton.sys()
            .byTitle("默认顺时针 · 1/60 秒".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTitleColor(JobsCor.white, for: .normal)
            .byImage("clock".sysImg, for: .normal)
            .byImagePlacement(.leading, padding: 12)
            .byTintColor(JobsCor.white)
            .byBackgroundColor(JobsCor.systemBlue)
            .byCornerRadius(14)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(descriptionLabel.snp.bottom).offset(24)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(84)
            }
    }()

    private lazy var counterclockwiseButton: UIButton = {
        UIButton.sys()
            .byTitle("逆时针 · 1/30 秒".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTitleColor(JobsCor.white, for: .normal)
            .byImage("clock".sysImg, for: .normal)
            .byImagePlacement(.leading, padding: 12)
            .byTintColor(JobsCor.white)
            .byBackgroundColor(JobsCor.systemPurple)
            .byCornerRadius(14)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(clockwiseButton.snp.bottom).offset(16)
                make.left.right.height.equalTo(clockwiseButton)
            }
    }()

    private lazy var startButton: UIButton = {
        makeControlButton(title: "开始".tr, backgroundColor: JobsCor.systemGreen) { [weak self] _ in
            self?.startRotations()
        }
        .byAddTo(view) { [unowned self] make in
            make.top.equalTo(counterclockwiseButton.snp.bottom).offset(24)
            make.left.equalTo(counterclockwiseButton)
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
            make.right.equalTo(counterclockwiseButton)
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

    private lazy var clockwiseRotator: JobsImageRotator = {
        JobsImageRotator(targetView: clockwiseButton.imageView ?? clockwiseButton)
    }()

    private lazy var counterclockwiseRotator: JobsImageRotator = {
        JobsImageRotator(
            targetView: counterclockwiseButton.imageView ?? counterclockwiseButton,
            direction: .counterclockwise,
            interval: 1.0 / 30.0
        )
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "JobsImageRotation".tr)
        view.byBackgroundColor(JobsCor.systemBackground)
        [
            descriptionLabel,
            clockwiseButton,
            counterclockwiseButton,
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
        clockwiseRotator.start()
        counterclockwiseRotator.start()
        statusLabel.byText("旋转中：顺时针 1/60 秒｜逆时针 1/30 秒".tr)
    }

    func pauseRotations() {
        clockwiseRotator.pause()
        counterclockwiseRotator.pause()
        statusLabel.byText("已暂停".tr)
    }

    func resumeRotations() {
        clockwiseRotator.resume()
        counterclockwiseRotator.resume()
        statusLabel.byText("已继续".tr)
    }

    func stopRotations() {
        clockwiseRotator.stop()
        counterclockwiseRotator.stop()
        statusLabel.byText("已停止并复位".tr)
    }
}
