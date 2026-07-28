//
//  JobsOCParityDockingScrollDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import GKNavigationBarSwift
import SnapKit

final class JobsDockingScrollDemoVC: BaseVC {

    private var panelTopConstraint: Constraint?
    private var panStartOffset: CGFloat = 0
    private var panelOffset: CGFloat = 0
    private var bottomOffset: CGFloat {
        max(240, UIScreen.main.bounds.height / 2 - 100)
    }

    private lazy var topRegionView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.systemPurple.withAlphaComponent(0.22))
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom)
                make.left.right.equalToSuperview()
                make.height.equalTo(bottomOffset)
            }
    }()

    private lazy var usageCard: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.systemBackground.withAlphaComponent(0.88))
            .byCornerRadius(12)
            .byShadowColor(JobsCor.black.withAlphaComponent(0.10))
            .byShadowOpacity(1)
            .byShadowRadius(10)
            .byShadowOffset(CGSize(width: 0, height: 4))
            .byAddTo(topRegionView) { make in
                make.top.equalToSuperview().offset(24)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var usageTitleLabel: UILabel = {
        UILabel()
            .byText("JobsScrollViewVC")
            .byFont(JobsFont.boldSystemFont(ofSize: 18))
            .byTextColor(JobsCor.label)
            .byAddTo(usageCard) { make in
                make.top.equalToSuperview().offset(14)
                make.left.right.equalToSuperview().inset(14)
            }
    }()

    private lazy var usageDescriptionLabel: UILabel = {
        UILabel()
            .byText(
                "演示“只允许在指定 y 区间内上下滑动”的吸附效果："
                + "拖拽绿色区域，上滑释放会吸附到最高点，下滑释放会回到底部初始位置。"
            )
            .byFont(JobsFont.systemFont(ofSize: 13))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byAddTo(usageCard) { [unowned self] make in
                make.top.equalTo(usageTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(14)
                make.bottom.equalToSuperview().inset(14)
            }
    }()

    private lazy var topAnchorLabel: UILabel = {
        UILabel()
            .byText("最高点：上滑后吸附到这里".tr)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byTextColor(JobsCor.systemBlue)
            .byAddTo(topRegionView) { [unowned self] make in
                make.top.equalTo(usageCard.snp.bottom).offset(18)
                make.left.equalToSuperview().offset(18)
            }
    }()

    private lazy var bottomAnchorLabel: UILabel = {
        UILabel()
            .byText("最低点：下滑释放回到初始位置".tr)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byTextColor(JobsCor.systemOrange)
            .byAddTo(topRegionView) { make in
                make.left.equalToSuperview().offset(18)
                make.bottom.equalToSuperview().inset(14)
            }
    }()

    private lazy var draggableView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.systemGreen.withAlphaComponent(0.92))
            .byUserInteractionEnabled(YES)
            .addPanAction { [weak self] gesture in
                self?.handlePan(gesture)
            }
            .byAddTo(view) { [unowned self] make in
                panelTopConstraint = make.top
                    .equalTo(gk_navigationBar.snp.bottom)
                    .offset(bottomOffset)
                    .constraint
                make.left.right.equalToSuperview()
                make.height.equalTo(view.snp.height)
            }
    }()

    private lazy var dragHintCard: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.systemBackground.withAlphaComponent(0.88))
            .byCornerRadius(12)
            .byAddTo(draggableView) { make in
                make.top.equalToSuperview().offset(26)
                make.centerX.equalToSuperview()
                make.width.equalTo(268)
                make.height.equalTo(84)
            }
    }()

    private lazy var dragHintLabel: UILabel = {
        UILabel()
            .byText("按住绿色区域上下拖动\n上滑吸顶，下滑回到底部".tr)
            .byFont(JobsFont.boldSystemFont(ofSize: 16))
            .byTextColor(JobsCor.label)
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byAddTo(dragHintCard) { make in
                make.edges.equalToSuperview().inset(12)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "指定 Y 区间拖动并吸附".tr)
        topRegionView.byVisible(YES)
        usageCard.byVisible(YES)
        topAnchorLabel.byVisible(YES)
        bottomAnchorLabel.byVisible(YES)
        draggableView.byVisible(YES)
        dragHintCard.byVisible(YES)
        dragHintLabel.byVisible(YES)
        panelOffset = bottomOffset
    }

    private func handlePan(_ gesture: UIGestureRecognizer) {
        guard let pan = gesture as? UIPanGestureRecognizer else { return }
        let translation = pan.translation(in: view)
        switch pan.state {
        /// 记录本次拖动起点
        case .began:
            panStartOffset = panelOffset
        /// 将绿色区域限制在最高点和最低点之间
        case .changed:
            panelOffset = min(bottomOffset, max(0, panStartOffset + translation.y))
            panelTopConstraint?.update(offset: panelOffset)
            view.layoutIfNeeded()
        /// 根据拖动方向吸附到对应端点
        case .ended:
            let target: CGFloat
            if translation.y < 0 {
                target = 0
            } else if translation.y > 0 {
                target = bottomOffset
            } else {
                target = panelOffset < bottomOffset / 2 ? 0 : bottomOffset
            }
            snap(to: target)
        /// 取消或失败时吸附到最近端点
        case .cancelled, .failed:
            snap(to: panelOffset < bottomOffset / 2 ? 0 : bottomOffset)
        /// 未匹配已知分支时不处理
        default:
            break
        }
    }

    private func snap(to offset: CGFloat) {
        panelOffset = offset
        panelTopConstraint?.update(offset: offset)
        UIView.jobsAnimateWithSpring(
            0.36,
            dampingRatio: 0.82,
            initialVelocity: 0.6,
            options: [.beginFromCurrentState, .allowUserInteraction],
            animations: { [weak self] in
                self?.view.layoutIfNeeded()
            }
        )
    }
}
