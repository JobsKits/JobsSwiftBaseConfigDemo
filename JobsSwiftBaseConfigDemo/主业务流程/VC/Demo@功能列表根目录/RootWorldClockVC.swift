//
//  RootWorldClockVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

import UIKit
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import JobsSwiftTimer
import JobsSwiftTimerMgr
import Jobsl10n
import SnapKit
import GKNavigationBarSwift

final class RootWorldClockVC: BaseVC,
                              UITableViewDataSource,
                              UITableViewDelegate {

    private var now = Date()
    private var presentationSignature = ""

    private var currentCardBackground: UIColor {
        RootListPreferences.darkModeEnabled
            ? UIColor(r: 14, g: 61, b: 51, a: 1)
            : UIColor(r: 137, g: 249, b: 218, a: 1)
    }

    private var currentCardForeground: UIColor {
        RootListPreferences.darkModeEnabled
            ? UIColor(r: 212, g: 255, b: 241, a: 1)
            : UIColor(r: 0, g: 77, b: 64, a: 1)
    }

    private var currentCardSecondary: UIColor {
        RootListPreferences.darkModeEnabled
            ? UIColor(r: 170, g: 219, b: 201, a: 1)
            : UIColor(r: 21, g: 99, b: 82, a: 1)
    }

    private var formatTitle: String {
        (WorldClockDisplayFormat.uses12HourFormat ? "12小时制" : "24小时制").tr
    }

    private lazy var currentCard = UIView.jobsMake { _ in }
        .byCornerRadius(16)
        .byClipsToBounds(true)
        .byAccessibilityIdentifier("jobs.worldClock.currentCard")

    private lazy var currentTitle = UILabel.jobsMake { _ in }
        .byNumberOfLines(0)
    private lazy var currentZone = UILabel.jobsMake { _ in }
        .byNumberOfLines(0)
    private lazy var currentTime = UILabel.jobsMake { _ in }
        .byNumberOfLines(0)
    private lazy var currentDate = UILabel.jobsMake { _ in }
        .byNumberOfLines(0)

    private lazy var currentCell: UITableViewCell = {
        let cell = UITableViewCell.make(style: .default, reuseIdentifier: nil)
            .bySelectionStyle(.none)
            .byAccessibilityIdentifier("jobs.worldClock.local")
            .bySeparatorInset(UIEdgeInsets(top: 0, left: 10000, bottom: 0, right: 0))
        currentCard.byAddTo(cell.contentView) { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(12)
        }
        currentTitle.byAddTo(currentCard) { make in
            make.left.right.top.equalToSuperview().inset(20)
        }
        currentZone.byAddTo(currentCard) { [unowned self] make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(self.currentTitle.snp.bottom).offset(4)
        }
        currentTime.byAddTo(currentCard) { [unowned self] make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(self.currentZone.snp.bottom).offset(18)
        }
        currentDate.byAddTo(currentCard) { [unowned self] make in
            make.left.right.bottom.equalToSuperview().inset(20)
            make.top.equalTo(self.currentTime.snp.bottom).offset(8)
        }
        return cell
    }()
    private var zones: [WorldClockCatalog.Entry] = []
    private var pageVisible = false
    private var observerTokens: [NSObjectProtocol] = []
    private var timer: JobsSwiftTimerProtocol?
    private let timerID = "RootWorldClockVC.\(UUID().uuidString)"

    private var secondaryTextColor: UIColor {
        RootListPreferences.primaryTextColor.withAlphaComponent(0.72)
    }

    private lazy var sectionHeaderViews: [UIView] = {
        (0..<2).map { _ in
            UIView.jobsMake { _ in }
                .byBackgroundColor(RootListPreferences.pageBackgroundColor)
        }
    }()

    private lazy var sectionHeaderLabels: [UILabel] = {
        ["当前时区", "世界时区"].enumerated().map { index, title in
            UILabel.jobsMake { _ in }
                .byText(title.tr)
                .byFont(JobsFont.preferredFont(forTextStyle: .caption1))
                .byTextColor(secondaryTextColor)
                .byNumberOfLines(0)
                .byAddTo(sectionHeaderViews[index]) { make in
                    make.left.right.equalToSuperview().inset(16)
                    make.top.equalToSuperview().offset(8)
                    make.bottom.equalToSuperview().inset(8).priority(999)
                }
        }
    }()

    private lazy var formatLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText(formatTitle)
            .byFont(JobsFont.preferredFont(forTextStyle: .body))
            .byTextColor(RootListPreferences.primaryTextColor)
            .byNumberOfLines(0)
            .byAddTo(formatBar) { [unowned self] make in
                make.left.top.bottom.equalToSuperview().inset(12)
                make.right.lessThanOrEqualTo(self.formatSwitch.snp.left).offset(-12)
            }
    }()

    private lazy var formatSwitch: UISwitch = {
        UISwitch.jobsMake { _ in }
            .byOn(WorldClockDisplayFormat.uses12HourFormat)
            .byAccessibilityIdentifier("jobs.worldClock.format12")
            .byAccessibilityLabel(formatTitle)
            .byAddAction(for: .valueChanged) { [weak self] (sender: UISwitch) in
                guard let self else {
                    return
                }
                WorldClockDisplayFormat.uses12HourFormat = sender.isOn
                self.formatLabel.byText(self.formatTitle)
                self.formatSwitch.byAccessibilityLabel(self.formatTitle)
                self.applyTimeFormat()
                self.reloadClocks(preserveScroll: true)
            }
            .byAddTo(formatBar) { make in
                make.right.equalToSuperview().inset(12)
                make.centerY.equalToSuperview()
                make.top.greaterThanOrEqualToSuperview().offset(10)
                make.bottom.lessThanOrEqualToSuperview().offset(-10)
            }
    }()

    private lazy var formatBar: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(RootListPreferences.cardBackgroundColor)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.gk_navigationBar.snp.bottom)
                make.left.right.equalTo(self.view.safeAreaLayoutGuide)
            }
    }()

    private lazy var cityFormatter: DateFormatter = {
        DateFormatter.jobsMake { _ in }
            .byDateFormat("VVV")
    }()

    private lazy var dateFormatter: DateFormatter = {
        DateFormatter.jobsMake { _ in }
    }()

    private lazy var timeFormatter: DateFormatter = {
        DateFormatter.jobsMake { _ in }
            .byDateFormat("HH:mm:ss")
    }()

    private lazy var tableView: UITableView = {
        UITableView.jobsMake { _ in }
            .byAccessibilityIdentifier("jobs.worldClock.list")
            .byDataSource(self)
            .byDelegate(self)
            .byRowHeight(UITableView.automaticDimension)
            .byEstimatedRowHeight(106)
            .bySectionHeaderHeight(UITableView.automaticDimension)
            .byEstimatedSectionHeaderHeight(40)
            .byAllowsSelection(false)
            .byNoSectionHeaderTopPadding()
            .byBackgroundColor(RootListPreferences.pageBackgroundColor)
            .byEmptyButtonProvider { [weak self] in
                UIButton.sys()
                    .byTitle("暂无时区".tr)
                    .bySubTitle("点击重新加载".tr)
                    .byTitleColor(RootListPreferences.primaryTextColor)
                    .bySubTitleColor(self?.secondaryTextColor ?? RootListPreferences.primaryTextColor)
                    .onTap { [weak self] _ in
                        self?.reloadClocks()
                    }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.formatBar.snp.bottom)
                make.left.right.bottom.equalTo(self.view.safeAreaLayoutGuide)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        formatSwitch.byVisible(true)
        formatLabel.byVisible(true)
        tableView.byVisible(true)
        observeChanges()
        createTimer()
        refreshAppearance()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pageVisible = true
        refreshTimerState()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pageVisible = false
        timer?.pause()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.preferredContentSizeCategory != previousTraitCollection?.preferredContentSizeCategory {
            formatLabel.byFont(JobsFont.preferredFont(forTextStyle: .body))
            refreshSectionHeaders()
            reloadClocks()
        }
    }

    deinit {
        timer?.stop()
        try? JobsSwiftTimerMgr.shared.remove(identifier: timerID)
        for token in observerTokens {
            NotificationCenter.default.removeObserver(token)
        }
    }

    private func createTimer() {
        do {
            timer = try JobsSwiftTimerMgr.shared.create(kind: .gcd,
                                                        identifier: timerID,
                                                        config: JobsSwiftTimerConfig(interval: 1,
                                                                                      repeats: true,
                                                                                      tolerance: 0.03,
                                                                                      queue: .main),
                                                        dedupPolicy: .replace) { [weak self] in
                onMainAsync(self) { controller in
                    guard controller.pageVisible,
                          UIApplication.shared.applicationState == .active else {
                        return
                    }
                    controller.reloadClocks()
                }
            }
            timer?.start()
            timer?.pause()
        } catch {
            print("❌ World clock timer: \(error)")
        }
    }

    private func observeChanges() {
        let changes: [Notification.Name] = [
            .JobsLanguageDidChange, .JobsThemeDidChange,
            UIApplication.didBecomeActiveNotification, UIApplication.willResignActiveNotification,
            UIApplication.significantTimeChangeNotification, .NSSystemTimeZoneDidChange,
            NSLocale.currentLocaleDidChangeNotification
        ]
        observerTokens = changes.map { name in
            NotificationCenter.default.addObserver(forName: name,
                                                     object: nil,
                                                     queue: .main) { [weak self] notification in
                guard let self else {
                    return
                }
                if notification.name == UIApplication.willResignActiveNotification {
                    self.timer?.pause()
                } else if notification.name == .JobsThemeDidChange || notification.name == .JobsLanguageDidChange {
                    self.refreshAppearance()
                } else {
                    self.refreshTimerState()
                }
            }
        }
    }

    private func refreshTimerState() {
        guard pageVisible,
              UIApplication.shared.applicationState == .active else {
            timer?.pause()
            return
        }
        reloadClocks()
        timer?.resume()
    }

    private func refreshAppearance() {
        jobsSetupGKNav(title: "世界时钟".tr)
        RootListPreferences.applyThemeChrome(to: self,
                                             backgroundColor: RootListPreferences.pageBackgroundColor)
        let locale = Locale(identifier: LanguageManager.shared.currentLanguageCode)
        cityFormatter.byLocale(locale)
        dateFormatter
            .byLocale(locale)
            .byLocalizedTemplate("yMMMMdEEEE")
        timeFormatter.byLocale(locale)
        applyTimeFormat()
        formatLabel
            .byText(formatTitle)
            .byTextColor(RootListPreferences.primaryTextColor)
        formatSwitch.byAccessibilityLabel(formatTitle)
        formatBar.byBackgroundColor(RootListPreferences.cardBackgroundColor)
        refreshSectionHeaders()
        tableView
            .byBackgroundColor(RootListPreferences.pageBackgroundColor)
            .bySeparatorColor(RootListPreferences.separatorColor)
        reloadClocks()
    }

    private func refreshSectionHeaders() {
        let titles = ["当前时区", "世界时区"]
        for (index, label) in sectionHeaderLabels.enumerated() {
            label
                .byText(titles[index].tr)
                .byFont(JobsFont.preferredFont(forTextStyle: .caption1))
                .byTextColor(secondaryTextColor)
            sectionHeaderViews[index].byBackgroundColor(RootListPreferences.pageBackgroundColor)
        }
    }

    private func applyTimeFormat() {
        WorldClockDisplayFormat.configure(timeFormatter,
                                          uses12HourFormat: WorldClockDisplayFormat.uses12HourFormat)
    }

    private func reloadClocks(preserveScroll: Bool = false) {
        now = Date()
        zones = WorldClockCatalog.entries(at: now)
        guard tableView.window != nil else {
            return
        }
        let local = WorldClockCatalog.localEntry(at: now)
        let signature = zones.map { entry in
            "\(entry.id)|\(entry.offsetLabel)|\(dateFormatter.byTimeZone(entry.timeZone).string(from: now))"
        }.joined(separator: ";") + "|\(local.id)|\(local.offsetLabel)|\(LanguageManager.shared.currentLanguageCode)|\(formatTitle)|\(RootListPreferences.darkModeEnabled)|\(traitCollection.preferredContentSizeCategory.rawValue)"
        if preserveScroll || presentationSignature != signature {
            presentationSignature = signature
            let offset = tableView.contentOffset
            tableView
                .byReloadData()
                .byReloadEmptyViewAuto(animated: false)
                .byLayoutIfNeeded()
                .byContentOffsetBy(offset)
        } else {
            // 秒值只更新可见内容，避免每秒重建卡片和整表导致滚动跳动。
            for indexPath in tableView.indexPathsForVisibleRows ?? [] {
                if indexPath.section == 0 {
                    configureCurrentCard()
                } else if let cell = tableView.cellForRow(at: indexPath) {
                    configureWorldCell(cell, entry: zones[indexPath.row])
                }
            }
        }
    }

    private func configureCurrentCard() {
        let entry = WorldClockCatalog.localEntry(at: now)
        let city = cityFormatter.byTimeZone(entry.timeZone).string(from: now)
        currentCell.byBackgroundColor(RootListPreferences.pageBackgroundColor)
        currentCard.byBackgroundColor(currentCardBackground)
        currentTitle
            .byText("当前时区".tr)
            .byFont(JobsFont.preferredFont(forTextStyle: .title3))
            .byTextColor(currentCardForeground)
        currentZone
            .byText("\(city) · \(entry.offsetLabel)\n\(entry.id)")
            .byFont(JobsFont.preferredFont(forTextStyle: .subheadline))
            .byTextColor(currentCardSecondary)
        currentTime
            .byText(timeFormatter.byTimeZone(entry.timeZone).string(from: now))
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: JobsFont.preferredFont(forTextStyle: .largeTitle).pointSize,
                                                      weight: .regular))
            .byTextColor(currentCardForeground)
        currentDate
            .byText(dateFormatter.byTimeZone(entry.timeZone).string(from: now))
            .byFont(JobsFont.preferredFont(forTextStyle: .subheadline))
            .byTextColor(currentCardSecondary)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : zones.count
    }

    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        guard section > 0 else {
            return nil
        }
        _ = sectionHeaderLabels
        return sectionHeaderViews[section]
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? .leastNormalMagnitude : UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            configureCurrentCard()
            return currentCell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "worldClock")
            ?? UITableViewCell.make(style: .subtitle, reuseIdentifier: "worldClock")
        configureWorldCell(cell, entry: zones[indexPath.row])
        return cell
    }

    private func configureWorldCell(_ cell: UITableViewCell, entry: WorldClockCatalog.Entry) {
        let zone = entry.timeZone
        let city = entry.id == "Etc/GMT+12"
            ? "贝克岛（无人常住）".tr
            : cityFormatter.byTimeZone(zone).string(from: now)
        let date = dateFormatter.byTimeZone(zone).string(from: now)
        let time = timeFormatter.byTimeZone(zone).string(from: now)
        cell
            .byAccessibilityIdentifier("jobs.worldClock.\(entry.id)")
            .byText("\(city) · \(entry.offsetLabel)")
            .byTitleFont(JobsFont.preferredFont(forTextStyle: .headline))
            .byTitleCor(RootListPreferences.primaryTextColor)
            .byTitleNumberOfLines(0)
            .bySecondaryText("\(entry.id)\n\(date)\n\(time)")
            .byDetailTitleFont(JobsFont.monospacedDigitSystemFont(ofSize: JobsFont.preferredFont(forTextStyle: .body).pointSize,
                                                                 weight: .regular))
            .byDetailTitleCor(secondaryTextColor)
            .byDetailTitleNumberOfLines(0)
            .byBackgroundColor(RootListPreferences.cardBackgroundColor)
            .bySelectionStyle(.none)
    }
}
