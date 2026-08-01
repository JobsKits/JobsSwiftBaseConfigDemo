//
//  RootFoldTableCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsIconfont
import JobsImageRotation
import JobsSwiftDSL
import JobsSwiftAppTools
import JobsSwiftBaseDefines
import JobsSwiftCountryCodeCtrl
import JobsSwiftUILabelScrolling
import SnapKit

// ================================== RootFoldTableCell（折叠 + 内嵌Table） ==================================
final class RootFoldTableCell: UITableViewCell,
                               UITableViewCellInsetProtocol,
                               UITableViewCellRoundable {
    typealias DemoItem = (title: String, vcType: UIViewController.Type)
    let contentInsets: UIEdgeInsets = .zero
    let shouldInsetSeparator = false
    let cornerRadius: CGFloat = 14
    // MARK: - Layout
    private static let vInset: CGFloat = 8
    private static let cardHorizontalInset: CGFloat = 10
    private static let titleFont = JobsFont.systemFont(ofSize: 16, weight: .medium)
    private static let subTitleFont = JobsFont.systemFont(ofSize: 12, weight: .regular)
    private static let headerTitleTop: CGFloat = 11
    private static let headerTitleGap: CGFloat = 5
    private static let headerTitleBottom: CGFloat = 10
    private static let titleHeight = ceil(titleFont.lineHeight)
    private static let subTitleHeight = ceil(subTitleFont.lineHeight)
    private static let headerSubTitleTop = headerTitleTop + titleHeight + headerTitleGap
    private static let headerH = max(64, headerTitleTop + titleHeight + headerTitleGap + subTitleHeight + headerTitleBottom)
    private static let innerRowH: CGFloat = 50
    private static let innerTitleFont = JobsFont.systemFont(ofSize: 15, weight: .regular)
    private static let innerSubTitleFont = JobsFont.systemFont(ofSize: 11, weight: .regular)
    private static let innerTop: CGFloat = 10
    private static let innerBottom: CGFloat = 10
    private static let innerCellReuseID = "RootFoldInnerCell"
    private static let animatedTitleIconSize = CGSize(width: 22, height: 22)
    private static let animatedTitleIconTextGap: CGFloat = 6
    private static var animatedTitleTextLeadingInset: CGFloat {
        animatedTitleIconSize.width + animatedTitleIconTextGap
    }
    // MARK: - Data
    private var items: [DemoItem] = []
    private var onSelectItem: ((Int) -> Void)?
    private var onPinItem: ((Int) -> Void)?
    private var pinAccessoryIndex: Int?
    private var pinnedSectionStyle = false
    private var isExpanded: Bool = false
    private var chargingProgressPhase = 0
    private var innerTableHeight: Constraint?
    // MARK: - Lazy UI
    private lazy var card: UIView = {
        UIView()
            .byBackgroundColor(RootListPreferences.foldCardBackgroundColor)
            .byCornerRadius(cornerRadius)
            .byClipsToBounds(YES)
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(Self.vInset)
                make.bottom.equalToSuperview().inset(Self.vInset)
                make.left.equalToSuperview().offset(Self.cardHorizontalInset)
                make.right.equalToSuperview().inset(Self.cardHorizontalInset)
            }
    }()

    private lazy var header: UIView = {
        UIView().byAddTo(card) { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(Self.headerH).priority(999)
        }
    }()

    private lazy var titleLab: UILabel = {
        UILabel()
            .byFont(Self.titleFont)
            .byTextColor(RootListPreferences.foldPrimaryTextColor)
            .byNumberOfLines(1)
            .byLineBreakMode(.byTruncatingTail)
            .byAddTo(header) { [unowned self] make in
                make.top.equalToSuperview().offset(Self.headerTitleTop)
                make.left.equalToSuperview().offset(16)
                make.right.lessThanOrEqualTo(self.chevron.snp.left).offset(-10)
                make.height.equalTo(Self.titleHeight)
            }
    }()

    private lazy var subTitleLab: UILabel = {
        UILabel()
            .byFont(Self.subTitleFont)
            .byTextColor(RootListPreferences.foldSecondaryTextColor)
            .byNumberOfLines(1)
            .byLineBreakMode(.byTruncatingTail)
            .byAddTo(header) { [unowned self] make in
                make.top.equalToSuperview().offset(Self.headerSubTitleTop)
                make.left.equalTo(self.titleLab)
                make.right.lessThanOrEqualTo(self.chevron.snp.left).offset(-10)
                make.height.equalTo(Self.subTitleHeight)
            }
    }()

    private lazy var chevron: UIImageView = {
        UIImageView(image: "chevron.right".sysImg)
            .byTintColor(RootListPreferences.foldSecondaryTextColor)
            .byContentMode(.scaleAspectFit)
            .byAddTo(header) { make in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().inset(16)
                make.size.equalTo(CGSize(width: 16, height: 16))
        }
    }()

    private lazy var detailClip: UIView = {
        UIView()
            .byClipsToBounds(YES)
            .byVisible(NO)
            .byAddTo(card) { [unowned self] make in
                make.top.equalTo(self.header.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var detailContent: UIView = {
        UIView()
            .byVisible(NO) // 默认折叠
            .byAddTo(detailClip) { make in
                make.edges.equalToSuperview()
            }
    }()

    private lazy var innerTableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byBackgroundColor(JobsCor.clear)
            .bySeparatorStyle(.singleLine)
            .bySeparatorColor(RootListPreferences.separatorColor)
            .byRowHeight(Self.innerRowH)
            .byScrollEnabled(NO)
            .byBounces(NO)
            .byEstimatedRowHeight(0)
            .byEstimatedSectionHeaderHeight(0)
            .byEstimatedSectionFooterHeight(0)
            .byContentInsetAdjustmentBehavior(.never)
            .byContentInset(.zero)
            .byScrollIndicatorInsets(.zero)
            .bySectionHeaderTopPadding(0)
            .byDataSource(self)
            .byDelegate(self)
            .byAddTo(detailContent) { [unowned self] make in
                make.top.equalToSuperview().offset(Self.innerTop)
                make.left.right.equalToSuperview()
                self.innerTableHeight = make.height.equalTo(0).priority(999).constraint
                make.bottom.lessThanOrEqualToSuperview().inset(Self.innerBottom).priority(999)
            }
    }()

    private lazy var innerCellLongPressGesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleInnerCellLongPress(_:)))
        gesture.minimumPressDuration = 0.45
        gesture.cancelsTouchesInView = false
        return gesture
    }()

    private lazy var shadow: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.black)
            .byVisible(NO)
            .byAddTo(detailClip) { make in
                make.edges.equalToSuperview()
            }
    }()
    // MARK: - Init
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.byBackgroundColor(JobsCor.clear)
        contentView.byBackgroundColor(JobsCor.clear)
        card.byVisible(YES)
        header.byVisible(YES)
        titleLab.byVisible(YES)
        subTitleLab.byVisible(YES)
        chevron.byVisible(YES)
        detailClip.byVisible(YES)
        detailContent.byVisible(YES)
        innerTableView.byVisible(YES)
        shadow.byVisible(YES)
        innerTableView.addGestureRecognizer(innerCellLongPressGesture)
        if #available(iOS 17.0, tvOS 17.0, *) {
            _ = registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (cell: RootFoldTableCell, _) in
                cell.refreshTheme()
            }
        }
        applyTheme()
        setExpanded(false, animated: false)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        stopVisibleInnerTextScrolling()
        items = []
        innerTableView.reloadData()
        onSelectItem = nil
        onPinItem = nil
        pinAccessoryIndex = nil
        pinnedSectionStyle = false
        subTitleLab.byVisible(YES)
        chevron.byVisible(YES)
        chevron.byImage("chevron.right".sysImg)
        applyTheme()
        setExpanded(false, animated: false)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        applyInsets()      // 水平边距@距离TableView
        applyCornerStyle() // 圆角
        innerTableView.visibleCells.forEach(syncAnimatedTitleTextBoundary(for:))
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        if window != nil { refreshTheme() }
        syncVisibleInnerTextScrollingState()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard #available(iOS 13.0, tvOS 13.0, *),
              previousTraitCollection?.hasDifferentColorAppearance(comparedTo: traitCollection) == true else { return }
        if #available(iOS 17.0, tvOS 17.0, *) { return }
        refreshTheme()
    }
}

