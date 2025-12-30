//
//  JobsSideDrawerVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/16/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
/// 左侧抽屉（个人中心）+ 右侧主内容（的 jobsNavContainer）
/// 主内容整体右移（导航栏也一起移动）
final class JobsSideDrawerVC: BaseVC {
    static var defaultMenuWidth: CGFloat {
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
        UIPanGestureRecognizer
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
            .byMinTouches(1)
            .byMaxTouches(1)
            .byCancelsTouchesInView(true)
            .byEnabled(true)
            .byName("JobsSideDrawerPan")
            .byDelegate(drawerGestureDelegate)
    }()
    private lazy var dimTapGR: UITapGestureRecognizer = {
        UITapGestureRecognizer
            .byConfig { [weak self] _ in
                self?.closeDrawer(animated: true)
            }
            .byTaps(1)
            .byTouches(1)
            .byCancelsTouchesInView(true)
            .byEnabled(true)
            .byName("JobsSideDrawerDimTap")
    }()
    private lazy var menuContainerView: UIView = {
        UIView()
            .byBgColor(.systemBackground)
            .byAddTo(view) { [unowned self] make in
                make.top.bottom.left.equalToSuperview()
                make.width.equalTo(self.menuWidth)
            }
    }()
    private lazy var contentContainerView: UIView = {
        UIView()
            .byBgColor(.clear)
            .byAddTo(view) { [unowned self] make in
                make.top.bottom.equalToSuperview()
                make.width.equalToSuperview()
                self.contentLeadingConstraint = make.left.equalToSuperview().constraint
            }
            .jobs_addGestureRetView(panGR)
    }()
    private lazy var dimView: UIView = {
        UIView()
            .byBgColor(.black.withAlphaComponent(0.35))
            .byUserInteractionEnabled(YES)
            .jobs_addGestureRetView(dimTapGR)
            .byVisible(NO) // ✅ 默认隐藏，打开时 byVisible(YES)
    }()

    init(menuVC: UIViewController,
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

    override func viewDidLoad() {
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

    func toggleDrawer(animated: Bool = true) {
        isOpen ? closeDrawer(animated: animated) : openDrawer(animated: animated)
    }

    func openDrawer(animated: Bool = true) {
        setDrawer(open: true, animated: animated)
    }

    func closeDrawer(animated: Bool = true) {
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
