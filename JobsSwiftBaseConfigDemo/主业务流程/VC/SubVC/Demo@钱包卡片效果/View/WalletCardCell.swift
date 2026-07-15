//
//  WalletCardCell.swift
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
import JobsByQuartzCore
import JobsSwiftBaseDefines
import SnapKit

// MARK: - 普通银行卡 Cell（懒加载 + byAddTo）
final class WalletCardCell: UICollectionViewCell {
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

    private func buildUI() {
        self.byBackgroundColor(JobsCor.clear)
        contentView.byBackgroundColor(JobsCor.clear)
        contentView.byCornerRadius(14)
        contentView.byMasksToBounds(true)
        layer.shadowColor = JobsCor.black.cgColor
        layer.shadowOpacity = 0.18
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 6)
        // 触发懒加载创建 UI
        gradientLayer.byHidden(NO)
        logoView.byVisible(YES)
        bankLabel.byVisible(YES)
        numberLabel.byVisible(YES)
        holderLabel.byVisible(YES)
        brandLabel.byVisible(YES)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.byFrame(contentView.bounds)
        contentView.layer.shadowPath = UIBezierPath
            .make(roundedRect: contentView.bounds, cornerRadius: 14)
            .cgPath
    }

    private func applyHighlight(_ highlighted: Bool, animated: Bool) {
        let block = {
            self.transform = highlighted ? CGAffineTransform(scaleX: 1.02, y: 1.02) : .identity
            self.layer.shadowOpacity = highlighted ? 0.3 : 0.18
        }
        if animated {
            UIView.jobsAnimateWithOptions(
                0.18,
                options: [.curveEaseOut],
                animations: block
            )
        } else {
            block()
        }
    }

    override var isHighlighted: Bool {
        didSet { applyHighlight(isHighlighted || isSelected, animated: true) }
    }

    override var isSelected: Bool {
        didSet { applyHighlight(isHighlighted || isSelected, animated: true) }
    }
}
// MARK: - 配置
extension WalletCardCell {
    /// ① 单参：协议要求的实现（真正做解析/渲染的地方）
    @discardableResult
    func byData(_ payload: Any?) -> Self {
        // 直接传 WalletCard
        if let card = payload as? WalletCard {
            render(card: card, highlight: false)
            return self
        }
        // varargs 糖转进来会是 [Any?]
        if let items = payload as? [Any?] {
            let card = items.first as? WalletCard
            let highlight = (items.count > 1 ? items[1] : nil) as? Bool ?? false
            if let card { render(card: card, highlight: highlight) };return self
        };return self
    }
    /// ② varargs：坚持要的第二个 byData（注意：这里不要用 any，用 items）
    @discardableResult
    func byData(_ items: Any?...) -> Self {
        // 显式选中“单参”版本，避免递归/歧义
        let single: (Any?) -> Self = self.byData
        return items.count == 1 ? single(items[0]) : single(items)
    }

    private func render(card: WalletCard, highlight: Bool) {
        bankLabel.byText(card.bankName)
        numberLabel.byText("**** \(card.lastDigits)")
        holderLabel.byText(card.holder)
        brandLabel.byText(card.brand)
        gradientLayer.colors = card.gradientColors.map { $0.cgColor }
        applyHighlight(highlight, animated: false)
    }
}
// MARK: - “添加银行卡” Cell（懒加载 + byAddTo）
final class WalletAddCardCell: UICollectionViewCell {
    private let horizontalInset: CGFloat = 20
    private lazy var dashedBorder: CAShapeLayer = {
        CAShapeLayer()
            .byStrokeColor(JobsCor.systemGray3)
            .byFillColor(JobsCor.clear)
            .byLineDashPattern([6, 4])
            .byLineWidth(1)
            .byAddTo(self.layer)
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
            .byText("添加新的银行卡".tr)
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

    private func buildUI() {
        self.byBackgroundColor(JobsCor.clear)
        contentView.byBackgroundColor(JobsCor.secondarySystemBackground)
        contentView.byCornerRadius(14)
        contentView.byMasksToBounds(true)
        dashedBorder.byHidden(NO);
        iconView.byVisible(YES)
        titleLabel.byVisible(YES)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath.make(roundedRect: bounds, cornerRadius: 14).cgPath
        dashedBorder.path = path
        dashedBorder.byFrame(bounds)
    }
}