extension RootFoldTableCell{
    static func collapsedHeight() -> CGFloat {
        headerH + vInset * 2
    }

    static func expandedHeight(itemCount: Int) -> CGFloat {
        collapsedHeight()
        + innerTop
        + CGFloat(itemCount) * innerRowH
        + innerBottom
    }

    private static func innerSecondaryText(for item: DemoItem) -> String {
        if item.vcType == JobsSwiftCountryCodeCtrlDemoVC.self,
           let country = JobsSwiftCountryCodeCtrl.selectedCountry {
            return country.displayName
        };return String(describing: item.vcType)
    }

    private func updateInnerTableHeight() {
        let contentHeight = isExpanded ? CGFloat(items.count) * Self.innerRowH : 0
        innerTableHeight?.update(offset: contentHeight)
    }

    func configure(groupTitle: String,
                   items: [DemoItem],
                   expanded: Bool,
                   onSelectItem: @escaping (Int) -> Void,
                   pinItem: @escaping (Int) -> Void) {
        pinnedSectionStyle = false
        self.items = items
        self.onSelectItem = onSelectItem
        self.onPinItem = pinItem
        pinAccessoryIndex = nil
        applyTheme()
        titleLab.byText("\(groupTitle)  (\(items.count))")
        subTitleLab.byText(subTitleText(expanded: expanded))
        chevron.byImage("chevron.right".sysImg)
        chevron.byVisible(YES)
        if window != nil { innerTableView.reloadData() }
        setExpanded(expanded, animated: false)
    }

