//
//  JobsMotionAppIconCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit

final class JobsMotionAppIconCell: UICollectionViewCell {
    private lazy var iconImageView: UIImageView = {
        UIImageView()
            .byContentMode(.scaleAspectFill)
            .byClipsToBounds(YES)
            .byCornerRadius(17)
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(10)
                make.centerX.equalToSuperview()
                make.size.equalTo(76)
            }
    }()

    private lazy var titleLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byTextAlignment(.center)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.iconImageView.snp.bottom).offset(7)
                make.left.right.equalToSuperview().inset(6)
            }
    }()

    private lazy var sourceLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 9, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byAdjustsFontSizeToFitWidth(YES)
            .byMinimumScaleFactor(0.7)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.titleLabel.snp.bottom).offset(2)
                make.left.right.equalToSuperview().inset(5)
            }
    }()

    private lazy var currentBadgeLabel: UILabel = {
        UILabel()
            .byText("当前".tr)
            .byFont(JobsFont.systemFont(ofSize: 10, weight: .bold))
            .byTextColor(JobsCor.white)
            .byTextAlignment(.center)
            .byBackgroundColor(JobsCor.systemBlue)
            .byCornerRadius(10)
            .byClipsToBounds(YES)
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(5)
                make.right.equalToSuperview().inset(5)
                make.width.equalTo(34)
                make.height.equalTo(20)
            }
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(18)
            .byBorderWidth(1)
            .byBorderColor(JobsCor.separator)
            .byClipsToBounds(YES)
        iconImageView.byVisible(YES)
        titleLabel.byVisible(YES)
        sourceLabel.byVisible(YES)
        currentBadgeLabel.byVisible(NO)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.byImage(nil)
        titleLabel.byText(nil)
        sourceLabel.byText(nil)
        currentBadgeLabel.byVisible(NO)
        contentView
            .byBorderWidth(1)
            .byBorderColor(JobsCor.separator)
    }

    @discardableResult
    func byOption(_ option: JobsMotionAppIconOption, isCurrent: Bool) -> Self {
        iconImageView.byImage(UIImage(named: option.previewAssetName))
        titleLabel.byText(option.title.tr)
        sourceLabel.byText(option.sourceDescription)
        currentBadgeLabel.byVisible(isCurrent)
        contentView
            .byBorderWidth(isCurrent ? 3 : 1)
            .byBorderColor(isCurrent ? JobsCor.systemBlue : JobsCor.separator)
        return self
    }
}
