//
//  JobsSwiftCommentView.swift
//  JobsSwiftComment
//
//  Created by Jobs on 2026年7月7日，星期二.
//

import UIKit
import JobsSwiftBaseDefines
import JobsByUIKit
import JobsSwiftDSL
import SnapKit

public final class JobsSwiftCommentView: UIView {
    public private(set) var tableView = UITableView(frame: .zero, style: .plain)
    public private(set) var config: JobsSwiftCommentConfig
    public private(set) var comments: [JobsSwiftCommentModel] = []
    public private(set) var isRenderTruncated = false

    private var renderRows: [RenderRow] = []
    private var expandedRootIDs = Set<String>()
    private let refreshControlView = UIRefreshControl.jobsMake { _ in }
    private let loadMoreButton = UIButton.sys()
    private var isLoadingMore = false
    private var noMoreData = false

    public override init(frame: CGRect) {
        self.config = .defaultConfig
        super.init(frame: frame)
        setupViews()
    }

    public init(config: JobsSwiftCommentConfig?) {
        self.config = config ?? .defaultConfig
        super.init(frame: .zero)
        setupViews()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @discardableResult
    public func byComments(_ comments: [JobsSwiftCommentModel]?) -> Self {
        reloadWithComments(comments)
        return self
    }

    @discardableResult
    public func byMode(_ mode: JobsSwiftCommentMode) -> Self {
        config.mode = mode
        updateRefreshers()
        rebuildRenderData()
        tableView.reloadData()
        return self
    }

    public func reloadWithConfig(_ config: JobsSwiftCommentConfig?) {
        self.config = config ?? .defaultConfig
        updateRefreshers()
        rebuildRenderData()
        tableView.reloadData()
    }

    public func reloadWithComments(_ comments: [JobsSwiftCommentModel]?) {
        self.comments = comments ?? []
        expandedRootIDs.formIntersection(Set(self.comments.map(\.messageID)))
        isLoadingMore = false
        noMoreData = false
        endPullRefresh()
        updateLoadMoreTitle()
        rebuildRenderData()
        tableView.reloadData()
    }

    public func appendComments(_ comments: [JobsSwiftCommentModel]) {
        self.comments.append(contentsOf: comments)
        rebuildRenderData()
        tableView.reloadData()
    }

    public func endPullRefresh() {
        refreshControlView.endRefreshing()
    }

    public func endLoadMore(noMoreData: Bool = false) {
        self.noMoreData = noMoreData
        isLoadingMore = false
        updateLoadMoreTitle()
    }
}

extension JobsSwiftCommentView: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        renderRows.count
    }

    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = renderRows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: JobsSwiftCommentCell.reuseIdentifier, for: indexPath) as! JobsSwiftCommentCell
        cell.replyAction = { [weak self] comment in
            guard let self else { return }
            if let replySelectedBlock = self.config.replySelectedBlock {
                replySelectedBlock(comment)
            } else {
                self.config.commentSelectedBlock?(comment)
            }
        }
        if row.isMoreRow {
            cell.updateWithMoreText("展开更多回复", depth: row.depth)
        } else {
            cell.update(with: row.comment, config: config, depth: row.depth, parentComment: row.parentComment)
        }
        return cell
    }

    public func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = renderRows[indexPath.row]
        if row.isMoreRow {
            expandedRootIDs.insert(row.rootID)
            rebuildRenderData()
            tableView.reloadData()
            return
        }
        config.commentSelectedBlock?(row.comment)
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldEnableRefreshByMode(),
              config.enablesLoadMore,
              !isLoadingMore,
              !noMoreData,
              scrollView.contentSize.height > scrollView.bounds.height else { return }
        let threshold = scrollView.contentSize.height - scrollView.bounds.height - 44
        if scrollView.contentOffset.y > threshold {
            triggerLoadMore()
        }
    }
}

private extension JobsSwiftCommentView {
    struct RenderRow {
        let comment: JobsSwiftCommentModel
        let depth: Int
        let parentComment: JobsSwiftCommentModel?
        let isMoreRow: Bool
        let rootID: String
    }

