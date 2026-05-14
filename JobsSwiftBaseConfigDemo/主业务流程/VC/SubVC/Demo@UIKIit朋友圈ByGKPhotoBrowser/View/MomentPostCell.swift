//
//  MomentPostCell.swift
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

import SnapKit
import JobsByUIKit
import JobsImageTools
import JobsSwiftFoundation
import JobsSwiftBaseDefines

final class MomentPostCell: UITableViewCell, UITextViewDelegate {
    // callbacks (✅ 回调把 cell 自己带出去)
    typealias CellVoidCallback = (MomentPostCell) -> Void
    typealias CellIntCallback  = (MomentPostCell, Int) -> Void

    private(set) var onTapMedia: CellIntCallback?
    private(set) var onToggleExpand: CellVoidCallback?
    private(set) var onLikeTapped: CellVoidCallback?
    private(set) var onCommentTapped: CellVoidCallback?
    private(set) var onNeedHeightUpdate: CellVoidCallback?

    private var layoutMode: TimelineLayoutMode = .estimated_autoDimension
    // 合并：同一帧只触发一次
    private var pendingHeightUpdate = false
    private func requestHeightUpdateOnce() {
        guard layoutMode == .estimated_autoDimension else { return }
        guard !pendingHeightUpdate else { return }
        pendingHeightUpdate = true
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.pendingHeightUpdate = false
            self.onNeedHeightUpdate?(self) // ✅ 带 cell
        }
    }
    // 当前数据
    private var currentPost: MomentPost?
    private var needsToggle: Bool = false
    private var lastTextWidth: CGFloat = 0
    // constraints
    private var mediaHeightConstraint: Constraint?
    // avatar loading
    private var avatarTask: URLSessionDataTask?
    private var currentAvatarURL: URL?

    private lazy var card: UIView = {
        UIView()
            .byBackgroundColor(.secondarySystemGroupedBackground)
            .byCornerRadius(12)
            .byMasksToBounds(YES)
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(8)
                make.left.right.equalToSuperview().inset(12)
                make.bottom.equalToSuperview().inset(8)
            }
    }()

    private lazy var avatar: UIImageView = {
        UIImageView()
            .byBackgroundColor(.tertiarySystemFill)
            .byCornerRadius(20)
            .byMasksToBounds(YES)
            .byContentMode(.scaleAspectFill)
            .byAddTo(card) { make in
                make.top.left.equalToSuperview().offset(12)
                make.size.equalTo(CGSize(width: 40, height: 40))
            }
    }()

    private lazy var rightStack: UIStackView = {
        UIStackView()
            .byAxis(.vertical)
            .byAlignment(.fill)
            .byDistribution(.fill)
            .bySpacing(6)
            .byAddArrangedSubview(nameLabel)
            .byAddArrangedSubview(contentTextView)
            .byAddArrangedSubview(mediaView)
            .byAddArrangedSubview(bottomBar)
            .byAddArrangedSubview(commentsBG)
            .byAddTo(card) { [unowned self] make in
                make.top.equalToSuperview().offset(12)
                make.left.equalTo(self.avatar.snp.right).offset(10)
                make.right.equalToSuperview().inset(12)
                make.bottom.equalToSuperview().inset(12)
            }
            .byCustomSpacing(8, after: contentTextView)
            .byCustomSpacing(8, after: bottomBar)
    }()

    private lazy var nameLabel: UILabel = {
        UILabel()
            .byFont(.boldSystemFont(ofSize: 15))
            .byTextColor(.label)
    }()
    /// ✅ 用 UITextView 做“末尾内联 全文/收起”
    private lazy var contentTextView: UITextView = {
        UITextView()
            .byBackgroundColor(.clear)
            .byEditable(NO)
            .byScrollEnabled(NO)
            .bySelectable(YES)
            .byDataDetectorTypes([])
            .byTextContainerInset(.zero)
            .byDelegate(self)
            .byTextAlignment(.left)
            .byAdjustsFontForContentSizeCategory(NO)
            .byTextContainer { textContainer in
                textContainer.lineFragmentPadding = 0
            }
            .byLinkTextAttributes([
                .foregroundColor: UIColor.systemBlue,
                .underlineStyle: 0
            ])
    }()

    private lazy var mediaView: MomentMediaView = {
        MomentMediaView()
            .byOnTap { [weak self] idx in
                guard let self else { return }
                self.onTapMedia?(self, idx) // ✅ 带 cell
            }
            .byOnHeightChanged { [weak self] h in
                guard let self else { return }
                self.mediaHeightConstraint?.update(offset: h)
                self.requestHeightUpdateOnce()
            }
            .byAdd { [weak self] make in
                self?.mediaHeightConstraint = make.height.equalTo(0).constraint
            }
    }()
    /// ✅ bottomBar：不要在这里触发 timeLabel/like/comment 的 lazy
    private lazy var bottomBar: UIView = {
        UIView()
            .byAdd { make in
                make.height.equalTo(22)
            }
    }()

    private lazy var timeLabel: UILabel = {
        UILabel()
            .byFont(.systemFont(ofSize: 12))
            .byTextColor(.secondaryLabel)
            .byAddTo(bottomBar) { make in
                make.left.centerY.equalToSuperview()
            }
    }()

    private lazy var commentButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.clear, for: .normal)
            .byTitle("评论".tr, for: .normal)
            .byTitleColor(.systemBlue, for: .normal)
            .byTitleFont(.systemFont(ofSize: 13, weight: .medium))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.onCommentTapped?(self) // ✅ 带 cell
            }
            .byAddTo(bottomBar) { make in
                make.right.centerY.equalToSuperview()
            }
    }()

    private lazy var likeButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.clear, for: .normal)
            .byTitle("赞".tr, for: .normal)
            .byTitleColor(.systemBlue, for: .normal)
            .byTitleFont(.systemFont(ofSize: 13, weight: .medium))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.onLikeTapped?(self) // ✅ 带 cell
            }
            .byAddTo(bottomBar) { make in
                make.right.equalTo(self.commentButton.snp.left).offset(-14)
                make.centerY.equalToSuperview()
            }
    }()
    /// ✅ commentsBG：不要在这里触发 commentsStack 的 lazy
    private lazy var commentsBG: UIView = {
        UIView()
            .byBackgroundColor(.secondarySystemBackground)
            .byCornerRadius(8)
            .byMasksToBounds(YES)
    }()

    private lazy var commentsStack: UIStackView = {
        UIStackView()
            .byAxis(.vertical)
            .byAlignment(.fill)
            .byDistribution(.fill)
            .bySpacing(6)
            .byAddTo(commentsBG) { make in
                make.edges.equalToSuperview().inset(8)
            }
    }()
    // ============================== Init ==============================
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        card.byVisible(YES)
        avatar.byVisible(YES)
        rightStack.byVisible(YES)
        timeLabel.byVisible(YES)
        likeButton.byVisible(YES)
        commentButton.byVisible(YES)
        commentsStack.byVisible(YES)
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        onTapMedia = nil
        onToggleExpand = nil
        onLikeTapped = nil
        onCommentTapped = nil
        onNeedHeightUpdate = nil

        pendingHeightUpdate = false
        currentPost = nil
        needsToggle = false
        lastTextWidth = 0

        avatarTask?.cancel()
        avatarTask = nil
        currentAvatarURL = nil
        avatar.image = nil

        nameLabel.text = nil
        contentTextView.attributedText = nil

        mediaView.byVisible(false)
        mediaHeightConstraint?.update(offset: 0)
        mediaView.render([])

        timeLabel.text = nil
        likeButton.byTitle("赞".tr, for: .normal)

        commentsBG.byVisible(false)
        commentsStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        // 文本宽度变化时，重新生成“内联全文”
        let w = rightStack.bounds.width
        if w > 0, abs(w - lastTextWidth) > 0.5 {
            lastTextWidth = w
            rebuildContentTextIfNeeded()
        }
    }
    // ============================== byData ==============================
    @discardableResult
    func byData(_ post: MomentPost, layoutMode: TimelineLayoutMode) -> Self {
        self.layoutMode = layoutMode
        self.currentPost = post
        nameLabel.byText(post.name)
        // avatar
        if let urlStr = post.avatarURL, let url = URL(string: urlStr) {
            setAvatar(url)
        } else {
            avatar.image = nil
        }
        // 文本先生成（如果当前宽度还没出来，layoutSubviews 会再补一次）
        lastTextWidth = rightStack.bounds.width
        rebuildContentTextIfNeeded()
        // media
        if post.media.isEmpty {
            mediaView.byVisible(false)
            mediaHeightConstraint?.update(offset: 0)
            mediaView.render([])
        } else {
            mediaView.byVisible(true)
            let rightW = max(0, rightStack.bounds.width > 0 ? rightStack.bounds.width : estimatedRightWidth())
            let h = MomentMediaView.height(for: post.media, width: rightW)
            mediaHeightConstraint?.update(offset: h)
            mediaView.render(post.media)
        }
        // bottom
        timeLabel.text = post.timeText
        let likeTitle = post.isLiked
        ? "已赞".tr + String(post.likeCount)
        : (post.likeCount > 0 ? "赞".tr + String(post.likeCount) : "赞".tr)
        likeButton.byTitle(likeTitle, for: .normal)

        // comments
        rebuildComments(post.comments)
        requestHeightUpdateOnce()
        return self
    }

    func mediaSourceImageView(at index: Int) -> UIImageView? {
        mediaView.imageView(at: index)
    }
    // ============================== Inline “全文/收起” ==============================
    private static let toggleURL = URL(string: "https://github.com/JobsKits/JobsSwiftBaseConfigDemo")!
    func textView(_ textView: UITextView,
                  shouldInteractWith URL: URL,
                  in characterRange: NSRange,
                  interaction: UITextItemInteraction) -> Bool {
        if URL.absoluteString == Self.toggleURL.absoluteString {
            onToggleExpand?(self) // ✅ 带 cell
            return false
        };return true
    }

    private func rebuildContentTextIfNeeded() {
        guard let post = currentPost else { return }

        let width = max(0, rightStack.bounds.width > 0 ? rightStack.bounds.width : estimatedRightWidth())
        guard width > 0 else { return }

        let base = makeBaseText(post: post)
        let maxLines = 3

        // 是否需要“全文”
        let fullFits = TextKitMeasure.fits(base, width: width, maxLines: maxLines)
        needsToggle = !fullFits

        if !needsToggle {
            contentTextView.attributedText = base
            return
        }

        if post.isExpanded {
            let expanded = NSMutableAttributedString(attributedString: base)
            expanded.append(NSAttributedString(string: " "))
            expanded.append(makeToggleToken(title: "收起".tr))
            contentTextView.attributedText = expanded
        } else {
            // 折叠：做一个“能容纳 …全文 的 3 行截断”
            let collapsed = makeCollapsedText(base: base, width: width, maxLines: maxLines)
            contentTextView.attributedText = collapsed
        }
    }

    private func makeBaseText(post: MomentPost) -> NSAttributedString {
        if let rich = post.richText { return rich }
        return NSAttributedString(string: post.text, attributes: [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.label
        ])
    }

    private func makeToggleToken(title: String) -> NSAttributedString {
        NSMutableAttributedString(string: title, attributes: [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.systemBlue,
            .link: Self.toggleURL
        ])
    }

    private func makeCollapsedText(base: NSAttributedString, width: CGFloat, maxLines: Int) -> NSAttributedString {
        let tail = NSMutableAttributedString(string: "…", attributes: [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.label
        ]).byAdd(makeToggleToken(title: "全文".tr))
        // binary search 最长前缀，使“前缀 + …全文”能在 maxLines 内完整展示
        let fullLen = base.length
        var lo = 0
        var hi = fullLen
        var best = 0

        while lo <= hi {
            let mid = (lo + hi) / 2
            let prefix = base.attributedSubstring(from: NSRange(location: 0, length: mid))
            let candidate = NSMutableAttributedString(attributedString: prefix)
            candidate.append(tail)

            if TextKitMeasure.fits(candidate, width: width, maxLines: maxLines) {
                best = mid
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }
        let prefix = base.attributedSubstring(from: NSRange(location: 0, length: best))
        return NSMutableAttributedString(attributedString: prefix).byAdd(tail)
    }
    // ============================== Comments ==============================
    private func rebuildComments(_ list: [MomentComment]) {
        commentsStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        guard !list.isEmpty else {
            commentsBG.byVisible(false)
            return
        }
        commentsBG.byVisible(true)
        for c in list {
            commentsStack.addArrangedSubview(
                UILabel()
                    .byNumberOfLines(0)
                    .byFont(.systemFont(ofSize: 13))
                    .byTextColor(.label)
                    .byAttributedString(
                        NSMutableAttributedString(
                            string: "\(c.user)：",
                            attributes: [
                                .font: UIFont.systemFont(ofSize: 13, weight: .semibold),
                                .foregroundColor: UIColor.label
                            ]
                        )
                        .byAdd(NSAttributedString(
                            string: c.text,
                            attributes: [
                                .font: UIFont.systemFont(ofSize: 13),
                                .foregroundColor: UIColor.label
                            ]
                        ))))
        }
    }
    // ============================== Avatar ==============================
    private func setAvatar(_ url: URL) {
        currentAvatarURL = url
        if let cached = JobsSimpleImageLoader.shared.cachedImage(for: url) {
            avatar.image = cached
            return
        }
        avatarTask?.cancel()
        avatarTask = JobsSimpleImageLoader.shared.load(url) { [weak self] img in
            guard let self else { return }
            guard self.currentAvatarURL == url else { return }
            self.avatar.image = img
        }
    }
    // ============================== Utils ==============================
    private func estimatedRightWidth() -> CGFloat {
        let tableW = UIScreen.main.bounds.width
        return max(0, tableW - (24 + 24 + 40 + 10 + 12))
    }
    // ============================== Height Formula ==============================
    static func heightFormula(for post: MomentPost, tableWidth: CGFloat) -> CGFloat {
        let outer: CGFloat = 8 + 8 + 12 + 12
        let contentW = max(0, tableWidth - (24 + 24 + 40 + 10 + 12))

        var heights: [CGFloat] = []
        heights.append(UIFont.boldSystemFont(ofSize: 15).lineHeight)

        let fullTextCount = post.richText?.string.count ?? post.text.count
        let likelyNeedsMore = fullTextCount > 60

        let textH: CGFloat = {
            if let rich = post.richText {
                let h = rich.boundingHeight(width: contentW, fontFallback: .systemFont(ofSize: 14))
                if likelyNeedsMore && !post.isExpanded {
                    return min(h, ceil(UIFont.systemFont(ofSize: 14).lineHeight * 3))
                }
                // expanded：粗略按真实高度算
                return h + (likelyNeedsMore ? ceil(UIFont.systemFont(ofSize: 14).lineHeight) : 0)
            } else {
                let h = post.text.boundingHeight(width: contentW, font: .systemFont(ofSize: 14))
                if likelyNeedsMore && !post.isExpanded {
                    return min(h, ceil(UIFont.systemFont(ofSize: 14).lineHeight * 3))
                }
                return h + (likelyNeedsMore ? ceil(UIFont.systemFont(ofSize: 14).lineHeight) : 0)
            }
        }()
        heights.append(textH)

        if !post.media.isEmpty {
            heights.append(MomentMediaView.height(for: post.media, width: contentW))
        }

        heights.append(22) // bottomBar

        if !post.comments.isEmpty {
            let commentsW = max(0, contentW - 16)
            var commentsH: CGFloat = 16
            for (idx, c) in post.comments.enumerated() {
                let attr = NSMutableAttributedString(
                    string: "\(c.user)：",
                    attributes: [.font: UIFont.systemFont(ofSize: 13, weight: .semibold)]
                )
                attr.append(NSAttributedString(string: c.text, attributes: [.font: UIFont.systemFont(ofSize: 13)]))
                commentsH += attr.boundingHeight(width: commentsW, fontFallback: .systemFont(ofSize: 13))
                if idx != post.comments.count - 1 { commentsH += 6 }
            }
            heights.append(commentsH)
        }

        let spacing: CGFloat = 6
        let spacingSum = CGFloat(max(0, heights.count - 1)) * spacing
        let stackH = heights.reduce(0, +) + spacingSum

        return ceil(outer + max(40, stackH) + 1)
    }
}
// MARK: - DSL
extension MomentPostCell {

    @discardableResult
    func byOnTapMedia(_ cb: CellIntCallback?) -> Self {
        onTapMedia = cb
        return self
    }

    @discardableResult
    func byOnToggleExpand(_ cb: CellVoidCallback?) -> Self {
        onToggleExpand = cb
        return self
    }

    @discardableResult
    func byOnLikeTapped(_ cb: CellVoidCallback?) -> Self {
        onLikeTapped = cb
        return self
    }

    @discardableResult
    func byOnCommentTapped(_ cb: CellVoidCallback?) -> Self {
        onCommentTapped = cb
        return self
    }

    @discardableResult
    func byOnNeedHeightUpdate(_ cb: CellVoidCallback?) -> Self {
        onNeedHeightUpdate = cb
        return self
    }
}
