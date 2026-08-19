//
//  JobsScreenshotTipsDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import GKNavigationBarSwift
import JobsByUIKit
import JobsInheritance
import JobsScreenCapture
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsToast
import Jobsl10n
import SnapKit

final class JobsScreenshotTipsDemoVC: BaseVC {
    private let screenshotObserver = JobsScreenshotObserver()
    private let screenshotCapturer = JobsScreenshotCapturer()
    private var systemScreenshotCount = 0
    private var activeScreenshotCount = 0

    private lazy var statusCardView: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(20)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(28)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var statusIconLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("📸")
            .byFont(JobsFont.systemFont(ofSize: 42, weight: .regular))
            .byTextAlignment(.center)
            .byAddTo(statusCardView) { make in
                make.top.equalToSuperview().offset(26)
                make.centerX.equalToSuperview()
            }
    }()

    private lazy var statusTitleLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("等待截屏操作".tr)
            .byFont(JobsFont.systemFont(ofSize: 21, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byTextAlignment(.center)
            .byAddTo(statusCardView) { [unowned self] make in
                make.top.equalTo(statusIconLabel.snp.bottom).offset(14)
                make.left.right.equalToSuperview().inset(18)
            }
    }()

    private lazy var statusDetailLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("系统截屏 0 次 · 按钮截屏 0 次".tr)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byAddTo(statusCardView) { [unowned self] make in
                make.top.equalTo(statusTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(18)
                make.bottom.equalToSuperview().inset(26)
            }
    }()

    private lazy var guideLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("真机可同时按下侧边键与音量加键；也可以点击下方按钮主动截取当前页面并保存到相册。程序主动截屏不会触发系统截屏通知，因此这里分开计数。".tr)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(statusCardView.snp.bottom).offset(20)
                make.left.right.equalToSuperview().inset(24)
            }
    }()

    private lazy var activeCaptureButton: UIButton = {
        let button = UIButton.sys()
            .byTitle("点击截屏并保存到相册".tr)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTitleColor(JobsCor.white)
            .byBackgroundColor(JobsCor.systemBlue, for: .normal)
            .byCornerRadius(10)
            .byMasksToBounds(true)
            .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 18, bottom: 10, right: 18))
            .onTap { [weak self] _ in
                self?.captureCurrentScreen()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(guideLabel.snp.bottom).offset(18)
                make.centerX.equalToSuperview()
                make.height.equalTo(44)
            }
        if #available(iOS 15.0, *) {
            button.byConfiguration { configuration in
                configuration.byBackgroundPatch { background in
                    background.cornerRadius = 10
                }
            }
        };return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "截屏 Tips".tr)
        view.byBackgroundColor(JobsCor.systemBackground)
        buildDemoUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        screenshotObserver.start { [weak self] in
            self?.handleScreenshot()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        screenshotObserver.stop()
    }

    private func buildDemoUI() {
        statusCardView.byVisible(true)
        statusIconLabel.byVisible(true)
        statusTitleLabel.byVisible(true)
        statusDetailLabel.byVisible(true)
        guideLabel.byVisible(true)
        activeCaptureButton.byVisible(true)
    }

    private func handleScreenshot() {
        systemScreenshotCount += 1
        statusTitleLabel.byText("已检测到截屏".tr)
        refreshScreenshotCount()
        toastBy("截屏完成：Tips 已触发".tr)
    }

    private func captureCurrentScreen() {
        screenshotCapturer.captureAndSave(view.window ?? view) { [weak self] result in
            guard let self else { return }
            switch result {
            /// 处理 .success 分支
            case .success:
                activeScreenshotCount += 1
                statusTitleLabel.byText("已主动截屏并保存".tr)
                refreshScreenshotCount()
                toastBy("主动截屏已保存到系统相册".tr)
            /// 处理 .failure 分支
            case let .failure(error):
                statusTitleLabel.byText("主动截屏失败".tr)
                toastBy(error.localizedDescription)
            }
        }
    }

    private func refreshScreenshotCount() {
        statusDetailLabel.byText(
            "系统截屏 \(systemScreenshotCount) 次 · 按钮截屏 \(activeScreenshotCount) 次".tr
        )
    }
}
