//
//  MomentPostUIKitCellNode.swift
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

import JobsSwiftBaseDefines
import JobsByUIKit
import JobsSwiftDSL
import AsyncDisplayKit
import TextureSwiftSupport

// MARK: - ASCellNode: Wrap existing MomentPostCell (UIKit) into a Texture cell node
final class MomentPostUIKitCellNode: ASCellNode {
    private let post: MomentPost
    private let layoutMode: TimelineLayoutMode

    private let containerNode: ASDisplayNode
    private weak var hostCell: MomentPostCell?

    /// ✅ 用于“离屏测高”，绝不改动屏幕上正在显示的 hostCell（防止 UI 被测高逻辑弄坏）
    private lazy var sizingCell: MomentPostCell = {
        let c = MomentPostCell(style: .default, reuseIdentifier: nil)
        c.byBackgroundColor(JobsCor.clear)
        c.contentView.byBackgroundColor(JobsCor.clear)
        c.byClipsToBounds(false)
        // 不需要回调，不要绑事件
        return c
    }()

    // callbacks (from wrapped UIKit cell)
    var onNeedHeightUpdate: (() -> Void)?
    var onTapMedia: ((Int) -> Void)?
    var onToggleExpand: (() -> Void)?
    var onLikeTapped: (() -> Void)?
    var onCommentTapped: (() -> Void)?

    private var cachedWidth: CGFloat = 0
    private var cachedHeight: CGFloat = 0
    private var heightUpdateWorkItem: DispatchWorkItem?

    // media 3x3 fix
    private var didApplyMediaGridFix: Bool = false
    private var lastGridWidth: CGFloat = 0

    init(post: MomentPost,
         layoutMode: TimelineLayoutMode) {
        // ✅ WeChat moments: media max 9
        var p = post
        if p.media.count > 9 {
            p.media = Array(p.media.prefix(9))
        }
        self.post = p
        self.layoutMode = layoutMode
        self.containerNode = ASDisplayNode(viewBlock: {
            let v = UIView()
            v.byBackgroundColor(JobsCor.clear)
            v.byClipsToBounds(false)
            return v
        })
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = JobsCor.clear
        selectionStyle = .none
    }

    deinit {
        heightUpdateWorkItem?.cancel()
        heightUpdateWorkItem = nil
    }

    override func didLoad() {
        super.didLoad()
        let cell = MomentPostCell(style: .default, reuseIdentifier: nil)
            .bySelectionStyle(.none)
            .byOnNeedHeightUpdate({ [weak self] _ in
                self?.requestHeightUpdateIfNeeded()
            })
            .byOnTapMedia({ [weak self] _, mediaIndex in
                self?.onTapMedia?(mediaIndex)
            })
            .byOnToggleExpand({ [weak self] _ in
                self?.onToggleExpand?()
            })
            .byOnLikeTapped({ [weak self] _ in
                self?.onLikeTapped?()
            })
            .byOnCommentTapped({ [weak self] _ in
                self?.onCommentTapped?()
            })
            .byData(self.post, layoutMode: layoutMode)
        // ⚠️ 不要动 UITableViewCell.translatesAutoresizingMaskIntoConstraints
        cell.byBackgroundColor(JobsCor.clear)
        cell.contentView.byBackgroundColor(JobsCor.clear)
        cell.byClipsToBounds(false)
        hostCell = cell
        let host = containerNode.view
        cell.byAddTo(host)
        cell.byFrame(host.bounds)
        cell.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // 首次进来测一次真实高度（用 sizingCell，不会影响屏幕上的 cell）
        DispatchQueue.main.async { [weak self] in
            self?.requestHeightUpdateIfNeeded()
        }
    }

    /// 给 GKPhotoBrowser 用：做 zoom 转场的 sourceImageView
    func sourceImageView(at index: Int) -> UIImageView? {
        hostCell?.mediaSourceImageView(at: index)
    }

    // MARK: - Layout

    override func layout() {
        super.layout()
        guard let cell = hostCell else { return }
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let changed = applyWeChat3x3MediaGridFixIfPossible(in: cell)
        if changed {
            requestHeightUpdateIfNeeded()
        }
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let w = effectiveWidth(constrainedSize)
        // 初次展示给个“够用的高度”，避免 UITableView 默认 44 把 UIKit 约束挤爆
        let hFormula = MomentPostCell.heightFormula(for: post, tableWidth: w)
        let hMin = estimatedMinimumHeight(tableWidth: w)
        let h = max(hFormula, hMin)
        cachedWidth = w
        cachedHeight = h
        containerNode.style.preferredSize = CGSize(width: w, height: h)
        return ASWrapperLayoutSpec(layoutElement: containerNode)
    }

