//
//  JobsSwiftCommentCell.swift
//  JobsSwiftComment
//
//  Created by Jobs on 2026年7月7日，星期二.
//

import UIKit
import JobsSwiftBaseDefines
import JobsByUIKit
import JobsSwiftDSL
import SnapKit

final class JobsSwiftCommentCell: UITableViewCell {
    static let reuseIdentifier = "JobsSwiftCommentCell"

    var replyAction: ((JobsSwiftCommentModel) -> Void)?

    private var currentComment: JobsSwiftCommentModel?
    private var contentLeadingConstraint: Constraint?

    private let avatarLabel = UILabel()
    private let nicknameLabel = UILabel()
    private let timeLabel = UILabel()
    private let contentLabel = UILabel()
    private let replyHintLabel = UILabel()
    private let metaLabel = UILabel()
    private let replyButton = UIButton.sys()
    private let verticalStack = UIStackView()
    private let topStack = UIStackView()
    private let contentStack = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        replyAction = nil
        currentComment = nil
    }

    func update(with comment: JobsSwiftCommentModel,
                config: JobsSwiftCommentConfig,
                depth: Int,
                parentComment: JobsSwiftCommentModel?) {
        currentComment = comment
        selectionStyle = .default
        avatarLabel.byHidden(false)
        topStack.byHidden(false)
        replyHintLabel.byHidden(false)
        metaLabel.byHidden(false)
        replyButton.byHidden(true)
        contentLabel.byTextColor(JobsCor.label)
        contentLabel.byFont(JobsFont.systemFont(ofSize: 15, weight: .regular))
        let displayDepth = config.mode == .custom ? min(depth, 2) : min(depth, 1)
        contentLeadingConstraint?.update(offset: 16 + CGFloat(displayDepth) * 22)
        avatarLabel.byText(avatarText(by: comment.nickname))
        nicknameLabel.byText(comment.nickname)
        timeLabel.byText(comment.publishTime)
        contentLabel.byText(comment.content)
        if depth >= 2, let replyUserName = parentComment?.nickname, !replyUserName.isEmpty {
            replyHintLabel.byText("回复 \(replyUserName)")
            replyHintLabel.byHidden(false)
        } else if let replyUserName = comment.replyUserName, depth > 0 {
            replyHintLabel.byText("回复 \(replyUserName)")
            replyHintLabel.byHidden(false)
        } else {
            replyHintLabel.byHidden(true)
        }
        metaLabel.byText(metaText(by: comment, config: config))
        metaLabel.byHidden(metaLabel.text?.isEmpty ?? true)
        let showsReplyEntrance = config.showsReplyEntrance && !comment.children.isEmpty && depth == 0
        replyButton.byHidden(!showsReplyEntrance)
        if showsReplyEntrance {
            replyButton.byTitle("查看 \(comment.children.count) 条回复")
        }
    }

    func updateWithMoreText(_ text: String, depth: Int) {
        selectionStyle = .default
        currentComment = nil
        avatarLabel.byHidden(true)
        topStack.byHidden(true)
        replyHintLabel.byHidden(true)
        metaLabel.byHidden(true)
        replyButton.byHidden(true)
        contentLeadingConstraint?.update(offset: 16 + CGFloat(min(depth, 2)) * 22)
        contentLabel.byText(text)
        contentLabel.byTextColor(UIColor(r: 0.17 * 255, g: 0.43 * 255, b: 0.82 * 255))
        contentLabel.byFont(JobsFont.systemFont(ofSize: 14, weight: .semibold))
    }
}

private extension JobsSwiftCommentCell {
    func setupViews() {
        self.byBackgroundColor(JobsCor.clear)
        contentView.byBackgroundColor(JobsCor.clear)
        avatarLabel.byTextAlignment(.center)
        avatarLabel.byFont(JobsFont.systemFont(ofSize: 16, weight: .bold))
        avatarLabel.byTextColor(JobsCor.white)
        avatarLabel.byBackgroundColor(UIColor(r: 0.70 * 255, g: 0.45 * 255, b: 0.22 * 255))
        avatarLabel.byCornerRadius(18)
        avatarLabel.byMasksToBounds(true)
        nicknameLabel.byFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
        nicknameLabel.byTextColor(JobsCor.label)
        nicknameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        timeLabel.byFont(JobsFont.systemFont(ofSize: 12, weight: .regular))
        timeLabel.byTextColor(JobsCor.secondaryLabel)
        timeLabel.byTextAlignment(.right)
        contentLabel.byNumberOfLines(0)
        contentLabel.byFont(JobsFont.systemFont(ofSize: 15, weight: .regular))
        contentLabel.byTextColor(JobsCor.label)
        replyHintLabel.byNumberOfLines(1)
        replyHintLabel.byFont(JobsFont.systemFont(ofSize: 12, weight: .medium))
        replyHintLabel.byTextColor(UIColor(r: 0.17 * 255, g: 0.43 * 255, b: 0.82 * 255))
        metaLabel.byNumberOfLines(1)
        metaLabel.byFont(JobsFont.systemFont(ofSize: 12, weight: .regular))
        metaLabel.byTextColor(JobsCor.secondaryLabel)
        replyButton
            .byTitleFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byContentHorizontalAlignment(.left)
            .byTitleColor(UIColor(r: 0.17 * 255, g: 0.43 * 255, b: 0.82 * 255))
            .byAddTarget(self, action: #selector(replyButtonTapped), for: .touchUpInside)
        topStack.axis = .horizontal
        topStack.alignment = .firstBaseline
        topStack.spacing = 8
        topStack.addArrangedSubview(nicknameLabel)
        topStack.addArrangedSubview(timeLabel)
        contentStack.axis = .vertical
        contentStack.spacing = 6
        contentStack.addArrangedSubview(topStack)
        contentStack.addArrangedSubview(replyHintLabel)
        contentStack.addArrangedSubview(contentLabel)
        contentStack.addArrangedSubview(metaLabel)
        contentStack.addArrangedSubview(replyButton)
        verticalStack.axis = .horizontal
        verticalStack.alignment = .top
        verticalStack.spacing = 10
        verticalStack.addArrangedSubview(avatarLabel)
        verticalStack.addArrangedSubview(contentStack)
        verticalStack.byAddTo(contentView)
        verticalStack.snp.makeConstraints { make in
            contentLeadingConstraint = make.leading.equalToSuperview().offset(16).constraint
            make.top.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-12)
        }
        avatarLabel.snp.makeConstraints { make in
            make.size.equalTo(36)
        }
    }

    func avatarText(by nickname: String) -> String {
        let trimmed = nickname.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let first = trimmed.first else { return "J" };return String(first)
    }

    func metaText(by comment: JobsSwiftCommentModel, config: JobsSwiftCommentConfig) -> String {
        var texts: [String] = []
        if config.showsDevice, !comment.device.isEmpty {
            texts.append(comment.device)
        }
        if config.showsLocation, !comment.location.isEmpty {
            texts.append(comment.location)
        };return texts.joined(separator: " · ")
    }

    @objc func replyButtonTapped() {
        guard let currentComment else { return }
        replyAction?(currentComment)
    }
}
