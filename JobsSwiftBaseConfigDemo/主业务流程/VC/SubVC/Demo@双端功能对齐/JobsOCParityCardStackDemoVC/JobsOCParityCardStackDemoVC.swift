//
//  JobsOCParityCardStackDemoVC.swift
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

final class JobsCardStackDemoVC: BaseVC {

    private let visibleCount = 5
    private let removalDistance: CGFloat = 100
    private var isInteracting = false

    private lazy var cards: [JobsSwipeCardView] = {
        (0..<10).map { index in
            let card = JobsSwipeCardView(index: index)
            card.addPanAction { [weak self, weak card] gesture in
                guard let self, let card else { return }
                handlePan(gesture, card: card)
            };return card
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "GXCard 式滑动卡片堆".tr)
        installCards()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard !isInteracting else { return }
        applyStackState()
    }

    private func installCards() {
        cards.reversed().forEach { card in
            view.addSubview(card)
            card.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(24)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(430)
            }
        }
        applyStackState()
    }

    private func applyStackState() {
        cards.reversed().forEach { view.bringSubviewToFront($0) }
        cards.enumerated().forEach { index, card in
            card
                .byVisible(index < visibleCount)
                .byAlpha(1)
                .byTransform(stackTransform(for: index))
                .resetDirectionHints()
        }
    }

    private func applyInteractiveStackState(progress: CGFloat) {
        let progress = min(max(progress, 0), 1)
        cards.enumerated().forEach { index, card in
            guard index > 0 else { return }
            guard index <= visibleCount else {
                card.byVisible(false)
                return
            }
            card
                .byVisible(true)
                .byAlpha(index == visibleCount ? progress : 1)
                .byTransform(interactiveStackTransform(for: index, progress: progress))
        }
    }

    private func stackTransform(for index: Int) -> CGAffineTransform {
        let metrics = stackMetrics(for: index)
        return CGAffineTransform(translationX: 0, y: metrics.verticalOffset)
            .rotated(by: metrics.angle)
            .scaledBy(x: metrics.scale, y: metrics.scale)
    }

    private func interactiveStackTransform(for index: Int, progress: CGFloat) -> CGAffineTransform {
        let start = stackMetrics(for: index)
        let end = stackMetrics(for: max(index - 1, 0))
        let scale = start.scale + (end.scale - start.scale) * progress
        let angle = start.angle + (end.angle - start.angle) * progress
        let verticalOffset = start.verticalOffset + (end.verticalOffset - start.verticalOffset) * progress
        return CGAffineTransform(translationX: 0, y: verticalOffset)
            .rotated(by: angle)
            .scaledBy(x: scale, y: scale)
    }

    private func stackMetrics(for index: Int) -> (scale: CGFloat, angle: CGFloat, verticalOffset: CGFloat) {
        let scale = 1 - CGFloat(index) * 0.035
        let angle = index == 0
            ? 0
            : CGFloat(index.isMultiple(of: 2) ? 1 : -1) * (.pi / 180 * min(CGFloat(index) * 2.2, 15))
        return (scale, angle, CGFloat(index) * 15)
    }

    private func handlePan(_ gesture: UIGestureRecognizer, card: JobsSwipeCardView) {
        guard cards.first === card,
              let pan = gesture as? UIPanGestureRecognizer else { return }
        let translation = pan.translation(in: view)
        switch pan.state {
        /// 开始拖动时让下一张待入场卡片进入交互状态
        case .began:
            isInteracting = true
            applyInteractiveStackState(progress: 0)
        /// 跟随手指平移并旋转顶部卡片
        case .changed:
            isInteracting = true
            let progress = min(1, abs(translation.x) / removalDistance)
            card
                .byTransform(
                    CGAffineTransform(translationX: translation.x, y: translation.y)
                        .rotated(by: translation.x / max(view.bounds.width, 1) * (.pi / 12))
                )
                .updateDirectionHints(horizontalTranslation: translation.x, progress: progress)
            applyInteractiveStackState(progress: progress)
        /// 达到移除距离时将卡片滑出并补到队尾
        case .ended:
            if abs(translation.x) >= removalDistance {
                removeTopCard(card, direction: translation.x < 0 ? -1 : 1)
            } else {
                restoreTopCard(card)
            }
        /// 取消或失败时恢复顶部卡片
        case .cancelled, .failed:
            restoreTopCard(card)
        /// 未匹配已知分支时不处理
        default:
            break
        }
    }

    private func removeTopCard(_ card: JobsSwipeCardView, direction: CGFloat) {
        UIView.jobsAnimateWithOptions(
            0.25,
            options: [.beginFromCurrentState, .allowUserInteraction],
            animations: { [weak self, weak card] in
                guard let self, let card else { return }
                card
                    .byTransform(
                        CGAffineTransform(translationX: direction * view.bounds.width * 1.4, y: 30)
                            .rotated(by: direction * .pi / 8)
                    )
                    .byAlpha(0)
                applyInteractiveStackState(progress: 1)
            },
            completion: { [weak self, weak card] _ in
                guard let self, let card else { return }
                cards.removeFirst()
                cards.append(card)
                isInteracting = false
                applyStackState()
            }
        )
    }

    private func restoreTopCard(_ card: JobsSwipeCardView) {
        UIView.jobsAnimateWithSpring(
            0.36,
            dampingRatio: 0.78,
            initialVelocity: 0.7,
            options: [.beginFromCurrentState, .allowUserInteraction],
            animations: { [weak self, weak card] in
                guard let self, let card else { return }
                card
                    .byTransform(.identity)
                    .resetDirectionHints()
                applyInteractiveStackState(progress: 0)
            },
            completion: { [weak self] _ in
                guard let self else { return }
                isInteracting = false
                applyStackState()
            }
        )
    }
}