    func configurePinned(groupTitle: String,
                         items: [DemoItem],
                         selectItem: @escaping (Int) -> Void,
                         unpinItem: @escaping (Int) -> Void) {
        pinnedSectionStyle = true
        self.items = items
        self.onSelectItem = selectItem
        self.onPinItem = unpinItem
        pinAccessoryIndex = nil
        applyTheme()
        titleLab.byText("\(groupTitle)  (\(items.count))")
        subTitleLab.byText(subTitleText(expanded: true))
        chevron.byImage(nil)
        chevron.byVisible(NO)
        if window != nil { innerTableView.reloadData() }
        setExpanded(true, animated: false)
    }

    /// 展开/收起的核心方法
    func setExpanded(_ expanded: Bool, animated: Bool) {
        let targetExpanded = pinnedSectionStyle ? true : expanded
        isExpanded = targetExpanded
        subTitleLab.byText(subTitleText(expanded: targetExpanded))
        updateInnerTableHeight()
        // ✅ 展开前先把容器露出来（折叠完成后会隐藏回去）
        if targetExpanded || animated {
            detailClip.byVisible(YES)
        }
        if targetExpanded {
            detailContent.byVisible(YES)
        } else if animated {
            // ✅ 如果是“从展开 -> 折叠”的动画，内容此时本来就是可见的；这里兜底保证可见以便折页动画能演
            detailContent.byVisible(YES)
        }
        if window != nil { detailContent.layoutIfNeeded() }
        let targetTransform = targetExpanded ? CATransform3DIdentity : foldedTransform()
        let targetAlpha: CGFloat = targetExpanded ? 1.0 : 0.0
        let targetChevron = targetExpanded ? CGAffineTransform(rotationAngle: .pi / 2) : .identity
        let apply = { [self] in
            detailContent.layer.transform = targetTransform
            detailContent.byAlpha(targetAlpha)
            chevron.transform = targetChevron
            // ✅ shadow 永远不参与显示（彻底消灭“灰条”）
            shadow.byVisible(NO)
        }
        if animated {
            UIView.jobsAnimateWithSpring(
                0.35,
                dampingRatio: 0.92,
                initialVelocity: 0,
                options: [.beginFromCurrentState, .allowUserInteraction],
                animations: {
                    self.detailContent.layoutIfNeeded()
                    apply()
                },
                completion: { [weak self] _ in
                    guard let self else { return }
                    if !targetExpanded {
                        self.detailContent.byVisible(NO)
                        self.detailClip.byVisible(NO) // ✅ 折叠完成：连容器一起藏掉，彻底无残影
                    }
                }
            )
        } else {
            UIView.jobsPerformWithoutAnimation { apply() }
            if !targetExpanded {
                detailContent.byVisible(NO)
                detailClip.byVisible(NO) // ✅ 非动画折叠：直接隐藏
            }
        }
        syncVisibleInnerTextScrollingState()
    }

    @objc private func handleInnerCellLongPress(_ gesture: UILongPressGestureRecognizer) {
        guard gesture.state == .began else { return }
        let point = gesture.location(in: innerTableView)
        guard let indexPath = innerTableView.indexPathForRow(at: point),
              items.indices.contains(indexPath.row) else { return }
        pinAccessoryIndex = indexPath.row
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        innerTableView.reloadData()
    }

