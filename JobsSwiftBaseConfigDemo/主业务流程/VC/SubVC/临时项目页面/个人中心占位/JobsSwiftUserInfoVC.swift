//
//  JobsSwiftUserInfoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import QuartzCore
import GKNavigationBarSwift
import JobsByUIKit
import JobsInheritance
import JobsNetworking
import Jobsl10n
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsSwiftTimer
import SnapKit

final class JobsSwiftUserInfoVC: BaseVC {

    private static let cellReuseIdentifier = "JobsSwiftUserInfoCell"
    private static let sectionHeaderCornerRadius: CGFloat = 12
    private static let topCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    private static let bottomCorners: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    private var userFields: [JobsUserInfoField] = []
    private var deviceFields: [JobsUserInfoField] = []
    private var copyAlertController: UIAlertController?
    private var expandedSections = [true, true]
    private var collectionClient = JobsDeviceCollectionClient()
    private var collectionSession: JobsDeviceCollectionSession?
    private var pairingURL: URL?
    private var collectionRequest: JobsRequestToken?
    private var collectionGeneration = UUID()
    private var collectionPoll: DispatchWorkItem?
    private var collectionObservers: [NSObjectProtocol] = []
    private var collectionStatus = "initial"
    private var collectionBusy = false
    private var collectionVisible = false
    private var collectionAlert: UIAlertController?