private final class JobsSwipeCardView: UIView {

    private let index: Int

    private lazy var numberLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("\(index)")
            .byFont(JobsFont.boldSystemFont(ofSize: 72))
            .byTextColor(JobsCor.systemRed)
            .byTextAlignment(.center)
            .byAddTo(self) { make in
                make.center.equalToSuperview()
            }
    }()

    private lazy var leftLabel: UILabel = {
        makeDirectionLabel("LEFT", color: JobsCor.systemBlue)
            .byTransform(CGAffineTransform(rotationAngle: -.pi / 12))
            .byAddTo(self) { make in
                make.top.left.equalToSuperview().inset(24)
            }
    }()

    private lazy var rightLabel: UILabel = {
        makeDirectionLabel("RIGHT", color: JobsCor.systemRed)
            .byTransform(CGAffineTransform(rotationAngle: .pi / 12))
            .byAddTo(self) { make in
                make.top.right.equalToSuperview().inset(24)
            }
    }()

    init(index: Int) {
        self.index = index
        super.init(frame: .zero)
        byBackgroundColor(JobsCor.systemYellow)
            .byCornerRadius(16)
            .byBorderWidth(2)
            .byBorderColor(JobsCor.white.withAlphaComponent(0.75))
            .byShadowColor(JobsCor.black.withAlphaComponent(0.22))
            .byShadowOpacity(1)
            .byShadowRadius(12)
            .byShadowOffset(CGSize(width: 0, height: 7))
        numberLabel.byVisible(YES)
        leftLabel.byVisible(YES)
        rightLabel.byVisible(YES)
        resetDirectionHints()
    }

    required init?(coder: NSCoder) {
        nil
    }

    @discardableResult
    func updateDirectionHints(horizontalTranslation: CGFloat, progress: CGFloat) -> Self {
        leftLabel.byAlpha(horizontalTranslation < 0 ? progress : 0)
        rightLabel.byAlpha(horizontalTranslation > 0 ? progress : 0)
        return self
    }

    @discardableResult
    func resetDirectionHints() -> Self {
        leftLabel.byAlpha(0)
        rightLabel.byAlpha(0)
        return self
    }

    private func makeDirectionLabel(_ text: String, color: UIColor) -> UILabel {
        UILabel.jobsMake { _ in }
            .byText(text)
            .byFont(JobsFont.boldSystemFont(ofSize: 24))
            .byTextColor(color)
            .byTextAlignment(.center)
            .byBorderWidth(3)
            .byBorderColor(color)
            .byCornerRadius(6)
    }
}
