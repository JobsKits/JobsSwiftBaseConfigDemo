//
//  JobsNetworkingDemoVC.swift
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

import JobsScale
import JobsToast
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftRefresher
import JobsEmptyView
import JobsInheritance
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

final class JobsNetworkingDemoVC: BaseVC {
    private var dataSources: [MethodDemoItem] = MethodType.allCases.map {
        MethodDemoItem(
            title: $0.title,
            subTitle: $0.subTitle,
            methodType: $0,
            path: $0.path
        )
    }

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byRegisterCell(MethodTBVCell.self)
            .byNoContentInsetAdjustment()
            .bySeparatorStyle(.singleLine)
            .byNoSectionHeaderTopPadding()
            .byContentInsetTop(8)
            .byExpandVerticalScrollDistance(200.h)
            .byTableHeaderView(
                UIView()
                    .byHeight(8)
                    .byBackgroundColor(JobsCor.clear)
            )
            .byTarget(self)
            .numberOfRowsInSection { [weak self] (_, _, _) -> Int in
                guard let self else { return 0 };return self.dataSources.count
            }
            .cellForRowAt { [weak self] _, tv, indexPath in
                guard let self else { return UITableViewCell() };return tv
                    .byDequeueReusableCell(withType: MethodTBVCell.self, for: indexPath)
                    .byData(self.dataSources[indexPath.row])
            }
            .didSelectRowAt { [weak self] _, tv, indexPath in
                guard let self else { return }
                tv.deselectRow(at: indexPath, animated: true)
                self.makeDetailVC(with: self.dataSources[indexPath.row]).byPush(self)
            }
            .byEmptyViewProvider { [unowned self] in
                JobsEmptyView()
                    .byOnTapRetry { [weak self] in
                        guard let self else { return }
                        self.loadCatalog()
                    }
            }
            .byEmptyViewLayout { emptyView, make, host in
                make.centerX.equalTo(host)
                make.centerY.equalTo(host).offset(-40)
                make.leading.greaterThanOrEqualTo(host).offset(16)
                make.trailing.lessThanOrEqualTo(host).inset(16)
                make.width.lessThanOrEqualTo(host).multipliedBy(0.9)
            }
            .byRefreshHeader(component: JobsDefaultHeader(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                self.loadCatalog(isRefresh: true)
            }
            .byRefreshFooter(component: JobsDefaultFooter(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                onMainSync {
                    self.tableView.switchRefreshFooter(to: .noMoreData)
                }
            }
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                    make.left.right.bottom.equalToSuperview()
                } else {
                    make.edges.equalToSuperview()
                }
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "JobsNetworking@本地模拟数据（iOS模拟器可看数据，真机无法）".tr)
        view.byBackgroundColor(JobsCor.systemBackground)
        tableView.byVisible(YES)
//        loadCatalog()
    }
}

extension JobsNetworkingDemoVC {
    private func loadCatalog(isRefresh: Bool = false) {
        Task {
            do {
                let items = try await DemoService.shared.loadCatalog()
                onMainSync { [weak self] in
                    guard let self else { return }
                    self.dataSources = items
                    self.tableView.byReloadData()
                    self.endRefreshing()
                }
            } catch {
                onMainSync { [weak self] in
                    guard let self else { return }
                    self.endRefreshing()
                    "目录加载失败：\(error.localizedDescription)".toast
                    self.tableView.byReloadData()
                }
            }
        }
    }

    private func endRefreshing() {
        tableView.switchRefreshHeader(to: .normal)
        tableView.switchRefreshFooter(to: .normal)
    }

    private func makeDetailVC(with item: MethodDemoItem) -> UIViewController {
        switch item.methodType {
        /// 处理 .get 分支
        case .get: JobsNetworkingGetDemoVC(item: item)
        /// 处理 .post 分支
        case .post: JobsNetworkingPostDemoVC(item: item)
        /// 处理 .put 分支
        case .put: JobsNetworkingPutDemoVC(item: item)
        /// 处理 .patch 分支
        case .patch: JobsNetworkingPatchDemoVC(item: item)
        /// 处理 .delete 分支
        case .delete: JobsNetworkingDeleteDemoVC(item: item)
        /// 处理 .upload 分支
        case .upload: JobsNetworkingUploadDemoVC(item: item)
        /// 处理 .download 分支
        case .download: JobsNetworkingDownloadDemoVC(item: item)
        }
    }
}
