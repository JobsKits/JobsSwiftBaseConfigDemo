//
//  JobsSideDrawerGestureDelegate.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/16/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
/// 抽屉专用手势代理：只负责“是否允许开始”
final class JobsSideDrawerGestureDelegate: NSObject, UIGestureRecognizerDelegate {
    private weak var owner: JobsSideDrawerVC?
    private let edgeWidth: CGFloat
    init(owner: JobsSideDrawerVC,
         edgeWidth: CGFloat = 24) {
        self.owner = owner
        self.edgeWidth = edgeWidth
        super.init()
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard
            let owner,
            let pan = gestureRecognizer as? UIPanGestureRecognizer
        else { return true }

        let v = pan.velocity(in: owner.view)
        // 过滤竖向滚动（tableView）
        if abs(v.x) <= abs(v.y) { return false }

        // 关闭状态：只允许左边缘触发，避免列表横滑误触
        if !owner.isOpen {
            let loc = pan.location(in: owner.view)
            if loc.x > edgeWidth { return false }
        };return true
    }
}

