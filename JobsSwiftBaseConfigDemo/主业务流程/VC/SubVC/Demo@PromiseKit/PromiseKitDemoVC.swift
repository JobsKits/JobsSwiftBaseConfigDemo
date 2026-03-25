//
//  PromiseKitDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 24/3/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import PromiseKit
import GKNavigationBarSwift
import JobsScale
import JobsByUIKit
import JobsEmptyView
import JobsRefresher
import JobsInheritance
import JobsSwiftBaseDefines

final class PromiseKitDemoVC: BaseVC {
    // MARK: - Row
    private enum Row: Int, CaseIterable {
        case serial
        case parallel
        case fallback
        case partialSuccess
        case timeoutRace

        var title: String {
            switch self {
            case .serial: "串行依赖：登录 → 用户资料 → 权益"
            case .parallel: "并发聚合：首页多接口一起拉"
            case .fallback: "失败回退：主链路失败 → recover 缓存"
            case .partialSuccess: "部分成功：when(resolved:)"
            case .timeoutRace: "竞争/超时：race + after"
            }
        }

        var subtitle: String {
            switch self {
            case .serial: "then 把前一个结果自然传给下一个请求"
            case .parallel: "when(fulfilled:) 解决回调地狱和收口问题"
            case .fallback: "recover 把兜底逻辑写平，不用层层 else"
            case .partialSuccess: "一个失败不影响其它成功结果落地"
            case .timeoutRace: "超时不是到处手写 Timer，而是直接组合"
            }
        }
    }
    // MARK: - Section
    private enum Section: Int, CaseIterable {
        case actions
        case logs

        var title: String {
            switch self {
            case .actions: "PromiseKit 场景"
            case .logs: "运行日志"
            }
        }
    }
    // MARK: - Model
    struct User {
        let id: Int
        let name: String
    }

    struct Benefit {
        let level: String
        let points: Int
    }

    struct Banner {
        let title: String
    }

    private struct HomeSummary {
        let userName: String
        let unreadCount: Int
        let banners: [Banner]
    }

    enum DemoError: Error {
        case invalidCredential
        case networkBusy
        case timeout
        case degraded
        case deallocated
    }
    // MARK: - Data
    private let service = MockPromiseService()
    private var logs = [String]() {
        didSet { tableView.reloadData() }
    }
    // MARK: - UI
    private lazy var tipsLabel: UILabel = {
        UILabel()
            .byText("""
                    PromiseKit 这个库确实不轻，但它有几个 callback / GCD 很难写得这么平的地方：
                    串行依赖、并发聚合、失败回退、部分成功、超时竞争。
                    这个 DemoVC 就只演示这 5 个点。
                    """)
            .byTextColor(.darkText)
            .byNumberOfLines(0)
            .byFont(.systemFont(ofSize: 14, weight: .regular))
            .byBackgroundColor(.white)
            .byCornerRadius(12)
            .byMasksToBounds(YES)
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview().inset(16)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(12)
                } else {
                    make.top.equalToSuperview().offset(12)
                }
            }
    }()

    private lazy var loadingLabel: UILabel = {
        UILabel()
            .byText("Idle")
            .byTextAlignment(.center)
            .byTextColor(.white)
            .byFont(.systemFont(ofSize: 13, weight: .semibold))
            .byBackgroundColor(.systemBlue.withAlphaComponent(0.9))
            .byCornerRadius(18)
            .byMasksToBounds(YES)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.tipsLabel.snp.bottom).offset(10)
                make.right.equalToSuperview().inset(16)
                make.height.equalTo(36)
                make.width.greaterThanOrEqualTo(96)
            }
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(UITableViewCell.self)
            .byNoContentInsetAdjustment()
            .bySeparatorStyle(.singleLine)
            .byNoSectionHeaderTopPadding()
            .byContentInsetTop(8)
            .byExpandVerticalScrollDistance(200.h)
            .byEmptyViewProvider { [unowned self] in
                JobsEmptyView()
                    .byOnTapRetry { [weak self] in
                        guard let self else { return }
                        self.appendLog("点击了空态重试")
                    }
            }
            .byEmptyViewLayout { emptyView, make, host in
                make.centerX.equalTo(host)
                make.centerY.equalTo(host).offset(-40)
                make.leading.greaterThanOrEqualTo(host).offset(16)
                make.trailing.lessThanOrEqualTo(host).inset(16)
                make.width.lessThanOrEqualTo(host).multipliedBy(0.9)
            }
            .byRefreshHeader(component: JobsDefaultHeader(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                self.reloadDemoData()
            }
            .byRefreshFooter(component: JobsDefaultFooter(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                onMainSync {
                    self.appendLog("Demo 没有真正分页，直接标记 noMoreData")
                    self.tableView.switchRefreshFooter(to: .noMoreData)
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.loadingLabel.snp.bottom).offset(10)
                make.left.right.bottom.equalToSuperview()
            }
    }()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(.systemGroupedBackground)
        jobsSetupGKNav(title: "PromiseKit Demo".tr)

        tipsLabel.byVisible(YES)
        loadingLabel.byVisible(YES)
        tableView.byVisible(YES)

        appendLog("DemoVC ready")
        appendLog("点任意一行，观察 PromiseKit 的组合能力")
    }
}

