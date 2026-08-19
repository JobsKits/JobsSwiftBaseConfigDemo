//
//  JobsLongPressLikeDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月14日，星期二.
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

final class JobsLongPressLikeDemoVC: BaseVC {
    private var likeLongPressConsumed = false
    private lazy var hapticFeedback = UIImpactFeedbackGenerator(style: .medium)

    private lazy var hintLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("短按切换点赞状态；长按图标立即变红，持续冒泡并伴随震动与声音反馈".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 15))
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom).offset(44)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(44)
                }
                make.left.right.equalToSuperview().inset(28)
            }
    }()

    private lazy var likeButton: UIButton = {
        UIButton.sys()
            .byImage("hand.thumbsup.fill".sysImg, for: .normal)
            .byTintColor(JobsCor.secondaryLabel)
            .byBackgroundColor(JobsCor.secondarySystemBackground, for: .normal)
            .byCornerRadius(48)
            .byMasksToBounds(false)
            .onTap { [weak self] button in
                guard let self, !likeLongPressConsumed else { return }
                button
                    .byToggleSelected()
                    .byTintColor(
                        button.isSelected
                            ? JobsCor.systemRed
                            : JobsCor.secondaryLabel
                    )
            }
            .onLongPress(minimumPressDuration: 0.32) { [weak self] button, gesture in
                guard let self else { return }
                switch gesture.state {
                /// 处理 .began 分支
                case .began:
                    likeLongPressConsumed = true
                    beginLike(on: button)
                /// 合并处理 .ended、.cancelled、.failed 分支
                case .ended, .cancelled, .failed:
                    endLike(on: button)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) { [weak self] in
                        self?.likeLongPressConsumed = false
                    }
                /// 未匹配已知分支时执行兜底处理
                default:
                    break
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(hintLabel.snp.bottom).offset(70)
                make.centerX.equalToSuperview()
                make.width.height.equalTo(96)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "长按点赞冒泡".tr)
        hintLabel.byVisible(YES)
        likeButton.byVisible(YES)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        likeLongPressConsumed = false
        likeButton
            .byFuseBubbleStop()
            .byFusePressScaleStop(animated: false)
    }

    private func beginLike(on button: UIButton) {
        hapticFeedback.prepare()
        button
            .bySelected(YES)
            .byTintColor(JobsCor.systemRed)
            .byFusePressScaleStart(scale: 1.08, duration: 0.12)
            .byFuseBubbleStart(
                in: view,
                config: JobsFuseBubbleConfig(
                    emissionInterval: 0.16,
                    riseDistance: 190,
                    horizontalDrift: 58,
                    duration: 0.92,
                    maximumConcurrentCount: 10
                ),
                bubbleProvider: {
                    UIImageView.jobsMake { _ in }
                        .byImage("hand.thumbsup.fill".sysImg)
                        .byContentMode(.scaleAspectFit)
                        .byFrame(CGRect(x: 0, y: 0, width: 34, height: 34))
                        .byTintColor(JobsCor.systemRed)
                },
                onEmit: { [weak self, weak button] in
                    self?.hapticFeedback.impactOccurred()
                    self?.hapticFeedback.prepare()
                    button?.byFusePlaySound()
                }
            )
    }

    private func endLike(on button: UIButton) {
        button
            .byFuseBubbleStop()
            .byFusePressScaleStop(
                animated: YES,
                duration: 0.22,
                damping: 0.72,
                velocity: 0.8
            )
    }
}