    @objc private func handlePinAccessoryButtonTap(_ sender: UIButton) {
        pinAccessoryIndex = nil
        onPinItem?(sender.tag)
        innerTableView.reloadData()
    }

    private func applyTheme() {
        self.byBackgroundColor(JobsCor.clear)
        contentView.byBackgroundColor(JobsCor.clear)
        card.byBackgroundColor(RootListPreferences.foldCardBackgroundColor)
        titleLab.byTextColor(RootListPreferences.foldPrimaryTextColor)
        subTitleLab.byTextColor(RootListPreferences.foldSecondaryTextColor)
        chevron.byTintColor(RootListPreferences.foldSecondaryTextColor)
        innerTableView.byBackgroundColor(JobsCor.clear)
        innerTableView.separatorColor = RootListPreferences.separatorColor
    }

    private func refreshTheme() {
        applyTheme()
        if window != nil { innerTableView.reloadData() }
    }

    private func subTitleText(expanded: Bool) -> String {
        let stateText = pinnedSectionStyle ? "已置顶".tr : (expanded ? "已展开".tr : "点击展开".tr)
        return "\(items.count) 个 Demo · \(stateText)"
    }

    private func isChargingProgressItem(_ item: DemoItem) -> Bool {
        item.vcType == JobsSysProgressDemoVC.self ||
            item.vcType == JobsProgressDemoVC.self
    }

    private func hasAnimatedTitleIcon(_ item: DemoItem) -> Bool {
        item.vcType == ClockDemoVC.self || isChargingProgressItem(item)
    }

    private static func animatedTitleTextPrefix(for font: UIFont) -> String {
        let blank = "\u{00A0}"
        let blankWidth = max(
            1,
            (blank as NSString).size(withAttributes: [.font: font]).width
        )
        let count = Int(ceil(animatedTitleTextLeadingInset / blankWidth))
        return String(repeating: blank, count: count)
    }

    private func displayTitle(for item: DemoItem) -> String {
        guard hasAnimatedTitleIcon(item) else { return item.title };return "\(Self.animatedTitleTextPrefix(for: Self.innerTitleFont))\(item.title)"
    }

    private func displaySecondaryText(for item: DemoItem) -> String {
        let text = Self.innerSecondaryText(for: item)
        guard hasAnimatedTitleIcon(item) else { return text };return "\(Self.animatedTitleTextPrefix(for: Self.innerSubTitleFont))\(text)"
    }

    func updateChargingProgress(phase: Int) {
        chargingProgressPhase = max(0, phase) % 3
        for indexPath in innerTableView.indexPathsForVisibleRows ?? [] {
            guard items.indices.contains(indexPath.row),
                  isChargingProgressItem(items[indexPath.row]),
                  let cell = innerTableView.cellForRow(at: indexPath),
                  let progressIcon = chargingProgressIcon(in: cell) else { continue }
            progressIcon.update(phase: chargingProgressPhase)
        }
    }

    private func syncVisibleInnerTextScrollingState() {
        innerTableView.visibleCells.forEach(syncTextScrollingState(for:))
    }

    private func applyTextDisplayStrategy(to label: UILabel?) {
        guard let label else { return }
        switch RootListPreferences.cellTextDisplayStrategy {
        /// 处理 .normal 分支
        case .normal:
            label
                .byStopTextScroll()
                .byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(false)
                .byMinimumScaleFactor(1)
                .byLineBreakMode(.byClipping)
        /// 处理 .tailTruncation 分支
        case .tailTruncation:
            label.byTextDisplayMode(.singleLineTailTruncation)
        /// 处理 .scaleToFit 分支
        case .scaleToFit:
            label.byTextDisplayMode(.scaleToFit, minimumScaleFactor: 0.5)
        /// 处理 .continuous 分支
        case .continuous:
            label.byTextDisplayMode(.scrolling, scrollConfiguration: .continuous())
        /// 处理 .pingPong 分支
        case .pingPong:
            label.byTextDisplayMode(.scrolling, scrollConfiguration: .pingPong())
        }
    }

    private func syncTextScrollingState(for cell: UITableViewCell) {
        [cell.textLabel, cell.detailTextLabel]
            .compactMap { $0 }
            .forEach { label in
                if window != nil, isExpanded {
                    label.byResumeTextScroll()
                } else {
                    label.byPauseTextScroll()
                }
            }
        syncAnimatedTitleIconState(for: cell)
        syncAnimatedTitleTextBoundary(for: cell)
    }

