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
public protocol UITableViewCellProtocol: ViewDataProtocol where Self: UITableViewCell {
    /// 数据定UITableViewCell的高
    static func cellHeightByData(_ data: Any?) -> CGFloat
}
// MARK: - UICollectionViewCell Size Protocol
public protocol UICollectionViewCellProtocol : ViewDataProtocol where Self: UICollectionViewCell {
    /// 数据定UICollectionViewCell的尺寸
    static func cellSizeByData(_ data: Any?) -> CGSize
}
/// UITableViewCellProtocol@默认空实现
public extension UITableViewCellProtocol {
    static func cellHeightByData(_ data: Any?) -> CGFloat {0}
}
/// UICollectionViewCellProtocol@默认空实现
public extension UICollectionViewCellProtocol {
    static func cellSizeByData(_ data: Any?) -> CGSize {CGSizeZero}
}
// MARK: - 在不修改外界 UITableViewCell 的正常调用的情况下，使得 UITableViewCell 和 UITableView 之间存在距离（系统默认是 UITableView 的宽度 == UITableViewCell 宽度）
public protocol UITableViewCellInsetProtocol: AnyObject {
    /// 左右缩进
    var horizontalInset: CGFloat { get }
    /// 是否也缩进 separator（可选）
    var shouldInsetSeparator: Bool { get }
    /// 执行缩进（由协议默认实现）
    func applyInsets()
}

public extension UITableViewCellInsetProtocol where Self: UITableViewCell {
    var horizontalInset: CGFloat { 16 }
    var shouldInsetSeparator: Bool { true }
    func applyInsets() {
        // 关键：避免 layoutSubviews 多次调用导致 inset 叠加
        // 用 bounds 为基准，而不是用当前 contentView.frame 再 inset
        var f = contentView.frame
        f.origin.x = horizontalInset
        f.size.width = bounds.width - horizontalInset * 2
        contentView.frame = f
        // 系统 label 的 layoutMargins（可选）
        contentView.layoutMargins = UIEdgeInsets(
            top: contentView.layoutMargins.top,
            left: horizontalInset,
            bottom: contentView.layoutMargins.bottom,
            right: horizontalInset
        )
        if shouldInsetSeparator {
            separatorInset = UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
            preservesSuperviewLayoutMargins = false
        }
    }
}
// MARK: - 每个 UITableViewCell 都切圆角
public protocol UITableViewCellRoundable: AnyObject {
    var cornerRadius: CGFloat { get }
    func applyCornerStyle()
}

public extension UITableViewCellRoundable where Self: UITableViewCell {
    var cornerRadius: CGFloat { 8 }
    func applyCornerStyle() {
        // 如果你的内容都在 contentView 上：直接圆角 contentView
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
        // 选中/高亮的圆角也要一致（重要）
        if selectedBackgroundView == nil {
            let v = UIView()
            v.layer.cornerRadius = cornerRadius
            v.layer.masksToBounds = true
            selectedBackgroundView = v
        } else {
            selectedBackgroundView?.layer.cornerRadius = cornerRadius
            selectedBackgroundView?.layer.masksToBounds = true
        }
        // 如果不想要系统分割线穿过圆角，通常要关掉 separator 或自己画
        // separatorInset = UIEdgeInsets(top: 0, left: 9999, bottom: 0, right: 0)
    }
}
// MARK: - UITableView的每一个Section的第一个Cell的左上角和右上角切圆角（默认8），每一个Section的最后一个Cell的左下角和右下角切圆角（默认8）
public enum SectionCellPosition {
    case single   // 该 section 只有 1 行：四个角都圆
    case first    // section 第一行：只圆上边两个角
    case middle   // 中间行：不圆角
    case last     // section 最后一行：只圆下边两个角
}

public protocol SectionCornerRoundable: AnyObject {
    var sectionCornerRadius: CGFloat { get }
    func applySectionCorners(_ position: SectionCellPosition)
}

extension SectionCornerRoundable where Self: UITableViewCell {

    public var sectionCornerRadius: CGFloat { 8 }
    public func applySectionCorners(_ position: SectionCellPosition) {
        // 先重置（避免复用残留）
        contentView.layer.cornerRadius = 0
        contentView.layer.maskedCorners = []
        contentView.layer.masksToBounds = true
        // 选中态也同步（不然选中时会变方）
        if selectedBackgroundView == nil {
            selectedBackgroundView = UIView()
        }
        selectedBackgroundView?.layer.cornerRadius = 0
        selectedBackgroundView?.layer.maskedCorners = []
        selectedBackgroundView?.layer.masksToBounds = true
        // 再按位置设置
        let radius = sectionCornerRadius
        switch position {
        case .single:
            contentView.layer.cornerRadius = radius
            contentView.layer.maskedCorners = [
                .layerMinXMinYCorner, .layerMaxXMinYCorner,
                .layerMinXMaxYCorner, .layerMaxXMaxYCorner
            ]
            selectedBackgroundView?.layer.cornerRadius = radius
            selectedBackgroundView?.layer.maskedCorners = contentView.layer.maskedCorners

        case .first:
            contentView.layer.cornerRadius = radius
            contentView.layer.maskedCorners = [
                .layerMinXMinYCorner, .layerMaxXMinYCorner
            ]
            selectedBackgroundView?.layer.cornerRadius = radius
            selectedBackgroundView?.layer.maskedCorners = contentView.layer.maskedCorners

        case .last:
            contentView.layer.cornerRadius = radius
            contentView.layer.maskedCorners = [
                .layerMinXMaxYCorner, .layerMaxXMaxYCorner
            ]
            selectedBackgroundView?.layer.cornerRadius = radius
            selectedBackgroundView?.layer.maskedCorners = contentView.layer.maskedCorners

        case .middle:
            // 保持重置后的状态：无圆角
            break
        }
    }
}
