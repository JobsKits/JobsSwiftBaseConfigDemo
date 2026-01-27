//
//  Demo@BMPlayer.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 10/28/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import GKNavigationBarSwift
import JobsInheritance
import JobsByUIKit
import JobsTextTools
import JobsSwiftBaseDefines
import JobsBy3rdTools

final class BMPlayerDemoVC: BaseVC {
    private enum Row: Int, CaseIterable {
        case local, remote, feed, float
        var title: String {
            switch self {
            case .local:  return "本地视频：welcome_video.mp4（单独播放）".tr
            case .remote: return "网络视频：信号源@巴基斯坦电视台（单独播放）".tr
            case .feed:   return "抖音风：列表预览 → 详情页独立播放".tr
            case .float:  return "悬浮窗口播放（直播）".tr
            }
        }
    }

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .registerCell(UITableViewCell.self)
            .byNoContentInsetAdjustment()
            .bySeparatorStyle(.singleLine)
            .byNoSectionHeaderTopPadding()
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
        jobsSetupGKNav(
            title: "BMPlayer"
        )
        tableView.byVisible(YES)
    }
}

extension BMPlayerDemoVC : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { Row.allCases.count }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.py_dequeueReusableCell(withType: UITableViewCell.self, for: indexPath)
            .byText(Row(rawValue: indexPath.row)?.title)
            .byAccessoryType(.disclosureIndicator)
            .onResult { _ in

            }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch Row(rawValue: indexPath.row)! {
        case .remote: PlayerRemoteVC().byPush(self)
        case .feed:   FeedListVC().byPush(self)
#if canImport(BMPlayer)
        case .local:  PlayerLocalVC().byPush(self)
        case .float:  JobsLiveFloatPlayer.shared.showRemoteLive()
#endif
        }
    }
}
