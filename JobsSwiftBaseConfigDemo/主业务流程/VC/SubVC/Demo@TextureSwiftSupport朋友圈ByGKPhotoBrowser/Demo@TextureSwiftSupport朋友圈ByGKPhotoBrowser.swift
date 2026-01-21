//
//  Demo@TextureSwiftSupport朋友圈ByGKPhotoBrowser.swift
//  JobsSwiftBaseConfigDemo
//
//  Rewritten to use TextureSwiftSupport (Texture/AsyncDisplayKit) as list container,
//  while keeping GKPhotoBrowser for media preview.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import AsyncDisplayKit
import TextureSwiftSupport
import GKPhotoBrowser
import GKNavigationBarSwift
import JobsInheritance
import SnapKit
import JobsByUIKit
import JobsBy3rdTools
import JobsTextTools
import JobsSwiftBaseDefines
import JobsRefresher

final class GKPhotoBrowserByTextureSwiftSupportDemoVC: BaseVC {
    // ✅ Fix：既然 node 通过 heightFormula 手算高度，就别开 estimated（避免滚动抖动/跳）
    private let layoutMode: TimelineLayoutMode = .noEstimated_manualHeight
    private var rows: Int = 20
    private var posts: [MomentPost] = []
    private var browser: GKPhotoBrowser?
    private var isExiting: Bool = false
    private lazy var tableNode: ASTableNode = {
        let n = ASTableNode(style: .plain)
        n.dataSource = self
        n.delegate = self

        // Fix: avoid readable-width shrinking & unexpected insets
        n.view.cellLayoutMarginsFollowReadableWidth = false
        if #available(iOS 11.0, *) {
            n.view.insetsContentViewsToSafeArea = false
        }
        n.view.layoutMargins = .zero
        n.view.separatorInset = .zero

        // 下面这些是原先 UITableView 的链式配置，直接作用到 n.view (UITableView) 就行
        n.view
            .byNoContentInsetAdjustment()
            .bySeparatorStyle(.none)
            .byNoSectionHeaderTopPadding()
            .byEstimatedSectionHeaderHeight(0)
            .byEstimatedSectionFooterHeight(0)

            .jobs_emptyButtonProvider { [unowned self] in
                UIButton(type: .system)
                    .byTitle("暂无数据", for: .normal)
                    .bySubTitle("点我填充示例数据", for: .normal)
                    .byImage("tray".sysImg, for: .normal)
                    .byImagePlacement(.top)
                    .onTap { [weak self] _ in
                        guard let self, !self.isExiting else { return }
                        self.rows = 20
                        self.posts = MomentPost.makeSample(rows: self.rows)
                        self.tableNode.reloadData()
                    }
                    .jobs_setEmptyLayout { _, make, host in
                        make.centerX.equalTo(host)
                        make.centerY.equalTo(host).offset(-40)
                        make.leading.greaterThanOrEqualTo(host).offset(16)
                        make.trailing.lessThanOrEqualTo(host).inset(16)
                        make.width.lessThanOrEqualTo(host).multipliedBy(0.9)
                    }
            }
            .configRefreshHeader(component: JobsDefaultHeader(),
                                 container: self,
                                 trigger: 66) { [weak self] in
                guard let self, !self.isExiting else { return }
                Task { @MainActor [weak self] in
                    guard let self, !self.isExiting else { return }
                    self.rows = 20
                    self.posts = MomentPost.makeSample(rows: self.rows)
                    self.tableNode.reloadData()
                    self.tableNode.view.switchRefreshHeader(to: .normal)
                    self.tableNode.view.switchRefreshFooter(to: .normal)
                }
            }
            .configRefreshFooter(component: JobsDefaultFooter(),
                                 container: self,
                                 trigger: 66) { [weak self] in
                guard let self, !self.isExiting else { return }
                Task { @MainActor [weak self] in
                    guard let self, !self.isExiting else { return }
                    if self.rows < 60 {
                        self.rows += 20
                        self.posts = MomentPost.makeSample(rows: self.rows)
                        self.tableNode.reloadData()
                        self.tableNode.view.switchRefreshFooter(to: .normal)
                    } else {
                        self.tableNode.view.switchRefreshFooter(to: .noMoreData)
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
            };return n
    }()

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParent || isBeingDismissed {
            isExiting = true
        }
    }

    deinit {
        // avoid callbacks firing during teardown
        tableNode.dataSource = nil
        tableNode.delegate = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "朋友圈 (Texture)")
        tableNode.view.byVisible(YES)

