//
//  JXSegmentedTitleOrImageDataSource.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(JXSegmentedView)
import JXSegmentedView
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
