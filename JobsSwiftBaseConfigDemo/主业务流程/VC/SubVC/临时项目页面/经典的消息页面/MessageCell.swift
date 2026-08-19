//
//  MessageCell.swift
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

import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import SnapKit

final class MessageCell: UITableViewCell {
    private lazy var titleLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTextColor(JobsCor.label)
    }()

    private lazy var timeLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 12))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.right)
    }()

    private lazy var previewLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 13))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(1)
    }()

    private lazy var titleRow: UIStackView = {
        UIStackView(arrangedSubviews: [titleLabel, UIView.jobsMake { _ in }, timeLabel])
            .byAxis(.horizontal)
            .byAlignment(.center)
    }()

    private lazy var textStack: UIStackView = {
        UIStackView(arrangedSubviews: [titleRow, previewLabel])
            .byAxis(.vertical)
            .bySpacing(6)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalToSuperview().offset(10)
                make.bottom.equalToSuperview().inset(10)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().inset(16)
            }
    }()

    required init?(coder: NSCoder) { fatalError() }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
        contentView.byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
        textStack.byVisible(YES)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateSystemSelectionControlIfNeeded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        updateSystemSelectionControlIfNeeded()
    }
}

extension MessageCell {
    func render(item: MessageItem, editing: Bool) {
        titleLabel.byText(item.title)
        previewLabel.byText(item.preview)
        timeLabel.byText(item.time)
        showsReorderControl = editing
    }

    private func updateSystemSelectionControlIfNeeded() {
        guard isEditing else { return }
        // 找私有 editControl（类名不保证稳定）
        guard let editControl = subviews.first(where: {
            String(describing: type(of: $0)).contains("EditControl")
        }) else { return }
        // 里面通常有 UIImageView
        let iv = editControl.subviews.compactMap { $0 as? UIImageView }.first
        guard let imageView = iv else { return }
        imageView
            .byTintColor(JobsCor.systemBlue)
            .byImage(isSelected ? "选择框（已选择）".img : "选择框（未选择）".img)
    }
}