    private func stopVisibleInnerTextScrolling() {
        innerTableView.visibleCells.forEach { cell in
            cell.textLabel?.byStopTextScroll()
            cell.detailTextLabel?.byStopTextScroll()
            clockIcon(in: cell)?.stop(reset: false)
        }
    }

    private func installAnimatedTitleIcon(for item: DemoItem, in cell: UITableViewCell) {
        removeAnimatedTitleIcons(from: cell)
        guard let titleLabel = cell.textLabel else { return }
        if item.vcType == ClockDemoVC.self {
            JobsClockIconView(interval: JobsClockIconView.defaultInterval)
                .byTintColor(RootListPreferences.foldSecondaryTextColor)
                .byAddTo(cell.contentView) { make in
                    make.left.centerY.equalTo(titleLabel)
                    make.size.equalTo(Self.animatedTitleIconSize)
                }
        } else if isChargingProgressItem(item) {
            JobsChargingProgressIconView()
                .byTintColor(RootListPreferences.foldSecondaryTextColor)
                .byAddTo(cell.contentView) { make in
                    make.left.centerY.equalTo(titleLabel)
                    make.size.equalTo(Self.animatedTitleIconSize)
                }
                .update(phase: chargingProgressPhase)
        }
        syncAnimatedTitleIconState(for: cell)
        syncAnimatedTitleTextBoundary(for: cell)
    }

    private func removeAnimatedTitleIcons(from cell: UITableViewCell) {
        [cell.textLabel, cell.detailTextLabel]
            .compactMap { $0 }
            .forEach { $0.layer.byMask(nil) }
        cell.contentView.subviews.forEach { subview in
            if let clockIcon = subview as? JobsClockIconView {
                clockIcon.stop()
                clockIcon.byRemoveFromSuperview()
            } else if subview is JobsChargingProgressIconView {
                subview.byRemoveFromSuperview()
            }
        }
    }

    private func clockIcon(in cell: UITableViewCell) -> JobsClockIconView? {
        cell.contentView.subviews
            .compactMap { $0 as? JobsClockIconView }
            .first
    }

    private func chargingProgressIcon(in cell: UITableViewCell) -> JobsChargingProgressIconView? {
        cell.contentView.subviews
            .compactMap { $0 as? JobsChargingProgressIconView }
            .first
    }

    private func syncAnimatedTitleIconState(for cell: UITableViewCell) {
        guard let clockIcon = clockIcon(in: cell) else { return }
        if window != nil,
           isExpanded,
           !UIAccessibility.isReduceMotionEnabled {
            if !clockIcon.isRunning {
                clockIcon.start()
            }
        } else {
            clockIcon.stop(reset: false)
        }
    }

    private func syncAnimatedTitleTextBoundary(for cell: UITableViewCell) {
        let hasAnimatedIcon = clockIcon(in: cell) != nil ||
            chargingProgressIcon(in: cell) != nil
        [cell.textLabel, cell.detailTextLabel]
            .compactMap { $0 }
            .forEach { label in
                guard hasAnimatedIcon,
                      label.bounds.width > Self.animatedTitleTextLeadingInset,
                      label.bounds.height > 0 else {
                    label.layer.byMask(nil)
                    return
                }
                label.layer.byMask(
                    CALayer()
                        .byFrame(
                            CGRect(
                                x: Self.animatedTitleTextLeadingInset,
                                y: 0,
                                width: label.bounds.width - Self.animatedTitleTextLeadingInset,
                                height: label.bounds.height
                            )
                        )
                        .byBackgroundColor(JobsCor.black)
                )
            }
    }

