//
//  JobsWalletCardLayout.swift
//  JobsWalletCard
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit

public final class JobsWalletCardLayout: UICollectionViewLayout {
    public weak var layoutDelegate: JobsWalletCardLayoutDelegate?
    public private(set) var expansionMode: JobsWalletCardExpansionMode = .individual
    public private(set) var expandedIndexPath: IndexPath?
    public private(set) var isExpanded = false
    public private(set) var padding: CGFloat = 16
    public private(set) var itemHeight: CGFloat = 76
    public private(set) var overlap: CGFloat = 10
    public private(set) var expandOffset: CGFloat = 10
    public private(set) var headerItemSpacing: CGFloat = 0
    private var cachedAttributes: [UICollectionViewLayoutAttributes] = []
    private var contentHeight: CGFloat = 0

    public override init() {
        super.init()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public func toggle(at indexPath: IndexPath, animated: Bool = true) {
        updateState({
            switch self.expansionMode {
            /// 单卡模式只撑开当前卡片与下一张卡片之间的间距
            case .individual:
                guard let collectionView = self.collectionView,
                      indexPath.item < collectionView.numberOfItems(inSection: indexPath.section) - 1 else {
                    self.expandedIndexPath = nil
                    self.isExpanded = false
                    return
                }
                if self.expandedIndexPath == indexPath {
                    self.expandedIndexPath = nil
                    self.isExpanded = false
                } else {
                    self.expandedIndexPath = indexPath
                    self.isExpanded = true
                }
            /// 全部模式由任意卡片统一切换全部开合状态
            case .all:
                self.isExpanded.toggle()
                self.expandedIndexPath = self.isExpanded ? indexPath : nil
            }
        }, animated: animated)
    }

    public func collapse(animated: Bool = true) {
        guard isExpanded || expandedIndexPath != nil else { return }
        updateState({
            self.expandedIndexPath = nil
            self.isExpanded = false
        }, animated: animated)
    }

    public func isActive(at indexPath: IndexPath) -> Bool {
        isExpanded && expandedIndexPath == indexPath
    }

    private func updateState(_ changes: @escaping () -> Void, animated: Bool) {
        guard let collectionView else {
            changes()
            invalidateLayout()
            return
        }
        let animations = {
            changes()
            self.invalidateLayout()
            collectionView.layoutIfNeeded()
        }
        guard animated, collectionView.window != nil else {
            changes()
            invalidateLayout()
            return
        }
        UIView.jobsTransition(
            with: collectionView,
            duration: 0.25,
            options: .transitionCrossDissolve,
            animations: animations
        )
    }

    private func shouldExpandGap(before indexPath: IndexPath) -> Bool {
        guard isExpanded, indexPath.item > 0 else { return false }
        switch expansionMode {
        /// 单卡模式只展开激活卡片后面的一个间距
        case .individual:
            guard let expandedIndexPath else { return false };return expandedIndexPath.section == indexPath.section &&
                expandedIndexPath.item + 1 == indexPath.item
        /// 全部模式展开所有卡片之间的间距
        case .all:
            return true
        }
    }

    public override func prepare() {
        super.prepare()
        guard let collectionView else { return }
        cachedAttributes.removeAll()
        contentHeight = 0
        let width = collectionView.bounds.width
        var yOffset: CGFloat = 0
        let numberOfSections = collectionView.numberOfSections
        for section in 0..<numberOfSections {
            let headerHeight = layoutDelegate?
                .collectionView(collectionView, reusableHeaderHeightFor: section) ?? 0
            if headerHeight > 0 {
                let indexPath = IndexPath(item: 0, section: section)
                let attributes = UICollectionViewLayoutAttributes(
                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                    with: indexPath
                )
                attributes.frame = CGRect(
                    x: 0,
                    y: yOffset,
                    width: width,
                    height: headerHeight
                )
                cachedAttributes.append(attributes)
                yOffset = attributes.frame.maxY + headerItemSpacing
            }
            let itemCount = collectionView.numberOfItems(inSection: section)
            for item in 0..<itemCount {
                let indexPath = IndexPath(item: item, section: section)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.zIndex = item * 2
                let itemSize = CGSize(width: width - 2 * padding, height: itemHeight)
                let gapAdjustment: CGFloat
                if item == 0 {
                    gapAdjustment = 0
                } else if shouldExpandGap(before: indexPath) {
                    gapAdjustment = -expandOffset
                } else {
                    gapAdjustment = overlap
                }
                attributes.frame = CGRect(
                    origin: CGPoint(x: padding, y: yOffset - gapAdjustment),
                    size: itemSize
                )
                cachedAttributes.append(attributes)
                yOffset = attributes.frame.maxY
            }
            let footerHeight = layoutDelegate?
                .collectionView(collectionView, reusableFooterHeightFor: section) ?? 0
            if footerHeight > 0 {
                let indexPath = IndexPath(item: max(0, itemCount - 1), section: section)
                let attributes = UICollectionViewLayoutAttributes(
                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                    with: indexPath
                )
                attributes.frame = CGRect(
                    x: 0,
                    y: yOffset,
                    width: width,
                    height: footerHeight
                )
                cachedAttributes.append(attributes)
                yOffset = attributes.frame.maxY
            }
        };contentHeight = yOffset + collectionView.adjustedContentInset.bottom + 8
    }

    public override var collectionViewContentSize: CGSize {
        CGSize(width: collectionView?.bounds.width ?? 0, height: contentHeight)
    }

    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        cachedAttributes.filter { $0.frame.intersects(rect) }
    }

    public override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        cachedAttributes.first {
            $0.representedElementCategory == .cell && $0.indexPath == indexPath
        }
    }

    public override func layoutAttributesForSupplementaryView(ofKind elementKind: String,
                                                               at indexPath: IndexPath)
    -> UICollectionViewLayoutAttributes? {
        cachedAttributes.first {
            $0.representedElementKind == elementKind && $0.indexPath == indexPath
        }
    }

    public override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView else { return true };return abs(newBounds.width - collectionView.bounds.width) > 0.5
    }
}

public extension JobsWalletCardLayout {
    @discardableResult
    func byExpansionMode(_ mode: JobsWalletCardExpansionMode) -> Self {
        guard expansionMode != mode else { return self }
        expansionMode = mode
        expandedIndexPath = nil
        isExpanded = false
        invalidateLayout()
        return self
    }

    @discardableResult
    func byPadding(_ value: CGFloat) -> Self {
        padding = value
        return self
    }

    @discardableResult
    func byItemHeight(_ value: CGFloat) -> Self {
        itemHeight = value
        return self
    }

    @discardableResult
    func byOverlap(_ value: CGFloat) -> Self {
        overlap = value
        return self
    }

    @discardableResult
    func byExpandOffset(_ value: CGFloat) -> Self {
        expandOffset = value
        return self
    }

    @discardableResult
    func byHeaderItemSpacing(_ value: CGFloat) -> Self {
        headerItemSpacing = value
        return self
    }

    @discardableResult
    func byLayoutDelegate(_ delegate: JobsWalletCardLayoutDelegate?) -> Self {
        layoutDelegate = delegate
        return self
    }

    @discardableResult
    func byConfig(_ block: (JobsWalletCardLayout) -> Void) -> Self {
        block(self)
        return self
    }
}