        posts = MomentPost.makeSample(rows: rows)
        applyLayoutMode()
        tableNode.reloadData()
    }

    private func applyLayoutMode() {
        // ⚠️ ASTableNode 的底层依旧是 UITableView，所以这些设置仍然有效
        switch layoutMode {
        case .noEstimated_manualHeight:
            tableNode.view
                .byEstimatedRowHeight(0)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
        case .estimated_autoDimension:
            tableNode.view
                .byEstimatedRowHeight(240)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
        }
    }

    private func showBrowser(for post: MomentPost,
                             at index: Int,
                             sourceNode: MomentPostUIKitCellNode?) {
        // ✅ UI 只展示最多 9 张（3×3），预览也必须保持一致
        let medias = Array(post.media.prefix(9))
        guard medias.indices.contains(index) else { return }

        var photos: [GKPhoto] = []
        photos.reserveCapacity(medias.count)

        for (i, m) in medias.enumerated() {
            let p = GKPhoto()

            if let cover = URL(string: m.coverURL) {
                p.url = cover
            }
            if let iv = sourceNode?.sourceImageView(at: i) {
                p.sourceImageView = iv
            }
            if m.isVideo,
               let vStr = m.videoURL,
               let vURL = URL(string: vStr) {
                p.videoUrl = vURL
            }
            photos.append(p)
        }

        let b = GKPhotoBrowser(photos: photos, currentIndex: index)
        let cfg = GKPhotoBrowserConfigure.default()
        cfg.showStyle = .zoom
        b.configure = cfg

        browser = b
        b.show(fromVC: self)
    }
}
// MARK: - ASTableNode DataSource & Delegate
extension GKPhotoBrowserByTextureSwiftSupportDemoVC: ASTableDataSource, ASTableDelegate {
    func numberOfSections(in tableNode: ASTableNode) -> Int { 1 }
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    /// ✅ 用 nodeBlock（后台线程创建 Node），Texture 线程模型更稳
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let row = indexPath.row
        let post = posts[row]
        let layoutMode = self.layoutMode
        return { [weak self, weak tableNode] in
            MomentPostUIKitCellNode(post: post, layoutMode: layoutMode)
                .byOnNeedHeightUpdate { [weak self, weak tableNode] in
                    guard let self, let tableNode, !self.isExiting else { return }
                    DispatchQueue.main.async { [weak self, weak tableNode] in
                        guard let self, let tableNode, !self.isExiting else { return }
                        guard tableNode.view.window != nil else { return }
                        // ✅ Fix：ASTableView 的 begin/endUpdates 已 deprecated
                        // 用 ASTableNode.performBatchUpdates 触发高度/布局刷新（无动画）
                        UIView.performWithoutAnimation {
                            tableNode.performBatchUpdates({
                                // no-op: height re-query happens because node invalidated layout
                            }, completion: nil)
                        }
                    }
                }
                .byOnTapMedia { [weak self] node, mediaIndex in
                    guard let self, !self.isExiting else { return }
                    guard self.posts.indices.contains(row) else { return }
                    self.showBrowser(for: self.posts[row], at: mediaIndex, sourceNode: node)
                }
                .byOnToggleExpand { [weak self, weak tableNode] in
                    guard let self, let tableNode, !self.isExiting else { return }
                    guard self.posts.indices.contains(row) else { return }
                    self.posts[row].isExpanded.toggle()
                    tableNode.reloadRows(at: [IndexPath(row: row, section: 0)], with: .automatic)
                }
                .byOnLikeTapped { [weak self, weak tableNode] in
                    guard let self, let tableNode, !self.isExiting else { return }
                    guard self.posts.indices.contains(row) else { return }
                    var p = self.posts[row]
                    p.isLiked.toggle()
                    p.likeCount += p.isLiked ? 1 : -1
                    self.posts[row] = p
                    tableNode.reloadRows(at: [IndexPath(row: row, section: 0)], with: .none)
                }
                .byOnCommentTapped { [weak self, weak tableNode] in
                    guard let self, let tableNode, !self.isExiting else { return }
                    guard self.posts.indices.contains(row) else { return }
                    var p = self.posts[row]
                    p.comments.append(.init(user: "Jobs", text: "Nice～"))
                    self.posts[row] = p
                    tableNode.reloadRows(at: [IndexPath(row: row, section: 0)], with: .automatic)
                }
        }
    }
}