    private static let fallbackDemoIconSymbolName = "questionmark.square.dashed"
    private static var reportedMissingDemoIconVCNames = Set<String>()
    private static let demoIconSymbolNamesByVCType: [String: String] = {
        let names = [
            "FSPopoverDemoVC": "arrowtriangle.down.circle", "PicLoadDemoVC": "photo",
            "JobsIconfontDemoListVC": "square.text.square.fill",
            "BRPickerDemoVC": "slider.horizontal.3", "GKPhotoBrowserByUIKitDemoVC": "photo.on.rectangle",
            "GKPhotoBrowserByTextureSwiftSupportDemoVC": "photo.stack", "ComponentKitLikeKitchenSinkVC": "square.3.layers.3d",
            "LunarDemoVC": "calendar", "XLSXDemoVC": "tablecells", "JobsSwiftExcelDemoVC": "tablecells.fill",
            "ObjectBoxDemoVC": "shippingbox",
            "PDFDemoVC": "doc.richtext", "PromiseKitDemoVC": "link", "LottieDemoVC": "sparkles",
            "SkeletonViewDemoVC": "rectangle.dashed", "SwiftEntryKitDemoVC": "rectangle.portrait.and.arrow.forward",
            "LiveChatDemoVC": "bubble.left.and.bubble.right", "FMDBDemoVC": "cylinder",
            "WCDBDemoVC": "externaldrive", "FlutterDemoVC": "arrow.left.arrow.right",
            "UnityDemoVC": "cube", "SwiftPackageManagerDemoVC": "shippingbox.fill",
            "JobsWorkerDemoVC": "tortoise", "TaskCenterComponentDemoVC": "checklist",
            "TimerDemoVC": "timer", "JobsTimerMgrDemoVC": "stopwatch",
            "JobsImageRotationDemoVC": "clock.arrow.circlepath",
            "JobsMultiTimerTableDemoVC": "list.number", "AnimationEffectLabelDemoVC": "textformat.123",
            "AnimatedButtonNumberDemoVC": "capsule", "JobsMarqueeDemoVC": "text.line.first.and.arrowtriangle.forward",
            "UILabelScrollingDemoVC": "text.line.last.and.arrowtriangle.forward",
            "JobsCountdownDemoVC": "hourglass", "ClockDemoVC": "clock",
            "LuckyWheelDemoVC": "circle.grid.cross", "RedPacketRainDemoVC": "envelope.open",
            "JobsCountdownLayerDemoVC": "flame", "JobsSysProgressDemoVC": "gauge",
            "JobsProgressDemoVC": "chart.bar", "JobsNetworkingListDemoVC": "network",
            "JobsNetworkingDemoVC": "server.rack", "YTKNetworkDemoVC": "globe",
            "JobsWebSocketDemoVC": "arrow.left.arrow.right.circle.fill",
            "MoyaDemoVC": "drop", "AFDemoVC": "cloud", "HKLocalRecordVC": "record.circle",
            "LiveCommentDemoVC": "text.bubble", "HKLiveVC": "dot.radiowaves.left.and.right",
            "BMPlayerDemoVC": "play.rectangle", "PNPlayerDemoVC": "play.square",
            "FoldTableDemoVC": "rectangle.compress.vertical", "JobsWalletDemoVC": "creditcard",
            "TransparentRegionVC": "viewfinder", "MosaicDemoListVC": "square.grid.3x3",
            "JobsLongPressLikeDemoVC": "hand.thumbsup.fill",
            "SphereDemoVC": "globe.asia.australia", "IrregularButtonDemoVC": "hexagon",
            "SlideToUnlockDemoVC": "lock.open", "GestureUnlockDemoVC": "hand.draw",
            "FTDashboadDemoVC": "speedometer", "JobsButtonDemoVC": "circle",
            "UIButtonDemoVC": "capsule.fill", "UIButtonBackgroundColorDemoVC": "paintbrush",
            "BaseWebViewDemoVC": "safari", "UITextFieldDemoVC": "textbox",
            "UITextViewDemoVC": "text.cursor", "JobsHandwritingDemoVC": "pencil.tip.crop.circle",
            "EmptyTableViewDemoVC": "list.bullet.rectangle",
            "UITableViewCellCornerDemoVC": "rectangle.roundedtop", "EmptyCollectionViewDemoVC": "square.grid.2x2",
            "JobsSwiftCommentDemoVC": "message", "JobsSwiftSearcherDemoVC": "magnifyingglass",
            "JobsAudioRecorderDemoVC": "mic.fill",
            "JobsBluetoothDemoVC": "antenna.radiowaves.left.and.right",
            "JobsCoreMotionDemoVC": "gyroscope",
            "JobsSceneDelegateDemoVC": "macwindow.on.rectangle",
            "JobsMotionAppIconDemoVC": "app.badge.checkmark",
            "JobsScreenshotTipsDemoVC": "camera.viewfinder",
            "JobsScreenshotProtectionDemoVC": "eye.slash",
            "JobsWidgetDemoVC": "widget.small",
            "JobsPostDraftDemoVC": "square.and.pencil",
            "JobsSaltedImageStoreDemoVC": "lock.doc.fill",
            "JobsLandscapeSwitchDemoVC": "rectangle.2.swap",
            "JobsStringCompressionDemoVC": "archivebox.fill",
            "JobsContextMenuDemoVC": "hand.tap",
            "JobsClipboardCueDemoVC": "doc.on.doc.fill",
            "JobsLabelBehaviorDemoVC": "character.textbox",
            "JobsInteractiveLabelDemoVC": "hand.tap.fill",
            "JobsBulletTextDemoVC": "list.bullet.indent",
            "JobsLabelRotationDemoVC": "rotate.right",
            "JobsRandomNumberDemoVC": "die.face.5",
            "JobsCardStackDemoVC": "rectangle.stack",
            "JobsDockingScrollDemoVC": "arrow.up.and.down.square",
            "JobsButtonCoverCellDemoListVC": "rectangle.grid.1x2",
            "JobsNavigationDemoVC": "arrow.triangle.turn.up.right.diamond", "LocalNotificationDemoVC": "bell",
            "JobsSwiftRefresherDemoVC": "arrow.clockwise", "JobsSwiftRefresherBy非正式协议闭包化DemoVC": "arrow.triangle.2.circlepath",
            "JobsDouyinRefreshDemoVC": "music.note",
            "KeyboardDemoVC": "keyboard", "PhotoAlbumDemoVC": "camera",
            "JobsSwiftCountryCodeCtrlDemoVC": "flag", "JobsSwiftCalendarDemoVC": "calendar.badge.plus",
            "JobsSwiftPatchDemoVC": "wrench", "JobsControlEventsDemoVC": "gamecontroller",
            "JobsSwiftNumberStepperDemoVC": "plusminus.circle",
            "JobsSwiftGraphicCaptchaDemoVC": "checkmark.shield", "TabBarDemoVC": "rectangle.bottomthird.inset.filled",
            "ToastDemoVC": "text.bubble.fill", "UIAlertDemoVC": "exclamationmark.triangle",
            "QRCodeDemoVC": "qrcode", "CNIDDemoVC": "person.text.rectangle",
            "TraitChangeDemoVC": "circle.lefthalf.fill", "JobsOpenDemoVC": "arrow.up.right.square",
            "MessageListDemoVC": "envelope", "LGOEditProfileDemoVC": "person.crop.circle",
            "HomeLinkageDemoListVC": "rectangle.split.2x1", "JobsAppDoorDemoVC": "key",
            "JobsMarkdownDocumentsDemoVC": "book.closed.fill",
            "RichTextDemoVC": "textformat", "JobsTextDemoVC": "character.book.closed",
            "JobsViewPushDemoVC": "arrow.right.square", "JobsSideDrawerDemoVC": "sidebar.left",
            "SafetyPushDemoVC": "shield.lefthalf.fill",
            "SafetyPresentDemoVC": "rectangle.portrait.and.arrow.right", "自定义注解DemoVC": "mappin",
            "SafeCodableDemoVC": "doc.text", "SnowflakeDemoVC": "snowflake"
        ]
        let duplicatedSymbolNames = Dictionary(grouping: names.values, by: { $0 })
            .compactMap { symbolName, mappings in mappings.count > 1 ? symbolName : nil }
            .sorted()
        if !duplicatedSymbolNames.isEmpty {
            print("⚠️ Demo 入口图标存在重复：\(duplicatedSymbolNames.joined(separator: ", "))")
        };return names
    }()

