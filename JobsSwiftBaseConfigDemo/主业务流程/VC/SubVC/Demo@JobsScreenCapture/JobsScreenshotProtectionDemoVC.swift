//
//  JobsScreenshotProtectionDemoVC.swift
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

final class JobsScreenshotProtectionDemoVC: BaseVC {
    private let screenshotCapturer = JobsScreenshotCapturer()

    private lazy var protectionView: JobsScreenshotProtectionView = {
        JobsScreenshotProtectionView()
            .byBackgroundColor(JobsCor.clear)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(24)
                make.left.right.equalToSuperview().inset(20)
                make.height.equalTo(250)
            }
    }()

    private lazy var sensitiveCardView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.systemIndigo)
            .byCornerRadius(22)
            .byAddTo(protectionView.contentView) { make in
                make.edges.equalToSuperview()
            }
    }()

    private lazy var sensitiveTitleLabel: UILabel = {
        UILabel()
            .byText("敏感内容安全区".tr)
            .byFont(JobsFont.systemFont(ofSize: 22, weight: .bold))
            .byTextColor(JobsCor.white)
            .byTextAlignment(.center)
            .byAddTo(sensitiveCardView) { make in
                make.top.equalToSuperview().offset(42)
                make.left.right.equalToSuperview().inset(18)
            }
    }()

    private lazy var sensitiveValueLabel: UILabel = {
        UILabel()
            .byText("账号：Jobs\n授权码：2026-0721-DEMO".tr)
            .byFont(JobsFont.monospacedSystemFont(ofSize: 17, weight: .semibold))
            .byTextColor(JobsCor.white)
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byAddTo(sensitiveCardView) { [unowned self] make in
                make.top.equalTo(sensitiveTitleLabel.snp.bottom).offset(28)
                make.left.right.equalToSuperview().inset(18)
            }
    }()

    private lazy var protectionStateLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(protectionView.snp.bottom).offset(20)
                make.left.right.equalToSuperview().inset(24)
            }
    }()

    private lazy var toggleProtectionButton: UIButton = {
        UIButton.sys()
            .byTitleColor(JobsCor.systemBlue)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .onTap { [weak self] _ in
                self?.toggleProtection()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(protectionStateLabel.snp.bottom).offset(14)
                make.centerX.equalToSuperview()
                make.height.equalTo(44)
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
                make.top.equalTo(toggleProtectionButton.snp.bottom).offset(14)
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
        jobsSetupGKNav(title: "禁止截屏 Demo".tr)
        view.byBackgroundColor(JobsCor.systemBackground)
        buildDemoUI()
        refreshProtectionState()
    }

    private func buildDemoUI() {
        protectionView.byVisible(true)
        sensitiveCardView.byVisible(true)
        sensitiveTitleLabel.byVisible(true)
        sensitiveValueLabel.byVisible(true)
        protectionStateLabel.byVisible(true)
        toggleProtectionButton.byVisible(true)
        activeCaptureButton.byVisible(true)
    }

    private func toggleProtection() {
        protectionView.setProtectionEnabled(!protectionView.isProtectionEnabled)
        refreshProtectionState()
    }

    private func refreshProtectionState() {
        guard protectionView.isProtectionAvailable else {
            protectionStateLabel.byText("当前系统未识别到安全渲染容器，内容按普通视图显示。".tr)
            toggleProtectionButton.byTitle("保护不可用".tr)
            toggleProtectionButton.byEnabled(false)
            return
        }
        if protectionView.isProtectionEnabled {
            protectionStateLabel.byText("保护已开启：页面仍可见，但截图中敏感卡片应被系统隐藏。请用真机验证。".tr)
            toggleProtectionButton.byTitle("临时关闭保护".tr)
        } else {
            protectionStateLabel.byText("保护已关闭：截图会包含敏感卡片，仅用于对比效果。".tr)
            toggleProtectionButton.byTitle("重新开启保护".tr)
        }
        toggleProtectionButton.byEnabled(true)
    }

    private func captureCurrentScreen() {
        screenshotCapturer.captureAndSave(view.window ?? view) { result in
            switch result {
            /// 处理 .success 分支
            case .success:
                toastBy("主动截屏已保存到相册，请打开相册对比敏感区域".tr)
            /// 处理 .failure 分支
            case let .failure(error):
                toastBy(error.localizedDescription)
            }
        }
    }
}