extension PromiseKitDemoVC {
    // MARK: - Event
    private func reloadDemoData() {
        onMainSync {
            self.appendLog("下拉刷新：重置日志")
            self.logs.removeAll()
            self.appendLog("DemoVC ready")
            self.appendLog("点任意一行，观察 PromiseKit 的组合能力")
            self.tableView.switchRefreshHeader(to: .normal)
            self.tableView.switchRefreshFooter(to: .normal)
        }
    }

    private func runDemo(_ row: Row) {
        switch row {
        case .serial:
            上一个请求的产物给下一个请求继续用()
        case .parallel:
            多个互不依赖的请求同时发最后一次性收口()
        case .fallback:
            主链路挂了以后不把页面打死直接切缓存()
        case .partialSuccess:
            一个接口失败不影响其它接口的成功结果展示()
        case .timeoutRace:
            哪个先完成就用哪个()
        }
    }
    // MARK: - Demo 1
    /// 串行依赖：上一个请求的产物给下一个请求继续用
    private func 上一个请求的产物给下一个请求继续用() {
        setLoading(true, text: "串行中...")

        firstly {
            service.login(username: "jobs", password: "123456")
        }.then { [service] token in
            service.fetchProfile(token: token)
        }.then { [service] user in
            service.fetchBenefits(userId: user.id).map { benefit in
                (user, benefit)
            }
        }.done { [weak self] user, benefit in
            guard let self else { return }
            self.appendLog("✅ 串行成功：\(user.name) / \(benefit.level) / \(benefit.points)分")
        }.catch { [weak self] error in
            guard let self else { return }
            self.appendLog("❌ 串行失败：\(error.localizedDescription)")
        }.finally { [weak self] in
            guard let self else { return }
            self.setLoading(false)
        }
    }
    // MARK: - Demo 2
    /// 并发聚合：多个互不依赖的请求同时发，最后一次性收口
    private func 多个互不依赖的请求同时发最后一次性收口() {
        setLoading(true, text: "并发中...")

        firstly {
            when(fulfilled:
                service.fetchCurrentUser(),
                service.fetchUnreadCount(),
                service.fetchBanners()
            )
        }.map { user, unread, banners in
            HomeSummary(userName: user.name, unreadCount: unread, banners: banners)
        }.done { [weak self] summary in
            guard let self else { return }
            let bannerTitles = summary.banners.map(\.title).joined(separator: "、")
            self.appendLog("✅ 并发成功：用户=\(summary.userName)，未读=\(summary.unreadCount)，Banner=[\(bannerTitles)]")
        }.catch { [weak self] error in
            guard let self else { return }
            self.appendLog("❌ 并发失败：\(error.localizedDescription)")
        }.finally { [weak self] in
            guard let self else { return }
            self.setLoading(false)
        }
    }
    // MARK: - Demo 3
    /// 失败回退：主链路挂了以后，不把页面打死，直接切缓存
    private func 主链路挂了以后不把页面打死直接切缓存() {
        setLoading(true, text: "回退中...")

        firstly {
            service.fetchRemoteConfig(forceFail: true)
        }.recover { [service] error -> Promise<String> in
            service.readCachedConfig().map { cached in
                "[recover from: \(error.localizedDescription)] \(cached)"
            }
        }.done { [weak self] config in
            guard let self else { return }
            self.appendLog("✅ recover 成功：\(config)")
        }.catch { [weak self] error in
            guard let self else { return }
            self.appendLog("❌ recover 也失败：\(error.localizedDescription)")
        }.finally { [weak self] in
            guard let self else { return }
            self.setLoading(false)
        }
    }
    // MARK: - Demo 4
    /// 部分成功：一个接口失败，不影响其它接口的成功结果展示
    private func 一个接口失败不影响其它接口的成功结果展示() {
        setLoading(true, text: "收集中...")

        let promises: [Promise<String>] = [
            service.fetchWidget(name: "推荐位", shouldFail: false),
            service.fetchWidget(name: "运营角标", shouldFail: true),
            service.fetchWidget(name: "活动弹窗", shouldFail: false)
        ]

        when(resolved: promises).done { [weak self] (results: [Result<String>]) in
            guard let self else { return }

            var successLogs = [String]()
            var failureLogs = [String]()

            results.forEach { result in
                switch result {
                case .fulfilled(let value):
                    successLogs.append(value)
                case .rejected(let error):
                    failureLogs.append(error.localizedDescription)
                }
            }

            self.appendLog("✅ 部分成功：成功[\(successLogs.joined(separator: "、"))]")
            if !failureLogs.isEmpty {
                self.appendLog("⚠️ 部分失败：失败[\(failureLogs.joined(separator: "、"))]")
            }

            self.setLoading(false)
        }
    }
    // MARK: - Demo 5
    /// 竞争 / 超时：哪个先完成就用哪个
    private func 哪个先完成就用哪个() {
        setLoading(true, text: "竞争中...")

        let request = service.fetchSlowResource(delay: 2.0)
        let timeout = after(seconds: 1.0).then { () -> Promise<String> in
            Promise(error: DemoError.timeout)
        }

        firstly {
            race(request, timeout)
        }.done { [weak self] value in
            guard let self else { return }
            self.appendLog("✅ race 成功：\(value)")
        }.catch { [weak self] error in
            guard let self else { return }
            self.appendLog("❌ race 触发超时：\(error.localizedDescription)")
        }.finally { [weak self] in
            guard let self else { return }
            self.setLoading(false)
        }
    }
    // MARK: - UI State
    private func setLoading(_ loading: Bool, text: String = "Idle") {
        onMainSync {
            self.loadingLabel
                .byVisible(YES)
                .byText(loading ? text : "Idle")
                .byBackgroundColor(loading ? .systemOrange.withAlphaComponent(0.9) : .systemBlue.withAlphaComponent(0.9))
        }
    }

