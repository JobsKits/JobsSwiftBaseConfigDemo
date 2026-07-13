//
//  JobsBtnCellModel.swift
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

import JobsSwiftBaseDefines

/// Model

struct JobsBtnCellModel {
    // MARK: - 主标题
    let title: String?
    let titleSelected: String?
    let titleFont: UIFont?
    let titleFontSelected: UIFont?
    let titleCor: UIColor?
    let titleCorSelected: UIColor?
    // MARK: - 副标题
    let subTitle: String?
    let subTitleSelected: String?
    let subTitleFont: UIFont?
    let subTitleFontSelected: UIFont?
    let subTitleCor: UIColor?
    let subTitleCorSelected: UIColor?
    // MARK: - 前景色
    let bgCor: UIColor?
    let bgCorSelected: UIColor?
    // MARK: - 前景图
    let image: UIImage?
    let imageURL: String?
    let imageSelected: UIImage?
    let imageSelectedURL: String?
    let imagePlaceholder: UIImage?
    let imageSelectedPlaceholder: UIImage?
    // MARK: - 背景图
    let bgImage: UIImage?
    let bgImageURL: String?
    let bgImageSelected: UIImage?
    let bgImageSelectedURL: String?
    let bgImagePlaceholder: UIImage?
    let bgImageSelectedPlaceholder: UIImage?
    // MARK: - 图文关系
    let placement: NSDirectionalRectEdge?
    let padding: CGFloat?
    // MARK: - 描边
    let cornerRadius: CGFloat?
    let masksToBounds: Bool?
    let borderWidth: CGFloat?
    let borderCor: UIColor?
    // MARK: - 其他
    let edgeInsets: UIEdgeInsets?
    var selected: Bool?
    let highlighted: Bool?
    let userInteractionEnabled: Bool? // ⚠️特别注意：如果仅仅是需要截断手势，只需要将此属性设置为NO。不要动UIButton.enabled
    let enabled: Bool?                // ⚠️特别注意：这个属性会影响UI外观。如果对按钮设置此属性为NO那么将对应disabled，除非对disabled配置颜色，否则显示不正常。

    init(
        // MARK: - 主标题
        title: String? = "",
        titleSelected: String? = "",
        titleFont: UIFont? = JobsFont.systemFont(ofSize: 14, weight: .semibold),
        titleFontSelected: UIFont? = JobsFont.systemFont(ofSize: 14, weight: .semibold),
        titleCor: UIColor? = JobsCor.black,
        titleCorSelected: UIColor? = JobsCor.black,
        // MARK: - 副标题
        subTitle: String? = "",
        subTitleSelected: String? = "",
        subTitleFont: UIFont? = JobsFont.systemFont(ofSize: 12, weight: .semibold),
        subTitleFontSelected: UIFont? = JobsFont.systemFont(ofSize: 12, weight: .semibold),
        subTitleCor: UIColor? = JobsCor.black,
        subTitleCorSelected: UIColor? = JobsCor.black,
        // MARK: - 前景色
        bgCor: UIColor? = JobsCor.white,
        bgCorSelected: UIColor? = JobsCor.white,
        // MARK: - 前景图@本地图、网络图（含兜底）
        image: UIImage? = nil,
        imageURL: String? = nil,
        imageSelected: UIImage? = nil,
        imageSelectedURL: String? = nil,
        imagePlaceholder: UIImage? = nil,
        imageSelectedPlaceholder: UIImage? = nil,
        // MARK: - 背景图@本地图、网络图（含兜底）
        bgImage: UIImage? = nil,
        bgImageURL: String? = nil,
        bgImageSelected: UIImage? = nil,
        bgImageSelectedURL: String? = nil,
        bgImagePlaceholder: UIImage? = nil,
        bgImageSelectedPlaceholder: UIImage? = nil,
        // MARK: - 图文关系
        placement: NSDirectionalRectEdge? = .top,
        padding: CGFloat? = 5,
        // MARK: - 描边
        masksToBounds : Bool = false,
        cornerRadius: CGFloat? = 0,
        borderWidth: CGFloat? = 0,
        borderCor: UIColor?  = nil,
        // MARK: - 其他
        edgeInsets: UIEdgeInsets? = .zero,
        selected: Bool = false,
        highlighted: Bool = false,
        userInteractionEnabled: Bool = false,
        enabled: Bool = false
    ) {
        // MARK: - 主标题
        self.title = title
        self.titleSelected = titleSelected
        self.titleFont = titleFont
        self.titleFontSelected = titleFontSelected
        self.titleCor = titleCor
        self.titleCorSelected = titleCorSelected
        // MARK: - 副标题
        self.subTitle = subTitle
        self.subTitleSelected = subTitleSelected
        self.subTitleFont = subTitleFont
        self.subTitleFontSelected = subTitleFontSelected
        self.subTitleCor = subTitleCor
        self.subTitleCorSelected = subTitleCorSelected
        // MARK: - 前景色
        self.bgCor = bgCor
        self.bgCorSelected = bgCorSelected
        // MARK: - 前景图
        self.image = image
        self.imageURL = imageURL
        self.imageSelected = imageSelected
        self.imageSelectedURL = imageSelectedURL
        self.imagePlaceholder = imagePlaceholder
        self.imageSelectedPlaceholder = imageSelectedPlaceholder
        // MARK: - 背景图
        self.bgImage = bgImage
        self.bgImageURL = bgImageURL
        self.bgImageSelected = bgImageSelected
        self.bgImageSelectedURL = bgImageSelectedURL
        self.bgImagePlaceholder = bgImagePlaceholder
        self.bgImageSelectedPlaceholder = bgImageSelectedPlaceholder
        // MARK: - 图文关系
        self.placement = placement
        self.padding = padding
        // MARK: - 描边
        self.masksToBounds = masksToBounds
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderCor = borderCor
        // MARK: - 其他
        self.edgeInsets = edgeInsets
        self.selected = selected
        self.highlighted = highlighted
        self.userInteractionEnabled = userInteractionEnabled
        self.enabled = enabled
    }
}
