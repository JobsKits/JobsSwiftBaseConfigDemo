//
//  JobsNetworkingListDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 31/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import GKNavigationBarSwift
import JobsByUIKit
import JobsRefresher
import JobsInheritance
import JobsSwiftBaseDefines
// MARK: - 外层入口：TableView + SnapKit
final class JobsNetworkingListDemoVC : BaseVC{
    
    private let items = DemoItem.allCases
    private enum DemoItem: CaseIterable {
        case requestAPI
        case uploadFile
        case concurrentRequests
        case downloadToLocal
        case generalRequest

        var title: String {
            switch self {
            case .requestAPI: return "Demo@ 请求接口.swift"
            case .uploadFile: return "Demo@ 上传文件.swift"
            case .concurrentRequests: return "Demo@ 同步并发请求.swift"
            case .downloadToLocal: return "Demo@ 下载文件到本地.swift"
            case .generalRequest: return "Demo@ 一般数据请求.swift"
            }
        }

        func makeViewController() -> UIViewController {
            switch self {
            case .requestAPI:
                return RequestAPIDemoVC()
            case .uploadFile:
                return UploadFileDemoVC()
            case .concurrentRequests:
                return ConcurrentRequestsDemoVC()
            case .downloadToLocal:
                return DownloadToLocalDemoVC()
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
            .numberOfRowsInSection { [weak self] (obj: AnyObject, tv: UITableView, section: Int) -> Int in
                self!.items.count
            }
            .cellForRowAt { _, tv, indexPath in
                let cell = tv.dequeueReusableCell(withIdentifier: "cell") ??
                        UITableViewCell(style: .default, reuseIdentifier: "cell")
                var cfg = cell.defaultContentConfiguration()
                cfg.text = self.items[indexPath.row].title
                cfg.textProperties.font = .systemFont(ofSize: 16, weight: .medium)
                cell.contentConfiguration = cfg
                cell.accessoryType = .disclosureIndicator
                return cell
            }
            .didSelectRowAt { _, tv, indexPath in
                tv.deselectRow(at: indexPath, animated: true)
                self.items[indexPath.row].makeViewController().byPush(self, animated: YES)
            }
            // 下拉刷新 Header
            .byRefreshHeader(component: JobsDefaultHeader(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                Task { @MainActor in
                    self.tableView.byReloadData()
                    self.tableView.switchRefreshHeader(to: .normal)
                    self.tableView.switchRefreshFooter(to: .normal) // 复位“无更多”
                }
            }
            // 上拉加载 Footer
            .byRefreshFooter(component: JobsDefaultFooter(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                self.tableView.byReloadData()
                self.tableView.switchRefreshFooter(to: .noMoreData)
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
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "JobsNetworking".tr)
        tableView.byVisible(YES)
    }
}
