//
//  JobsRefresherDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 10/31/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import JobsInheritance
import JobsByUIKit
import JobsBy3rdTools
import JobsSwiftBaseDefines
import JobsRefresher
import GKNavigationBarSwift
/// 上：横向侧拉（Left/Right）
/// 下：纵向下拉/上拉（Header/Footer）
final class JobsRefresherDemoVC: BaseVC {
    private let topHeight: CGFloat = 180
    private var hItems = 18              // 顶部横向卡片数量
    private var rows = 20                // 底部纵向行数
    
    private lazy var hLayout: UICollectionViewFlowLayout = {
        UICollectionViewFlowLayout()
            .byScrollDirection(.horizontal)
            .byMinimumLineSpacing(12)
            .byMinimumInteritemSpacing(12)
            .bySectionInset(UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12))
            .byItemSize(CGSize(width: 120, height: 156))
    }()

    private lazy var topCollectionView: UICollectionView = {
        UICollectionView(frame: .zero, collectionViewLayout: hLayout)
           .byDataSource(self)
           .byDelegate(self)
           .registerCell(HCell.self)
           .byBackgroundView(nil)
           .byShowsHorizontalScrollIndicator(false)
           .byAlwaysBounceHorizontal(true)// 即使不满一屏也允许左右拉
           .byAddTo(view) { [unowned self] make in
               make.left.right.equalToSuperview()
               make.height.equalTo(topHeight)
               if view.jobs_hasVisibleTopBar() {
                   make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
               } else {
                   make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
               }
           }
           // 左侧拉：比如“上一页/回退”
           .configSideRefresh(with: JobsDefaultLeftRefresher(),
                              container: self,
                              at: .left,
                              trigger: 70) { [weak self] in
               guard let self else { return }
               jobsRunOnMain(self) { vc in
                   try? await Task.sleep(nanoseconds: 900_000_000)
                   // 模拟“刷新完成”：减少一个 item 并刷新
                   self.hItems = max(8, self.hItems - 1)
                   self.topCollectionView.byReloadData()
                   self.topCollectionView.switchSideRefresh(.left, to: .normal)
               }
           }
           // 右侧拉：比如“下一页/加载更多卡片”
           .configSideRefresh(with: JobsDefaultRightRefresher(),
                              container: self,
                              at: .right,
                              trigger: 70) { [weak self] in
               guard let self else { return }
               jobsRunOnMain(self) { vc in
                   try? await Task.sleep(nanoseconds: 900_000_000)
                   self.hItems += 3
                   self.topCollectionView.byReloadData()
                   self.topCollectionView.switchSideRefresh(.right, to: .normal)
               }
           }
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byRowHeight(52)
            .byTableFooterView(UIView())
            .byDataSource(self)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(topCollectionView.snp.bottom)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            }
            // 下拉刷新 Header
            .configRefreshHeader(component: JobsDefaultHeader(),
                                 container: self,
                                 trigger: 66) { [weak self] in
                guard let self else { return }
                jobsRunOnMain(self) { vc in
                    try? await Task.sleep(nanoseconds: 1_000_000_000)
                    self.rows = 20
                    self.tableView.byReloadData()
                    self.tableView.switchRefreshHeader(to: .normal)
                    self.tableView.switchRefreshFooter(to: .normal) // 复位“无更多”
                }
            }
            // 上拉加载 Footer
            .configRefreshFooter(component: JobsDefaultFooter(),
                                 container: self,
                                 trigger: 66) { [weak self] in
                guard let self else { return }
                jobsRunOnMain(self) { vc in
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
}
// MARK: - Life Cycle
extension JobsRefresherDemoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "刷新控件".tr)
        view.backgroundColor = .systemBackground
        topCollectionView.byVisible(YES)
        tableView.byVisible(YES)
    }
}
// MARK: - UITableViewDataSource
extension JobsRefresherDemoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { rows }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = tableView.dequeueReusableCell(withIdentifier: "cell") ??
                UITableViewCell(style: .default, reuseIdentifier: "cell")
        var cfg = c.defaultContentConfiguration()
        cfg.text = "Row \(indexPath.row)"
        c.contentConfiguration = cfg
        return c
    }
}
// MARK: - UICollectionViewDataSource
extension JobsRefresherDemoVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int { hItems }
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView
            .dequeueCell(HCell.self, for: indexPath)
            .byData(indexPath.item)
            .onResult { _ in

            }
    }
}
// MARK: - UICollectionViewDelegateFlowLayout (可选扩展)
extension JobsRefresherDemoVC: UICollectionViewDelegateFlowLayout { }

