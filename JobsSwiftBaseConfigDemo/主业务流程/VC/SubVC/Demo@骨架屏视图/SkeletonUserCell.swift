//
//  SkeletonUserCell.swift
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
import SkeletonView

final class SkeletonUserCell: UITableViewCell {
    // MARK: - UI（lazy）
    private lazy var avatar: UIImageView = {
        let iv = UIImageView()
            .bySkeletonable()
            .bySkeletonCornerRadius(24)
            .byAddTo(contentView) { make in
                make.size.equalTo(CGSize(width: 48, height: 48))
                make.leading.equalToSuperview().offset(16)
                make.centerY.equalToSuperview()
                make.top.greaterThanOrEqualToSuperview().offset(12)
                make.bottom.lessThanOrEqualToSuperview().inset(12)
            }
        iv.byContentMode(.scaleAspectFill)
        iv.byClipsToBounds()
        iv.byCornerRadius(24)
        return iv
    }()

    private lazy var titleLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byNumberOfLines(1)
            .bySkeletonable()
            .bySkeletonLinesCornerRadius(6)
    }()

    private lazy var subtitleLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(2)
            .bySkeletonable()
            .bySkeletonLinesCornerRadius(6)
            .bySkeletonLastLineFillPercent(60)
    }()

    private lazy var stack: UIStackView = {
        UIStackView()
            .byAxis(.vertical)
            .byAlignment(.fill)
            .byDistribution(.fill)
            .bySpacing(6)
            .byAddArrangedSubviews([titleLabel, subtitleLabel])
            .byAddTo(contentView) { [unowned self] make in
                make.leading.equalTo(avatar.snp.trailing).offset(12)
                make.trailing.equalToSuperview().inset(16)
                make.centerY.equalTo(avatar)
            }
    }()
    // MARK: - Init
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
        avatar.byVisible(YES)
        stack.byVisible(YES)
        self.bySkeletonable()
        contentView.bySkeletonable()
    }
}

extension SkeletonUserCell {
    // MARK: - Data
    func configure(with u: User) {
        avatar.byBackgroundColor(u.color)
        titleLabel.byText(u.name)
        subtitleLabel.byText(u.detail)
    }
}
