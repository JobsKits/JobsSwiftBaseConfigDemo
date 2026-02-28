//
//  UICollectionViewListCell.swift
//  Pods
//
//  Created by Jobs on 1/3/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBlock

@available(iOS 14.0, tvOS 14.0, *)
extension UICollectionViewListCell {
    /// 以链式闭包方式配置并设置 `contentConfiguration`
    @discardableResult
    public func byListConfig(_ builder: JobsRetByListContentConfigBlock) -> Self {
        let base = (contentConfiguration as? UIListContentConfiguration) ?? .cell()
        contentConfiguration = builder(base)
        return self
    }
}
