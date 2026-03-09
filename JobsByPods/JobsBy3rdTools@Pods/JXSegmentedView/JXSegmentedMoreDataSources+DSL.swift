//
//  JXSegmentedMoreDataSources+DSL.swift
//  JobsBy3rdTools
//
//  Created by OpenClaw on 2026/03/09.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(JXSegmentedView)
import JXSegmentedView

// MARK: - BaseDataSource missing DSL
extension JXSegmentedBaseDataSource {

    /// content 宽度：用于 indicatorWidthSameAsItemContent 等场景
    @discardableResult
    public func byItemContentWidth(_ v: CGFloat) -> Self {
        itemContentWidth = v
        return self
    }

    /// 直接覆盖内部 dataSource（itemModels）
    @discardableResult
    public func byItemModels(_ v: [JXSegmentedBaseItemModel]) -> Self {
        dataSource = v
        return self
    }

    @discardableResult
    public func byItemWidthZoomAnimable(_ on: Bool = true) -> Self {
        isItemWidthZoomAnimable = on
        return self
    }
}

// MARK: - DotDataSource
extension JXSegmentedDotDataSource {

    @discardableResult
    public func byDotStates(_ v: [Bool]) -> Self {
        dotStates = v
        return self
    }

    @discardableResult
    public func byDotSize(_ v: CGSize) -> Self {
        dotSize = v
        return self
    }

    @discardableResult
    public func byDotCornerRadius(_ v: CGFloat) -> Self {
        dotCornerRadius = v
        return self
    }

    @discardableResult
    public func byDotColor(_ v: UIColor) -> Self {
        dotColor = v
        return self
    }

    @discardableResult
    public func byDotOffset(_ v: CGPoint) -> Self {
        dotOffset = v
        return self
    }
}

// MARK: - NumberDataSource
extension JXSegmentedNumberDataSource {

    @discardableResult
    public func byNumbers(_ v: [Int]) -> Self {
        numbers = v
        return self
    }

    @discardableResult
    public func byNumberWidthIncrement(_ v: CGFloat) -> Self {
        numberWidthIncrement = v
        return self
    }

    @discardableResult
    public func byNumberBackgroundColor(_ v: UIColor) -> Self {
        numberBackgroundColor = v
        return self
    }

    @discardableResult
    public func byNumberTextColor(_ v: UIColor) -> Self {
        numberTextColor = v
        return self
    }

    @discardableResult
    public func byNumberFont(_ v: UIFont) -> Self {
        numberFont = v
        return self
    }

    @discardableResult
    public func byNumberOffset(_ v: CGPoint) -> Self {
        numberOffset = v
        return self
    }

    @discardableResult
    public func byNumberHeight(_ v: CGFloat) -> Self {
        numberHeight = v
        return self
    }

    /// 自定义数字显示格式（比如 99+）
    @discardableResult
    public func byNumberStringFormatter(_ closure: ((Int) -> String)?) -> Self {
        numberStringFormatterClosure = closure
        return self
    }
}

// MARK: - TitleGradientDataSource
extension JXSegmentedTitleGradientDataSource {

    @discardableResult
    public func byTitleNormalGradientColors(_ v: [CGColor]) -> Self {
        titleNormalGradientColors = v
        return self
    }

    @discardableResult
    public func byTitleSelectedGradientColors(_ v: [CGColor]) -> Self {
        titleSelectedGradientColors = v
        return self
    }

    @discardableResult
    public func byTitleGradientStartPoint(_ v: CGPoint) -> Self {
        titleGradientStartPoint = v
        return self
    }

    @discardableResult
    public func byTitleGradientEndPoint(_ v: CGPoint) -> Self {
        titleGradientEndPoint = v
        return self
    }
}

// MARK: - TitleOrImageDataSource
extension JXSegmentedTitleOrImageDataSource {

    /// 选中态的图片信息（支持 imageName / URL 等，按官方 DataSource 定义）
    @discardableResult
    public func bySelectedImageInfos(_ v: [String?]?) -> Self {
        selectedImageInfos = v
        return self
    }

    @discardableResult
    public func byLoadImageClosure(_ v: LoadImageClosure?) -> Self {
        loadImageClosure = v
        return self
    }

    @discardableResult
    public func byImageSize(_ v: CGSize) -> Self {
        imageSize = v
        return self
    }
}

#endif