    private func appendLog(_ text: String) {
        onMainSync {
            let time = Self.timeFormatter.string(from: Date())
            self.logs.insert("[\(time)] \(text)", at: 0)
        }
    }

    private static let timeFormatter: DateFormatter = {
        DateFormatter().byDateFormat("HH:mm:ss")
    }()
}
// MARK: - UITableViewDataSource / UITableViewDelegate
extension PromiseKitDemoVC: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        Section.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sec = Section(rawValue: section) else { return 0 }
        let count: Int
        switch sec {
        case .actions:
            count = Row.allCases.count
        case .logs:
            count = logs.count
        };return count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Section(rawValue: section)?.title
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        68
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard
            let section = Section(rawValue: indexPath.section),
            section == .actions,
            let row = Row(rawValue: indexPath.row)
        else { return }

        runDemo(row)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView
            .byDequeueReusableCell(withType: UITableViewCell.self, for: indexPath)
            .byAccessoryType(.none)

        var config = cell.defaultContentConfiguration()

        if indexPath.section == Section.actions.rawValue,
           let row = Row(rawValue: indexPath.row) {
            config.text = row.title
            config.secondaryText = row.subtitle
            cell.accessoryType = .disclosureIndicator
        } else {
            config.text = logs[indexPath.row]
            config.secondaryText = nil
            cell.accessoryType = .none
        }

        config.textProperties.numberOfLines = 0
        config.secondaryTextProperties.numberOfLines = 0
        cell.contentConfiguration = config
        return cell
    }
}
// MARK: - Mock Service
private final class MockPromiseService {

