//
//  BRPanelAnimation.swift
//  BRPickerViewSwift
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public protocol BRPanelAnimatable {
    func animateIn(panel: UIView, dimming: UIView, finalFrame: CGRect)
    func animateOut(panel: UIView, dimming: UIView, finalFrame: CGRect, completion: @escaping () -> Void)
}

public struct BRSlideAnimation: BRPanelAnimatable {
    public init() {}
    public func animateIn(panel: UIView, dimming: UIView, finalFrame: CGRect) {
        panel.frame = finalFrame.offsetBy(dx: 0, dy: finalFrame.height + 80)
        dimming.alpha = 0
        UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseOut]) {
            panel.frame = finalFrame
            dimming.alpha = 1
        }
    }
    public func animateOut(panel: UIView, dimming: UIView, finalFrame: CGRect, completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.22, delay: 0, options: [.curveEaseIn]) {
            panel.frame = finalFrame.offsetBy(dx: 0, dy: finalFrame.height + 80)
            dimming.alpha = 0
        } completion: { _ in completion() }
    }
}

public struct BRSpringAnimation: BRPanelAnimatable {
    public init() {}
    public func animateIn(panel: UIView, dimming: UIView, finalFrame: CGRect) {
        panel.frame = finalFrame.offsetBy(dx: 0, dy: finalFrame.height + 120)
        dimming.alpha = 0
        UIView.animate(withDuration: 0.45,
                       delay: 0,
                       usingSpringWithDamping: 0.86,
                       initialSpringVelocity: 0.8,
                       options: [.curveEaseOut]) {
            panel.frame = finalFrame
            dimming.alpha = 1
        }
    }
    public func animateOut(panel: UIView, dimming: UIView, finalFrame: CGRect, completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.22, delay: 0, options: [.curveEaseIn]) {
            panel.frame = finalFrame.offsetBy(dx: 0, dy: finalFrame.height + 80)
            dimming.alpha = 0
        } completion: { _ in completion() }
    }
}

public struct BRFadeAnimation: BRPanelAnimatable {
    public init() {}
    public func animateIn(panel: UIView, dimming: UIView, finalFrame: CGRect) {
        panel.frame = finalFrame
        panel.alpha = 0
        dimming.alpha = 0
        UIView.animate(withDuration: 0.25) {
            panel.alpha = 1
            dimming.alpha = 1
        }
    }
    public func animateOut(panel: UIView, dimming: UIView, finalFrame: CGRect, completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.2, animations: {
            panel.alpha = 0
            dimming.alpha = 0
        }) { _ in completion() }
    }
}
