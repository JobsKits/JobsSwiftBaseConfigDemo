//
//  LiveMsgCell.swift
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

final class LiveMsgCell: UITableViewCell {
    private lazy var bubble: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(12)
            .byMasksToBounds(true)
            .byAddTo(contentView) {[unowned self] make in
                make.top.equalToSuperview().offset(6)
                make.bottom.equalToSuperview().inset(6)
                make.leading.equalToSuperview().offset(12)
                make.trailing.lessThanOrEqualToSuperview().inset(12)
            }
    }()
    private lazy var label: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 16))
            .byTextColor(JobsCor.label)
            .byAddTo(bubble) {[unowned self] make in
                make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
            }
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.byBackgroundColor(JobsCor.clear)
        contentView.byBackgroundColor(JobsCor.clear)
        bubble.byVisible(YES)
        label.byVisible(YES)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    func configure(_ m: LiveMsg) -> Self{
        label.byText(m.text)
        return self
    }

    func playAppearAnimation() {
        contentView.byAlpha(0)
        contentView.transform = CGAffineTransform(translationX: 0, y: 22)
        UIView.jobsAnimateWithSpring(
            0.25,
            dampingRatio: 0.85,
            initialVelocity: 0.6,
            options: [.curveEaseOut, .allowUserInteraction],
            animations: {
                self.contentView.byAlpha(1)
                self.contentView.transform = .identity
            }
        )
    }
}
