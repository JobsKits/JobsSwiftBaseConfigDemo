//
//  UIViewController+侧滑抽屉容器.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/30/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
// MARK: - 主内容 push 提供者（抽屉体系专用） 
protocol JobsMainPushProviding: AnyObject {
    /// 返回“主内容区域”的 UINavigationController（用于保证全屏 push）
    var jobs_mainNavForPush: UINavigationController? { get }
    /// push 前的准备动作（比如先关抽屉）
    func jobs_prepareForMainPush(animated: Bool)
}

extension JobsMainPushProviding {
    func jobs_prepareForMainPush(animated: Bool) { /* default no-op */ }
}
// MARK: - 从当前 VC 往父链找主内容 Nav
extension UIViewController {
    /// 让任何 VC 都能拿到抽屉容器
    var jobsSideDrawer: JobsSideDrawerVC? {
        var p: UIViewController? = self
        while let parent = p?.parent {
            if let drawer = parent as? JobsSideDrawerVC { return drawer }
            p = parent
        };return nil
    }
    /// 在父控制器链路里找 JobsMainPushProviding，找到就返回主内容 nav
    func jobs_findMainNavFromAncestors(closeDrawer: Bool = true,
                                      animated: Bool = true) -> UINavigationController? {
        // 1) 先用你现成的 jobsSideDrawer（沿 parent 找）
        if let drawer = self.jobsSideDrawer,
           let nav = drawer.jobs_mainNavForPush {
            return nav
        }
        // 2) 再兜底：沿 parent 链找任何实现了 JobsMainPushProviding 的容器
        var cur: UIViewController? = self
        while let vc = cur {
            if let provider = vc as? JobsMainPushProviding {
                if closeDrawer { provider.jobs_prepareForMainPush(animated: animated) }
                return provider.jobs_mainNavForPush
            };cur = vc.parent
        };return nil
    }
}
