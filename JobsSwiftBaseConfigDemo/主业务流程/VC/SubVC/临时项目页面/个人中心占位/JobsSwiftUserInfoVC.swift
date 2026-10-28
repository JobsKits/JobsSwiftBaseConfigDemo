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
import JobsSwiftBaseDefines
import JobsSwiftDSL
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
        section == 0 ? "用户信息".tr : "本机信息".tr
    }

    private func updateSectionHeader(_ section: Int) {
        let state = expandedSections[section] ? "已展开".tr : "已收起".tr
        let action = expandedSections[section] ? "收起".tr : "展开".tr
        let corners = expandedSections[section]
            ? Self.topCorners
            : Self.topCorners.union(Self.bottomCorners)
        sectionTitleLabels[section].byText(sectionTitle(section))
        sectionCountLabels[section].byText("\(fields(in: section).count) 项")
        sectionActionLabels[section].byText(action)
        sectionChevronViews[section].byImage((expandedSections[section] ? "chevron.up" : "chevron.down").sysImg)
        let button = sectionHeaderButtons[section]
            .byAccessibilityLabel("\(sectionTitle(section))，\(fields(in: section).count)项，\(state)，点击\(action)")
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
        let message = field.isSystemRestricted
            ? "已复制%@的系统限制说明".tr(field.name)
            : "已复制%@".tr(field.name)
        copyAlertController = UIAlertController.makeAlert("复制成功".tr,
                                                          message)
            .byAddOK("确定".tr) { [weak self] _ in
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
        return "点击任意信息可复制；受限项仅复制系统限制说明。iOS 16 及以上可能仅返回 iPhone / iPad 等通用设备名称。".tr
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
            .bySecondaryText(field.value)
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
