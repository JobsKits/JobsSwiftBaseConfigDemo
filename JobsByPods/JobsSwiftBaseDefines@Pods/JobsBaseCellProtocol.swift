//
//  JobsBaseCellProtocol.swift
//  Pods
//
//  Created by Jobs on 3/2/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
// MARK: - UITableViewCell Height Protocol
public protocol UITableViewCellProtocol where Self: UITableViewCell {
    /// 数据定UITableViewCell的高
    static func cellHeightByData(_ data: Any?) -> CGFloat
}
// MARK: - UICollectionViewCell Size Protocol
public protocol UICollectionViewCellProtocol where Self: UICollectionViewCell {
    /// 数据定UICollectionViewCell的尺寸
    static func cellSizeByData(_ data: Any?) -> CGSize
}