    private lazy var collectionPanel: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.clear)
    }()

    private lazy var collectionStatusLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byTextColor(JobsCor.label)
            .byNumberOfLines(0)
            .byAddTo(collectionPanel) { make in
                make.top.leading.trailing.equalToSuperview().inset(12)
            }
    }()

    private lazy var collectButton: UIButton = {
        UIButton.sys()
            .byAccessibilityIdentifier("JobsDeviceCollection.start")
            .byNumberOfLines(0)
            .byTitleFont(JobsFont.systemFont(ofSize: 14,
                                             weight: .semibold))
            .onTap { [weak self] _ in
                self?.confirmCollection()
            }
            .byAddTo(collectionPanel) { make in
                make.top.equalTo(self.collectionStatusLabel.snp.bottom).offset(12)
                make.leading.equalToSuperview().offset(12)
                make.width.equalToSuperview().multipliedBy(0.5).offset(-18)
                make.height.greaterThanOrEqualTo(52)
            }
    }()

    private lazy var refreshCollectionButton: UIButton = {
        UIButton.sys()
            .byAccessibilityIdentifier("JobsDeviceCollection.refresh")
            .byNumberOfLines(0)
            .byTitleFont(JobsFont.systemFont(ofSize: 14))
            .onTap { [weak self] _ in
                self?.refreshCollection()
            }
            .byAddTo(collectionPanel) { make in
                make.top.height.width.equalTo(self.collectButton)
                make.trailing.equalToSuperview().inset(12)
            }
    }()

    private lazy var resumeCollectionButton: UIButton = {
        UIButton.sys()
            .byAccessibilityIdentifier("JobsDeviceCollection.open")
            .byNumberOfLines(0)
            .byTitleFont(JobsFont.systemFont(ofSize: 14))
            .onTap { [weak self] _ in
                self?.openCollectionPage()
            }
            .byAddTo(collectionPanel) { make in
                make.top.equalTo(self.collectButton.snp.bottom).offset(8)
                make.leading.width.equalTo(self.collectButton)
                make.height.greaterThanOrEqualTo(52)
            }
    }()

    private lazy var clearCollectionButton: UIButton = {
        UIButton.sys()
            .byAccessibilityIdentifier("JobsDeviceCollection.clear")
            .byNumberOfLines(0)
            .byTitleFont(JobsFont.systemFont(ofSize: 14))
            .onTap { [weak self] _ in
                self?.clearCollection()
            }
            .byAddTo(collectionPanel) { make in
                make.top.height.width.equalTo(self.resumeCollectionButton)
                make.trailing.bottom.equalToSuperview().inset(12)
            }
    }()

    private lazy var sectionTitleLabels: [UILabel] = {
        (0 ..< 2).map { _ in
            UILabel
                .jobsMake { _ in }
                .byFont(JobsFont.systemFont(ofSize: 17,
                                            weight: .semibold))
                .byTextColor(JobsCor.label)
        }
    }()

    private lazy var sectionCountLabels: [UILabel] = {
        (0 ..< 2).map { _ in
            UILabel
                .jobsMake { label in
                    bindSectionSecondaryTheme(to: label)
                }
                .byFont(JobsFont.systemFont(ofSize: 13))
        }
    }()

    private lazy var sectionActionLabels: [UILabel] = {
        (0 ..< 2).map { _ in
            UILabel
                .jobsMake { label in
                    bindSectionSecondaryTheme(to: label)
                }
                .byFont(JobsFont.systemFont(ofSize: 13,
                                            weight: .medium))
        }
    }()

    private lazy var sectionChevronViews: [UIImageView] = {
        (0 ..< 2).map { _ in
            UIImageView
                .jobsMake { _ in }
                .byContentMode(.scaleAspectFit)
                .byTintColor(JobsCor.secondaryLabel)
        }
    }()

    private lazy var sectionHeaderButtons: [UIButton] = {
        (0 ..< 2).map { section in
            let button = UIButton.sys()
                .byAccessibilityIdentifier("JobsUserInfo.sectionHeader.\(section)")
                .onTap { [weak self] _ in
                    self?.toggleSection(section)
                }
            sectionTitleLabels[section].byAddTo(button) { make in
                make.leading.equalToSuperview().offset(16)
                make.centerY.equalToSuperview()
            }
            sectionChevronViews[section].byAddTo(button) { make in
                make.trailing.equalToSuperview().inset(16)
                make.centerY.equalToSuperview()
                make.width.equalTo(12)
                make.height.equalTo(14)
            }
            sectionActionLabels[section].byAddTo(button) { make in
                make.trailing.equalTo(self.sectionChevronViews[section].snp.leading).offset(-8)
                make.centerY.equalToSuperview()
            }
            sectionCountLabels[section].byAddTo(button) { make in
                make.leading.equalTo(self.sectionTitleLabels[section].snp.trailing).offset(8)
                make.centerY.equalToSuperview()
                make.trailing.lessThanOrEqualTo(self.sectionActionLabels[section].snp.leading).offset(-12)
            }
            bindSectionHeaderTheme(to: button,
                                   section: section)
            return button
        }
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero,
                    style: .grouped)
            .byAccessibilityIdentifier("JobsUserInfo.table")
            .byDataSource(self)
            .byDelegate(self)
            .byBackgroundColor(JobsCor.systemGroupedBackground)
            .bySeparatorColor(RootListPreferences.separatorColor)
            .bySectionHeaderTopPadding(0)
            .bySeparatorInset(UIEdgeInsets(top: 0,
                                           left: 16,
                                           bottom: 0,
                                           right: 16))
            .byEstimatedRowHeight(72)
            .byRowHeight(UITableView.automaticDimension)
            .byTableHeaderView(collectionPanel)
            .byAddTo(view) { make in
                make.left.right.equalToSuperview().inset(16)
                make.bottom.equalToSuperview()
                make.top.equalTo(self.gk_navigationBar.snp.bottom)
            }
    }()

    override func loadView() {
        super.loadView()
        userFields = loadUserInfoFields()
        deviceFields = JobsDeviceInfo.fields()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "用户与设备信息".tr)
        RootListPreferences.applyThemeChrome(to: self)
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        tableView.byVisible(YES)
        configureCollection()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionVisible = true
        refreshCollection()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        collectionVisible = false
        cancelCollectionRequest()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutCollectionPanel()
    }

    deinit {
        collectionRequest?.cancel()
        collectionPoll?.cancel()
        collectionObservers.forEach {
            NotificationCenter.default.removeObserver($0)
        }
    }

    private func configureCollection() {
        collectionStatusLabel.byVisible(YES)
        for button in [collectButton, refreshCollectionButton, resumeCollectionButton, clearCollectionButton] {
            JobsThemeCenter.shared.bind(button,
                                        slot: "JobsDeviceCollection.action") { object, center in
                guard let button = object as? UIButton else {
                    return
                }
                let configuration = button.configuration ?? .plain()
                button
                    .byConfiguration(configuration
                        .byBackground(configuration.background
                            .byBackgroundColor(center.resolvedColor(.backgroundGroupedSecondary))
                            .byCornerRadius(10)))
                    .byTitleColor(center.resolvedColor(.textPrimary))
            }
        }
        collectionObservers.append(NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification,
                                                                           object: nil,
                                                                           queue: .main) { [weak self] _ in
            guard let self, collectionVisible else {
                return
            }
            refreshCollection()
        })
        collectionObservers.append(NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification,
                                                                           object: nil,
                                                                           queue: .main) { [weak self] _ in
            self?.cancelCollectionRequest()
        })
        collectionObservers.append(NotificationCenter.default.addObserver(forName: .JobsLanguageDidChange,
                                                                           object: nil,
                                                                           queue: .main) { [weak self] _ in
            self?.updateCollectionUI()
        })
        updateCollectionUI()
    }

    private func layoutCollectionPanel() {
        let width = tableView.bounds.width
        guard width > 0 else {
            return
        }
        let size = collectionPanel.systemLayoutSizeFitting(CGSize(width: width, height: 0),
                                                          withHorizontalFittingPriority: .required,
                                                          verticalFittingPriority: .fittingSizeLevel)
        let height = ceil(size.height)
        guard abs(collectionPanel.frame.height - height) > 0.5 || collectionPanel.frame.width != width else {
            return
        }
        collectionPanel.byFrame(CGRect(x: 0, y: 0, width: width, height: height))
        tableView.byTableHeaderView(collectionPanel)
    }

    private func updateCollectionUI() {
        let text = JobsDeviceCollectionText.text
        collectionStatusLabel.byText(text(collectionBusy ? "busy" : collectionStatus))
        collectButton
            .byTitle(text("start"))
            .byEnabled(!collectionBusy)
        refreshCollectionButton
            .byTitle(text("refresh"))
            .byEnabled(!collectionBusy)
        resumeCollectionButton
            .byTitle(text("resume"))
            .byEnabled(!collectionBusy && pairingURL != nil)
        clearCollectionButton
            .byTitle(text("clear"))
            .byEnabled(!collectionBusy && collectionSession != nil)
        deviceFields = JobsDeviceInfo.fields(collection: collectionSession)
        tableView.byReloadData()
        view.bySetNeedsLayout()
    }

    private func confirmCollection() {
        guard !collectionBusy, presentedViewController == nil else {
            return
        }
        let text = JobsDeviceCollectionText.text
        collectionAlert = UIAlertController.makeAlert(text("title"), "\(text("consent"))\n\n\(collectionClient.siteAddress)")
            .byAddCancel(text("cancel")) { [weak self] _ in
                self?.collectionAlert = nil
            }
            .byAddOK(text("agree")) { [weak self] _ in
                self?.collectionAlert = nil
                self?.performCollectionRequest("api/pair", method: .post)
            }
            .byPresent(self)
    }

    private func refreshCollection() {
        guard !collectionBusy else {
            return
        }
        expireCollectionIfNeeded()
        performCollectionRequest("api/session")
    }

    private func clearCollection() {
        guard !collectionBusy else {
            return
        }
        let previousClient = collectionClient
        cancelCollectionRequest()
        collectionSession = nil
        pairingURL = nil
        collectionClient = JobsDeviceCollectionClient()
        collectionStatus = "clearFailed"
        // 先丢弃本机结果和 Cookie；取消远端清除也不能把旧数据重新恢复。
        performCollectionRequest("api/session", method: .delete, client: previousClient)
    }

    private func cancelCollectionRequest() {
        collectionGeneration = UUID()
        collectionPoll?.cancel()
        collectionPoll = nil
        collectionRequest?.cancel()
        collectionRequest = nil
        collectionBusy = false
    }

    private func expireCollectionIfNeeded() {
        if let expiration = collectionSession?.expirationDate, expiration <= Date() {
            collectionSession = nil
            pairingURL = nil
            collectionClient = JobsDeviceCollectionClient()
            collectionStatus = "expired"
            updateCollectionUI()
        }
    }

    private func performCollectionRequest(_ path: String,
                                          method: HTTPMethod = .get,
                                          client: JobsDeviceCollectionClient? = nil) {
        collectionPoll?.cancel()
        collectionPoll = nil
        collectionGeneration = UUID()
        let generation = collectionGeneration
        collectionBusy = true
        updateCollectionUI()
        collectionRequest = (client ?? collectionClient).request(path,
                                                                  method: method) { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                guard let self, collectionGeneration == generation else {
                    return
                }
                collectionBusy = false
                collectionRequest = nil
                handleCollectionResponse(result, method: method)
                updateCollectionUI()
                scheduleCollectionRefresh()
            }
        }
    }

    private func handleCollectionResponse(_ result: Result<JobsDeviceCollectionSession.Response, JobsError>,
                                           method: HTTPMethod) {
        expireCollectionIfNeeded()
        switch result {
        /// 失败时保留本地公开信息及尚未过期的已收结果。
        case .failure(let error):
            if method == .delete {
                collectionStatus = "clearFailed"
                return
            }
            if case .decode = error {
                collectionStatus = "invalid"
            } else if case .http(statusCode: 429, data: _) = error {
                collectionStatus = "rateLimited"
            } else {
                collectionStatus = "offline"
            }
        /// 只接受符合现有服务协议的会话和一次性配对链接。
        case .success(let response):
            guard response.ok, response.session?.isValid != false else {
                collectionStatus = "invalid"
                return
            }
            guard method != .post || response.session != nil else {
                collectionStatus = "invalid"
                return
            }
            if method == .delete {
                collectionSession = nil
                pairingURL = nil
                collectionClient = JobsDeviceCollectionClient()
                collectionStatus = "initial"
                return
            }
            let previousSession = collectionSession
            collectionSession = response.session
            if let session = response.session {
                if session.expirationDate! <= Date() {
                    expireCollectionIfNeeded()
                    return
                }
                collectionStatus = session.callbackError == nil ? "waiting" : "rejected"
                if session.state == "received" {
                    collectionStatus = session.device?.hasValidUDID == true ? "received" : "browser"
                }
                if method == .post {
                    guard let token = response.pairToken,
                          let url = collectionClient.pairingURL(token: token) else {
                        pairingURL = nil
                        collectionStatus = "invalid"
                        return
                    }
                    pairingURL = url
                    openCollectionPage()
                }
            } else {
                pairingURL = nil
                collectionStatus = previousSession == nil ? collectionStatus : "expired"
                if collectionStatus == "offline" || collectionStatus == "invalid" {
                    collectionStatus = "initial"
                }
            }
        }
    }

    private func openCollectionPage() {
        expireCollectionIfNeeded()
        guard let pairingURL else {
            return
        }
        pairingURL.absoluteString.open(jobsByVoidBlock: { [weak self] result in
            switch result {
            /// 打开默认浏览器，不把调起成功当作系统安装成功。
            case .opened:
                break
            /// 系统限制或 URL 无法打开时保留配对入口供重试。
            default:
                self?.collectionStatus = "openingFailed"
                self?.updateCollectionUI()
            }
        })
    }

    private func scheduleCollectionRefresh() {
        guard collectionVisible,
              UIApplication.shared.applicationState == .active,
              let session = collectionSession,
              let expiration = session.expirationDate else {
            return
        }
        let remaining = expiration.timeIntervalSinceNow
        guard remaining > 0 else {
            expireCollectionIfNeeded()
            return
        }
        let delay = session.state == "received" ? remaining : min(8, remaining)
        let work = DispatchWorkItem { [weak self] in
            self?.refreshCollection()
        }
        collectionPoll = work
        DispatchQueue.main.asyncAfter(deadline: .now() + delay,
                                      execute: work)
    }

    private func loadUserInfoFields() -> [JobsUserInfoField] {
        guard let url = Bundle.main.url(forResource: "UserData",
                                        withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let object = try? JSONSerialization.jsonObject(with: data),
              let dictionary = object as? [String: Any] else {
            return [JobsUserInfoField(name: "状态",
                                      value: "未读取到 UserData.json")]
        }
        return dictionary.keys.sorted().map {
            JobsUserInfoField(name: $0,
                              value: displayText(for: dictionary[$0]))
        }
    }

    private func displayText(for value: Any?) -> String {
        guard let value, !(value is NSNull) else {
            return "nil"
        }
        if JSONSerialization.isValidJSONObject(value),
           let data = try? JSONSerialization.data(withJSONObject: value,
                                                  options: [.prettyPrinted]),
           let text = String(data: data,
                             encoding: .utf8) {
            return text
        }
        return String(describing: value)
    }

    private func fields(in section: Int) -> [JobsUserInfoField] {
        section == 0 ? userFields : deviceFields
    }

    private func sectionTitle(_ section: Int) -> String {
        section == 0 ? "用户信息".tr : JobsDeviceCollectionText.text(collectionSession?.device == nil ? "localTitle" : "collectedTitle")
    }

    private func updateSectionHeader(_ section: Int) {
        let text = JobsDeviceCollectionText.text
        let state = section == 0
            ? (expandedSections[section] ? "已展开".tr : "已收起".tr)
            : text(expandedSections[section] ? "expanded" : "collapsed")
        let action = section == 0
            ? (expandedSections[section] ? "收起".tr : "展开".tr)
            : text(expandedSections[section] ? "collapse" : "expand")
        let corners = expandedSections[section]
            ? Self.topCorners
            : Self.topCorners.union(Self.bottomCorners)
        sectionTitleLabels[section].byText(sectionTitle(section))
        let count = section == 0 ? "\(fields(in: section).count) 项" : String(format: text("items"), fields(in: section).count)
        sectionCountLabels[section].byText(count)
        sectionActionLabels[section].byText(action)
        sectionChevronViews[section].byImage((expandedSections[section] ? "chevron.up" : "chevron.down").sysImg)
        let button = sectionHeaderButtons[section]
            .byAccessibilityLabel("\(sectionTitle(section)) · \(count) · \(state) · \(action)")
        applyCorners(to: button,
                     corners: corners,
                     radius: Self.sectionHeaderCornerRadius)
    }

    private func applyCorners(to view: UIView,
                              corners: CACornerMask,
                              radius: CGFloat) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        defer {
            CATransaction.commit()
        }
        view.layer
            .byMask(nil)
            .byCornerRadius(radius)
            .byMaskedCorners(corners)
            .byCornerCurve(.continuous)
            .byMasksToBounds(true)
        if #available(iOS 26.0, *) {
            // 显式固定四角，避免配置刷新后重新采用系统的同心圆角。
            view.cornerConfiguration = .corners(topLeftRadius: .fixed(corners.contains(.layerMinXMinYCorner) ? Double(radius) : 0),
                                                topRightRadius: .fixed(corners.contains(.layerMaxXMinYCorner) ? Double(radius) : 0),
                                                bottomLeftRadius: .fixed(corners.contains(.layerMinXMaxYCorner) ? Double(radius) : 0),
                                                bottomRightRadius: .fixed(corners.contains(.layerMaxXMaxYCorner) ? Double(radius) : 0))
        }
    }

    private func bindSectionSecondaryTheme(to label: UILabel) {
        JobsThemeCenter.shared.bind(label,
                                    slot: "JobsUserInfo.sectionHeaderSecondary") { object, center in
            guard let label = object as? UILabel else {
                return
            }
            label.byTextColor(center.resolvedColor(.textSecondary).withAlphaComponent(1))
        }
    }

    private func bindSectionHeaderTheme(to button: UIButton,
                                        section: Int) {
        JobsThemeCenter.shared.bind(button,
                                    slot: "JobsUserInfo.sectionHeader") { [weak self] object, center in
            guard let button = object as? UIButton else {
                return
            }
            let configuration = button.configuration ?? .plain()
            let background = configuration.background
                .byBackgroundColor(center.resolvedColor(.backgroundGroupedSecondary))
                .byCornerRadius(0)
                .byBackgroundInsets(.zero)
                .byEdgesAddingLayoutMarginsToBackgroundInsets([])
            button
                .byConfiguration(configuration
                    .byBackground(background)
                    .byCornerStyle(.fixed))
                .byTitleColor(center.resolvedColor(.textPrimary))
            guard let self else {
                return
            }
            let corners = expandedSections[section]
                ? Self.topCorners
                : Self.topCorners.union(Self.bottomCorners)
            applyCorners(to: button,
                         corners: corners,
                         radius: Self.sectionHeaderCornerRadius)
        }
    }

    private func toggleSection(_ section: Int) {
        guard viewIfLoaded?.window != nil else {
            return
        }
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        defer {
            CATransaction.commit()
        }
        // 分组背景和圆角蒙版在同一帧完成布局，避免展示重载的中间形状。
        UIView.jobsPerformWithoutAnimation {
            expandedSections[section].toggle()
            updateSectionHeader(section)
            tableView
                .byReloadSections(IndexSet(integer: section),
                                  with: .none)
                .byLayoutIfNeeded()
        }
    }

    private func applyFooterChrome(to view: UIView) {
        guard let sectionView = view as? UITableViewHeaderFooterView else {
            return
        }
        JobsThemeCenter.shared.bind(sectionView,
                                    slot: "JobsUserInfo.sectionFooter") { object, center in
            guard let sectionView = object as? UITableViewHeaderFooterView else {
                return
            }
            let backgroundColor = center.resolvedColor(.backgroundGrouped)
            // 次要说明保留语义灰色，去掉透明度以保证浅底下仍可清楚阅读。
            let textColor = center.resolvedColor(.textSecondary).withAlphaComponent(1)
            sectionView.contentView.byBackgroundColor(backgroundColor)
            sectionView.textLabel?
                .byTextColor(textColor)
                .byFont(JobsFont.systemFont(ofSize: 13))
                .byBackgroundColor(JobsCor.clear)
            sectionView.backgroundView?.byBackgroundColor(backgroundColor)
        }
    }

    @discardableResult
    private func bindCellAppearance(to cell: UITableViewCell,
                                    at indexPath: IndexPath) -> UITableViewCell {
        let isLastRow = indexPath.row == fields(in: indexPath.section).count - 1
        JobsThemeCenter.shared.bind(cell,
                                    slot: "JobsUserInfo.cellAppearance") { [weak self] object, center in
            guard let cell = object as? UITableViewCell else {
                return
            }
            let backgroundColor = center.resolvedColor(.backgroundGroupedSecondary)
            // 分组卡片首行保持直角接住标题，只有末行补齐下圆角。
            cell
                .byBackgroundConfiguration({ background in
                    background = UIBackgroundConfiguration.clear()
                        .byBackgroundColor(backgroundColor)
                        .byCornerRadius(0)
                        .byBackgroundInsets(.zero)
                        .byEdgesAddingLayoutMarginsToBackgroundInsets([])
                },
                                           automaticallyUpdates: false)
                .byDetailTitleCor(center.resolvedColor(.textSecondary).withAlphaComponent(1))
                .byContentView { contentView in
                    contentView.byBackgroundColor(backgroundColor)
                }
            self?.applyCorners(to: cell,
                               corners: isLastRow ? Self.bottomCorners : [],
                               radius: isLastRow ? Self.sectionHeaderCornerRadius : 0)
        }
        applyCorners(to: cell,
                     corners: isLastRow ? Self.bottomCorners : [],
                     radius: isLastRow ? Self.sectionHeaderCornerRadius : 0)
        return cell
    }

    private func copy(_ field: JobsUserInfoField) {
        guard presentedViewController == nil else {
            return
        }
        field.value.paste()
        copyAlertController = UIAlertController.makeAlert(JobsDeviceCollectionText.text("copy"),
                                                          field.name)
            .byAddOK(JobsDeviceCollectionText.text("ok")) { [weak self] _ in
                self?.copyAlertController = nil
            }
            .byPresent(self)
    }
}

