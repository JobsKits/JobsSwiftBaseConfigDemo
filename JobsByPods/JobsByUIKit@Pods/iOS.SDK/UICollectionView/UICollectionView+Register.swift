//
//  UICollectionView+Register.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/3/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
/// UICollectionView、UICollectionViewCell、UICollectionReusableView@注册
extension UICollectionView {
    // MARK: - register@Cell（Nib）
    /// 按类名从 Nib 注册 Cell
    /// - Parameter cellClass: `UICollectionViewCell` 子类
    /// - Returns: self（便于链式调用）
    @discardableResult
    public func byRegisterCellNib<T: UICollectionViewCell>(_ cellClass: T.Type) -> Self {
        let id = String(describing: cellClass)
        let nib = UINib(nibName: id, bundle: nil)
        register(nib, forCellWithReuseIdentifier: id)
        return self
    }
    // MARK: - register@Cell（Class）
    /// 按类名注册 Cell（Class）
    /// - Parameter cellClass: `UICollectionViewCell` 子类
    /// - Returns: self
    @discardableResult
    public func byRegisterCell<T: UICollectionViewCell>(_ cellClass: T.Type) -> Self {
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
        return self
    }
    // MARK: - register@Cell（Class with ID）
    /// 指定复用 ID 注册 Cell（Class）
    /// - Parameters:
    ///   - cellClass: `UICollectionViewCell` 子类
    ///   - reuseID: 自定义复用标识
    /// - Returns: self
    @discardableResult
    public func byRegisterCell<T: UICollectionViewCell>(_ cellClass: T.Type, reuseID: String) -> Self {
        register(cellClass, forCellWithReuseIdentifier: reuseID)
        return self
    }
    // MARK: - register@Cell（Nib with ID）
    /// 指定复用 ID 注册 Cell（Nib）
    /// - Parameters:
    ///   - cellClass: `UICollectionViewCell` 子类
    ///   - reuseID: 自定义复用标识
    /// - Returns: self
    @discardableResult
    public func byRegisterCellNib<T: UICollectionViewCell>(_ cellClass: T.Type, reuseID: String) -> Self {
        let nib = UINib(nibName: String(describing: cellClass), bundle: nil)
        register(nib, forCellWithReuseIdentifier: reuseID)
        return self
    }
    // MARK: - register@Cell（Class）
    /// 按类名注册 Cell（Class）
    /// - Parameter cellClassType: `UICollectionViewCell` 子类类型
    public func byRegister(cellClassType: UICollectionViewCell.Type) {
        let cellId = cellClassType.className
        let cellClass: AnyClass = cellClassType.classForCoder()
        register(cellClass, forCellWithReuseIdentifier: cellId)
    }
    // MARK: - register@Cell（Nib）
    /// 按类名从 Nib 注册 Cell
    /// - Parameter cellNibType: `UICollectionViewCell` 子类类型
    public func byRegister(cellNibType: UICollectionViewCell.Type) {
        let cellId = cellNibType.className
        let cellNib = UINib(nibName: cellId, bundle: nil)
        register(cellNib, forCellWithReuseIdentifier: cellId)
    }
    // MARK: - register@SupplementaryView（Class）
    /// 注册 SupplementaryView（Class）
    /// - Parameters:
    ///   - viewClass: `UICollectionReusableView` 子类
    ///   - kind: 视图类型（如 `UICollectionView.elementKindSectionHeader`）
    /// - Returns: self
    @discardableResult
    public func byRegisterSupplementaryView<T: UICollectionReusableView>(_ viewClass: T.Type, kind: String) -> Self {
        let id = String(describing: viewClass)
        register(viewClass, forSupplementaryViewOfKind: kind, withReuseIdentifier: id)
        return self
    }
    // MARK: - register@SupplementaryView（Nib）
    /// 注册 SupplementaryView（Nib）
    /// - Parameters:
    ///   - viewClass: `UICollectionReusableView` 子类
    ///   - kind: 视图类型（如 `UICollectionView.elementKindSectionHeader`）
    /// - Returns: self
    @discardableResult
    public func byRegisterSupplementaryNib<T: UICollectionReusableView>(_ viewClass: T.Type, kind: String) -> Self {
        let id = String(describing: viewClass)
        let nib = UINib(nibName: id, bundle: nil)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: id)
        return self
    }
    // MARK: - register@Header（Class）
    /// py_ 注册 Header（Class）
    /// - Parameter headerViewClassType: `UICollectionReusableView` 子类
    public func byRegisterHeaderView(headerViewClassType: UICollectionReusableView.Type) {
        let cellId = headerViewClassType.className
        let viewType: AnyClass = headerViewClassType.classForCoder()
        register(viewType,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: cellId)
    }
    // MARK: - register@Header（Nib）
    /// 注册 Header（Nib）
    /// - Parameter headerViewNibType: `UICollectionReusableView` 子类
    public func byRegisterHeaderView(headerViewNibType: UICollectionReusableView.Type) {
        let cellId = headerViewNibType.className
        let viewNib = UINib(nibName: cellId, bundle: nil)
        register(viewNib,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: cellId)
    }
    // MARK: - register@Footer（Class）
    /// 注册 Footer（Class）
    /// - Parameter footerViewClassType: `UICollectionReusableView` 子类
    public func byRegisterFooterView(footerViewClassType: UICollectionReusableView.Type) {
        let cellId = footerViewClassType.className
        let viewType: AnyClass = footerViewClassType.classForCoder()
        register(viewType,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                 withReuseIdentifier: cellId)
    }
    // MARK: - register@Footer（Nib）
    /// 注册 Footer（Nib）
    /// - Parameter footerViewNibType: `UICollectionReusableView` 子类
    public func byRegisterFooterView(footerViewNibType: UICollectionReusableView.Type) {
        let cellId = footerViewNibType.className
        let viewNib = UINib(nibName: cellId, bundle: nil)
        register(viewNib,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                 withReuseIdentifier: cellId)
    }
}
