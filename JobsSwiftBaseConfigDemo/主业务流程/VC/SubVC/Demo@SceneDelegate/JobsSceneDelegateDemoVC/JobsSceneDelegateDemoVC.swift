//
//  JobsSceneDelegateDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月30日，星期四.
//

import UIKit

import GKNavigationBarSwift
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsToast
import SnapKit

final class JobsSceneDelegateDemoVC: BaseVC {
    private let restorationActivity: NSUserActivity?
    private weak var currentScene: UIWindowScene?
    private var counter: Int

    private lazy var scrollView: UIScrollView = {
        UIScrollView.jobsMake { _ in }
            .byAlwaysBounceVertical(YES)
            .byShowsVerticalScrollIndicator(NO)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var contentStackView: UIStackView = {
        UIStackView.jobsMake { _ in }
            .byAxis(.vertical)
            .byAlignment(.fill)
            .byDistribution(.fill)
            .bySpacing(14)
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalTo(scrollView.contentLayoutGuide).inset(16)
                make.width.equalTo(scrollView.frameLayoutGuide).offset(-32)
            }
    }()

    private lazy var introLabel: UILabel = {
        makeBodyLabel(
            "AppDelegate 管进程级能力；每个窗口会话各有自己的 UIScene、SceneDelegate、UIWindow 和生命周期。"
        )
    }()

    private lazy var supportLabel: UILabel = makeCardLabel()
    private lazy var sessionLabel: UILabel = makeCardLabel()

    private lazy var counterLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byTextColor(JobsCor.systemBlue)
            .byFont(UIFont.monospacedDigitSystemFont(ofSize: 28, weight: .bold))
            .byTextAlignment(.center)
            .byNumberOfLines(1)
    }()

    private lazy var stateTipLabel: UILabel = {
        makeBodyLabel(
            "这个计数只属于当前 Scene。新建窗口从 0 开始；系统重连该会话时通过 NSUserActivity 恢复。"
        )
    }()

    private lazy var incrementButton: UIButton = {
        makeButton(title: "当前 Scene +1", color: JobsCor.systemBlue) { [weak self] in
            self?.incrementCounter()
        }
    }()

    private lazy var newSceneButton: UIButton = {
        makeButton(title: "新建 Scene 窗口", color: JobsCor.systemGreen) { [weak self] in
            self?.requestNewScene()
        }
    }()

    private lazy var activateSceneButton: UIButton = {
        makeButton(title: "激活另一个 Scene", color: JobsCor.systemOrange) { [weak self] in
            self?.activateOtherScene()
        }
    }()

    private lazy var refreshButton: UIButton = {
        makeButton(title: "刷新会话快照", color: JobsCor.systemGray) { [weak self] in
            self?.requestSnapshotRefresh()
        }
    }()

    private lazy var closeSceneButton: UIButton = {
        makeButton(title: "关闭当前 Scene", color: JobsCor.systemRed) { [weak self] in
            self?.closeCurrentScene()
        }
    }()

    private lazy var actionTipLabel: UILabel = {
        makeBodyLabel(
            "多窗口能力由 Info.plist 声明和当前设备环境共同决定。iPad 最适合验证；操作按钮始终可点，不支持时会通过 Toast 说明原因。"
        )
    }()

    private lazy var logTitleLabel: UILabel = {
        makeSectionTitleLabel("当前 Scene 生命周期日志")
    }()

    private lazy var logLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("等待 Scene 生命周期事件…".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(UIFont.monospacedSystemFont(ofSize: 12, weight: .regular))
            .byNumberOfLines(0)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(12)
            .byClipsToBounds(YES)
    }()

    init(restorationActivity: NSUserActivity? = nil) {
        self.restorationActivity = restorationActivity
        counter = JobsSceneCoordinator.restoredCounter(from: restorationActivity)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        restorationActivity = nil
        counter = 0
        super.init(coder: coder)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "SceneDelegate 多场景".tr)
        setupContent()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(sceneCoordinatorDidChange(_:)),
            name: JobsSceneCoordinator.didChangeNotification,
            object: nil
        )
        updateCounterLabel()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindCurrentSceneIfNeeded()
        refreshSnapshot(requestSystemRefresh: false)
    }

    func sceneRestorationActivity() -> NSUserActivity? {
        guard let currentScene else { return restorationActivity };return JobsSceneCoordinator.updateCounter(
            counter,
            for: currentScene
        )
    }

    func restoreSceneInteractionState(with activity: NSUserActivity) {
        guard JobsSceneCoordinator.isDemoActivity(activity) else { return }
        counter = JobsSceneCoordinator.restoredCounter(from: activity)
        if isViewLoaded {
            persistCounter()
            refreshSnapshot(requestSystemRefresh: false)
        }
    }
}

