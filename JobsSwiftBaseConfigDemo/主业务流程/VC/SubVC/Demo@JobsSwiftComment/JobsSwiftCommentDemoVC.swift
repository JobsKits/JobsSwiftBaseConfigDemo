//
//  JobsSwiftCommentDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsByUIKit
import JobsSwiftComment
import JobsSwiftDSL
import JobsScale
import JobsInheritance
import SnapKit
import GKNavigationBarSwift

final class JobsSwiftCommentDemoVC: BaseVC {
    private let modeArr: [JobsSwiftCommentMode] = [.netEase, .toutiao, .custom]
    private lazy var commentArr = makeDemoComments()
    private var popupDetailViewController: JobsSwiftCommentModeDetailVC?
    private var pushedDetailViewController: JobsSwiftCommentModeDetailVC?

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDelegate(self)
            .byDataSource(self)
            .bySeparatorStyle(.singleLine)
            .byRowHeight(72.h)
            .byEstimatedRowHeight(0)
            .byEstimatedSectionHeaderHeight(0)
            .byEstimatedSectionFooterHeight(0)
            .bySectionHeaderHeight(.leastNormalMagnitude)
            .bySectionHeaderTopPadding(0)
            .byContentInset(UIEdgeInsets(top: 12.h, left: 0, bottom: 0, right: 0))
            .byContentInsetAdjustmentBehavior(.never)
            .byBackgroundColor(JobsCor.clear)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "JobsSwiftComment")
        tableView.byVisible(true)
    }
}

extension JobsSwiftCommentDemoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modeArr.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "JobsSwiftCommentDemoCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) ??
            UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        let mode = modeArr[indexPath.row]
        return cell
            .byText(JobsSwiftCommentConfig.title(by: mode))
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTitleCor(JobsCor.label)
            .byDetailText(JobsSwiftCommentConfig.subtitle(by: mode))
            .byDetailTitleFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
            .byDetailTitleCor(JobsCor.secondaryLabel)
            .byAccessoryType(.disclosureIndicator)
            .bySelectionStyle(.default)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showMode(modeArr[indexPath.row])
    }
}

private extension JobsSwiftCommentDemoVC {
    func showMode(_ mode: JobsSwiftCommentMode) {
        if mode == .toutiao {
            pushMode(mode)
        } else {
            presentPopupMode(mode)
        }
    }

    func presentPopupMode(_ mode: JobsSwiftCommentMode) {
        guard presentedViewController == nil else { return }
        popupDetailViewController = JobsSwiftCommentModeDetailVC()
            .byTitle(JobsSwiftCommentConfig.title(by: mode))
        popupDetailViewController?.mode = mode
        popupDetailViewController?.popupStyle = true
        popupDetailViewController?.commentArr = commentArr
        popupDetailViewController?.popUpHeight = UIScreen.main.bounds.height * 0.62
        popupDetailViewController?.preferredContentSize = CGSize(
            width: UIScreen.main.bounds.width,
            height: popupDetailViewController?.popUpHeight ?? 0
        )
        popupDetailViewController?.modalPresentationStyle = .pageSheet
        if #available(iOS 15.0, *), let sheet = popupDetailViewController?.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }
        if let popupDetailViewController {
            present(popupDetailViewController, animated: true)
        }
    }

    func pushMode(_ mode: JobsSwiftCommentMode) {
        pushedDetailViewController = JobsSwiftCommentModeDetailVC()
            .byTitle(JobsSwiftCommentConfig.title(by: mode))
        pushedDetailViewController?.mode = mode
        pushedDetailViewController?.commentArr = commentArr
        if let pushedDetailViewController {
            navigationController?.pushViewController(pushedDetailViewController, animated: true)
        }
    }

