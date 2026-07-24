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
        view.byBackgroundColor(JobsCor.systemRed)
        jobsSetupGKNav(title: "GXCard 式滑动卡片堆".tr)
        installCards()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
            card.byVisible(index < visibleCount)
            card.resetDirectionHints()
            let scale = 1 - CGFloat(index) * 0.035
            let angle = index == 0 ? 0 : CGFloat(index.isMultiple(of: 2) ? 1 : -1) * (.pi / 180 * min(CGFloat(index) * 2.2, 15))
            card.byTransform(
                CGAffineTransform(translationX: 0, y: CGFloat(index) * 15)
                    .rotated(by: angle)
                    .scaledBy(x: scale, y: scale)
            )
        }
    }

    private func handlePan(_ gesture: UIGestureRecognizer, card: JobsSwipeCardView) {
        guard cards.first === card,
              let pan = gesture as? UIPanGestureRecognizer else { return }
        let translation = pan.translation(in: view)
        switch pan.state {
        /// 跟随手指平移并旋转顶部卡片
        case .changed:
            let progress = min(1, abs(translation.x) / removalDistance)
            card.byTransform(
                CGAffineTransform(translationX: translation.x, y: translation.y)
                    .rotated(by: translation.x / max(view.bounds.width, 1) * (.pi / 12))
            )
            card.updateDirectionHints(horizontalTranslation: translation.x, progress: progress)
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
        UIView.jobsAnimateWithCompletion(
            0.25,
            animations: { [weak self, weak card] in
                guard let self, let card else { return }
                card.byTransform(
                    CGAffineTransform(translationX: direction * view.bounds.width * 1.4, y: 30)
                        .rotated(by: direction * .pi / 8)
                )
                card.byAlpha(0)
            },
            completion: { [weak self, weak card] _ in
                guard let self, let card else { return }
                cards.removeFirst()
                cards.append(card)
                card.byAlpha(1)
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
            animations: { [weak card] in
                card?.byTransform(.identity)
                card?.resetDirectionHints()
            }
        )
    }
}

private final class JobsSwipeCardView: UIView {

    private let index: Int

    private lazy var numberLabel: UILabel = {
        UILabel()
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

    func updateDirectionHints(horizontalTranslation: CGFloat, progress: CGFloat) {
        leftLabel.byAlpha(horizontalTranslation < 0 ? progress : 0)
        rightLabel.byAlpha(horizontalTranslation > 0 ? progress : 0)
    }

    func resetDirectionHints() {
        leftLabel.byAlpha(0)
        rightLabel.byAlpha(0)
    }

    private func makeDirectionLabel(_ text: String, color: UIColor) -> UILabel {
        UILabel()
            .byText(text)
            .byFont(JobsFont.boldSystemFont(ofSize: 24))
            .byTextColor(color)
            .byTextAlignment(.center)
            .byBorderWidth(3)
            .byBorderColor(color)
            .byCornerRadius(6)
    }
}
