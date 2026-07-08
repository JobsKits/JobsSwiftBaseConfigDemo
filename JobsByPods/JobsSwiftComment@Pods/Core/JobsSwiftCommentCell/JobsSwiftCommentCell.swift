//
//  JobsSwiftCommentCell.swift
//  JobsSwiftComment
//
//  Created by Jobs on 2026年7月7日，星期二.
//

import UIKit

final class JobsSwiftCommentCell: UITableViewCell {
    static let reuseIdentifier = "JobsSwiftCommentCell"

    var replyAction: ((JobsSwiftCommentModel) -> Void)?

    private var currentComment: JobsSwiftCommentModel?
    private var contentLeadingConstraint: NSLayoutConstraint?

    private let avatarLabel = UILabel()
    private let nicknameLabel = UILabel()
    private let timeLabel = UILabel()
    private let contentLabel = UILabel()
    private let replyHintLabel = UILabel()
    private let metaLabel = UILabel()
    private let replyButton = UIButton(type: .system)
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
        avatarLabel.isHidden = false
        topStack.isHidden = false
        replyHintLabel.isHidden = false
        metaLabel.isHidden = false
        replyButton.isHidden = true
        contentLabel.textColor = UIColor(red: 0.18, green: 0.21, blue: 0.26, alpha: 1)
        contentLabel.font = .systemFont(ofSize: 15, weight: .regular)

        let displayDepth = config.mode == .custom ? min(depth, 2) : min(depth, 1)
        contentLeadingConstraint?.constant = 16 + CGFloat(displayDepth) * 22
        avatarLabel.text = avatarText(by: comment.nickname)
        nicknameLabel.text = comment.nickname
        timeLabel.text = comment.publishTime
        contentLabel.text = comment.content

        if depth >= 2, let replyUserName = parentComment?.nickname, !replyUserName.isEmpty {
            replyHintLabel.text = "回复 \(replyUserName)"
            replyHintLabel.isHidden = false
        } else if let replyUserName = comment.replyUserName, depth > 0 {
            replyHintLabel.text = "回复 \(replyUserName)"
            replyHintLabel.isHidden = false
        } else {
            replyHintLabel.isHidden = true
        }

        metaLabel.text = metaText(by: comment, config: config)
        metaLabel.isHidden = metaLabel.text?.isEmpty ?? true

        let showsReplyEntrance = config.showsReplyEntrance && !comment.children.isEmpty && depth == 0
        replyButton.isHidden = !showsReplyEntrance
        if showsReplyEntrance {
            replyButton.setTitle("查看 \(comment.children.count) 条回复", for: .normal)
        }
    }

    func updateWithMoreText(_ text: String, depth: Int) {
        selectionStyle = .default
        currentComment = nil
        avatarLabel.isHidden = true
        topStack.isHidden = true
        replyHintLabel.isHidden = true
        metaLabel.isHidden = true
        replyButton.isHidden = true
        contentLeadingConstraint?.constant = 16 + CGFloat(min(depth, 2)) * 22
        contentLabel.text = text
        contentLabel.textColor = UIColor(red: 0.17, green: 0.43, blue: 0.82, alpha: 1)
        contentLabel.font = .systemFont(ofSize: 14, weight: .semibold)
    }
}

private extension JobsSwiftCommentCell {

    func setupViews() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        avatarLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarLabel.textAlignment = .center
        avatarLabel.font = .systemFont(ofSize: 16, weight: .bold)
        avatarLabel.textColor = .white
        avatarLabel.backgroundColor = UIColor(red: 0.70, green: 0.45, blue: 0.22, alpha: 1)
        avatarLabel.layer.cornerRadius = 18
        avatarLabel.layer.masksToBounds = true

        nicknameLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        nicknameLabel.textColor = UIColor(red: 0.18, green: 0.21, blue: 0.26, alpha: 1)
        nicknameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        timeLabel.font = .systemFont(ofSize: 12, weight: .regular)
        timeLabel.textColor = UIColor(red: 0.50, green: 0.54, blue: 0.60, alpha: 1)
        timeLabel.textAlignment = .right

        contentLabel.numberOfLines = 0
        contentLabel.font = .systemFont(ofSize: 15, weight: .regular)
        contentLabel.textColor = UIColor(red: 0.18, green: 0.21, blue: 0.26, alpha: 1)

        replyHintLabel.numberOfLines = 1
        replyHintLabel.font = .systemFont(ofSize: 12, weight: .medium)
        replyHintLabel.textColor = UIColor(red: 0.17, green: 0.43, blue: 0.82, alpha: 1)

        metaLabel.numberOfLines = 1
        metaLabel.font = .systemFont(ofSize: 12, weight: .regular)
        metaLabel.textColor = UIColor(red: 0.50, green: 0.54, blue: 0.60, alpha: 1)

        replyButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        replyButton.contentHorizontalAlignment = .left
        replyButton.setTitleColor(UIColor(red: 0.17, green: 0.43, blue: 0.82, alpha: 1), for: .normal)
        replyButton.addTarget(self, action: #selector(replyButtonTapped), for: .touchUpInside)

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

        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .horizontal
        verticalStack.alignment = .top
        verticalStack.spacing = 10
        verticalStack.addArrangedSubview(avatarLabel)
        verticalStack.addArrangedSubview(contentStack)
        contentView.addSubview(verticalStack)

        contentLeadingConstraint = verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        NSLayoutConstraint.activate([
            contentLeadingConstraint!,
            verticalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            avatarLabel.widthAnchor.constraint(equalToConstant: 36),
            avatarLabel.heightAnchor.constraint(equalToConstant: 36)
        ])
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

