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
import JobsSwiftDSL
import JobsSwiftAppTools
import JobsSwiftBaseDefines
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
    private static let innerTop: CGFloat = 10
    private static let innerBottom: CGFloat = 10
    private static let innerCellReuseID = "RootFoldInnerCell"
    // MARK: - Data
    private var items: [DemoItem] = []
    private var onSelectItem: ((Int) -> Void)?
    private var onPinItem: ((Int) -> Void)?
    private var pinAccessoryIndex: Int?
    private var pinnedSectionStyle = false
    private var isExpanded: Bool = false
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
                make.left.equalToSuperview().offset(10)
                make.right.equalToSuperview().inset(10)
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
        applyTheme()

        setExpanded(false, animated: false)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        items = []
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
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        if window != nil { innerTableView.reloadData() }
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
        let targetH: CGFloat = targetExpanded ? CGFloat(items.count) * Self.innerRowH : 0
        innerTableHeight?.update(offset: targetH)
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

    private func subTitleText(expanded: Bool) -> String {
        let stateText = pinnedSectionStyle ? "已置顶".tr : (expanded ? "已展开".tr : "点击展开".tr)
        return "\(items.count) 个 Demo · \(stateText)"
    }

    private func subTitleText(for item: DemoItem) -> String {
        String(describing: item.vcType)
    }

    private static let demoIconSymbolNamesByVCType: [String: String] = {
        let names = [
            "FSPopoverDemoVC": "arrowtriangle.down.circle", "PicLoadDemoVC": "photo",
            "BRPickerDemoVC": "slider.horizontal.3", "GKPhotoBrowserByUIKitDemoVC": "photo.on.rectangle",
            "GKPhotoBrowserByTextureSwiftSupportDemoVC": "photo.stack", "ComponentKitLikeKitchenSinkVC": "square.3.layers.3d",
            "LunarDemoVC": "calendar", "XLSXDemoVC": "tablecells", "ObjectBoxDemoVC": "shippingbox",
            "PDFDemoVC": "doc.richtext", "PromiseKitDemoVC": "link", "LottieDemoVC": "sparkles",
            "SkeletonViewDemoVC": "rectangle.dashed", "SwiftEntryKitDemoVC": "rectangle.portrait.and.arrow.forward",
            "LiveChatDemoVC": "bubble.left.and.bubble.right", "FMDBDemoVC": "cylinder",
            "WCDBDemoVC": "externaldrive", "FlutterDemoVC": "arrow.left.arrow.right",
            "UnityDemoVC": "cube", "SwiftPackageManagerDemoVC": "shippingbox.fill",
            "JobsWorkerDemoVC": "tortoise", "TaskCenterComponentDemoVC": "checklist",
            "TimerDemoVC": "timer", "JobsTimerMgrDemoVC": "stopwatch",
            "JobsMultiTimerTableDemoVC": "list.number", "AnimationEffectLabelDemoVC": "textformat.123",
            "AnimatedButtonNumberDemoVC": "capsule", "JobsMarqueeDemoVC": "text.line.first.and.arrowtriangle.forward",
            "JobsCountdownDemoVC": "hourglass", "ClockDemoVC": "clock",
            "LuckyWheelDemoVC": "circle.grid.cross", "RedPacketRainDemoVC": "envelope.open",
            "JobsCountdownLayerDemoVC": "flame", "JobsSysProgressDemoVC": "gauge",
            "JobsProgressDemoVC": "chart.bar", "JobsNetworkingListDemoVC": "network",
            "JobsNetworkingDemoVC": "server.rack", "YTKNetworkDemoVC": "globe",
            "MoyaDemoVC": "drop", "AFDemoVC": "cloud", "HKLocalRecordVC": "record.circle",
            "LiveCommentDemoVC": "text.bubble", "HKLiveVC": "dot.radiowaves.left.and.right",
            "BMPlayerDemoVC": "play.rectangle", "PNPlayerDemoVC": "play.square",
            "FoldTableDemoVC": "rectangle.compress.vertical", "JobsWalletDemoVC": "creditcard",
            "TransparentRegionVC": "viewfinder", "MosaicDemoListVC": "square.grid.3x3",
            "SphereDemoVC": "globe.asia.australia", "IrregularButtonDemoVC": "hexagon",
            "SlideToUnlockDemoVC": "lock.open", "GestureUnlockDemoVC": "hand.draw",
            "FTDashboadDemoVC": "speedometer", "JobsButtonDemoVC": "circle",
            "UIButtonDemoVC": "capsule.fill", "UIButtonBackgroundColorDemoVC": "paintbrush",
            "BaseWebViewDemoVC": "safari", "UITextFieldDemoVC": "textbox",
            "UITextViewDemoVC": "text.cursor", "EmptyTableViewDemoVC": "list.bullet.rectangle",
            "UITableViewCellCornerDemoVC": "rectangle.roundedtop", "EmptyCollectionViewDemoVC": "square.grid.2x2",
            "JobsSwiftCommentDemoVC": "message", "JobsSwiftSearcherDemoVC": "magnifyingglass",
            "JobsBluetoothDemoVC": "antenna.radiowaves.left.and.right",
            "BtnFullOnCVCellDemoVC": "rectangle.grid.1x2", "BtnFullOnTBVCellDemoVC": "rectangle.grid.3x2",
            "JobsNavigationDemoVC": "arrow.triangle.turn.up.right.diamond", "LocalNotificationDemoVC": "bell",
            "JobsSwiftRefresherDemoVC": "arrow.clockwise", "JobsSwiftRefresherBy非正式协议闭包化DemoVC": "arrow.triangle.2.circlepath",
            "KeyboardDemoVC": "keyboard", "PhotoAlbumDemoVC": "camera",
            "JobsSwiftCountryCodeCtrlDemoVC": "flag", "JobsSwiftCalendarDemoVC": "calendar.badge.plus",
            "JobsSwiftPatchDemoVC": "wrench", "JobsControlEventsDemoVC": "gamecontroller",
            "JobsSwiftGraphicCaptchaDemoVC": "checkmark.shield", "TabBarDemoVC": "rectangle.bottomthird.inset.filled",
            "ToastDemoVC": "text.bubble.fill", "UIAlertDemoVC": "exclamationmark.triangle",
            "QRCodeDemoVC": "qrcode", "CNIDDemoVC": "person.text.rectangle",
            "TraitChangeDemoVC": "circle.lefthalf.fill", "JobsOpenDemoVC": "arrow.up.right.square",
            "MessageListDemoVC": "envelope", "LGOEditProfileVC": "person.crop.circle",
            "HomeLinkageDemoListVC": "rectangle.split.2x1", "JobsAppDoorDemoVC": "key",
            "RichTextDemoVC": "textformat", "JobsTextDemoVC": "character.book.closed",
            "JobsViewPushDemoVC": "arrow.right.square", "SafetyPushDemoVC": "shield.lefthalf.fill",
            "SafetyPresentDemoVC": "rectangle.portrait.and.arrow.right", "自定义注解DemoVC": "mappin",
            "SafeCodableDemoVC": "doc.text", "SnowflakeDemoVC": "snowflake"
        ]
        precondition(Set(names.values).count == names.count, "Demo 入口图标必须保持一项一图，不允许重复")
        return names
    }()

    private func demoIconSymbolName(for item: DemoItem) -> String {
        let vcName = String(describing: item.vcType).split(separator: ".").last.map(String.init) ?? ""
        guard let symbolName = Self.demoIconSymbolNamesByVCType[vcName] else {
            preconditionFailure("Demo 入口 \(vcName) 必须显式配置贴合内容且不重复的图标")
        };return symbolName
    }

    private func demoIconImage(for item: DemoItem) -> UIImage {
        demoIconSymbolName(for: item).sysImg.withRenderingMode(.alwaysTemplate)
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
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.innerCellReuseID) ??
            UITableViewCell(style: .subtitle, reuseIdentifier: Self.innerCellReuseID)
        cell.byText(item.title)
            .bySecondaryText(subTitleText(for: item))
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .regular))
            .byDetailTitleFont(JobsFont.systemFont(ofSize: 11, weight: .regular))
            .byTitleCor(RootListPreferences.foldPrimaryTextColor)
            .byDetailTitleCor(RootListPreferences.foldSecondaryTextColor)
            .byImage(demoIconImage(for: item))
        cell.byBackgroundColor(JobsCor.clear)
        cell.contentView.byBackgroundColor(JobsCor.clear)
        cell.byTintColor(RootListPreferences.foldSecondaryTextColor)
        cell.imageView?.byTintColor(RootListPreferences.foldSecondaryTextColor)
        cell.imageView?.byContentMode(.scaleAspectFit)
        cell.selectionStyle = .default
        cell.accessoryView = nil
        if pinAccessoryIndex == indexPath.row {
            cell.byAccessoryType(.none)
            cell.accessoryView = pinAccessoryButton(index: indexPath.row)
        } else {
            cell.byAccessoryType(.disclosureIndicator)
        };return cell
    }

    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        Self.innerRowH
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        onSelectItem?(indexPath.row)
    }
}