    func makeDemoComments() -> [JobsSwiftCommentModel] {
        let reply1_1_1 = JobsSwiftCommentModel.comment(
            messageID: "c-1001-1-1",
            nickname: "北海有风",
            replyID: "c-1001-1",
            replyUserName: "江左小白",
            publishTime: "刚刚",
            content: "我更关心后续有没有把时间线补齐，第三层这里不再继续缩进，但会显示回复对象。",
            device: "iPhone 15 Pro",
            location: "广州"
        )
        let reply1_1_2 = JobsSwiftCommentModel.comment(
            messageID: "c-1001-1-2",
            nickname: "AAA",
            replyID: "c-1001-1",
            replyUserName: "江左小白",
            publishTime: "刚刚",
            content: "我这里是对二级回复的继续回复，缩进和二级保持一致，但要标出回复对象。",
            device: "iPhone",
            location: "深圳"
        )
        let reply1_1 = JobsSwiftCommentModel.comment(
            messageID: "c-1001-1",
            nickname: "江左小白",
            replyID: "c-1001",
            replyUserName: "Jobs",
            publishTime: "3 分钟前",
            content: "网易风格里这种回复会留在当前评论块里，不需要再打开新页面。",
            device: "iPhone",
            location: "杭州",
            children: [reply1_1_1, reply1_1_2]
        )
        let reply1_2 = JobsSwiftCommentModel.comment(
            messageID: "c-1001-2",
            nickname: "咖啡续杯",
            replyID: "c-1001",
            replyUserName: "Jobs",
            publishTime: "5 分钟前",
            content: "这个数据结构清楚：replyID 指向上一级，展示时再按模式决定缩进。",
            device: "Mac",
            location: "上海"
        )
        let reply1_3 = JobsSwiftCommentModel.comment(
            messageID: "c-1001-3",
            nickname: "时间线同学",
            replyID: "c-1001",
            replyUserName: "Jobs",
            publishTime: "2 分钟前",
            content: "这条用于演示模式三的固定展示数量。",
            device: "Web",
            location: "南京"
        )
        let reply1_4 = JobsSwiftCommentModel.comment(
            messageID: "c-1001-4",
            nickname: "评论观察员",
            replyID: "c-1001",
            replyUserName: "Jobs",
            publishTime: "1 分钟前",
            content: "超过默认 3 条以后，下面会出现显示更多入口。",
            device: "iPad",
            location: "苏州"
        )
        let reply1_5 = JobsSwiftCommentModel.comment(
            messageID: "c-1001-5",
            nickname: "尾巴补充",
            replyID: "c-1001",
            replyUserName: "Jobs",
            publishTime: "刚刚",
            content: "点击显示更多以后，这条也会展开出来。",
            device: "Mac",
            location: "上海"
        )
        let comment1 = JobsSwiftCommentModel.comment(
            messageID: "c-1001",
            nickname: "Jobs",
            replyID: "news-20260706",
            publishTime: "8 分钟前",
            content: "这是一级评论：不需要显示回复谁，只表达对整个新闻事件的观点。",
            device: "iPhone",
            location: "深圳",
            children: [reply1_1, reply1_2, reply1_3, reply1_4, reply1_5]
        )
        let reply2_1 = JobsSwiftCommentModel.comment(
            messageID: "c-1002-1",
            nickname: "月台来信",
            replyID: "c-1002",
            replyUserName: "产品同学",
            publishTime: "12 分钟前",
            content: "今日头条模式下，主列表只露出入口，点进去单开回复页。",
            device: "iPad",
            location: "北京"
        )
        let comment2 = JobsSwiftCommentModel.comment(
            messageID: "c-1002",
            nickname: "产品同学",
            replyID: "news-20260706",
            publishTime: "20 分钟前",
            content: "模式二适合评论主线和回复详情分开，列表会更轻。",
            device: "iPhone",
            location: "成都",
            children: [reply2_1]
        )
        let comment3 = JobsSwiftCommentModel.comment(
            messageID: "c-1003",
            nickname: "晴天脚本",
            replyID: "news-20260706",
            publishTime: "30 分钟前",
            content: "模式三主要看层级：二级缩进，三级以后回到主缩进并显示回复对象。",
            device: "Web",
            location: "厦门"
        );return [comment1, comment2, comment3]
    }
}
