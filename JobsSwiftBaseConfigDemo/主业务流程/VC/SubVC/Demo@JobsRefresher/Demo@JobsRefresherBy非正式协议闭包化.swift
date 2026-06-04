//
//  Demo@JobsRefresherBy非正式协议闭包化.swift
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
import JobsRefresher
import JobsBy3rdTools
import JobsInheritance
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift
/// 上：横向侧拉（Left/Right）
/// 下：纵向下拉/上拉（Header/Footer）

final class JobsRefresherBy非正式协议闭包化DemoVC: BaseVC {
    private let topHeight: CGFloat = 180
    private var hItems = 18
    private var rows = 20
    private lazy var collectionView: UICollectionView = {
        UICollectionView(frame: .zero, collectionViewLayout:UICollectionViewFlowLayout()
            .byScrollDirection(.horizontal)
            .byMinimumLineSpacing(12)
            .byMinimumInteritemSpacing(12)
            .bySectionInset(UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12))
            .byItemSize(CGSize(width: 120, height: 156)))
            .byRegisterCell(HCell.self)
            .byBackgroundView(nil)
            .byShowsHorizontalScrollIndicator(false)
            .byAlwaysBounceHorizontal(true)
            // 非正式协议闭包化
            .byTarget(self)
            .numberOfItemsInSection { [weak self] (obj: AnyObject, cv: UICollectionView, section: Int) -> Int in
                self?.hItems ?? 0
            }
            .cellForItemAt { _, cv, indexPath in
                cv
                    .byDequeueCell(HCell.self, for: indexPath)
                    .byData(indexPath.item)
                    .onResult { _ in }
            }
            .didSelectItemAt({ obj, cv, idx in
                cv.deselectItem(at: idx, animated: true)
                "点选逻辑".toast
            })

            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview()
                make.height.equalTo(topHeight)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
            .setLeftLottie(.custom(.init(animationName: "9squares_AlBoardman")))
            .setRightLottie(.inherit)
            .enableRefreshHaptics(true)
            .setRefreshSound("Sound.wav")
            .bySideRefresh(with: JobsDefaultLeftRefresher(),
                               container: self,
                               at: .left,
                               trigger: 70) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { _ in
                    try? await Task.sleep(nanoseconds: 900_000_000)
                    self.hItems = max(8, self.hItems - 1)
                    self.collectionView.byReloadData()
                    self.collectionView.switchSideRefresh(.left, to: .normal)
                }
            }
            .bySideRefresh(with: JobsDefaultRightRefresher(),
                               container: self,
                               at: .right,
                               trigger: 70) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { _ in
                    try? await Task.sleep(nanoseconds: 900_000_000)
                    self.hItems += 3
                    self.collectionView.byReloadData()
                    self.collectionView.switchSideRefresh(.right, to: .normal)
                }
            }

    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byRowHeight(52)
            .byTableFooterView(UIView())
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(collectionView.snp.bottom)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            }
            // 非正式协议闭包化
            .byTarget(self)
            .numberOfRowsInSection { [weak self] (obj: AnyObject, tv: UITableView, section: Int) -> Int in
                self?.rows ?? 0
            }
            .cellForRowAt { _, tv, indexPath in
                let c = tv.dequeueReusableCell(withIdentifier: "cell") ??
                        UITableViewCell(style: .default, reuseIdentifier: "cell")
                var cfg = c.defaultContentConfiguration()
                cfg.text = "Row \(indexPath.row)"
                c.contentConfiguration = cfg
                return c
            }
            .didSelectRowAt { _, tv, indexPath in
                tv.deselectRow(at: indexPath, animated: true)
                "点选逻辑".toast
            }

            .showRefreshHeaderInfo(YES)
            .showRefreshFooterInfo(NO)
            .setHeaderLottie(.custom(.init(animationName: "LottieLogo1")))
            .setFooterLottie(.disabled)
            .enableRefreshHaptics(true)
            .setRefreshSound("Sound.wav")
            .byRefreshHeader(component: JobsDefaultHeader(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { _ in
                    try? await Task.sleep(nanoseconds: 1_000_000_000)
                    self.rows = 20
                    self.tableView.byReloadData()
                    self.tableView.switchRefreshHeader(to: .normal)
                    self.tableView.switchRefreshFooter(to: .normal)
                }
            }
            .byRefreshFooter(component: JobsDefaultFooter(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { _ in
                    try? await Task.sleep(nanoseconds: 1_000_000_000)
                    if self.rows < 60 {
                        self.rows += 20
                        self.tableView.byReloadData()
                        self.tableView.switchRefreshFooter(to: .normal)
                    } else {
                        self.tableView.switchRefreshFooter(to: .noMoreData)
                    }
                }
            }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "演示：非正式协议闭包化".tr)
        view.backgroundColor = .systemBackground
        collectionView.byVisible(YES)
        tableView.byVisible(YES)
    }
}
