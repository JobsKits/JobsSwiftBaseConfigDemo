//
//  JobsSideDrawer.swift
//  JobsViewPush
//
//  Created by Jobs on 2026年7月12日，星期日.
//

import UIKit

public enum JobsSideDrawerDirection: Int, CaseIterable {
    case top, bottom, left, right
}

public enum JobsSideDrawerContentMode: Int, CaseIterable {
    case following
    case fixed
}

public final class JobsSideDrawerConfiguration {
    public var direction: JobsSideDrawerDirection
    public var contentMode: JobsSideDrawerContentMode
    public var presentedRatio: CGFloat
    public var animationDuration: TimeInterval
    public var dimColor: UIColor

    public init(direction: JobsSideDrawerDirection = .left,
                contentMode: JobsSideDrawerContentMode = .following,
                presentedRatio: CGFloat = 0.5,
                animationDuration: TimeInterval = 0.28,
                dimColor: UIColor = UIColor.black.withAlphaComponent(0.35)) {
        self.direction = direction
        self.contentMode = contentMode
        self.presentedRatio = max(0.1, min(1, presentedRatio))
        self.animationDuration = animationDuration
        self.dimColor = dimColor
    }
}

public final class JobsSideDrawerVC: UIViewController {
    public static var defaultMenuWidth: CGFloat { UIScreen.main.bounds.width * 0.5 }
    public private(set) var isOpen = false
    public let configuration: JobsSideDrawerConfiguration

    private let drawerVC: UIViewController?
    private let mainVC: UIViewController?
    private let drawerContentView: UIView
    private let mainContentView: UIView
    private let drawerContainerView = UIView()
    private let contentContainerView = UIView()
    private lazy var dimControl: UIControl = {
        let control = UIControl()
        control.backgroundColor = configuration.dimColor
        control.alpha = 0
        control.isHidden = true
        control.addTarget(self, action: #selector(closeFromDim), for: .touchUpInside)
        return control
    }()

    public init(drawerViewController: UIViewController,
                mainViewController: UIViewController,
                configuration: JobsSideDrawerConfiguration = .init()) {
        drawerVC = drawerViewController
        mainVC = mainViewController
        drawerContentView = drawerViewController.view
        mainContentView = mainViewController.view
        self.configuration = configuration
        super.init(nibName: nil, bundle: nil)
    }

    public convenience init(menuVC: UIViewController,
                            mainVC: UIViewController,
                            menuWidth: CGFloat = JobsSideDrawerVC.defaultMenuWidth) {
        let ratio = menuWidth / max(UIScreen.main.bounds.width, 1)
        self.init(drawerViewController: menuVC,
                  mainViewController: mainVC,
                  configuration: .init(presentedRatio: ratio))
    }

    public init(drawerView: UIView,
                mainView: UIView,
                configuration: JobsSideDrawerConfiguration = .init()) {
        drawerVC = nil
        mainVC = nil
        drawerContentView = drawerView
        mainContentView = mainView
        self.configuration = configuration
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        installChildren()
        view.addSubview(contentContainerView)
        view.addSubview(drawerContainerView)
        contentContainerView.addSubview(mainContentView)
        contentContainerView.addSubview(dimControl)
        drawerContainerView.addSubview(drawerContentView)
        mainContentView.frame = contentContainerView.bounds
        drawerContentView.frame = drawerContainerView.bounds
        dimControl.frame = contentContainerView.bounds
        [mainContentView, drawerContentView, dimControl].forEach {
            $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
        mainVC?.didMove(toParent: self)
        drawerVC?.didMove(toParent: self)
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutDrawer(open: isOpen)
    }

    public func applyConfiguration(animated: Bool = false) {
        configuration.presentedRatio = max(0.1, min(1, configuration.presentedRatio))
        setDrawer(open: isOpen, animated: animated)
    }

    public func toggleDrawer(animated: Bool = true) {
        setDrawer(open: !isOpen, animated: animated)
    }

    public func openDrawer(animated: Bool = true) {
        setDrawer(open: true, animated: animated)
    }

    public func closeDrawer(animated: Bool = true) {
        setDrawer(open: false, animated: animated)
    }

    private func installChildren() {
        if let drawerVC { addChild(drawerVC) }
        if let mainVC { addChild(mainVC) }
    }

    private func setDrawer(open: Bool, animated: Bool) {
        view.layoutIfNeeded()
        isOpen = open
        if open { dimControl.isHidden = false }
        let changes = { [weak self] in
            guard let self else { return }
            self.layoutDrawer(open: open)
            self.dimControl.alpha = open ? 1 : 0
        }
        let completion: (Bool) -> Void = { [weak self] _ in
            if !open { self?.dimControl.isHidden = true }
        }
        guard animated else { changes(); completion(true); return }
        UIView.animate(withDuration: configuration.animationDuration,
                       delay: 0,
                       usingSpringWithDamping: 0.92,
                       initialSpringVelocity: 0,
                       options: [.curveEaseInOut, .allowUserInteraction],
                       animations: changes,
                       completion: completion)
    }

    private func layoutDrawer(open: Bool) {
        let bounds = view.bounds
        let horizontal = configuration.direction == .left || configuration.direction == .right
        let distance = (horizontal ? bounds.width : bounds.height) * configuration.presentedRatio
        var shownFrame = bounds
        if horizontal { shownFrame.size.width = distance } else { shownFrame.size.height = distance }
        if configuration.direction == .right { shownFrame.origin.x = bounds.width - distance }
        if configuration.direction == .bottom { shownFrame.origin.y = bounds.height - distance }
        var hiddenFrame = shownFrame
        switch configuration.direction {
        case .left: hiddenFrame.origin.x = -distance
        case .right: hiddenFrame.origin.x = bounds.width
        case .top: hiddenFrame.origin.y = -distance
        case .bottom: hiddenFrame.origin.y = bounds.height
        }
        drawerContainerView.frame = open ? shownFrame : hiddenFrame
        var contentFrame = bounds
        if open, configuration.contentMode == .following {
            switch configuration.direction {
            case .left: contentFrame.origin.x += distance
            case .right: contentFrame.origin.x -= distance
            case .top: contentFrame.origin.y += distance
            case .bottom: contentFrame.origin.y -= distance
            }
        }
        contentContainerView.transform = .identity
        contentContainerView.frame = contentFrame
        drawerContentView.frame = drawerContainerView.bounds
        mainContentView.frame = contentContainerView.bounds
        dimControl.frame = contentContainerView.bounds
        view.bringSubviewToFront(drawerContainerView)
    }

    @objc private func closeFromDim() {
        closeDrawer()
    }
}

public extension UIViewController {
    var jobsSideDrawer: JobsSideDrawerVC? {
        var current: UIViewController? = self
        while let controller = current {
            if let drawer = controller as? JobsSideDrawerVC { return drawer }
            current = controller.parent
        };return nil
    }

    func jobs_findMainNavFromAncestors(closeDrawer: Bool = true,
                                       animated: Bool = true) -> UINavigationController? {
        if let drawer = jobsSideDrawer {
            if closeDrawer { drawer.closeDrawer(animated: animated) }
            return drawer.children.compactMap { $0 as? UINavigationController }.last
        };return navigationController
    }
}