private extension JobsSceneDelegateDemoVC {
    func setupContent() {
        let architectureTitleLabel = makeSectionTitleLabel("进程与场景的职责边界")
        let runtimeTitleLabel = makeSectionTitleLabel("当前运行环境")
        let stateTitleLabel = makeSectionTitleLabel("Scene 独立状态与恢复")
        let actionTitleLabel = makeSectionTitleLabel("场景会话操作")
        contentStackView.byAddArrangedSubviews([
            architectureTitleLabel,
            introLabel,
            runtimeTitleLabel,
            supportLabel,
            sessionLabel,
            stateTitleLabel,
            stateTipLabel,
            counterLabel,
            incrementButton,
            actionTitleLabel,
            actionTipLabel,
            newSceneButton,
            activateSceneButton,
            refreshButton,
            closeSceneButton,
            logTitleLabel,
            logLabel
        ])

        [incrementButton, newSceneButton, activateSceneButton, refreshButton, closeSceneButton]
            .forEach { $0.snp.makeConstraints { $0.height.equalTo(44) } }
        logLabel.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(180)
        }
    }

    func makeSectionTitleLabel(_ text: String) -> UILabel {
        return UILabel.jobsMake { _ in }
            .byText(text.tr)
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 18, weight: .bold))
            .byNumberOfLines(1)
    }

    func makeBodyLabel(_ text: String) -> UILabel {
        return UILabel.jobsMake { _ in }
            .byText(text.tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byNumberOfLines(0)
    }

    func makeCardLabel() -> UILabel {
        return UILabel.jobsMake { _ in }
            .byTextColor(JobsCor.label)
            .byFont(UIFont.monospacedSystemFont(ofSize: 13, weight: .regular))
            .byNumberOfLines(0)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(12)
            .byClipsToBounds(YES)
    }

    func makeButton(
        title: String,
        color: UIColor,
        action: @escaping () -> Void
    ) -> UIButton {
        return UIButton.sys()
            .byConfiguration(
                UIButton.Configuration.filled()
                    .byTitle(title.tr)
                    .byBaseBackgroundColor(color)
                    .byCornerStyle(.medium)
            )
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .onTap { _ in action() }
    }

    func bindCurrentSceneIfNeeded() {
        guard let scene = view.window?.windowScene else { return }
        currentScene = scene
        counter = JobsSceneCoordinator.counter(for: scene.session, fallback: counter)
        persistCounter()
    }

    func incrementCounter() {
        counter += 1
        persistCounter()
        refreshSnapshot(requestSystemRefresh: false)
    }

    func persistCounter() {
        guard let currentScene else {
            updateCounterLabel()
            return
        }
        _ = JobsSceneCoordinator.updateCounter(counter, for: currentScene)
        currentScene.title = "Scene Demo · \(JobsSceneCoordinator.shortIdentifier(for: currentScene.session))"
        updateCounterLabel()
    }

    func updateCounterLabel() {
        counterLabel.byText("当前 Scene 计数：\(counter)")
    }

    func requestNewScene() {
        guard UIApplication.shared.supportsMultipleScenes else {
            showToast("当前环境不支持多窗口，请在支持多窗口的 iPad 上验证")
            return
        }
        JobsSceneCoordinator.requestNewDemoScene(from: currentScene?.session) { [weak self] error in
            DispatchQueue.main.async {
                if let error {
                    self?.showMessage(title: "新建 Scene 失败", message: error.localizedDescription)
                }
                self?.refreshSnapshot(requestSystemRefresh: false)
            }
        }
    }

    func activateOtherScene() {
        guard UIApplication.shared.supportsMultipleScenes else {
            showToast("当前环境不支持多窗口，请在支持多窗口的 iPad 上验证")
            return
        }
        guard let session = currentScene?.session else {
            showToast("当前页面尚未绑定 Scene，暂时无法激活其它窗口")
            return
        }
        guard let otherSession = JobsSceneCoordinator.otherOpenSession(excluding: session) else {
            showToast("没有其它 Scene，请先新建一个 Scene 窗口")
            return
        }
        JobsSceneCoordinator.requestActivation(for: otherSession) { [weak self] error in
            DispatchQueue.main.async {
                if let error {
                    self?.showMessage(title: "激活 Scene 失败", message: error.localizedDescription)
                }
                self?.refreshSnapshot(requestSystemRefresh: false)
            }
        }
    }

    func closeCurrentScene() {
        guard UIApplication.shared.supportsMultipleScenes else {
            showToast("当前环境不支持多窗口，无法关闭独立 Scene")
            return
        }
        guard let session = currentScene?.session else {
            showToast("当前页面尚未绑定 Scene，暂时无法关闭")
            return
        }
        guard UIApplication.shared.openSessions.count > 1 else {
            showToast("这是最后一个 Scene，请先新建另一个 Scene 再关闭")
            return
        }
        JobsSceneCoordinator.requestDestruction(for: session) { [weak self] error in
            DispatchQueue.main.async {
                if let error {
                    self?.showMessage(title: "关闭 Scene 失败", message: error.localizedDescription)
                }
            }
        }
    }

    func requestSnapshotRefresh() {
        guard currentScene != nil else {
            showToast("当前页面尚未绑定 Scene，暂时无法刷新会话快照")
            return
        }
        refreshSnapshot(requestSystemRefresh: true)
    }

    func refreshSnapshot(requestSystemRefresh: Bool) {
        guard isViewLoaded else { return }
        let application = UIApplication.shared
        let connectedCount = application.connectedScenes.count
        let openCount = application.openSessions.count
        supportLabel.byText(
            """
            supportsMultipleScenes：\(application.supportsMultipleScenes ? "YES" : "NO")
            connectedScenes：\(connectedCount)
            openSessions：\(openCount)
            """
        )
        guard let scene = currentScene else {
            sessionLabel.byText("当前页面尚未绑定 UIWindowScene")
            updateButtons()
            return
        }
        let session = scene.session
        sessionLabel.byText(
            """
            session：\(JobsSceneCoordinator.shortIdentifier(for: session))
            role：\(session.role.rawValue)
            activationState：\(JobsSceneCoordinator.activationStateText(for: scene.activationState))
            """
        )
        if requestSystemRefresh {
            application.requestSceneSessionRefresh(session)
            JobsSceneCoordinator.record("请求系统刷新 SceneSession", for: session)
            showToast("会话快照已刷新")
        }
        let events = JobsSceneCoordinator.events(for: session)
        logLabel.byText(events.isEmpty ? "等待 Scene 生命周期事件…".tr : events.joined(separator: "\n"))
        updateButtons()
    }

    func updateButtons() {
        incrementButton.byEnabled(currentScene != nil)
        newSceneButton.byEnabled(YES)
        activateSceneButton.byEnabled(YES)
        refreshButton.byEnabled(YES)
        closeSceneButton.byEnabled(YES)
    }

    @objc
    func sceneCoordinatorDidChange(_ notification: Notification) {
        guard let session = currentScene?.session,
              notification.userInfo?[JobsSceneCoordinator.sessionIdentifierUserInfoKey] as? String
                == session.persistentIdentifier else { return }
        refreshSnapshot(requestSystemRefresh: false)
    }

    func showMessage(title: String, message: String) {
        present(
            UIAlertController(title: title.tr, message: message.tr, preferredStyle: .alert)
                .byAddOK("知道了".tr),
            animated: true
        )
    }

    func showToast(_ text: String) {
        JobsToast.show(text: text.tr, in: view.window)
    }
}