    func setupViews() {
        byBackgroundColor(UIColor(r: 0.96 * 255, g: 0.97 * 255, b: 0.99 * 255))
        tableView
            .byDelegate(self)
            .byDataSource(self)
            .bySeparatorStyle(.none)
            .byBackgroundColor(JobsCor.clear)
            .byEstimatedRowHeight(96)
            .byRowHeight(UITableView.automaticDimension)
            .byKeyboardDismissMode(.onDrag)
            .byContentInset(UIEdgeInsets(top: 6, left: 0, bottom: 10, right: 0))
            .byEmptyButtonProvider { [weak self] in
                JobsEmptyAuto.Config.defaultProvider().onTap { [weak self] _ in
                    self?.pullRefreshTriggered()
                }
            }
            .byRegisterCellOnID(CellCls: JobsSwiftCommentCell.self,
                                ID: JobsSwiftCommentCell.reuseIdentifier)
        if #available(iOS 15.0, *) {
            tableView.bySectionHeaderTopPadding(0)
        }
        tableView.byAddTo(self)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        refreshControlView.byAddTarget(self,
                                       action: #selector(pullRefreshTriggered),
                                       for: .valueChanged)
        loadMoreButton
            .byFrame(CGRect(x: 0, y: 0, width: 0, height: 54))
            .byTitleFont(JobsFont.systemFont(ofSize: 14, weight: .semibold))
            .byTitleColor(UIColor(r: 0.17 * 255, g: 0.43 * 255, b: 0.82 * 255))
            .byAddTarget(self, action: #selector(loadMoreButtonTapped), for: .touchUpInside)
        updateRefreshers()
    }

    func rebuildRenderData() {
        renderRows.removeAll(keepingCapacity: true)
        isRenderTruncated = false
        let rowLimit = max(1, min(config.maxRenderedRows, 10_000))
        let depthLimit = max(0, min(config.maxReplyDepth, 128))
        let shouldShowChildren = config.mode != .toutiao || comments.count == 1
        for comment in comments {
            guard renderRows.count < rowLimit else {
                isRenderTruncated = true
                break
            }
            renderRows.append(RenderRow(comment: comment, depth: 0, parentComment: nil,
                                        isMoreRow: false, rootID: comment.messageID))
            guard shouldShowChildren else { continue }
            let visibleLimit = effectiveMaxVisibleChildReplyCount()
            let isExpanded = expandedRootIDs.contains(comment.messageID)
            var visibleCount = 0
            // Frames retain a child index, so very wide trees do not allocate a second full stack.
            var stack: [(parent: JobsSwiftCommentModel, index: Int, depth: Int)] = [(comment, 0, 1)]
            while let frame = stack.last {
                if frame.index >= frame.parent.children.count {
                    stack.removeLast()
                    continue
                }
                stack[stack.count - 1].index += 1
                guard frame.depth <= depthLimit else {
                    isRenderTruncated = true
                    stack.removeLast()
                    continue
                }
                if !isExpanded, visibleCount >= visibleLimit {
                    if renderRows.count < rowLimit {
                        renderRows.append(RenderRow(comment: comment, depth: 1, parentComment: nil,
                                                    isMoreRow: true, rootID: comment.messageID))
                    } else {
                        isRenderTruncated = true
                    }
                    break
                }
                guard renderRows.count < rowLimit else {
                    isRenderTruncated = true
                    break
                }
                let child = frame.parent.children[frame.index]
                renderRows.append(RenderRow(comment: child, depth: frame.depth,
                                            parentComment: frame.parent, isMoreRow: false,
                                            rootID: comment.messageID))
                visibleCount += 1
                if !child.children.isEmpty {
                    stack.append((child, 0, frame.depth + 1))
                }
            }
        }
    }

    func effectiveMaxVisibleChildReplyCount() -> Int {
        max(1, min(config.maxVisibleChildReplyCount, 10_000))
    }

    func shouldEnableRefreshByMode() -> Bool {
        config.mode == .netEase || config.mode == .custom
    }

    func updateRefreshers() {
        if shouldEnableRefreshByMode(), config.enablesPullRefresh {
            tableView.byRefreshControl(refreshControlView)
        } else {
            tableView.byRefreshControl(nil)
        }
        tableView.byTableFooterView(shouldEnableRefreshByMode() && config.enablesLoadMore ? loadMoreButton : UIView(frame: .zero))
        updateLoadMoreTitle()
    }

    func updateLoadMoreTitle() {
        let title: String
        if noMoreData {
            title = "没有更多评论了"
        } else if isLoadingMore {
            title = "正在加载更多评论..."
        } else {
            title = "上拉加载更多评论"
        }
        loadMoreButton
            .byTitle(title)
            .byEnabled(!isLoadingMore && !noMoreData)
    }

    func triggerLoadMore() {
        guard shouldEnableRefreshByMode(), config.enablesLoadMore, !isLoadingMore, !noMoreData else { return }
        isLoadingMore = true
        updateLoadMoreTitle()
        if let loadMoreBlock = config.loadMoreBlock {
            loadMoreBlock(self)
        } else {
            endLoadMore()
        }
    }

    @objc func pullRefreshTriggered() {
        if let pullRefreshBlock = config.pullRefreshBlock {
            pullRefreshBlock(self)
        } else {
            endPullRefresh()
        }
    }

    @objc func loadMoreButtonTapped() {
        triggerLoadMore()
    }
}
