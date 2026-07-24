//
//  JobsWalletCardCell.swift
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

final class JobsWalletCardCell: UICollectionViewCell {
    private let horizontalInset: CGFloat = 16
    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
            .byStartPoint(CGPoint(x: 0, y: 0))
            .byEndPoint(CGPoint(x: 1, y: 1))
            .byCornerRadius(14)
        contentView.layer.insertSublayer(layer, at: 0)
        return layer
    }()

    private lazy var logoView: UIImageView = {
        UIImageView()
            .byContentMode(.scaleAspectFit)
            .byTintColor(JobsCor.white.withAlphaComponent(0.9))
            .byImage("creditcard.fill".sysImg)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalToSuperview().offset(12)
                make.right.equalToSuperview().inset(self.horizontalInset)
                make.width.equalTo(30)
                make.height.equalTo(22)
            }
    }()

    private lazy var bankLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 18, weight: .semibold))
            .byTextColor(JobsCor.white)
            .byAddTo(contentView) { [unowned self] make in
                make.left.equalToSuperview().offset(self.horizontalInset)
                make.centerY.equalTo(self.logoView.snp.centerY)
            }
    }()

    private lazy var numberLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 16, weight: .medium))
            .byTextColor(JobsCor.white.withAlphaComponent(0.95))
            .byAddTo(contentView) { [unowned self] make in
                make.left.equalTo(self.bankLabel)
                make.bottom.equalToSuperview().inset(18)
            }
    }()

    private lazy var holderLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
            .byTextColor(JobsCor.white.withAlphaComponent(0.8))
            .byAddTo(contentView) { [unowned self] make in
                make.left.equalTo(self.bankLabel)
                make.bottom.equalTo(self.numberLabel.snp.top).offset(-6)
            }
    }()

    private lazy var brandLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .medium))
            .byTextColor(JobsCor.white.withAlphaComponent(0.9))
            .byTextAlignment(.right)
            .byAddTo(contentView) { [unowned self] make in
                make.right.equalToSuperview().inset(self.horizontalInset)
                make.centerY.equalTo(self.holderLabel.snp.centerY)
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

    override func prepareForReuse() {
        super.prepareForReuse()
        applyHighlight(false, animated: false)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.byFrame(contentView.bounds)
        layer.shadowPath = UIBezierPath
            .make(roundedRect: contentView.bounds, cornerRadius: 14)
            .cgPath
    }

    override var isHighlighted: Bool {
        didSet { applyHighlight(isHighlighted || isSelected, animated: true) }
    }

    override var isSelected: Bool {
        didSet { applyHighlight(isHighlighted || isSelected, animated: true) }
    }

    private func buildUI() {
        self.byBackgroundColor(JobsCor.clear)
        contentView.byBackgroundColor(JobsCor.clear)
        contentView.byCornerRadius(14)
        contentView.byMasksToBounds(true)
        layer.shadowColor = JobsCor.black.cgColor
        layer.shadowOpacity = 0.18
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 6)
        gradientLayer.byHidden(false)
        logoView.byVisible(true)
        bankLabel.byVisible(true)
        numberLabel.byVisible(true)
        holderLabel.byVisible(true)
        brandLabel.byVisible(true)
    }

    private func applyHighlight(_ highlighted: Bool, animated: Bool) {
        let changes = {
            self.transform = highlighted ? CGAffineTransform(scaleX: 1.02, y: 1.02) : .identity
            self.layer.shadowOpacity = highlighted ? 0.3 : 0.18
        }
        if animated {
            UIView.jobsAnimateWithOptions(
                0.18,
                options: [.curveEaseOut],
                animations: changes
            )
        } else {
            changes()
        }
    }

    @discardableResult
    func byModel(_ model: JobsWalletCardModel, highlighted: Bool) -> Self {
        bankLabel.byText(model.bankName)
        numberLabel.byText("**** \(model.lastDigits)")
        holderLabel.byText(model.holder)
        brandLabel.byText(model.brand)
        gradientLayer.colors = model.gradientColors.map { $0.cgColor }
        applyHighlight(highlighted, animated: false)
        return self
    }
}
