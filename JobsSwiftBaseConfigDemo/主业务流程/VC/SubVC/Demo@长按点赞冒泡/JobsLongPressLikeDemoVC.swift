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
    private lazy var hapticFeedback = UIImpactFeedbackGenerator(style: .light)

    private lazy var hintLabel: UILabel = {
        UILabel()
            .byText("长按下方大拇指：图标立即变红，持续冒泡并伴随震动反馈".tr)
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
            .onLongPress(minimumPressDuration: 0.32) { [weak self] button, gesture in
                guard let self else { return }
                switch gesture.state {
                case .began:
                    beginLike(on: button)
                case .ended, .cancelled, .failed:
                    endLike(on: button)
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
        likeButton
            .byFuseBubbleStop()
            .byFusePressScaleStop(animated: false)
    }

    private func beginLike(on button: UIButton) {
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
                    UIImageView()
                        .byImage("hand.thumbsup.fill".sysImg)
                        .byContentMode(.scaleAspectFit)
                        .byFrame(CGRect(x: 0, y: 0, width: 34, height: 34))
                        .byTintColor(JobsCor.systemRed)
                },
                onEmit: { [weak self] in
                    self?.hapticFeedback.impactOccurred()
                }
            )
        hapticFeedback.prepare()
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
