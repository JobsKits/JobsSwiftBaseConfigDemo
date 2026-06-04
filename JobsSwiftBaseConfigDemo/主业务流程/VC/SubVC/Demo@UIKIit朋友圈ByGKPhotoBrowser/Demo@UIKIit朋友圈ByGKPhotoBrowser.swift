//
//  Demo@UIKIit朋友圈ByGKPhotoBrowser.swift
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

import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsBy3rdTools
import JobsTextTools
import JobsSwiftBaseDefines
import JobsRefresher
import GKPhotoBrowser
import GKNavigationBarSwift
import SnapKit

final class GKPhotoBrowserByUIKitDemoVC: BaseVC {
    private let layoutMode: TimelineLayoutMode = .estimated_autoDimension
    private var rows: Int = 20
    private var posts: [MomentPost] = []
    private var heightCache: [Int: CGFloat] = [:] // key = row
    private var browser: GKPhotoBrowser?
    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(MomentPostCell.self)
            .byNoContentInsetAdjustment()
            .bySeparatorStyle(.none)
            .byNoSectionHeaderTopPadding()
            .byEmptyButtonProvider { [unowned self] in
                UIButton(type: .system)
                    .byTitle("暂无数据".tr, for: .normal)
                    .bySubTitle("点我填充示例数据".tr, for: .normal)
                    .byImage("tray".sysImg, for: .normal)
                    .byImagePlacement(.top)
                    .onTap { [weak self] _ in
                        guard let self else { return }
                        self.rows = 20
                        self.posts = MomentPost.makeSample(rows: self.rows)
                        self.heightCache.removeAll()
                        self.tableView.byReloadData()
                    }
                    .byEmptyLayout { btn, make, host in
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
                    self.rows = 20
                    self.posts = MomentPost.makeSample(rows: self.rows)
                    self.heightCache.removeAll()
                    self.tableView.byReloadData()
                    self.tableView.switchRefreshHeader(to: .normal)
                    self.tableView.switchRefreshFooter(to: .normal)
                }
            }
            .byRefreshFooter(component: JobsDefaultFooter(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { vc in
                    if self.rows < 60 {
                        self.rows += 20
                        self.posts = MomentPost.makeSample(rows: self.rows)
                        self.heightCache.removeAll()
                        self.tableView.byReloadData()
                            .switchRefreshFooter(to: .normal)
                    } else {
                        self.tableView.switchRefreshFooter(to: .noMoreData)
                    }
                }
            }
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom)
                    make.left.right.bottom.equalToSuperview()
                } else {
                    make.edges.equalToSuperview()
                }
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "朋友圈")
        tableView.byVisible(YES)
        posts = MomentPost.makeSample(rows: rows)
        heightCache.removeAll()

        applyLayoutMode()
        tableView.byReloadData()
    }

    private func applyLayoutMode() {
        switch layoutMode {
        case .noEstimated_manualHeight:
            tableView
                .byEstimatedRowHeight(0)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
        case .estimated_autoDimension:
            tableView
                .byEstimatedRowHeight(240)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
        }
    }

    private func showBrowser(for post: MomentPost, at index: Int, sourceCell: MomentPostCell?) {
        guard post.media.indices.contains(index) else { return }

        var photos: [GKPhoto] = []
        photos.reserveCapacity(post.media.count)

        for (i, m) in post.media.enumerated() {
            let p = GKPhoto()

            if let cover = URL(string: m.coverURL) {
                p.url = cover
            }
            if let iv = sourceCell?.mediaSourceImageView(at: i) {
                p.sourceImageView = iv
            }
            if m.isVideo, let vStr = m.videoURL, let vURL = URL(string: vStr) {
                p.videoUrl = vURL
            };photos.append(p)
        }

        let b = GKPhotoBrowser(photos: photos, currentIndex: index)
        let cfg = GKPhotoBrowserConfigure.default()
        cfg.showStyle = .zoom
        b.configure = cfg

        browser = b
        b.show(fromVC: self)
    }
}

extension GKPhotoBrowserByUIKitDemoVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    // ✅ 开 estimated 时：给“更准的预估高度”
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let w = tableView.bounds.width > 0 ? tableView.bounds.width : UIScreen.main.bounds.width
        return MomentPostCell.heightFormula(for: posts[indexPath.row], tableWidth: w)
    }
    // ✅ 不开 estimated 时：走“手动高度 + 缓存”
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard layoutMode == .noEstimated_manualHeight else { return UITableView.automaticDimension }

        if let h = heightCache[indexPath.row] { return h }
        let w = tableView.bounds.width > 0 ? tableView.bounds.width : UIScreen.main.bounds.width
        let h = MomentPostCell.heightFormula(for: posts[indexPath.row], tableWidth: w)
        heightCache[indexPath.row] = h
        return h
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView
            .byDequeueReusableCell(withType: MomentPostCell.self, for: indexPath)
            .bySelectionStyle(.none)
            // ✅ 自动高度模式：同一帧合并一次 batchUpdates，抑制跳动
            .byOnNeedHeightUpdate({ [weak tableView] cell in
                guard let tableView else { return }
                UIView.performWithoutAnimation {
                    tableView.performBatchUpdates(nil)
                }
            })
            .byOnTapMedia({ [weak self, weak tableView] cell, mediaIndex in
                guard let self, let tableView else { return }
                guard let ip = tableView.indexPath(for: cell) else { return }
                self.showBrowser(for: self.posts[ip.row], at: mediaIndex, sourceCell: cell)
            })
            .byOnToggleExpand({ [weak self, weak tableView] cell in
                guard let self, let tableView else { return }
                guard let ip = tableView.indexPath(for: cell) else { return }
                self.posts[ip.row].isExpanded.toggle()
                self.heightCache[ip.row] = nil
                tableView.reloadRows(at: [ip], with: .automatic)
            })
            .byOnLikeTapped({ [weak self, weak tableView] cell in
                guard let self, let tableView else { return }
                guard let ip = tableView.indexPath(for: cell) else { return }
                var p = self.posts[ip.row]
                p.isLiked.toggle()
                p.likeCount += p.isLiked ? 1 : -1
                self.posts[ip.row] = p
                tableView.reloadRows(at: [ip], with: .none)
            })
            .byOnCommentTapped({ [weak self, weak tableView] cell in
                guard let self, let tableView else { return }
                guard let ip = tableView.indexPath(for: cell) else { return }
                var p = self.posts[ip.row]
                p.comments.append(.init(user: "Jobs", text: "Nice～"))
                self.posts[ip.row] = p
                self.heightCache[ip.row] = nil
                tableView.reloadRows(at: [ip], with: .automatic)
            })
            .byData(posts[indexPath.row], layoutMode: layoutMode)
    }
}