extension JobsSwiftUserInfoVC: UITableViewDataSource,
                               UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        expandedSections[section] ? fields(in: section).count : 0
    }

    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        updateSectionHeader(section)
        return sectionHeaderButtons[section]
    }

    func tableView(_ tableView: UITableView,
                   willDisplayHeaderView view: UIView,
                   forSection section: Int) {
        updateSectionHeader(section)
    }

    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        56
    }

    func tableView(_ tableView: UITableView,
                   titleForFooterInSection section: Int) -> String? {
        guard expandedSections[section] else {
            return nil
        }
        guard section == 1 else {
            return "点击任意信息可复制当前显示内容。".tr
        }
        return JobsDeviceCollectionText.text(collectionStatus)
    }

    func tableView(_ tableView: UITableView,
                   heightForFooterInSection section: Int) -> CGFloat {
        expandedSections[section] ? UITableView.automaticDimension : 16
    }

    func tableView(_ tableView: UITableView,
                   willDisplayFooterView view: UIView,
                   forSection section: Int) {
        applyFooterChrome(to: view)
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let field = fields(in: indexPath.section) [indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellReuseIdentifier) ??
            UITableViewCell.make(style: .subtitle,
                                 reuseIdentifier: Self.cellReuseIdentifier)
        return bindCellAppearance(to: cell,
                                  at: indexPath)
            .byText(field.name)
            .byTitleFont(JobsFont.systemFont(ofSize: 16,
                                             weight: .semibold))
            .byTitleNumberOfLines(0)
            .byTitleCor(RootListPreferences.foldPrimaryTextColor)
            .bySecondaryText(field.sourceDescription.map { "\(field.value)\n\(JobsDeviceCollectionText.text("source"))：\($0)" } ?? field.value)
            .byDetailTitleFont(JobsFont.systemFont(ofSize: 14))
            .byDetailTitleNumberOfLines(0)
            .byAccessoryType(.none)
            .bySelectionStyle(.default)
            .byAccessibilityIdentifier("JobsUserInfo.\(indexPath.section == 0 ? "user" : "device").\(field.name)")
    }

    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        bindCellAppearance(to: cell,
                           at: indexPath)
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.byDeselectRow(indexPath,
                                animated: true)
        copy(fields(in: indexPath.section) [indexPath.row])
    }
}