    private static func demoIconSymbolName(for item: DemoItem) -> String {
        let vcName = String(describing: item.vcType).split(separator: ".").last.map(String.init) ?? ""
        guard let symbolName = demoIconSymbolNamesByVCType[vcName] else {
            if reportedMissingDemoIconVCNames.insert(vcName).inserted {
                print("⚠️ Demo 入口 \(vcName) 缺少显式图标映射，已使用兜底图标")
            };return fallbackDemoIconSymbolName
        };return symbolName
    }

    private static func demoIconImage(for item: DemoItem) -> UIImage {
        let vcName = String(describing: item.vcType).split(separator: ".").last.map(String.init) ?? ""
        if vcName == "JobsIconfontDemoListVC" {
            return JobsIconfont.shared.iconImage(
                .component,
                size: CGSize(width: 30, height: 30),
                color: JobsCor.systemBlue
            ).withRenderingMode(.alwaysOriginal)
        } else if vcName == "JobsSceneDelegateDemoVC" {
            return JobsIconfont.shared.iconImage(
                .switcher,
                size: CGSize(width: 30, height: 30),
                color: JobsCor.systemBlue
            ).withRenderingMode(.alwaysOriginal)
        };return demoIconSymbolName(for: item).sysImg.withRenderingMode(.alwaysTemplate)
    }

