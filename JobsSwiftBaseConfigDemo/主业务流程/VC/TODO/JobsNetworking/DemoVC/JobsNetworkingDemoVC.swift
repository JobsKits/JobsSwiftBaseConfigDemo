//
//  JobsNetworkingDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 29/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import GKNavigationBarSwift
import JobsByUIKit
import JobsSwiftBaseDefines
import JobsInheritance

final class JobsNetworkingDemoVC: BaseVC {

    private let rows: [String] = [
        "1. 一般数据请求（GET/POST）",
        "2. 请求接力（relay）",
        "3. 同步并发请求（concurrent）",
        "4. 上传文件（相机/相册）",
        "5. 下载文件到本地"
    ]

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .registerCell(UITableViewCell.self)
            .byNoContentInsetAdjustment()
            .bySeparatorStyle(.singleLine)
            .byNoSectionHeaderTopPadding()
            .byContentInsetTop(8)
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
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(
            title: "JobsNetworking Demo"
        )
        tableView.byVisible(YES)
    }
}

extension JobsNetworkingDemoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { rows.count }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = tableView.dequeueReusableCell(withIdentifier: "cell")
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        var cfg = c.defaultContentConfiguration()
        cfg.text = rows[indexPath.row]
        cfg.secondaryText = "点击进入"
        c.contentConfiguration = cfg
        c.accessoryType = .disclosureIndicator
        return c
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc: UIViewController
        switch indexPath.row {
        case 0: vc = NormalRequestVC()
        case 1: vc = RelayRequestVC()
        case 2: vc = ConcurrentRequestVC()
        case 3: vc = UploadFileVC()
        default: vc = DownloadFileVC()
        }
        vc
            .byData("https://www.baidu.com")
            .byDirection(.system)
            .byPush(self)
            .byCompletion { print("❤️结束❤️ fromTop") }
    }
}
