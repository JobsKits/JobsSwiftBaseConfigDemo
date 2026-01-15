//
//  MessageListDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/17/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
import SnapKit
import JobsByUIKit

final class MessageListDemoVC: BaseVC {
    // MARK: - Data
    private var items: [MessageItem] = []
    private var selectedIDs: Set<UUID> = []
    private var rows: Int = 0
    // MARK: - Layout
    private let bottomBarBaseH: CGFloat = 56
    private var bottomBarHeightC: Constraint?
    /// tableView 初始 inset 备份（用于 show/hide bottomBar 时恢复）
    private var baseContentInset: UIEdgeInsets = .zero
    private var baseVerticalIndicatorInsets: UIEdgeInsets = .zero
    private var baseHorizontalIndicatorInsets: UIEdgeInsets = .zero
    private var baseIndicatorInsetsLegacy: UIEdgeInsets = .zero
    // MARK: - State
    private var isEditingMode: Bool = false {
        didSet { applyEditingMode(isEditingMode) }
    }
    private var isAllSelected: Bool {
        !items.isEmpty && selectedIDs.count == items.count
    }
    /// ✅ 刘海机：加 safeBottomInset；非刘海机：不加
    /// - 这里用 view.safeAreaInsets.bottom 更稳（VC 在屏幕上时一定正确）
    private var bottomBarShownHeight: CGFloat {
        let safeBottom = view.safeAreaInsets.bottom
        let extra = safeBottom > 0 ? safeBottom : 0
        return bottomBarBaseH + extra
    }
    // MARK: - Nav Buttons
    private lazy var rightEditButton: UIButton = {
        UIButton.sys()
            .byFrame(CGRect(x: 0, y: 0, width: 64, height: 32))
            .byTitle("编辑".tr, for: .normal)
            .byTitle("完成".tr, for: .selected)
            .byTitleColor(.label, for: .normal)
            .byTitleColor(.label, for: .selected)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.isEditingMode.toggle()
            }
    }()
    // MARK: - BottomBar Buttons
    private lazy var bottomSelectAllButton: UIButton = {
        UIButton.sys()
            .byTitle("全选".tr, for: .normal)
            .byTitle("取消".tr, for: .selected)
            .byTitleColor(.label, for: .normal)
            .byTitleColor(.label, for: .selected)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .onTap { [weak self] _ in
                guard let self else { return }
                guard self.isEditingMode else { return }
                self.isAllSelected ? self.deselectAllRows(clearIDs: true) : self.selectAllRows()
                self.updateBottomBarUI()
            }
    }()

    private lazy var bottomDeleteButton: UIButton = {
        UIButton.sys()
            .byTitle("删除".tr, for: .normal)
            .byTitleColor(.systemRed, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.deleteSelectedRows()
            }
    }()
    // MARK: - BottomBar
    private lazy var bottomBar: UIView = {
        let v = UIView()
            .byBgColor(.secondarySystemBackground)
            .byShadowColor(.black.withAlphaComponent(0.10))
            .byShadowOpacity(1)
            .byShadowRadius(8)
            .byShadowOffset(.init(width: 0, height: -2))
            .byVisible(NO)
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview()
                make.bottom.equalToSuperview()                      // ✅ 覆盖安全区：贴 superview 底
                self.bottomBarHeightC = make.height.equalTo(0).constraint // 默认隐藏
            }

        // ✅ 关键：按钮对齐 safeAreaLayoutGuide，避免被额外的 safeBottom “拉偏”
        bottomSelectAllButton.byAddTo(v) { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalTo(v.safeAreaLayoutGuide.snp.centerY)
            make.height.equalTo(44)
        }

        bottomDeleteButton.byAddTo(v) { make in
            make.right.equalToSuperview().inset(16)
            make.centerY.equalTo(v.safeAreaLayoutGuide.snp.centerY)
            make.height.equalTo(44)
        }

        return v
    }()
    // MARK: - TableView
    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .registerCell(MessageCell.self)
            .byNoContentInsetAdjustment()
            .bySeparatorStyle(.singleLine)
            .byNoSectionHeaderTopPadding()
            .jobs_emptyButtonProvider { [unowned self] in
                UIButton(type: .system)
                    .byTitle("暂无数据".tr, for: .normal)
                    .bySubTitle("点我填充示例数据".tr, for: .normal)
                    .byImage("tray".sysImg, for: .normal)
                    .byImagePlacement(.top)
                    .onTap { [weak self] _ in
                        guard let self else { return }
                        self.rows = 20
                        self.items = self.makeDemoItems(self.rows)
                        self.selectedIDs.removeAll()
                        self.tableView.reloadData()
                    }
                    .jobs_setEmptyLayout { btn, make, host in
                        make.centerX.equalTo(host)
                        make.centerY.equalTo(host).offset(-40)
                        make.leading.greaterThanOrEqualTo(host).offset(16)
                        make.trailing.lessThanOrEqualTo(host).inset(16)
                        make.width.lessThanOrEqualTo(host).multipliedBy(0.9)
                    }
            }
            .configRefreshHeader(component: JobsDefaultHeader(),
                                 container: self,
                                 trigger: 66) { [weak self] in
                guard let self else { return }
                Task { @MainActor in
                    self.rows = 20
                    self.items = self.makeDemoItems(self.rows)
                    self.selectedIDs.removeAll()
                    self.tableView.byReloadData()
                    self.tableView.switchRefreshHeader(to: .normal)
                    self.tableView.switchRefreshFooter(to: .normal)
                }
            }
            .configRefreshFooter(component: JobsDefaultFooter(),
                                 container: self,
                                 trigger: 66) { [weak self] in
                guard let self else { return }
                Task { @MainActor in
                    if self.rows < 60 {
                        self.rows += 20
                        self.items = self.makeDemoItems(self.rows)
                        self.tableView.byReloadData()
                        self.tableView.switchRefreshFooter(to: .normal)
                    } else {
                        self.tableView.switchRefreshFooter(to: .noMoreData)
                    }
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.left.right.bottom.equalToSuperview()
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalToSuperview()
                }
            }
    }()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(
            title: "消息",
            rightButtons: [rightEditButton]  // ✅ 右上角一直存在
        )
        tableView.byVisible(YES)
        bottomBar.byVisible(YES)
        view.bringSubviewToFront(bottomBar)   
        captureBaseInsetsIfNeeded()
        loadInitialData()   // ✅ 一进页面就有数据
        updateNavUI()
        updateBottomBarUI()
        setBottomBarVisible(false, animated: false) // ✅ 保证初始状态不占 inset
    }

    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        // ✅ 旋转/切换机型/通话条等导致 safeArea 变化时，编辑态下同步高度
        guard isEditingMode else { return }
        bottomBarHeightC?.update(offset: bottomBarShownHeight)
        applyTableInsetsForBottomBarVisible(true)
        view.layoutIfNeeded()
    }

    private func loadInitialData() {
        rows = 20
        items = makeDemoItems(rows)
        selectedIDs.removeAll()
        tableView.byReloadData()
    }

    private func updateNavUI() {
        rightEditButton.isSelected = isEditingMode
    }
    // MARK: - Insets
    private func captureBaseInsetsIfNeeded() {
        baseContentInset = tableView.contentInset

        if #available(iOS 13.0, *) {
            baseVerticalIndicatorInsets = tableView.verticalScrollIndicatorInsets
            baseHorizontalIndicatorInsets = tableView.horizontalScrollIndicatorInsets
        } else {
            baseIndicatorInsetsLegacy = tableView.scrollIndicatorInsets
        }
    }

    private func applyTableInsetsForBottomBarVisible(_ visible: Bool) {
        let extra = visible ? bottomBarShownHeight : 0

        var inset = baseContentInset
        inset.bottom = baseContentInset.bottom + extra
        tableView.contentInset = inset

        if #available(iOS 13.0, *) {
            var v = baseVerticalIndicatorInsets
            v.bottom = baseVerticalIndicatorInsets.bottom + extra
            tableView.verticalScrollIndicatorInsets = v

            var h = baseHorizontalIndicatorInsets
            h.bottom = baseHorizontalIndicatorInsets.bottom + extra
            tableView.horizontalScrollIndicatorInsets = h
        } else {
            var s = baseIndicatorInsetsLegacy
            s.bottom = baseIndicatorInsetsLegacy.bottom + extra
            tableView.scrollIndicatorInsets = s
        }
    }
    // MARK: - Editing
    private func applyEditingMode(_ editing: Bool) {
        tableView.allowsMultipleSelectionDuringEditing = true
        tableView.setEditing(editing, animated: true)

        if editing {
            syncSelectionToUI()
        } else {
            deselectAllRows(clearIDs: true)
        }

        setBottomBarVisible(editing, animated: true)
        updateNavUI()
        updateBottomBarUI()
        tableView.reloadData()
    }

    private func setBottomBarVisible(_ visible: Bool, animated: Bool) {
        let h = bottomBarShownHeight
        let d: TimeInterval = animated ? 0.25 : 0

        applyTableInsetsForBottomBarVisible(visible)

        if visible {
            bottomBar.jobs_slide(.show(from: .bottom, size: h),
                                 sizeConstraint: bottomBarHeightC,
                                 duration: d)
        } else {
            bottomBar.jobs_slide(.hide(to: .bottom),
                                 sizeConstraint: bottomBarHeightC,
                                 duration: d)
        }
    }

    private func updateBottomBarUI() {
        bottomSelectAllButton.isSelected = isAllSelected
        bottomDeleteButton.isEnabled = !selectedIDs.isEmpty
        bottomDeleteButton.alpha = selectedIDs.isEmpty ? 0.35 : 1
    }

    private func syncSelectionToUI() {
        guard !items.isEmpty else { return }
        for (idx, item) in items.enumerated() where selectedIDs.contains(item.id) {
            tableView.selectRow(at: IndexPath(row: idx, section: 0),
                                animated: false,
                                scrollPosition: .none)
        }
    }

    private func selectAllRows() {
        guard !items.isEmpty else { return }
        selectedIDs = Set(items.map(\.id))
        for i in 0..<items.count {
            tableView.selectRow(at: IndexPath(row: i, section: 0),
                                animated: false,
                                scrollPosition: .none)
        }
    }

    private func deselectAllRows(clearIDs: Bool = false) {
        (tableView.indexPathsForSelectedRows ?? []).forEach {
            tableView.deselectRow(at: $0, animated: false)
        }
        if clearIDs { selectedIDs.removeAll() }
    }

    private func deleteSelectedRows() {
        guard isEditingMode else { return }
        guard let selected = tableView.indexPathsForSelectedRows, !selected.isEmpty else { return }

        let sorted = selected.sorted { $0.row > $1.row }

        let idsToRemove: [UUID] = sorted.compactMap { ip in
            guard items.indices.contains(ip.row) else { return nil }
            return items[ip.row].id
        }

        for ip in sorted {
            guard items.indices.contains(ip.row) else { continue }
            items.remove(at: ip.row)
        }
        idsToRemove.forEach { selectedIDs.remove($0) }

        tableView.performBatchUpdates {
            tableView.deleteRows(at: sorted, with: .automatic)
        } completion: { _ in
            self.updateBottomBarUI()
            self.updateNavUI()
            self.isEditingMode = false   // ✅ 删除完退出编辑态 -> bar 自动带动画消失
            if self.items.isEmpty {
                self.tableView.byReloadData()
            }
        }
    }
    // MARK: - Demo Data
    private func makeDemoItems(_ count: Int) -> [MessageItem] {
        (1...count).map { i in
            MessageItem(
                id: UUID(),
                title: "消息 \(i)",
                preview: "这是第 \(i) 条消息预览内容（演示用）",
                time: String(format: "%02d:%02d", (8 + i) % 24, (i * 3) % 60),
                isUnread: (i % 3 != 0)
            )
        }
    }
}
// MARK: - UITableViewDataSource
extension MessageListDemoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.py_dequeueReusableCell(withType: MessageCell.self, for: indexPath)
        let item = items[indexPath.row]
        cell.render(item: item, editing: isEditingMode)
        return cell
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        isEditingMode
    }

    func tableView(_ tableView: UITableView,
                   moveRowAt sourceIndexPath: IndexPath,
                   to destinationIndexPath: IndexPath) {
        let moved = items.remove(at: sourceIndexPath.row)
        items.insert(moved, at: destinationIndexPath.row)
    }
}
// MARK: - UITableViewDelegate
extension MessageListDemoVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 64 }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isEditingMode {
            selectedIDs.insert(items[indexPath.row].id)
            updateBottomBarUI()
            tableView.cellForRow(at: indexPath)?.setNeedsLayout()
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard isEditingMode else { return }
        selectedIDs.remove(items[indexPath.row].id)
        updateBottomBarUI()
        tableView.cellForRow(at: indexPath)?.setNeedsLayout()
    }

    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }

    func tableView(_ tableView: UITableView,
                   shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        true
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
}
