//
//  FoldCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/16/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit

final class FoldCell: UITableViewCell {
    // VC 里算高度时用这两个常量就行（确保和约束一致）
    static let headerHeight: CGFloat = 76
    static let verticalInset: CGFloat = 8

    private var isExpanded: Bool = false
    private lazy var cardView: UIView = {
        UIView()
            .byBgColor(.secondarySystemBackground)
            .byCornerRadius(14)
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(Self.verticalInset)
                make.bottom.equalToSuperview().inset(Self.verticalInset)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var headerView: UIView = {
        UIView().byAddTo(cardView) { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(Self.headerHeight)
        }
    }()

    private lazy var titleLabel: UILabel = {
        UILabel()
            .byFont(.systemFont(ofSize: 18, weight: .semibold))
            .byAddTo(headerView) { [unowned self] make in
                make.top.equalToSuperview().offset(16)
                make.left.equalToSuperview().offset(16)
                make.right.lessThanOrEqualTo(self.chevron.snp.left).offset(-12)
            }
    }()

    private lazy var subtitleLabel: UILabel = {
        UILabel()
            .byFont(.systemFont(ofSize: 13, weight: .regular))
            .byTextColor(.secondaryLabel)
            .byAddTo(headerView) { [unowned self] make in
                make.top.equalTo(self.titleLabel.snp.bottom).offset(6)
                make.left.equalTo(self.titleLabel)
                make.right.lessThanOrEqualTo(self.chevron.snp.left).offset(-12)
                make.bottom.lessThanOrEqualToSuperview().inset(14)
            }
    }()

    private lazy var chevron: UIImageView = {
        UIImageView(image: "chevron.down".sysImg)
            .byContentMode(.scaleAspectFit)
            .byTintColor(.secondaryLabel)
            .byAddTo(headerView) { make in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().inset(16)
                make.width.height.equalTo(18)
            }
    }()

    private lazy var detailClipView: UIView = {
        UIView()
            .byClipsToBounds(YES)
            .byAddTo(cardView) { [unowned self] make in
                make.top.equalTo(self.headerView.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var detailContentView: UIView = {
        UIView()
            .byAddTo(detailClipView) { make in
               make.edges.equalToSuperview()
            }
            .byVisible(NO)// 初始折叠：先隐藏
    }()

    private lazy var detailLabel: UILabel = {
        UILabel()
            .byNumberOfLines(0)
            .byFont(.systemFont(ofSize: 14))
            .byAddTo(detailContentView) { make in
                make.top.equalToSuperview().offset(12)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().inset(16)
                make.bottom.lessThanOrEqualToSuperview().inset(12)
            }
    }()

    private lazy var foldShadowView: UIView = {
        UIView()
            .byBgColor(.black)
            .byAlpha(0.22)
            .byAddTo(detailClipView) { make in
                make.edges.equalToSuperview()
            }
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        // 触发懒加载（保证层级正确）
        cardView.byVisible(YES)
        headerView.byVisible(YES)
        titleLabel.byVisible(YES)
        subtitleLabel.byVisible(YES)
        chevron.byVisible(YES)
        detailClipView.byVisible(YES)
        detailContentView.byVisible(YES)
        detailLabel.byVisible(YES)
        foldShadowView.byVisible(YES)

        setExpanded(false, animated: false)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func layoutSubviews() {
        super.layoutSubviews()
        // 折页从顶部边开始翻
        detailContentView.setAnchorPointWithoutJump(CGPoint(x: 0.5, y: 0.0))
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        setExpanded(false, animated: false)
    }

    func configure(title: String,
                   subtitle: String,
                   detail: String,
                   expanded: Bool) -> Self{
        titleLabel.text = title
        subtitleLabel.text = subtitle
        detailLabel.text = detail
        setExpanded(expanded, animated: false)
        return self
    }

    func setExpanded(_ expanded: Bool, animated: Bool) {
        isExpanded = expanded

        if expanded {
            // 用的时候：byVisible(YES) “唤起”
            detailContentView.byVisible(YES)
        }

        let targetTransform = expanded ? CATransform3DIdentity : foldedTransform()
        let targetAlpha: CGFloat = expanded ? 1.0 : 0.0
        let targetShadowAlpha: CGFloat = expanded ? 0.0 : 0.22
        let targetChevron = expanded ? CGAffineTransform(rotationAngle: .pi) : .identity

        let apply = { [self] in
            detailContentView.layer.transform = targetTransform
            detailContentView.alpha = targetAlpha
            foldShadowView.alpha = targetShadowAlpha
            chevron.transform = targetChevron
        }

        if animated {
            UIView.animate(
                withDuration: 0.38,
                delay: 0,
                usingSpringWithDamping: 0.92,
                initialSpringVelocity: 0,
                options: [.beginFromCurrentState, .allowUserInteraction]
            ) {
                apply()
            } completion: { [weak self] _ in
                guard let self else { return }
                if !expanded {
                    self.detailContentView.byVisible(NO)
                }
            }
        } else {
            UIView.performWithoutAnimation { apply() }
            if !expanded { detailContentView.byVisible(NO) }
        }
    }

    private func foldedTransform() -> CATransform3D {
        var t = CATransform3DIdentity
        t.m34 = -1.0 / 520.0   // 透视
        t = CATransform3DRotate(t, -CGFloat.pi / 2.0, 1, 0, 0) // -90°
        return t
    }
}
