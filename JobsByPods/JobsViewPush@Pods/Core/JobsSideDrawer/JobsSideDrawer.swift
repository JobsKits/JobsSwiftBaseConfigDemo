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
    public var allowsInteractiveTransition: Bool

    public init(direction: JobsSideDrawerDirection = .left,
                contentMode: JobsSideDrawerContentMode = .following,
                presentedRatio: CGFloat = 0.5,
                animationDuration: TimeInterval = 0.28,
                dimColor: UIColor = UIColor.black.withAlphaComponent(0.35),
                allowsInteractiveTransition: Bool = true) {
        self.direction = direction
        self.contentMode = contentMode
        self.presentedRatio = max(0.1, min(1, presentedRatio))
        self.animationDuration = animationDuration
        self.dimColor = dimColor
        self.allowsInteractiveTransition = allowsInteractiveTransition
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
    private lazy var openGesture = UIScreenEdgePanGestureRecognizer(target: self,
                                                                    action: #selector(handleOpenGesture(_:)))
    private lazy var closeGesture = UIPanGestureRecognizer(target: self,
                                                           action: #selector(handleCloseGesture(_:)))
    private var interactiveProgress: CGFloat?
    private var isAnimatingTransition = false
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
        openGesture.delegate = self
        closeGesture.delegate = self
        view.addGestureRecognizer(openGesture)
        drawerContainerView.addGestureRecognizer(closeGesture)
        updateGestureConfiguration()
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
        layoutDrawer(progress: interactiveProgress ?? (isOpen ? 1 : 0))
    }

    public func applyConfiguration(animated: Bool = false) {
        configuration.presentedRatio = max(0.1, min(1, configuration.presentedRatio))
        updateGestureConfiguration()
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
        let wasInteractive = interactiveProgress != nil
        if !wasInteractive { view.layoutIfNeeded() }
        interactiveProgress = nil
        isAnimatingTransition = animated
        isOpen = open
        if open { dimControl.isHidden = false }
        updateGestureAvailability()
        let changes = { [weak self] in
            guard let self else { return }
            self.layoutDrawer(progress: open ? 1 : 0)
        }
        let completion: (Bool) -> Void = { [weak self] _ in
            self?.isAnimatingTransition = false
            if !open { self?.dimControl.isHidden = true }
            self?.updateGestureAvailability()
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

    private func layoutDrawer(progress: CGFloat) {
        let bounds = view.bounds
        let progress = max(0, min(1, progress))
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
        drawerContainerView.frame = CGRect(
            x: hiddenFrame.origin.x + (shownFrame.origin.x - hiddenFrame.origin.x) * progress,
            y: hiddenFrame.origin.y + (shownFrame.origin.y - hiddenFrame.origin.y) * progress,
            width: shownFrame.width,
            height: shownFrame.height
        )
        var contentFrame = bounds
        if configuration.contentMode == .following {
            switch configuration.direction {
            case .left: contentFrame.origin.x += distance * progress
            case .right: contentFrame.origin.x -= distance * progress
            case .top: contentFrame.origin.y += distance * progress
            case .bottom: contentFrame.origin.y -= distance * progress
            }
        }
        contentContainerView.transform = .identity
        contentContainerView.frame = contentFrame
        drawerContentView.frame = drawerContainerView.bounds
        mainContentView.frame = contentContainerView.bounds
        dimControl.frame = contentContainerView.bounds
        dimControl.alpha = progress
        view.bringSubviewToFront(drawerContainerView)
    }

    private func updateGestureConfiguration() {
        switch configuration.direction {
        case .left: openGesture.edges = .left
        case .right: openGesture.edges = .right
        case .top: openGesture.edges = .top
        case .bottom: openGesture.edges = .bottom
        }
        updateGestureAvailability()
    }

    private func updateGestureAvailability() {
        let allowsGesture = configuration.allowsInteractiveTransition && !isAnimatingTransition
        openGesture.isEnabled = allowsGesture && !isOpen
        closeGesture.isEnabled = allowsGesture && isOpen
    }

    private func interactiveDistance() -> CGFloat {
        let horizontal = configuration.direction == .left || configuration.direction == .right
        let length = horizontal ? view.bounds.width : view.bounds.height
        return max(length * configuration.presentedRatio, 1)
    }

    private func openingOffset(for translation: CGPoint) -> CGFloat {
        switch configuration.direction {
        case .left: return max(translation.x, 0)
        case .right: return max(-translation.x, 0)
        case .top: return max(translation.y, 0)
        case .bottom: return max(-translation.y, 0)
        }
    }

    private func openingVelocity(for velocity: CGPoint) -> CGFloat {
        switch configuration.direction {
        case .left: return velocity.x
        case .right: return -velocity.x
        case .top: return velocity.y
        case .bottom: return -velocity.y
        }
    }

    private func updateInteractiveTransition(_ gesture: UIPanGestureRecognizer, opening: Bool) {
        let translation = gesture.translation(in: view)
        let directionalOffset = opening
            ? openingOffset(for: translation)
            : max(-openingVelocity(for: translation), 0)
        let progress = min(directionalOffset / interactiveDistance(), 1)
        let targetProgress = opening ? progress : 1 - progress
        switch gesture.state {
        case .began:
            dimControl.isHidden = false
            interactiveProgress = opening ? 0 : 1
            layoutDrawer(progress: interactiveProgress ?? 0)
        case .changed:
            interactiveProgress = targetProgress
            layoutDrawer(progress: targetProgress)
        case .ended, .cancelled, .failed:
            let openingVelocity = openingVelocity(for: gesture.velocity(in: view))
            let directionalVelocity = opening ? openingVelocity : -openingVelocity
            let completed = gesture.state == .ended && (progress >= 0.35 || directionalVelocity >= 500)
            setDrawer(open: opening ? completed : !completed, animated: true)
        default:
            break
        }
    }

    @objc private func handleOpenGesture(_ gesture: UIScreenEdgePanGestureRecognizer) {
        updateInteractiveTransition(gesture, opening: true)
    }

    @objc private func handleCloseGesture(_ gesture: UIPanGestureRecognizer) {
        updateInteractiveTransition(gesture, opening: false)
    }

    @objc private func closeFromDim() {
        closeDrawer()
    }
}

extension JobsSideDrawerVC: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer === closeGesture,
              let panGesture = gestureRecognizer as? UIPanGestureRecognizer else { return true }
        let velocity = panGesture.velocity(in: view)
        let horizontal = configuration.direction == .left || configuration.direction == .right
        let primaryVelocity = openingVelocity(for: velocity)
        let isPrimaryDirection = horizontal
            ? abs(velocity.x) > abs(velocity.y)
            : abs(velocity.y) > abs(velocity.x)
        return isPrimaryDirection && primaryVelocity < 0
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
            if closeDrawer { drawer.closeDrawer(animated: animated) };return drawer.children.compactMap { $0 as? UINavigationController }.last
        };return navigationController
    }
}
