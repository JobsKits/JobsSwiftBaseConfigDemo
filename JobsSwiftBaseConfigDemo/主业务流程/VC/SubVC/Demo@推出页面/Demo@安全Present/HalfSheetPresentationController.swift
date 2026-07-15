//
//  HalfSheetPresentationController.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsByUIKit
import JobsSwiftDSL

// MARK: - 自定义 PresentationController（控制高度/位置/遮罩）
final class HalfSheetPresentationController: UIPresentationController {
    private let height: CGFloat
    private lazy var dimmingView: UIView = {
        let v = UIView(frame: containerView?.bounds ?? .zero)
        v.byBackgroundColor(JobsCor.black.withAlphaComponent(0.38))
        v.byAlpha(1)
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapDim)))
        return v
    }()

    init(presentedViewController: UIViewController,
         presenting presentingViewController: UIViewController?,
         height: CGFloat) {
        self.height = height
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        guard let container = containerView else { return .zero }
        let y = container.bounds.height - height
        return CGRect(x: 0, y: max(0, y), width: container.bounds.width, height: min(container.bounds.height, height))
    }

    override func presentationTransitionWillBegin() {
        guard let container = containerView else { return }
        dimmingView.byFrame(container.bounds)
        dimmingView.byAddTo(container)
        // 跟随系统转场动画
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.byAlpha(1)
        })
    }

    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.byAlpha(0)
        })
    }

    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        dimmingView.byFrame(containerView?.bounds ?? .zero)
        presentedView?.byFrame(frameOfPresentedViewInContainerView)
    }

    @objc private func onTapDim() {
        presentedViewController.dismiss(animated: true)
    }
}
