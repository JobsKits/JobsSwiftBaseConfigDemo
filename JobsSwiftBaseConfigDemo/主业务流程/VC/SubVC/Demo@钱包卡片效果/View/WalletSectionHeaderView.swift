//
//  WalletSectionHeaderView.swift
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

final class WalletSectionHeaderView: UICollectionReusableView {
    private let horizontalInset: CGFloat = 20
    private lazy var titleLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byText("我的银行卡".tr)
            .byAddTo(self)
            .byAddTo(self) { make in
                make.left.equalToSuperview().offset(self.horizontalInset)
                make.bottom.equalTo(self.snp.centerY).offset(-2)
        }
    }()

    private lazy var subtitleLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byText("点击银行卡，可展开查看".tr)
            .byAddTo(self) { [unowned self] make in
                make.left.equalTo(self.titleLabel)
                make.top.equalTo(self.snp.centerY).offset(2)
        }
    }()

    private lazy var separator: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.label.withAlphaComponent(0.06))
            .byAddTo(self) { [unowned self] make in
                make.left.equalToSuperview().offset(self.horizontalInset)
                make.right.equalToSuperview().inset(self.horizontalInset)
                make.bottom.equalToSuperview()
                make.height.equalTo(0.5)
        }
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.byBackgroundColor(JobsCor.clear)
        titleLabel.byVisible(YES)
        subtitleLabel.byVisible(YES)
        separator.byVisible(YES)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.byBackgroundColor(JobsCor.clear)
        titleLabel.byVisible(YES)
        subtitleLabel.byVisible(YES)
        separator.byVisible(YES)
    }

    func configure(title: String) {
        titleLabel.byText(title)
    }
}