    // MARK: - Width

    private func effectiveWidth(_ constrainedSize: ASSizeRange) -> CGFloat {
        let maxW = constrainedSize.max.width
        let minW = constrainedSize.min.width
        func isUsable(_ w: CGFloat) -> Bool {
            // greatestFiniteMagnitude 也是 isFinite = true，所以必须加“上限阈值”
            return w.isFinite && w > 0 && w < 10_000
        }
        if isUsable(maxW) { return maxW }
        if isUsable(minW) { return minW }
        #if os(iOS) || os(tvOS)
        return UIScreen.main.bounds.width
        #else
        return 375
        #endif
    }

    // MARK: - Height update

    private func requestHeightUpdateIfNeeded() {
        heightUpdateWorkItem?.cancel()
        let work = DispatchWorkItem { [weak self] in
            guard let self else { return }
            guard Thread.isMainThread else { return }
            let w = (self.cachedWidth > 0) ? self.cachedWidth : self.effectiveWidth(ASSizeRangeUnconstrained)
            // ✅ 用离屏 sizingCell 测真实高度（不会把屏幕上的 UI 搞没）
            let measured = self.measuredHeight(preferWidth: w)
            // ✅ 关键：不要再用 minH 抬高 measured（会产生大空白）
            let newHeight = max(measured, 44)
            guard abs(newHeight - self.cachedHeight) > 0.5 else { return }
            self.cachedHeight = newHeight
            self.containerNode.style.preferredSize = CGSize(width: w, height: newHeight)
            self.invalidateCalculatedLayout()
            self.setNeedsLayout()
            self.onNeedHeightUpdate?()
        }
        heightUpdateWorkItem = work
        DispatchQueue.main.async(execute: work)
    }

    /// 用 UIKit 的 systemLayoutSizeFitting 获取真实高度（主线程），用 sizingCell（离屏）。
    private func measuredHeight(preferWidth w: CGFloat) -> CGFloat {
        guard Thread.isMainThread else { return cachedHeight }
        let cell = sizingCell
        _ = cell.byData(self.post, layoutMode: layoutMode)
        // 给一个足够大的高度承载约束（离屏，不会影响 UI）
        cell.bounds = CGRect(x: 0, y: 0, width: w, height: 10_000)
        cell.contentView.bounds = cell.bounds
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let target = CGSize(width: w, height: UIView.layoutFittingCompressedSize.height)
        let size = cell.contentView.systemLayoutSizeFitting(
            target,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        var h = size.height
        if h < 1 {
            h = cell.sizeThatFits(CGSize(width: w, height: CGFloat.greatestFiniteMagnitude)).height
        }
        if h < 1 {
            h = MomentPostCell.heightFormula(for: post, tableWidth: w)
        };return ceil(h + 0.5)
    }

    /// 初次展示的“安全最小高度”：尽量小，但不能小到把 UIKit 约束挤爆
    private func estimatedMinimumHeight(tableWidth w: CGFloat) -> CGFloat {
        var h: CGFloat = 88  // 比之前 120 更不容易产生空白，同时足够避免 44 的挤压
        let mediaCount = min(post.media.count, 9)
        if mediaCount > 0 {
            let spacing: CGFloat = 4
            let side = floor((w - 2 * spacing) / 3.0)
            let rows = Int(ceil(Double(mediaCount) / 3.0))
            let mediaH = CGFloat(rows) * side + CGFloat(max(0, rows - 1)) * spacing
            h += mediaH + 16
        }
        let commentCount = post.comments.count
        if commentCount > 0 {
            h += CGFloat(min(commentCount, 3)) * 22 + 16
        };return h
    }
    // MARK: - Force media grid to 3 columns (3*3)
    /// 返回：是否真的改动了 layout/约束（用于决定要不要触发高度重测）
    private func applyWeChat3x3MediaGridFixIfPossible(in cell: MomentPostCell) -> Bool {
        #if os(iOS) || os(tvOS)
        let mediaCount = min(post.media.count, 9)
        guard mediaCount > 0 else { return false }
        // 找 UICollectionView（媒体九宫格通常就是它）
        let collectionViews = cell.contentView.findSubviews(ofType: UICollectionView.self)
        guard let cv = collectionViews.max(by: { $0.bounds.width < $1.bounds.width }) else {
            return false
        }
        let w = cv.bounds.width
        guard w > 0 else { return false }
        // 避免每次 layout 都重复 setLayout
        if didApplyMediaGridFix, abs(w - lastGridWidth) < 0.5, (cv.collectionViewLayout is WeChatNineGridLayout) {
            return false
        }
        let spacing: CGFloat = 4
        // ✅ 强制换成“硬 3 列”layout（绕开 sizeForItemAt）
        if !(cv.collectionViewLayout is WeChatNineGridLayout) {
            cv.setCollectionViewLayout(WeChatNineGridLayout(columns: 3, spacing: spacing), animated: false)
        } else {
            cv.collectionViewLayout.invalidateLayout()
        }
        cv.byScrollEnabled(false)
            .byContentInset(.zero)
        cv.reloadData()
        cv.layoutIfNeeded()
        // 按 3 列算高度，并通过 MomentPostCell 内部的 SnapKit 约束入口更新
        let side = floor((w - 2 * spacing) / 3.0)
        let rows = Int(ceil(Double(mediaCount) / 3.0))
        let mediaHeight = CGFloat(rows) * side + CGFloat(max(0, rows - 1)) * spacing
        cell.byMediaHeight(mediaHeight)
        didApplyMediaGridFix = true
        lastGridWidth = w
        return true
        #else
        return false
        #endif
    }
}

// MARK: - UIView helpers
#if os(iOS) || os(tvOS)
private extension UIView {
    func findSubviews<T: UIView>(ofType type: T.Type) -> [T] {
        var result: [T] = []
        func dfs(_ v: UIView) {
            for s in v.subviews {
                if let t = s as? T { result.append(t) }
                dfs(s)
            }
        }
        dfs(self)
        return result
    }
}
#endif

#if os(iOS) || os(tvOS)
private final class WeChatNineGridLayout: UICollectionViewLayout {
    private let columns: Int
    private let spacing: CGFloat

