//
//  DemoInsetRoundTableViewCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/2/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftBaseDefines
// MARK: - 演示UITableViewCell最小代价切圆角 + 与UITableView左右间距
final class DemoInsetRoundTableViewCell: UITableViewCell,
                                         UITableViewCellInsetProtocol,
                                         SectionCornerRoundable {    

    // 可以按需覆写协议默认值
    var horizontalInset: CGFloat { 16 }
    var shouldInsetSeparator: Bool { false }     // 卡片风格通常关闭系统 separator
    var sectionCornerRadius: CGFloat { 8 }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // selectionStyle = .none
        byBackgroundColor("#f9dcba".cor)
        contentView.byBackgroundColor("#f9dcba".cor)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // ✅ 只在 Cell 内部缩进，不修改外界 tableView 调用方式
        applyInsets()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        // 防止复用时视觉残留（尤其是 middle <-> first/last）
        contentView.layer.cornerRadius = 0
        contentView.layer.maskedCorners = []
        selectedBackgroundView?.layer.cornerRadius = 0
        selectedBackgroundView?.layer.maskedCorners = []
    }
}