    func login(username: String, password: String) -> Promise<String> {
        Promise { seal in
            after(seconds: 0.6).done {
                if username == "jobs", password == "123456" {
                    seal.fulfill("token_abc_123")
                } else {
                    seal.reject(PromiseKitDemoVC.DemoError.invalidCredential)
                }
            }
        }
    }

    func fetchProfile(token: String) -> Promise<PromiseKitDemoVC.User> {
        Promise { seal in
            after(seconds: 0.5).done {
                guard token == "token_abc_123" else {
                    seal.reject(PromiseKitDemoVC.DemoError.invalidCredential)
                    return
                }
                seal.fulfill(.init(id: 9527, name: "Jobs"))
            }
        }
    }

    func fetchBenefits(userId: Int) -> Promise<PromiseKitDemoVC.Benefit> {
        Promise { seal in
            after(seconds: 0.4).done {
                seal.fulfill(.init(level: "VIP", points: 1888))
            }
        }
    }

    func fetchCurrentUser() -> Promise<PromiseKitDemoVC.User> {
        Promise { seal in
            after(seconds: 0.4).done {
                seal.fulfill(.init(id: 1, name: "Jobs"))
            }
        }
    }

    func fetchUnreadCount() -> Promise<Int> {
        Promise { seal in
            after(seconds: 0.3).done {
                seal.fulfill(7)
            }
        }
    }

    func fetchBanners() -> Promise<[PromiseKitDemoVC.Banner]> {
        Promise { seal in
            after(seconds: 0.8).done {
                seal.fulfill([
                    .init(title: "新人礼"),
                    .init(title: "秒杀专区"),
                    .init(title: "会员日")
                ])
            }
        }
    }

    func fetchRemoteConfig(forceFail: Bool) -> Promise<String> {
        Promise { seal in
            after(seconds: 0.5).done {
                if forceFail {
                    seal.reject(PromiseKitDemoVC.DemoError.networkBusy)
                } else {
                    seal.fulfill("remote_config_v3")
                }
            }
        }
    }

    func readCachedConfig() -> Promise<String> {
        Promise { seal in
            after(seconds: 0.2).done {
                seal.fulfill("cached_config_v2")
            }
        }
    }

    func fetchWidget(name: String, shouldFail: Bool) -> Promise<String> {
        Promise { seal in
            after(seconds: 0.35).done {
                if shouldFail {
                    seal.reject(PromiseKitDemoVC.DemoError.degraded)
                } else {
                    seal.fulfill("\(name)加载成功")
                }
            }
        }
    }

    func fetchSlowResource(delay: TimeInterval) -> Promise<String> {
        Promise { seal in
            after(seconds: delay).done {
                seal.fulfill("慢接口返回成功")
            }
        }
    }
}
