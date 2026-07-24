//
//  JobsWalletAddCardCell.swift
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
import JobsSwiftDSL
import SnapKit

final class JobsWalletAddCardCell: UICollectionViewCell {
    private lazy var dashedBorder: CAShapeLayer = {
        CAShapeLayer()
            .byStrokeColor(JobsCor.systemGray3)
            .byFillColor(JobsCor.clear)
            .byLineDashPattern([6, 4])
            .byLineWidth(1)
            .byAddTo(layer)
    }()

    private lazy var iconView: UIImageView = {
        UIImageView()
            .byImage("plus.circle.fill".sysImg)
            .byTintColor(JobsCor.systemBlue)
            .byContentMode(.scaleAspectFit)
            .byAddTo(contentView) { make in
                make.centerY.equalToSuperview()
                make.centerX.equalToSuperview().offset(-40)
                make.width.height.equalTo(26)
            }
    }()

    private lazy var titleLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byTextColor(JobsCor.systemBlue)
            .byAddTo(contentView) { [unowned self] make in
                make.left.equalTo(self.iconView.snp.right).offset(12)
                make.centerY.equalToSuperview()
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

    override func layoutSubviews() {
        super.layoutSubviews()
        dashedBorder.path = UIBezierPath.make(roundedRect: bounds, cornerRadius: 14).cgPath
        dashedBorder.byFrame(bounds)
    }

    private func buildUI() {
        self.byBackgroundColor(JobsCor.clear)
        contentView.byBackgroundColor(JobsCor.secondarySystemBackground)
        contentView.byCornerRadius(14)
        contentView.byMasksToBounds(true)
        dashedBorder.byHidden(false)
        iconView.byVisible(true)
        titleLabel.byVisible(true)
    }

    @discardableResult
    func byTitle(_ title: String) -> Self {
        titleLabel.byText(title)
        return self
    }
}
