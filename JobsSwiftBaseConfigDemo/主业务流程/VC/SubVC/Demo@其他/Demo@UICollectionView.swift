//
//  Demo@UICollectionView.swift
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

import JobsToast
import JobsByUIKit
import JobsSwiftDSL
import JobsEmptyView
import JobsTextTools
import JobsInheritance
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

final class EmptyCollectionViewDemoVC: BaseVC {
    // ============================== 数据源 & 状态 ==============================
    // 竖向列表
    private var itemsV: [String] = []
    private var isPullRefreshingV = false
    private var isLoadingMoreV    = false
    // 横向列表
    private var itemsH: [String] = []
    private var isPullRefreshingH = false
    private var isLoadingMoreH    = false
    // ============================== UI：上面的【竖向】CollectionView ==============================
    private lazy var collectionViewV: UICollectionView = {
        UICollectionView(frame: .zero, collectionViewLayout:UICollectionViewFlowLayout()
            .byScrollDirection(.vertical)
            .byMinimumLineSpacing(10)
            .byMinimumInteritemSpacing(10)
            .bySectionInset(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)))
            .byBounces(true)
            .byAlwaysBounceVertical(true)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(UICollectionViewCell.self)
            .byBackgroundView(nil)
            .byDragInteractionEnabled(false)
            // 空态按钮
//            .byEmptyButtonProvider { [unowned self] in
//                UIButton.sys()
//                    .byTitle("暂无数据（竖向）".tr, for: .normal)
//                    .bySubTitle("点我填充示例数据".tr, for: .normal)
//                    .byImage("square.grid.2x2".sysImg, for: .normal)
//                    .byImagePlacement(.top)
//                    .onTap { [weak self] _ in
//                        guard let self else { return }
//                        addVData()
//                    }
//                    .byEmptyLayout { btn, make, host in
//                        make.centerX.equalTo(host)
//                        make.centerY.equalTo(host).offset(-40)
//                        make.leading.greaterThanOrEqualTo(host).offset(16)
//                        make.trailing.lessThanOrEqualTo(host).inset(16)
//                        make.width.lessThanOrEqualTo(host).multipliedBy(0.9)
//                    }
//            }
            .byEmptyViewProvider { [unowned self] in
                JobsEmptyView()
                    .byOnTapRetry { [weak self] in
                        "hello".tr.toast
                    }
            }
            .byEmptyViewLayout { emptyView, make, host in
                make.centerX.equalTo(host)
                make.centerY.equalTo(host).offset(-40)
                make.leading.greaterThanOrEqualTo(host).offset(16)
                make.trailing.lessThanOrEqualTo(host).inset(16)
                make.width.lessThanOrEqualTo(host).multipliedBy(0.9)
            }
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalToSuperview()
                }
                make.left.right.equalToSuperview()
                make.height.equalTo(view.snp.height).multipliedBy(0.55) // 上面占 55%
            }
    }()
    // ============================== UI：下面的【横向】CollectionView ==============================
    private lazy var collectionViewH: UICollectionView = {
        UICollectionView(frame: .zero, collectionViewLayout:UICollectionViewFlowLayout()
            .byScrollDirection(.horizontal)
            .byMinimumLineSpacing(12)
            .byMinimumInteritemSpacing(12)
            .bySectionInset(UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)))
            .byBounces(true)
            .byAlwaysBounceHorizontal(true)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(UICollectionViewCell.self)
            .byBackgroundView(nil)
            .byDragInteractionEnabled(false)
            // 空态按钮
            .byEmptyButtonProvider { [unowned self] in
                UIButton.sys()
                    .byTitle("暂无数据（横向）".tr, for: .normal)
                    .bySubTitle("点我填充示例数据".tr, for: .normal)
                    .byImage("rectangle.grid.1x2".sysImg, for: .normal)
                    .byImagePlacement(.top)
                    .onTap { [weak self] _ in
                        guard let self else { return }
                        addHData()
                    }
                    .byEmptyLayout { btn, make, host in
                        make.centerX.equalTo(host)
                        make.centerY.equalTo(host).offset(-20)
                        make.leading.greaterThanOrEqualTo(host).offset(16)
                        make.trailing.lessThanOrEqualTo(host).inset(16)
                        make.width.lessThanOrEqualTo(host).multipliedBy(0.9)
                    }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(collectionViewV.snp.bottom).offset(10)
                make.left.right.equalToSuperview()
                make.bottom.equalToSuperview().inset(10)               // 下面占余下空间，高度自适应
            }
    }()
    // ============================== 生命周期 ==============================
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(
            title: "UICollectionView@空态刷新".tr,
            rightButtons: [
                // 清空两个列表
                UIButton.sys()
                    .byImage("xmark.bin".sysImg, for: .normal)
                    .onTap { [weak self] _ in
                        guard let self else { return }
                        itemsV.removeAll(); itemsH.removeAll()
                        collectionViewV.byReloadData()
                        collectionViewH.byReloadData()
                        collectionViewV.byReloadEmptyViewAuto()
                        collectionViewH.byReloadEmptyViewAuto()
                    },
                // 追加两个列表
                UIButton.sys()
                    .byImage("plus".sysImg, for: .normal)
                    .onTap { [weak self] _ in
                        guard let self else { return }
                        addAllData()
                    }
            ]
        )
        // 布局：上竖向、下横向
        collectionViewV.reloadData()
        collectionViewH.reloadData()    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension EmptyCollectionViewDemoVC {
    // 追加两个列表@全部
    func addAllData() {
        addVData()
        addHData()
    }
    // 追加两个列表@竖向
    func addVData() {
        let bV = itemsV.count
        itemsV += (1...6).map { "Item \(bV + $0)" }
        collectionViewV.byReloadData()
        collectionViewV.byReloadEmptyViewAuto()
    }
    // 追加两个列表@横向
    func addHData() {
        let bH = itemsH.count
        itemsH += (1...5).map { "Card \(bH + $0)" }
        collectionViewH.byReloadData()
        collectionViewH.byReloadEmptyViewAuto()
    }
}
// MARK: - UICollectionViewDataSource
extension EmptyCollectionViewDemoVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if collectionView === collectionViewV { return itemsV.count };return itemsH.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.byDequeueCell(UICollectionViewCell.self, for: indexPath)
        let label: UILabel
        if let exist = cell.contentView.viewWithTag(1001) as? UILabel {
            label = exist
        } else {
            label = UILabel()
                .byNumberOfLines(1)
                .byTextAlignment(.center)
                .byFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
                .byTextColor(JobsCor.label)
                .byTag(1001)
                .byAddTo(cell.contentView) { make in
                    make.edges.equalToSuperview().inset(8)
                }
            cell.contentView
                .byBackgroundColor(JobsCor.secondarySystemBackground)
                .byCornerRadius(10)
                .byMasksToBounds(true)
        }
        if collectionView === collectionViewV {
            label.byText(itemsV[indexPath.item])
        } else {
            label.byText(itemsH[indexPath.item])
        };return cell
    }
}
// MARK: - UICollectionViewDelegate
extension EmptyCollectionViewDemoVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView === collectionViewV {
            print("✅[V] didSelect Item: \(indexPath.item)")
            _ = collectionViewV[section: 0, item: 3]
            _ = collectionViewV[section: 0, item: 300]
            print("")
        } else {
            print("✅[H] didSelect Item: \(indexPath.item)")
            _ = collectionViewH[section: 0, item: 3]
            _ = collectionViewH[section: 0, item: 300]
            print("")
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension EmptyCollectionViewDemoVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView === collectionViewV {
            // 竖向：两列网格
            guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
                return CGSize(width: 100, height: 64)
            }
            let inset = layout.sectionInset
            let spacing = layout.minimumInteritemSpacing
            let columns: CGFloat = 2
            let totalH = inset.left + inset.right + (columns - 1) * spacing
            let w = floor((collectionView.bounds.width - totalH) / columns)
            return CGSize(width: w, height: 64)
        } else {
            // 横向：卡片固定宽度，随高度自适应
            guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
                return CGSize(width: 120, height: 100)
            }
            let inset = layout.sectionInset
            let h = max(64, collectionView.bounds.height - inset.top - inset.bottom)
            return CGSize(width: 120, height: h - 6) // 轻微留白
        }
    }
}
