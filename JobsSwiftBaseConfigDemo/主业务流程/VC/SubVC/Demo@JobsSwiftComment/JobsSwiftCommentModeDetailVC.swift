//
//  JobsSwiftCommentModeDetailVC.swift
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

final class JobsSwiftCommentModeDetailVC: BaseVC {
    var mode: JobsSwiftCommentMode = .netEase
    var popupStyle = false
    var replyDetailStyle = false
    var commentArr: [JobsSwiftCommentModel] = []
    var popUpHeight: CGFloat = 0 {
        didSet { updatePreferredContentSizeIfNeeded() }
    }

    private var demoRefreshCount = 0
    private var demoLoadMoreCount = 0

    private lazy var commentView: JobsSwiftCommentView = {
        JobsSwiftCommentView(config: commentConfig())
            .byComments(commentArr)
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
        view.byBackgroundColor(UIColor(hex: 0xF6F7FB))
        setupNavigation()
        updatePreferredContentSizeIfNeeded()
        commentView.byVisible(true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updatePreferredContentSizeIfNeeded()
    }
}

private extension JobsSwiftCommentModeDetailVC {
    func setupNavigation() {
        if popupStyle {
            jobsSetupGKNav(
                title: titleText,
                rightButtons: [
                    UIButton.sys()
                        .byTitle("关闭".tr, for: .normal)
                        .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
                        .onTap { [weak self] _ in
                            self?.dismiss(animated: true)
                        }
                ]
            )
        } else {
            jobsSetupGKNav(title: titleText)
        }
    }

    func commentConfig() -> JobsSwiftCommentConfig {
        let config = JobsSwiftCommentConfig.defaultConfig
        config.mode = mode
        config.title = titleText
        config.showsReplyEntrance = !replyDetailStyle
        bindRefresher(by: config)
        config.commentSelectedBlock = { [weak self] comment in
            guard let self else { return }
            if self.mode == .toutiao, !comment.children.isEmpty, !self.replyDetailStyle {
                self.openReplyPage(by: comment)
            } else {
                print("点击评论：\(comment.messageID)")
            }
        }
        config.replySelectedBlock = { [weak self] comment in
            guard let self else { return }
            if self.mode == .toutiao, !comment.children.isEmpty, !self.replyDetailStyle {
                self.openReplyPage(by: comment)
            } else {
                print("点击回复入口：\(comment.messageID)")
            }
        };return config
    }

    func bindRefresher(by config: JobsSwiftCommentConfig) {
        guard mode == .netEase || mode == .custom else {
            config.enablesPullRefresh = false
            config.enablesLoadMore = false
            return
        }
        config.pullRefreshBlock = { [weak self] commentView in
            self?.pullRefresh(by: commentView)
        }
        config.loadMoreBlock = { [weak self] commentView in
            self?.loadMore(by: commentView)
        }
    }

    func pullRefresh(by commentView: JobsSwiftCommentView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [weak self, weak commentView] in
            guard let self, let commentView else { return }
            self.demoRefreshCount += 1
            self.commentArr.insert(
                self.demoGeneratedComment(action: "refresh", index: self.demoRefreshCount),
                at: 0
            )
            commentView.reloadWithComments(self.commentArr)
            commentView.endPullRefresh()
        }
    }

    func loadMore(by commentView: JobsSwiftCommentView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [weak self, weak commentView] in
            guard let self, let commentView else { return }
            self.demoLoadMoreCount += 1
            self.commentArr.append(
                self.demoGeneratedComment(action: "loadMore", index: self.demoLoadMoreCount)
            )
            commentView.reloadWithComments(self.commentArr)
            commentView.endLoadMore()
        }
    }

    func demoGeneratedComment(action: String, index: Int) -> JobsSwiftCommentModel {
        let isRefresh = action == "refresh"
        let nickname = isRefresh ? "刷新来的评论" : "加载来的评论"
        let content = isRefresh
            ? "这条是下拉刷新插入的新一级评论，用来验证模式一/三的刷新入口。"
            : "这条是上拉加载追加的新一级评论，用来验证模式一/三的加载入口。"
        return JobsSwiftCommentModel.comment(
            messageID: "c-\(action)-\(mode.rawValue)-\(index)",
            nickname: "\(nickname)\(index)",
            replyID: "news-20260706",
            publishTime: "刚刚",
            content: content,
            device: "JobsSwiftRefresher",
            location: "深圳"
        )
    }

    func openReplyPage(by comment: JobsSwiftCommentModel) {
        let vc = JobsSwiftCommentModeDetailVC()
        vc.mode = .toutiao
        vc.replyDetailStyle = true
        vc.commentArr = [comment]
        navigationController?.pushViewController(vc, animated: true)
    }

    var titleText: String {
        if replyDetailStyle {
            guard let comment = commentArr.first, !comment.nickname.isEmpty else { return "评论回复" };return "\(comment.nickname) 的回复"
        };return JobsSwiftCommentConfig.title(by: mode)
    }

    func updatePreferredContentSizeIfNeeded() {
        guard popupStyle else { return }
        if popUpHeight <= 0 {
            popUpHeight = UIScreen.main.bounds.height * 0.62
            return
        }
        preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: popUpHeight)
    }
}
