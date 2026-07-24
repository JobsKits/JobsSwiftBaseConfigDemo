//
//  JobsNetworkingListDemoVC.swift
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

import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftRefresher
import JobsInheritance
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

// MARK: - 外层入口：TableView + SnapKit
final class JobsNetworkingListDemoVC : BaseVC {
    private let items = DemoItem.allCases
    private enum DemoItem: CaseIterable {
        case requestAPI
        case uploadFile
        case concurrentRequests
        case downloadToLocal
        case generalRequest
        var title: String {
            switch self {
            /// 处理 .requestAPI 分支
            case .requestAPI: return "Demo@ 请求接口.swift"
            /// 处理 .uploadFile 分支
            case .uploadFile: return "Demo@ 上传文件.swift"
            /// 处理 .concurrentRequests 分支
            case .concurrentRequests: return "Demo@ 同步并发请求.swift"
            /// 处理 .downloadToLocal 分支
            case .downloadToLocal: return "Demo@ 下载文件到本地.swift"
            /// 处理 .generalRequest 分支
            case .generalRequest: return "Demo@ 一般数据请求.swift"
            }
        }
        func makeViewController() -> UIViewController {
            switch self {
            /// 处理 .requestAPI 分支
            case .requestAPI:
                return RequestAPIDemoVC()
            /// 处理 .uploadFile 分支
            case .uploadFile:
                return UploadFileDemoVC()
            /// 处理 .concurrentRequests 分支
            case .concurrentRequests:
                return ConcurrentRequestsDemoVC()
            /// 处理 .downloadToLocal 分支
            case .downloadToLocal:
                return DownloadToLocalDemoVC()
            /// 处理 .generalRequest 分支
            case .generalRequest:
                return GeneralRequestDemoVC()
            }
        }
    }

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byRegisterCell(UITableViewCell.self)
            .bySeparatorStyle(.singleLine)
            .setRefreshSound("Sound.wav")
            // 非正式协议闭包化
            .byTarget(self)
            .numberOfRowsInSection { [weak self] _, _, _ in
                self?.items.count ?? 0
            }
            .cellForRowAt { [weak self] _, tv, indexPath in
                let cell = tv.dequeueReusableCell(withIdentifier: "cell") ??
                    UITableViewCell(style: .default, reuseIdentifier: "cell")
                guard let self else { return cell }
                var cfg = cell.defaultContentConfiguration()
                cfg.text = self.items[indexPath.row].title
                cfg.textProperties.font = JobsFont.systemFont(ofSize: 16, weight: .medium)
                cell.contentConfiguration = cfg
                cell.accessoryType = .disclosureIndicator
                return cell
            }
            .didSelectRowAt { [weak self] _, tv, indexPath in
                guard let self else { return }
                tv.deselectRow(at: indexPath, animated: true)
                self.items[indexPath.row].makeViewController().byPush(self, animated: YES)
            }
            // 下拉刷新 Header
            .byRefreshHeader(component: JobsDefaultHeader(),
                             container: self,
                             trigger: 66) { [weak self] in
                onMainSync { [weak self] in
                    guard let self else { return }
                    self.tableView.byReloadData()
                    self.tableView.switchRefreshHeader(to: .normal)
                    self.tableView.switchRefreshFooter(to: .normal) // 复位“无更多”
                }
            }
            // 上拉加载 Footer
            .byRefreshFooter(component: JobsDefaultFooter(),
                             container: self,
                             trigger: 66) { [weak self] in
                onMainSync { [weak self] in
                    guard let self else { return }
                    self.tableView.byReloadData()
                    self.tableView.switchRefreshFooter(to: .noMoreData)
                }
            }
            .byAddTo(view) {[unowned self] make in
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
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "JobsNetworking@共用网络接口".tr)
        tableView.byVisible(YES)
    }
}
