//
//  UIViewController+侧滑抽屉容器.swift
//  JobsByUIKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import JobsSwiftBlock
import JobsSwiftDSL
import JobsSwiftBaseDefines
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
/// 左侧抽屉（个人中心）+ 右侧主内容（的 jobsNavContainer）
/// 主内容整体右移（导航栏也一起移动）
public class JobsSideDrawerVC: UIViewController {
    public static var defaultMenuWidth: CGFloat {
        min(320, UIScreen.main.bounds.width * 0.35)
    }
    private(set) var isOpen: Bool = false
    private let menuVC: UIViewController
    private let mainVC: UIViewController
    private let menuWidth: CGFloat
    private var contentLeadingConstraint: Constraint?
    private var currentOffset: CGFloat = 0
    private var panStartOffset: CGFloat = 0
    private lazy var panGR: UIPanGestureRecognizer = {
        UIPanGestureRecognizer()
            .byMinTouches(1)
            .byMaxTouches(1)
            .byCancelsTouchesInView(true)
            .byEnabled(true)
            .byName("JobsSideDrawerPan")
            .byDelegate(drawerGestureDelegate)
            .byConfig { [weak self] gr in
                guard let self, let pan = gr as? UIPanGestureRecognizer else { return }
                let translation = pan.translation(in: view)
                let velocity = pan.velocity(in: view)

                switch pan.state {
                case .began:
                    panStartOffset = currentOffset
                    if currentOffset == 0 { _ = dimView.byVisible(YES) }

                case .changed:
                    var newOffset = panStartOffset + translation.x
                    newOffset = max(0, min(menuWidth, newOffset))

                    currentOffset = newOffset
                    contentLeadingConstraint?.update(offset: newOffset)

                    let progress = newOffset / menuWidth
                    dimView.alpha = progress
                    view.layoutIfNeeded()

                case .ended, .cancelled, .failed:
                    let shouldOpen: Bool = {
                        if abs(velocity.x) > 600 { return velocity.x > 0 }
                        return self.currentOffset > self.menuWidth * 0.5
                    }()
                    setDrawer(open: shouldOpen, animated: true)

                default:
                    break
                }
            }
    }()
    
    private lazy var dimTapGR: UITapGestureRecognizer = {
        UITapGestureRecognizer()
            .byTaps(1)
            .byTouches(1)
            .byCancelsTouchesInView(true)
            .byEnabled(true)
            .byName("JobsSideDrawerDimTap")
            .byConfig { [weak self] _ in
                self?.closeDrawer(animated: true)
            }
    }()
    
    private lazy var menuContainerView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.systemBackground)
            .byAddTo(view) { [unowned self] make in
                make.top.bottom.left.equalToSuperview()
                make.width.equalTo(self.menuWidth)
            }
    }()
    
    private lazy var contentContainerView: UIView = {
        UIView()
            .byBackgroundColor(.clear)
            .jobs_addGestureRetView(panGR)
            .byAddTo(view) { [unowned self] make in
                make.top.bottom.equalToSuperview()
                make.width.equalToSuperview()
                self.contentLeadingConstraint = make.left.equalToSuperview().constraint
            }
    }()
    
    private lazy var dimView: UIView = {
        UIView()
            .byBackgroundColor(.black.withAlphaComponent(0.35))
            .byUserInteractionEnabled(YES)
            .jobs_addGestureRetView(dimTapGR)
            .byVisible(NO) // ✅ 默认隐藏，打开时 byVisible(YES)
    }()

    public init(menuVC: UIViewController,
                mainVC: UIViewController,
                menuWidth: CGFloat = JobsSideDrawerVC.defaultMenuWidth) {
        self.menuVC = menuVC
        self.mainVC = mainVC
        self.menuWidth = menuWidth
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    private lazy var drawerGestureDelegate: JobsSideDrawerGestureDelegate = {
        JobsSideDrawerGestureDelegate(owner: self, edgeWidth: 24)
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // 1) Menu
        addChild(menuVC)
        _ = menuContainerView
        menuContainerView.addSubview(menuVC.view)
        menuVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        menuVC.didMove(toParent: self)
        // 2) Main
        addChild(mainVC)
        _ = contentContainerView
        contentContainerView.addSubview(mainVC.view)
        mainVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mainVC.didMove(toParent: self)
        // 3) Dim overlay（拦截点击关闭）
        contentContainerView.addSubview(dimView)
        dimView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setDrawer(open: Bool, animated: Bool) {
        isOpen = open
        currentOffset = open ? menuWidth : 0
        contentLeadingConstraint?.update(offset: currentOffset)
        if open { _ = dimView.byVisible(YES) } // ✅ 唤起
        let animations = { [weak self] in
            guard let self else { return }
            self.dimView.alpha = open ? 1 : 0
            self.contentContainerView.layer.cornerRadius = open ? 16 : 0
            self.contentContainerView.layer.masksToBounds = open
            self.view.layoutIfNeeded()
        }

        let completion: (Bool) -> Void = { [weak self] _ in
            guard let self else { return }
            if !open { _ = self.dimView.byVisible(NO) } // ✅ 收起隐藏，不挡交互
        }

        guard animated else {
            animations()
            completion(true)
            return
        }

        UIView.animate(withDuration: 0.28,
                       delay: 0,
                       usingSpringWithDamping: 0.92,
                       initialSpringVelocity: 0,
                       options: [.curveEaseInOut, .allowUserInteraction],
                       animations: animations,
                       completion: completion)
    }

    public func toggleDrawer(animated: Bool = true) {
        isOpen ? closeDrawer(animated: animated) : openDrawer(animated: animated)
    }

    public func openDrawer(animated: Bool = true) {
        setDrawer(open: true, animated: animated)
    }

    public func closeDrawer(animated: Bool = true) {
        setDrawer(open: false, animated: animated)
    }
}

extension JobsSideDrawerVC: JobsMainPushProviding {
    var jobs_mainNavForPush: UINavigationController? {
        // mainVC 传进来的就是 jobsNavContainer（大概率是 UINavigationController）
        if let nav = mainVC as? UINavigationController { return nav }
        if let nav = mainVC.navigationController { return nav }
        return (mainVC as UIViewController).jobs_findNavController
    }
}
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
    public var jobsSideDrawer: JobsSideDrawerVC? {
        var p: UIViewController? = self
        while let parent = p?.parent {
            if let drawer = parent as? JobsSideDrawerVC { return drawer }
            p = parent
        };return nil
    }
    /// 在父控制器链路里找 JobsMainPushProviding，找到就返回主内容 nav
    public func jobs_findMainNavFromAncestors(closeDrawer: Bool = true,
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
