//
//  JobsWalletSectionHeaderView.swift
//  JobsWalletCard
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftBaseDefines
import SnapKit

final class JobsWalletSectionHeaderView: UICollectionReusableView {
    private let horizontalInset: CGFloat = 20
    private lazy var titleLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byAddTo(self) { [unowned self] make in
                make.left.equalToSuperview().offset(self.horizontalInset)
                make.bottom.equalTo(self.snp.centerY).offset(-2)
            }
    }()

    private lazy var subtitleLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(self) { [unowned self] make in
                make.left.equalTo(self.titleLabel)
                make.top.equalTo(self.snp.centerY).offset(2)
            }
    }()

    private lazy var separator: UIView = {
        UIView.jobsMake { _ in }
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
        buildUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buildUI()
    }

    private func buildUI() {
        self.byBackgroundColor(JobsCor.clear)
        titleLabel.byVisible(true)
        subtitleLabel.byVisible(true)
        separator.byVisible(true)
    }

    @discardableResult
    func byTitle(_ title: String, subtitle: String) -> Self {
        titleLabel.byText(title)
        subtitleLabel
            .byText(subtitle)
            .byVisible(!subtitle.isEmpty)
        return self
    }
}
