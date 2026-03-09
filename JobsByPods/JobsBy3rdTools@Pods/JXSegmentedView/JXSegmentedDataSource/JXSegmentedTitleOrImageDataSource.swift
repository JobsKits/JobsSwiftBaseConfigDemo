//
//  JXSegmentedTitleOrImageDataSource.swift
//  Pods
//
//  Created by Jobs on 9/3/26.
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
