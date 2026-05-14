//
//  Demo@RxDataSources.swift
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
import RxSwift
import RxCocoa
import RxDataSources
import GKNavigationBarSwift
import JobsSwiftBaseDefines
import JobsInheritance
import JobsByUIKit
import JobsBy3rdTools
import JobsTextTools
import JobsRefresher

final class RxDataSourcesDemoVC: BaseVC {
    // MARK: - Data
    private typealias TVSection = SectionModel<String, String>
    private typealias CVSection = SectionModel<String, String>

    private let bag = DisposeBag()
    private let tableRelay = BehaviorRelay<[TVSection]>(value: [])
    private let collectionRelay = BehaviorRelay<[CVSection]>(value: [])
    private var rows: Int = 0
    // MARK: - UI
    private lazy var seg: UISegmentedControl = {
        UISegmentedControl(items: ["Table".tr, "Collection".tr])
            .bySelectedSegmentIndex(0)
    }()

    // ============================== TableView ==============================
    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            // ⚠️ 不要 .byDataSource(self)（RxDataSources 会接管 dataSource）
            .byDelegate(self)
            .byRegisterCell(BaseTableViewCellByDefault.self)
            .byNoContentInsetAdjustment()
            .bySeparatorStyle(.singleLine)
            .byNoSectionHeaderTopPadding()
            .byContentInsetTop(8)
            .byEmptyButtonProvider { [unowned self] in
                UIButton(type: .system)
                    .byTitle("暂无数据".tr, for: .normal)
                    .bySubTitle("点我填充示例数据".tr, for: .normal)
                    .byImage("tray".sysImg, for: .normal)
                    .byImagePlacement(.top)
                    .onTap { [weak self] _ in
                        self?.fillTableDemoData(count: 10)
                    }
                    .byEmptyLayout { _, make, host in
                        make.centerX.equalTo(host)
                        make.centerY.equalTo(host).offset(-40)
                        make.leading.greaterThanOrEqualTo(host).offset(16)
                        make.trailing.lessThanOrEqualTo(host).inset(16)
                        make.width.lessThanOrEqualTo(host).multipliedBy(0.9)
                    }
            }
            .byRefreshHeader(component: JobsDefaultHeader(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { vc in
                    try? await Task.sleep(nanoseconds: 800_000_000)
                    self.rows = 20
                    self.fillTableDemoData(count: self.rows)
                    self.tableView.switchRefreshHeader(to: .normal)
                    self.tableView.switchRefreshFooter(to: .normal)
                }
            }
            .byRefreshFooter(component: JobsDefaultFooter(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { vc in
                    try? await Task.sleep(nanoseconds: 800_000_000)
                    if self.rows < 60 {
                        self.rows += 20
                        self.fillTableDemoData(count: self.rows)
                        self.tableView.switchRefreshFooter(to: .normal)
                    } else {
                        self.tableView.switchRefreshFooter(to: .noMoreData)
                    }
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(seg.snp.bottom).offset(10)
                make.left.right.bottom.equalToSuperview()
            }
            .byVisible(true) // 初始显示 Table
    }()

    // ============================== Collection Layout ==============================
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        UICollectionViewFlowLayout()
            .byScrollDirection(.vertical)
            .byMinimumLineSpacing(10)
            .byMinimumInteritemSpacing(10)
            .bySectionInset(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
    }()

    // ============================== CollectionView ==============================
    private lazy var collectionView: UICollectionView = {
        UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
            // ⚠️ 不要 .byDataSource(self)（RxDataSources 会接管 dataSource）
            .byDelegate(self)
            .byRegisterCell(HCell.self)
            .byBackgroundView(nil)
            .byDragInteractionEnabled(false)
            .byContentInsetTop(8)
            .byEmptyButtonProvider { [unowned self] in
                UIButton.sys()
                    .byTitle("暂无数据", for: .normal)
                    .bySubTitle("点我填充示例数据", for: .normal)
                    .byImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
                    .byImagePlacement(.top)
                    .onTap { [weak self] _ in
                        self?.fillCollectionDemoData(count: 12)
                    }
                    .byEmptyLayout { _, make, host in
                        make.centerX.equalTo(host)
                        make.centerY.equalTo(host).offset(-40)
                        make.leading.greaterThanOrEqualTo(host).offset(16)
                        make.trailing.lessThanOrEqualTo(host).inset(16)
                        make.width.lessThanOrEqualTo(host).multipliedBy(0.9)
                    }
            }
            .byRefreshHeader(component: JobsDefaultHeader(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { vc in
                    try? await Task.sleep(nanoseconds: 800_000_000)
                    self.rows = 20
                    self.fillCollectionDemoData(count: self.rows)
                    self.collectionView.switchRefreshHeader(to: .normal)
                    self.collectionView.switchRefreshFooter(to: .normal)
                }
            }
            .byRefreshFooter(component: JobsDefaultFooter(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { vc in
                    try? await Task.sleep(nanoseconds: 800_000_000)
                    if self.rows < 60 {
                        self.rows += 20
                        self.fillCollectionDemoData(count: self.rows)
                        self.collectionView.switchRefreshFooter(to: .normal)
                    } else {
                        self.collectionView.switchRefreshFooter(to: .noMoreData)
                    }
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(seg.snp.bottom).offset(10)
                make.left.right.bottom.equalToSuperview()
            }
            .byVisible(false) // 初始隐藏 Collection
    }()

    // MARK: - RxDataSources
    private lazy var tableDataSource: RxTableViewSectionedReloadDataSource<TVSection> = {
        .init(
            configureCell: { _, tv, indexPath, item in
                tv.byDequeueReusableCell(withType: BaseTableViewCellByDefault.self,for: indexPath)
                    .byData(item)
                    .onResult { _ in }
            },
            titleForHeaderInSection: { ds, idx in
                ds.sectionModels[idx].model
            }
        )
    }()

    private lazy var collectionDataSource: RxCollectionViewSectionedReloadDataSource<CVSection> = {
        .init(
            configureCell: { _, cv, indexPath, item in
                cv.byDequeueCell(HCell.self, for: indexPath)
                    .byData(item)
                    .onResult { _ in }
            }
        )
    }()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "RxDataSources Demo")
        view.backgroundColor = .systemBackground
        seg.byAddTo(view) { [unowned self] make in
            if view.jobs_hasVisibleTopBar() {
                make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().inset(16)
                make.height.equalTo(32)
            } else {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().inset(16)
                make.height.equalTo(32)
            }
        }

        bindUI()
        bindData()
    }
    // MARK: - Bindings
    private func bindUI() {
        // ✅ delegate 用 Rx 方式接管（避免你链式封装内部 setDelegate 时机不确定）
        tableView.rx.setDelegate(self).disposed(by: bag)
        collectionView.rx.setDelegate(self).disposed(by: bag)

        // seg 切换：外层用 byVisible(true/false) 唤醒
        seg.rx.selectedSegmentIndex
            .distinctUntilChanged()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] idx in
                guard let self else { return }
                let showTable = (idx == 0)
                self.tableView.byVisible(showTable)
                self.collectionView.byVisible(!showTable)
            })
            .disposed(by: bag)

        // 点击事件（table/collection 都演示）
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
                print("✅ table didSelect: \(indexPath)")
            })
            .disposed(by: bag)

        collectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.collectionView.deselectItem(at: indexPath, animated: true)
                print("✅ collection didSelect: \(indexPath)")
            })
            .disposed(by: bag)
    }

    private func bindData() {
        tableRelay
            .asObservable()
            .bind(to: tableView.rx.items(dataSource: tableDataSource))
            .disposed(by: bag)

        collectionRelay
            .asObservable()
            .bind(to: collectionView.rx.items(dataSource: collectionDataSource))
            .disposed(by: bag)
    }

    // MARK: - Demo Data
    private func fillTableDemoData(count: Int) {
        let items = (1...count).map { "Row \($0)" }
        let sections: [TVSection] = [
            TVSection(model: "Section A", items: Array(items.prefix(count / 2))),
            TVSection(model: "Section B", items: Array(items.suffix(max(0, count - count / 2))))
        ]
        tableRelay.accept(sections)

        // ⚠️ 空态/刷新状态依赖 reload 的话就补这一句
        tableView.byReloadData()
    }

    private func fillCollectionDemoData(count: Int) {
        let items = (1...count).map { "Item \($0)" }
        let sections: [CVSection] = [
            CVSection(model: "Grid", items: items)
        ]
        collectionRelay.accept(sections)

        // ⚠️ 同理
        collectionView.byReloadData()
    }
}

// MARK: - UITableViewDelegate
extension RxDataSourcesDemoVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 64 }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RxDataSourcesDemoVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return CGSize(width: 100, height: 64)
        }
        let inset = layout.sectionInset
        let spacing = layout.minimumInteritemSpacing
        let columns: CGFloat = 2
        let totalH = inset.left + inset.right + (columns - 1) * spacing
        let w = floor((collectionView.bounds.width - totalH) / columns)
        return CGSize(width: w, height: 64)
    }
}
