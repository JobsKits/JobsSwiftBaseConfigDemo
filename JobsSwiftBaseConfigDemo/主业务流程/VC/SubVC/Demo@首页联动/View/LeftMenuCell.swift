//
//  LeftMenuCell.swift
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

final class LeftMenuCell: UITableViewCell {

    private lazy var indicator: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.systemOrange)
            .byAddTo(contentView) { make in
                make.leading.equalToSuperview()
                make.centerY.equalToSuperview()
                make.width.equalTo(4)
                make.height.equalTo(22)
            }
    }()

    private lazy var iconView: UIImageView = {
        UIImageView(image:"star".sysImg)
            .byTintColor(JobsCor.systemGray)
            .byContentMode(.scaleAspectFit)
            .byAddTo(contentView) { make in
                make.leading.equalToSuperview().offset(16)
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize(width: 18, height: 18))
            }
    }()

    private lazy var titleLabel: UILabel = {
        UILabel()
            .byText("--")
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(contentView) { [unowned self] make in
                make.leading.equalTo(iconView.snp.trailing).offset(10)
                make.trailing.lessThanOrEqualToSuperview().inset(8)
                make.centerY.equalTo(iconView.snp.centerY)
            }
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.byBackgroundColor(JobsCor.clear)
        contentView.byBackgroundColor(JobsCor.clear)
        selectionStyle = .none

        indicator.byHidden(YES)
        iconView.byVisible(YES)
        titleLabel.byVisible(YES)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    func configure(icon: String, title: String, selected: Bool) {
        iconView.byImage(UIImage(systemName: icon))
        titleLabel.byText(title)
        indicator.byHidden(!selected)
        titleLabel.byTextColor(selected ? JobsCor.label : JobsCor.secondaryLabel)
        iconView.byTintColor(selected ? JobsCor.systemOrange : JobsCor.systemGray)
        contentView.byBackgroundColor(
            selected ? JobsCor.systemOrange.withAlphaComponent(0.15) : JobsCor.clear
        )
    }
}
// MARK: - DSL
extension LeftMenuCell {
    /// 一次性设置：图标 + 标题 + 选中态
    @discardableResult
    func byMenu(icon: String,
                title: String,
                selected: Bool) -> Self {
        iconView.byImage(UIImage(systemName: icon))
        titleLabel.byText(title)
        return byMenuSelected(selected)
    }
    /// 仅更新选中态（便于复用）
    @discardableResult
    func byMenuSelected(_ selected: Bool) -> Self {
        indicator.byHidden(!selected)
        titleLabel.byTextColor(selected ? JobsCor.label : JobsCor.secondaryLabel)
        iconView.byTintColor(selected ? JobsCor.systemOrange : JobsCor.systemGray)
        contentView.byBackgroundColor(
            selected ? JobsCor.systemOrange.withAlphaComponent(0.15) : JobsCor.clear
        )
        return self
    }
    /// 仅更新标题或图标（可选）
    @discardableResult
    func byMenuTitle(_ text: String) -> Self { titleLabel.byText(text); return self }

    @discardableResult
    func byMenuIcon(_ name: String) -> Self {
        iconView.byImage(UIImage(systemName: name)); return self
    }
}
