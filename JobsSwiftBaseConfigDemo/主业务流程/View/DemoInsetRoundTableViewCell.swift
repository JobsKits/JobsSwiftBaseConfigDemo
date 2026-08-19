//
//  DemoInsetRoundTableViewCell.swift
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

// MARK: - 演示：UITableViewCell 最小代价切圆角 + 与 UITableView 留边距（只动 contentView）
final class DemoInsetRoundTableViewCell: UITableViewCell,
                                         UITableViewCellInsetProtocol,
                                         SectionCornerRoundable {
    private var sectionPosition: SectionCellPosition = .single

    private lazy var selectedCardView: UIView = {
        UIView.jobsMake { _ in }.byBackgroundColor(JobsCor.systemGray5)
    }()

    private lazy var accentView: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.systemBlue)
            .byAddTo(contentView) { make in
                make.top.left.bottom.equalToSuperview()
                make.width.equalTo(5)
            }
    }()

    private lazy var separatorView: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.separator)
            .byAddTo(contentView) { make in
                make.left.equalToSuperview().offset(20)
                make.right.bottom.equalToSuperview()
                make.height.equalTo(1)
            }
    }()

    // MARK: - Inset 配置（支持上下左右）
    var contentInsets: UIEdgeInsets {
        switch sectionPosition {
        /// 单行 section 的上下都留出卡片呼吸空间
        case .single:
            return .init(top: 6, left: 24, bottom: 6, right: 24)
        /// 多行 section 只在首行顶部留白
        case .first:
            return .init(top: 6, left: 24, bottom: 0, right: 24)
        /// 中间行保持连续卡片
        case .middle:
            return .init(top: 0, left: 24, bottom: 0, right: 24)
        /// 多行 section 只在末行底部留白
        case .last:
            return .init(top: 0, left: 24, bottom: 6, right: 24)
        }
    }
    // MARK: - Separator（卡片风格通常关掉系统 separator）
    var shouldInsetSeparator: Bool { false }
    // MARK: - Section 圆角配置
    var sectionCornerRadius: CGFloat { 18 }

    private var showsInternalSeparator: Bool {
        switch sectionPosition {
        /// 首行和中间行需要显示卡片内部的层级分隔线
        case .first, .middle:
            return true
        /// 单行和末行不显示底部分隔线
        case .single, .last:
            return false
        }
    }
    // MARK: - Init
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self
            .byBackgroundColor(JobsCor.clear)
            .byBackgroundConfiguration { config in
                config = config.byBackgroundColor(JobsCor.clear)
            }
            .bySelectedBackgroundView(selectedCardView)
        contentView.byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
        accentView.byVisible(YES)
        separatorView.byVisible(NO)
    }

    @discardableResult
    func bySectionPosition(_ position: SectionCellPosition) -> Self {
        sectionPosition = position
        separatorView.byVisible(showsInternalSeparator)
        applySectionCorners(position)
        return bySetNeedsLayout()
    }
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        applyInsets()
        applySectionCorners(sectionPosition)
        contentView
            .byBringToFront(accentView)
            .byBringToFront(separatorView)
    }
    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        bySectionPosition(.single)
    }
}
