//
//  Demo@按钮完全盖在UICollectionViewCell上.swift
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
import JobsTextTools
import JobsSwiftRefresher
import JobsBy3rdTools
import JobsInheritance
import JobsSwiftBaseDefines
import GKNavigationBarSwift
import SnapKit

final class BtnFullOnCVCellDemoVC: BaseVC {
    private var items: [JobsBtnCellModel] = []
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        UICollectionViewFlowLayout()
            .byScrollDirection(.vertical)
            .byMinimumLineSpacing(10)
            .byMinimumInteritemSpacing(10)
            .bySectionInset(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
    }()
    private lazy var collectionView: UICollectionView = {
        UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(SDBtnCVCell.self)
            .byRegisterCell(KFBtnCVCell.self)
            .byBackgroundView(nil)
            .byDragInteractionEnabled(false)
            // 空态按钮
            .byEmptyButtonProvider { [unowned self] in
                UIButton.sys()
                    .byTitle("暂无数据", for: .normal)
                    .bySubTitle("点我填充示例数据", for: .normal)
                    .byImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
                    .byImagePlacement(.top)
                    .onTap { [weak self] _ in
                        guard let self else { return }
                        self.items = self.makeMockItems(count: 12)
                        self.collectionView.byReloadData()
                    }
                    .byEmptyLayout { btn, make, host in
                        make.centerX.equalTo(host)
                        make.centerY.equalTo(host).offset(-40)
                        make.leading.greaterThanOrEqualTo(host).offset(16)
                        make.trailing.lessThanOrEqualTo(host).inset(16)
                        make.width.lessThanOrEqualTo(host).multipliedBy(0.9)
                    }
            }
            // 下拉刷新
            .byRefreshHeader(component: JobsDefaultHeader(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { vc in
                    self.items = self.makeMockItems(count: 12)
                    self.collectionView.byReloadData()
                    self.collectionView.switchRefreshHeader(to: .normal)
                    self.collectionView.switchRefreshFooter(to: .normal)
                }
            }
            // 上拉加载
            .byRefreshFooter(component: JobsDefaultFooter(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { vc in
                    if self.items.count < 60 {
                        self.items.append(contentsOf: self.makeMockItems(count: 12, startAt: self.items.count + 1))
                        self.collectionView.byReloadData()
                        self.collectionView.switchRefreshFooter(to: .normal)
                    } else {
                        self.collectionView.switchRefreshFooter(to: .noMoreData)
                    }
                }
            }
            // SnapKit 约束写在 byAddTo 里
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                    make.left.right.bottom.equalToSuperview()
                } else {
                    make.edges.equalToSuperview()
                }
            }
    }()
    /// LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.92)
        jobsSetupGKNav(title: "按钮完全盖在UICollectionViewCell上")
        collectionView.byReloadData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 3 列网格（贴近截图）
        let columns: CGFloat = 3
        let inset = flowLayout.sectionInset
        let spacing = flowLayout.minimumInteritemSpacing
        let w = collectionView.bounds.width
        let total = inset.left + inset.right + (columns - 1) * spacing
        let itemW = floor((w - total) / columns)
        flowLayout.itemSize = CGSize(width: itemW, height: 118)
    }
}

extension BtnFullOnCVCellDemoVC : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView
            // .byDequeueCell(SDBtnCVCell.self, for: indexPath)
            .byDequeueCell(KFBtnCVCell.self, for: indexPath)
            .byData(items[indexPath.item], indexPath.item)
            .onResult { _ in }
    }
}

extension BtnFullOnCVCellDemoVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        "✅ 点击了👉UICollectionViewCell: \(indexPath.item)".toast
        // 演示：点击 Cell 后切换“拥有/未拥有”
//        items[indexPath.item] = .init(
//            title: items[indexPath.item].title,
//            subTitle: items[indexPath.item].subTitle,
//            selected: !items[indexPath.item].selected
//        )
//
//        // 让 Cell 重绘选中态（同时驱动 coverButton.selected）
//        collectionView.reloadItems(at: [indexPath])
//        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension BtnFullOnCVCellDemoVC : UICollectionViewDelegateFlowLayout {}

extension BtnFullOnCVCellDemoVC {
    
    private func makeMockItems(count: Int, startAt: Int = 1) -> [JobsBtnCellModel] {
        let titles = ["贵族勋章", "超级会员", "专属皮肤", "聊天气泡", "进场特效", "昵称边框"]
        return (0..<count).map { i in
            let idx = startAt + i
            return JobsBtnCellModel(
                title: titles[idx % titles.count],
                titleCor:.red,
                subTitle: "发言时聊天专属皮肤",
                subTitleCor: .blue,
                imageURL:"https://picsum.photos/200",
                bgImageURL:"https://picsum.photos/300",
                selected: NO,
                userInteractionEnabled:NO,
                enabled: YES
            )
        }
    }
}
