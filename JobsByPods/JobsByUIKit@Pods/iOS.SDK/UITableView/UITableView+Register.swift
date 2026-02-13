//
//  UITableView+Register.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/3/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
// MARK: - 🍬语法糖@注册：UITableViewCell、HeaderFooterView、HeaderFooterView
extension UITableView {
    /// 通用注册@类名（类名自己为🆔）
    @discardableResult
    public func byRegister(cellClassType: UITableViewCell.Type) -> Self {
        let cellId = cellClassType.className
        let cellClass: AnyClass = cellClassType.classForCoder()
        self.register(cellClass, forCellReuseIdentifier: cellId)
        return self
    }
    /// 注册UITableViewCell@Nib
    @discardableResult
    public func byRegister(cellNibType: UITableViewCell.Type) -> Self{
        let cellId = cellNibType.className
        let cellNib = UINib(nibName: cellId, bundle: nil)
        self.register(cellNib, forCellReuseIdentifier: cellId)
        return self
    }
    /// 注册UITableViewHeaderFooterView@类名
    @discardableResult
    public func byRegister(headerFooterViewClassType: UIView.Type) -> Self{
        let reuseId = headerFooterViewClassType.className
        let viewType: AnyClass = headerFooterViewClassType.classForCoder()
        self.register(viewType, forHeaderFooterViewReuseIdentifier: reuseId)
        return self
    }
    /// 注册UITableViewHeaderFooterView@Nib
    @discardableResult
    public func byRegister(headerFooterViewNibType: UIView.Type) -> Self{
        let reuseId = headerFooterViewNibType.className
        let viewNib = UINib(nibName: reuseId, bundle: nil)
        self.register(viewNib, forHeaderFooterViewReuseIdentifier: reuseId)
        return self
    }
}
// MARK: - 🍬语法糖@注册：UITableViewCell
extension UITableView {
    /// 注册UITableViewCell@（类名自己为🆔）
    @discardableResult
    public func byRegisterCell<T: UITableViewCell>(_ cellClass: T.Type) -> Self {
        self.register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
        return self
    }
    /// 注册UITableViewCell@类名和🆔
    @discardableResult
    public func byRegisterCellOnID<T: UITableViewCell>(CellCls cellClass: T.Type,ID id:String) -> Self {
        self.register(cellClass, forCellReuseIdentifier: id)
        return self
    }
}
