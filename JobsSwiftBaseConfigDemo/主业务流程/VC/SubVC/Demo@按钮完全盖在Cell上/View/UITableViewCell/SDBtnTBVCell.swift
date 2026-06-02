//
//  SDBtnTBVCell.swift
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

import SnapKit
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
#if canImport(SDWebImage)
import SDWebImage
final class SDBtnTBVCell: UITableViewCell {
    
    private lazy var coverButton: UIButton = {
        UIButton.sys()
            .byAddTo(contentView) { make in
                make.edges.equalToSuperview()
            }
    }()
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: reuseIdentifier)
        coverButton.byVisible(YES)
        /// 写在外层，不要在Cell里面配置。仅此作为提示模板
//        contentView.byCornerRadius(8)
//            .byMasksToBounds(YES)
//        layer.byCornerRadius(8)
//            .byMasksToBounds(NO)
//            .byBorderWidth(1)
//            .byBorderColor(.clear)
    }
    /// 覆盖在Cell上的按钮设置为不可用，那么手势将执行以下方法
    override var isSelected: Bool {
        didSet {
            // ✅ 用 Cell 选中状态驱动按钮切换（文字/图标都能自动切）
            coverButton.isSelected = isSelected
            // ✅ 红色描边
            layer.borderColor = (isSelected ? UIColor.systemRed : UIColor.clear).cgColor
        }
    }
}

extension SDBtnTBVCell {
    // MARK: ViewDataProtocol
    @discardableResult
    func byData(_ model: JobsBtnCellModel, _ index: Int? = nil) -> Self {
        coverButton
            /// 主标题
            .byTitle(model.title, for: .normal)
            .byTitle(model.titleSelected, for: .selected)
            .byTitleColor(model.titleCor, for: .normal)
            .byTitleColor(model.titleCorSelected, for: .selected)
            .byTitleFont(model.titleFont)
            .byTitleFont(model.titleFont,for: .selected)
            /// 副标题
            .bySubTitle(model.subTitle, for: .normal)
            .bySubTitle(model.subTitleSelected, for: .selected)
            .bySubTitleColor(model.subTitleCor, for: .normal)
            .bySubTitleColor(model.subTitleCorSelected, for: .selected)
            .bySubTitleFont(model.subTitleFont)
            .bySubTitleFont(model.subTitleFontSelected,for: .selected)
            /// 前景图
            .byImage(model.image, for: .normal)
            .byImage(model.imageSelected, for: .selected)
            .byImagePlacement(model.placement,padding: model.padding)
            .sd_imageURL(model.imageURL)
            .sd_placeholderImage(model.imagePlaceholder)
            .sd_options([
                .retryFailed,
                .highPriority,
                .scaleDownLargeImages
            ])
            .sd_normalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
            /// 背景图
            .byBackgroundColor(model.bgCor, for: .normal)
            .byBackgroundColor(model.bgCorSelected, for: .selected)
            .sd_imageURL(model.bgImageURL)
            .sd_placeholderImage(model.bgImagePlaceholder)
            .sd_options([.scaleDownLargeImages, .retryFailed])
            .sd_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
            /// 其他
            .byContentEdgeInsets(model.edgeInsets)
            .bySelected(model.selected)
            .byEnabled(model.enabled)
            .byUserInteractionEnabled(model.userInteractionEnabled)
            .byHighlighted(model.highlighted)
            .byCornerRadius(model.cornerRadius)
            .byMasksToBounds(model.masksToBounds)
        return self
    }

    @discardableResult
    func onResult(_ block: (SDBtnTBVCell) -> Void) -> Self {
        block(self)
        return self
    }
}
#endif
