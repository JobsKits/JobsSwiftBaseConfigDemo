//
//  Demo@钱包卡片效果.swift
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

import SnapKit
import GKNavigationBarSwift
import JobsScale
import JobsToast
import JobsByUIKit
import JobsTextTools
import JobsInheritance
import JobsSwiftBaseDefines
// MARK: - 数据模型
struct WalletCard {
    let bankName: String
    let lastDigits: String
    let holder: String
    let brand: String
    let gradientColors: [UIColor]
}

enum WalletItem {
    case card(WalletCard)
    case addNew
}

final class JobsWalletDemoVC: BaseVC {
    private let horizontalInset: CGFloat = 0
    private lazy var collectionView: UICollectionView = {
        UICollectionView(frame: .zero, collectionViewLayout: WalletLayout()
            .byPadding(20)
            .byItemHeight(120)
            .byOverlap(14)
            .byExpandOffset(14)
            .byLayoutDelegate(self))
            .byBackgroundColor(.clear)
            .byShowsVerticalScrollIndicator(NO)
            .byContentInset(UIEdgeInsets(top: 16.h, left: 0.w, bottom: 24.h, right: 0.w))
            .byRegisterCell(WalletCardCell.self)
            .byRegisterCell(WalletAddCardCell.self)
            .byDelegate(self)
            .byDataSource(self)
            .byRegisterSupplementaryView(WalletSectionHeaderView.self,kind: UICollectionView.elementKindSectionHeader)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom)
                make.left.equalToSuperview().offset(self.horizontalInset)
                make.right.equalToSuperview().inset(self.horizontalInset)
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }()

    private var sections: [[WalletItem]] = [[
        .card(WalletCard(bankName: "上海银行".tr,
                         lastDigits: "7895",
                         holder: "Jobs",
                         brand: "VISA",
                         gradientColors: [.systemPurple, .systemBlue])),
        .card(WalletCard(bankName: "国泰世华".tr,
                         lastDigits: "2345",
                         holder: "Jobs",
                         brand: "Mastercard",
                         gradientColors: [.systemPink, .systemOrange])),
        .card(WalletCard(bankName: "台湾银行".tr,
                         lastDigits: "7654",
                         holder: "Jobs",
                         brand: "VISA",
                         gradientColors: [.systemTeal, .systemBlue])),
        .card(WalletCard(bankName: "嘉华银行".tr,
                         lastDigits: "2345",
                         holder: "Jobs",
                         brand: "UnionPay",
                         gradientColors: [.systemIndigo, .systemTeal])),
        .card(WalletCard(bankName: "包头银行".tr,
                         lastDigits: "7654",
                         holder: "Jobs",
                         brand: "Debit",
                         gradientColors: [.systemGreen, .systemTeal])),
        .card(WalletCard(bankName: "成都银行".tr,
                         lastDigits: "2345",
                         holder: "Jobs",
                         brand: "Credit",
                         gradientColors: [.systemRed, .systemOrange])),
        .card(WalletCard(bankName: "南充商业银行".tr,
                         lastDigits: "7654",
                         holder: "Jobs",
                         brand: "VISA",
                         gradientColors: [.systemBlue, .systemGreen]))
    ],[.addNew]]
    private var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGroupedBackground
        jobsSetupGKNav(
            title: "钱包卡片效果".tr
        )
        // 触发 collectionView 懒加载 + 布局
        collectionView.byVisible(YES)
        collectionView.reloadData()
    }
}
// MARK: - UICollectionViewDataSource
extension JobsWalletDemoVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section][indexPath.item] {
        case .card(let card):
            let isSelected = (selectedIndexPath == indexPath)
            return collectionView
                .byDequeueCell(WalletCardCell.self, for: indexPath)
                .byData(card, isSelected)

        case .addNew:
            return collectionView
                .byDequeueCell(WalletAddCardCell.self, for: indexPath)
                .byData(nil)
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }

        let header: WalletSectionHeaderView =
            collectionView.byDequeueSupplementary(WalletSectionHeaderView.self,
                                               kind: kind,
                                               for: indexPath)
        if indexPath.section == 0 {
            header.configure(title: "我的银行卡".tr)
        } else {
            header.configure(title: "更多操作".tr)
        };return header
    }
}
// MARK: - UICollectionViewDelegate
extension JobsWalletDemoVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch sections[indexPath.section][indexPath.item] {
        case .card:
            // 仿 OC：最后一张 / 其他 section 不展开
            let isLastInSection = indexPath.item ==
                (collectionView.numberOfItems(inSection: indexPath.section) - 1)
            let allowExpand = !isLastInSection && indexPath.section == 0
            if allowExpand {
                if selectedIndexPath == indexPath {
                    selectedIndexPath = nil
                } else {
                    selectedIndexPath = indexPath
                }
            } else {
                selectedIndexPath = nil
            }
            (collectionView.collectionViewLayout as! WalletLayout).animateToggle(at: indexPath, allowExpand: allowExpand)
            collectionView.reloadData()
        case .addNew:
            // 这里接自己的跳转绑卡页面逻辑
            "📇 点击添加新的银行卡".toast
        }
    }
}
// MARK: - WalletLayoutDelegate
extension JobsWalletDemoVC: WalletLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        reusableHeaderHeightFor section: Int) -> CGFloat {
        if section == sections.count - 1 {
            return 45
        };return 30
    }

    func collectionView(_ collectionView: UICollectionView,
                        reusableFooterHeightFor section: Int) -> CGFloat {
        return 0
    }
}
