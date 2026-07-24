//
//  JobsWalletCardView.swift
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
import JobsSwiftBaseDefines
import SnapKit

public final class JobsWalletCardView: UIView {
    private enum Section: Int {
        case cards
        case addCard
    }

    public private(set) var cards: [JobsWalletCardModel] = []
    public private(set) var expansionMode: JobsWalletCardExpansionMode = .individual
    public private(set) var showsAddCard = true
    public private(set) var sectionTitle = "我的银行卡"
    public private(set) var sectionSubtitle = "点击银行卡，可展开查看"
    public private(set) var addSectionTitle = "更多操作"
    public private(set) var addCardTitle = "添加新的银行卡"
    private var selectCardBlock: ((JobsWalletCardModel, Int) -> Void)?
    private var addCardBlock: (() -> Void)?
    private lazy var walletLayout: JobsWalletCardLayout = {
        JobsWalletCardLayout()
            .byPadding(20)
            .byItemHeight(120)
            .byOverlap(14)
            .byExpandOffset(14)
            .byHeaderItemSpacing(10)
            .byExpansionMode(expansionMode)
            .byLayoutDelegate(self)
    }()
    private lazy var collectionView: UICollectionView = {
        UICollectionView(frame: .zero, collectionViewLayout: walletLayout)
            .byBackgroundColor(JobsCor.clear)
            .byShowsVerticalScrollIndicator(false)
            .byContentInset(UIEdgeInsets(top: 16, left: 0, bottom: 24, right: 0))
            .byRegisterCell(JobsWalletCardCell.self)
            .byRegisterCell(JobsWalletAddCardCell.self)
            .byDelegate(self)
            .byDataSource(self)
            .byRegisterSupplementaryView(
                JobsWalletSectionHeaderView.self,
                kind: UICollectionView.elementKindSectionHeader
            )
            .byAddTo(self) { make in
                make.edges.equalToSuperview()
            }
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        buildUI()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        buildUI()
    }

    private func buildUI() {
        self.byBackgroundColor(JobsCor.clear)
        collectionView.byVisible(true)
    }

    private func reload(resetExpansion: Bool) {
        if resetExpansion {
            walletLayout.collapse(animated: false)
        }
        collectionView.reloadData()
    }
}

public extension JobsWalletCardView {
    @discardableResult
    func byCards(_ cards: [JobsWalletCardModel]) -> Self {
        self.cards = cards
        reload(resetExpansion: true)
        return self
    }

    @discardableResult
    func byExpansionMode(_ mode: JobsWalletCardExpansionMode) -> Self {
        expansionMode = mode
        walletLayout.byExpansionMode(mode)
        collectionView.reloadData()
        return self
    }

    @discardableResult
    func byShowsAddCard(_ showsAddCard: Bool) -> Self {
        self.showsAddCard = showsAddCard
        reload(resetExpansion: true)
        return self
    }

    @discardableResult
    func bySectionTitle(_ title: String) -> Self {
        sectionTitle = title
        collectionView.reloadData()
        return self
    }

    @discardableResult
    func bySectionSubtitle(_ subtitle: String) -> Self {
        sectionSubtitle = subtitle
        collectionView.reloadData()
        return self
    }

    @discardableResult
    func byAddSectionTitle(_ title: String) -> Self {
        addSectionTitle = title
        collectionView.reloadData()
        return self
    }

    @discardableResult
    func byAddCardTitle(_ title: String) -> Self {
        addCardTitle = title
        collectionView.reloadData()
        return self
    }

    @discardableResult
    func onSelectCard(_ block: ((JobsWalletCardModel, Int) -> Void)?) -> Self {
        selectCardBlock = block
        return self
    }

    @discardableResult
    func onAddCard(_ block: (() -> Void)?) -> Self {
        addCardBlock = block
        return self
    }
}

extension JobsWalletCardView: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        showsAddCard ? 2 : 1
    }

    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }
        switch section {
        /// 银行卡区域按外部模型数量展示
        case .cards:
            return cards.count
        /// 添加银行卡区域只展示一个入口
        case .addCard:
            return 1
        }
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        switch section {
        /// 渲染银行卡
        case .cards:
            return collectionView
                .byDequeueCell(JobsWalletCardCell.self, for: indexPath)
                .byModel(cards[indexPath.item], highlighted: walletLayout.isActive(at: indexPath))
        /// 渲染添加银行卡入口
        case .addCard:
            return collectionView
                .byDequeueCell(JobsWalletAddCardCell.self, for: indexPath)
                .byTitle(addCardTitle)
        }
    }

    public func collectionView(_ collectionView: UICollectionView,
                               viewForSupplementaryElementOfKind kind: String,
                               at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let section = Section(rawValue: indexPath.section) else {
            return UICollectionReusableView()
        }
        let header = collectionView.byDequeueSupplementary(
            JobsWalletSectionHeaderView.self,
            kind: kind,
            for: indexPath
        )
        switch section {
        /// 银行卡区域展示主标题与交互提示
        case .cards:
            return header.byTitle(sectionTitle, subtitle: sectionSubtitle)
        /// 添加银行卡区域只展示操作标题
        case .addCard:
            return header.byTitle(addSectionTitle, subtitle: "")
        }
    }
}

extension JobsWalletCardView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let section = Section(rawValue: indexPath.section) else { return }
        switch section {
        /// 银行卡点击由布局根据模式统一管理开合
        case .cards:
            walletLayout.toggle(at: indexPath)
            collectionView.reloadData()
            selectCardBlock?(cards[indexPath.item], indexPath.item)
        /// 添加银行卡点击只向业务层回调
        case .addCard:
            addCardBlock?()
        }
    }
}

extension JobsWalletCardView: JobsWalletCardLayoutDelegate {
    public func collectionView(_ collectionView: UICollectionView,
                               reusableHeaderHeightFor section: Int) -> CGFloat {
        guard let section = Section(rawValue: section) else { return 0 }
        switch section {
        /// 银行卡区域沿用原 Demo 的紧凑 Header
        case .cards:
            return 30
        /// 添加银行卡区域保留完整标题高度
        case .addCard:
            return 45
        }
    }

    public func collectionView(_ collectionView: UICollectionView,
                               reusableFooterHeightFor section: Int) -> CGFloat {
        0
    }
}
