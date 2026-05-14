//
//  JXSegmentedTitleImageDataSource.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(JXSegmentedView)
import JXSegmentedView
extension JXSegmentedTitleImageDataSource {
    // MARK: - layout type
    /// 图文关系 ➤ .leftImage / .rightImage / .topImage / .bottomImage / .onlyImage / .onlyTitle / .backgroundImage
    @discardableResult
    public func byTitleImageType(_ value: JXSegmentedTitleImageType) -> Self {
        titleImageType = value
        return self
    }
    // MARK: - images
    /// 数量需要和 titles 数量一致。可以是 imageName 或 URL 字符串
    @discardableResult
    public func byNormalImages(_ values: [String]?) -> Self {
        normalImageInfos = values
        return self
    }
    /// 数量需要和 titles 数量一致。可以是 imageName 或 URL 字符串
    /// 不赋值则选中态不会切换图片
    @discardableResult
    public func bySelectedImages(_ values: [String]?) -> Self {
        selectedImageInfos = values
        return self
    }
    /// 一次性设置 normal + selected
    @discardableResult
    public func byImages(normal: [String]?, selected: [String]? = nil) -> Self {
        normalImageInfos = normal
        selectedImageInfos = selected
        return self
    }
    // MARK: - image loader
    /// 自定义图片加载（网络图/自定义缓存/任何加载策略）
    @discardableResult
    public func byLoadImageClosure(_ closure: LoadImageClosure?) -> Self {
        loadImageClosure = closure
        return self
    }
    // MARK: - size & spacing
    @discardableResult
    public func byImageSize(_ value: CGSize) -> Self {
        imageSize = value
        return self
    }

    @discardableResult
    public func byTitleImageSpacing(_ value: CGFloat) -> Self {
        titleImageSpacing = value
        return self
    }
    // MARK: - zoom
    /// 图片缩放：可顺带配置选中 scale
    @discardableResult
    public func byImageZoom(enabled: Bool = true, selectedScale: CGFloat? = nil) -> Self {
        isImageZoomEnabled = enabled
        if let s = selectedScale { imageSelectedZoomScale = s }
        return self
    }
    // MARK: - presets
    /// 上图下文：常用预设
    @discardableResult
    public func byTopImage(bottomTitle spacing: CGFloat = 6, imageSize: CGSize? = nil) -> Self {
        titleImageType = .topImage
        titleImageSpacing = spacing
        if let s = imageSize { self.imageSize = s }
        return self
    }
    /// 左图右文：常用预设
    @discardableResult
    public func byLeftImage(rightTitle spacing: CGFloat = 6, imageSize: CGSize? = nil) -> Self {
        titleImageType = .leftImage
        titleImageSpacing = spacing
        if let s = imageSize { self.imageSize = s }
        return self
    }
    /// 只有图标：常用预设
    @discardableResult
    public func byOnlyImage(imageSize: CGSize? = nil) -> Self {
        titleImageType = .onlyImage
        if let s = imageSize { self.imageSize = s }
        return self
    }
    /// 只有标题：常用预设
    @discardableResult
    public func byOnlyTitle() -> Self {
        titleImageType = .onlyTitle
        return self
    }
}
#endif
