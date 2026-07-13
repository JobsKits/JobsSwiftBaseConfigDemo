//
//  FeedVideoCell.swift
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

final class FeedVideoCell: UITableViewCell {
    // MARK: - UI（懒加载）
    /// 播放器真正挂载到这个容器（PlayerCenter 负责把 BMPlayer 迁移到这里）
    lazy var playerHost: UIView = { [unowned self] in
        UIView()
            .byAddTo(contentView) { make in
                make.edges.equalToSuperview()
            }
            .byBackgroundColor(JobsCor.black)
            .byClipsToBounds(YES)
    }()

    private lazy var subtitleLabel: UILabel = { [unowned self] in
        UILabel()
            .byTextColor(JobsCor.lightGray)
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byNumberOfLines(2)
            .byAddTo(contentView) { make in
                make.leading.trailing.equalToSuperview().inset(12)
                make.bottom.equalToSuperview().inset(28)
            }
    }()

    private lazy var titleLabel: UILabel = { [unowned self] in
        UILabel()
            .byTextColor(JobsCor.white)
            .byFont(JobsFont.boldSystemFont(ofSize: 18))
            .byAddTo(contentView) { make in
                make.leading.equalToSuperview().inset(12)
                make.bottom.equalTo(self.subtitleLabel.snp.top).offset(-6)
            }
    }()
    // MARK: - 生命周期
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.byBackgroundColor(JobsCor.black)
        playerHost.byVisible(YES)
        subtitleLabel.byVisible(YES)
        titleLabel.byVisible(YES)
    }

    required init?(coder: NSCoder) { fatalError() }
    // MARK: - 填充
    func fill(nickname: String, content: String) {
        titleLabel.byText(nickname)
        subtitleLabel.byText(content.isEmpty ? " " : content)
    }
}