    private func pinAccessoryButton(index: Int) -> UIButton {
        let imageName = pinnedSectionStyle ? "minus.circle.fill" : "pin.fill"
        let image = imageName.sysImg.withRenderingMode(.alwaysTemplate)
        return UIButton.sys()
            .byImage(image)
            .byImage(image, for: .highlighted)
            .byTintColor(JobsCor.systemRed)
            .byFrame(CGRect(x: 0, y: 0, width: 40, height: 40))
            .byImageEdgeInsets(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
            .byTag(index)
            .byAddTarget(self,
                         action: #selector(handlePinAccessoryButtonTap(_:)),
                         for: .touchUpInside)
    }
    // MARK: - Fold
    private func foldedTransform() -> CATransform3D {
        let h = max(detailContent.bounds.height, 1)
        var t = CATransform3DIdentity
        t.m34 = -1.0 / 520.0
        t = CATransform3DTranslate(t, 0, -h / 2.0, 0)
        t = CATransform3DRotate(t, -CGFloat.pi / 2.0, 1, 0, 0)
        t = CATransform3DTranslate(t, 0,  h / 2.0, 0)
        return t
    }
}
// MARK: - Inner Table（二级目录）
extension RootFoldTableCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.innerCellReuseID) ??
            UITableViewCell(style: .subtitle, reuseIdentifier: Self.innerCellReuseID)
        guard items.indices.contains(indexPath.row) else {
            removeAnimatedTitleIcons(from: cell)
            cell.contentConfiguration = nil
            cell.textLabel?.byText(nil)
            cell.detailTextLabel?.byText(nil)
            cell.detailTextLabel?.attributedText = nil
            cell.imageView?.byImage(nil)
            cell.accessoryView = nil
            cell.byAccessoryType(.none)
            return cell
        }
        let item = items[indexPath.row]
        /// 复用旧 Cell 时先退出动态 UIListContentConfiguration，恢复可直接配置的 UILabel。
        cell.contentConfiguration = nil
        cell.textLabel?
            .byText(displayTitle(for: item))
            .byFont(Self.innerTitleFont)
            .byTextColor(RootListPreferences.foldPrimaryTextColor)
        cell.detailTextLabel?
            .byText(displaySecondaryText(for: item))
            .byFont(Self.innerSubTitleFont)
            .byTextColor(RootListPreferences.foldSecondaryTextColor)
        applyTextDisplayStrategy(to: cell.textLabel)
        applyTextDisplayStrategy(to: cell.detailTextLabel)
        cell.imageView?.byImage(Self.demoIconImage(for: item))
        cell
            .bySelectionStyle(.default)
            .bySelectedBackgroundView(
                UIView().byBackgroundColor(JobsCor.tertiarySystemBackground)
            )
            .byTintColor(RootListPreferences.foldSecondaryTextColor)
            .byBackgroundColor(JobsCor.clear)
        cell.contentView.byBackgroundColor(JobsCor.clear)
        cell.imageView?.byTintColor(RootListPreferences.foldSecondaryTextColor)
        cell.imageView?.byContentMode(.scaleAspectFit)
        installAnimatedTitleIcon(for: item, in: cell)
        cell.accessoryView = nil
        if pinAccessoryIndex == indexPath.row {
            cell.byAccessoryType(.none)
            cell.accessoryView = pinAccessoryButton(index: indexPath.row)
        } else {
            cell.byAccessoryType(.disclosureIndicator)
        }
        syncTextScrollingState(for: cell)
        return cell
    }

    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        Self.innerRowH
    }
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        syncTextScrollingState(for: cell)
    }
    func tableView(_ tableView: UITableView,
                   didEndDisplaying cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        cell.textLabel?.byPauseTextScroll()
        cell.detailTextLabel?.byPauseTextScroll()
        clockIcon(in: cell)?.stop(reset: false)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard items.indices.contains(indexPath.row) else { return }
        onSelectItem?(indexPath.row)
    }
}