    private var cache: [IndexPath: UICollectionViewLayoutAttributes] = [:]
    private var _contentSize: CGSize = .zero

    init(columns: Int = 3, spacing: CGFloat = 4) {
        self.columns = max(1, columns)
        self.spacing = max(0, spacing)
        super.init()
    }

    required init?(coder: NSCoder) {
        self.columns = 3
        self.spacing = 4
        super.init(coder: coder)
    }

    private func itemSide(for width: CGFloat) -> CGFloat {
        let totalSpacing = CGFloat(columns - 1) * spacing
        return floor((width - totalSpacing) / CGFloat(columns))
    }

    override func prepare() {
        super.prepare()
        guard let cv = collectionView else { return }
        cache.removeAll(keepingCapacity: true)
        let width = cv.bounds.width
        guard width > 0 else {
            _contentSize = .zero
            return
        }
        let side = itemSide(for: width)
        guard side > 0 else {
            _contentSize = .zero
            return
        }
        var flatIndex = 0
        for section in 0..<cv.numberOfSections {
            let items = cv.numberOfItems(inSection: section)
            for item in 0..<items {
                let row = flatIndex / columns
                let col = flatIndex % columns
                let x = CGFloat(col) * (side + spacing)
                let y = CGFloat(row) * (side + spacing)
                let frame = CGRect(x: x, y: y, width: side, height: side)
                let ip = IndexPath(item: item, section: section)
                let attr = UICollectionViewLayoutAttributes(forCellWith: ip)
                attr.frame = frame
                cache[ip] = attr
                flatIndex += 1
            }
        }
        let rows = Int(ceil(Double(flatIndex) / Double(columns)))
        let height: CGFloat
        if rows <= 0 {
            height = 0
        } else {
            height = CGFloat(rows) * side + CGFloat(rows - 1) * spacing
        }
        _contentSize = CGSize(width: width, height: height)
    }

    override var collectionViewContentSize: CGSize { _contentSize }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        cache.values.filter { $0.frame.intersects(rect) }
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        cache[indexPath]
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        true
    }
}
#endif

// MARK: - DSL (Chain Syntax)
extension MomentPostUIKitCellNode {
    @discardableResult
    func byOnNeedHeightUpdate(_ block: (() -> Void)?) -> Self {
        onNeedHeightUpdate = block
        return self
    }

    @discardableResult
    func byOnTapMedia(_ block: ((MomentPostUIKitCellNode, Int) -> Void)?) -> Self {
        onTapMedia = { [weak self] index in
            guard let self else { return }
            block?(self, index)
        };return self
    }

    @discardableResult
    func byOnToggleExpand(_ block: (() -> Void)?) -> Self {
        onToggleExpand = block
        return self
    }

    @discardableResult
    func byOnLikeTapped(_ block: (() -> Void)?) -> Self {
        onLikeTapped = block
        return self
    }

    @discardableResult
    func byOnCommentTapped(_ block: (() -> Void)?) -> Self {
        onCommentTapped = block
        return self
    }
}
