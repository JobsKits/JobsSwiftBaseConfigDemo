//
//  UITableView+DSL.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/3/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBlock
// MARK: - 🍬语法糖@数据源和代理
extension UITableView {
    @discardableResult
    public func byDelegate(_ delegate: UITableViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    public func byDataSource(_ dataSource: UITableViewDataSource) -> Self {
        self.dataSource = dataSource
        return self
    }
    // MARK: - iOS 10.0+ 预取数据源
    @available(iOS 10.0, *)
    @discardableResult
    public func byPrefetchDataSource(_ ds: UITableViewDataSourcePrefetching?) -> Self {
        self.prefetchDataSource = ds
        return self
    }
    // MARK: - iOS 11.0+ 拖拽代理
    @available(iOS 11.0, *)
    @discardableResult
    public func byDragDelegate(_ delegate: UITableViewDragDelegate?) -> Self {
        self.dragDelegate = delegate
        return self
    }
    // MARK: - iOS 11.0+ 放置代理
    @available(iOS 11.0, *)
    @discardableResult
    public func byDropDelegate(_ delegate: UITableViewDropDelegate?) -> Self {
        self.dropDelegate = delegate
        return self
    }
}
// MARK: - 🍬语法糖@UI
extension UITableView {
    // MARK: - iOS 11+ 禁止自动调整 contentInset
    @discardableResult
    public func byNoContentInsetAdjustment() -> Self {
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        };return self
    }
    // MARK: - iOS 15+ 去掉 section header 顶部默认间距
    @discardableResult
    public func byNoSectionHeaderTopPadding() -> Self {
        if #available(iOS 15.0, *) {
            self.setValue(0, forKey: "sectionHeaderTopPadding")
        };return self
    }

    @discardableResult
    public func byRowHeight(_ height: CGFloat) -> Self {
        self.rowHeight = height
        return self
    }

    @discardableResult
    public func bySeparatorStyle(_ style: UITableViewCell.SeparatorStyle) -> Self {
        self.separatorStyle = style
        return self
    }

    @discardableResult
    public func byTableFooterView(_ view: UIView?) -> Self {
        self.tableFooterView = view
        return self
    }

    @discardableResult
    public func byTableHeaderView(_ view: UIView?) -> Self {
        self.tableHeaderView = view
        return self
    }
    // MARK: - 隐藏分割线
    public func hiddenSeparator() {
        tableFooterView = UIView().byBgColor(UIColor.clear)
    }
    // MARK: - 设置整个区圆角
    public func sectionConner(cell: UITableViewCell,
                       bgColor: UIColor = UIColor.systemBackground,
                       indexPath: IndexPath,
                       cornerRadius: CGFloat = 10.0) {
        let bounds = CGRect(x: self.separatorInset.left, y: 0,
                            width: self.bounds.width - self.separatorInset.left*2, height: cell.bounds.height)

        let path: UIBezierPath
        let isFirst = indexPath.row == 0
        let isLast  = indexPath.row == self.numberOfRows(inSection: indexPath.section) - 1

        if isFirst && isLast {
            path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        } else if isFirst {
            path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        } else if isLast {
            path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: [.bottomLeft, .bottomRight],
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        } else {
            path = UIBezierPath(rect: bounds)
        }
        cell.byBackgroundView(UIView(frame: bounds)
            .byInsertSublayer(CAShapeLayer().byPath(path.cgPath).byFillColor(bgColor), at: 0)
            .byBgColor(.clear))
    }
    // MARK: - Heights & Insets
    @discardableResult
    public func bySectionHeaderHeight(_ h: CGFloat) -> Self {
        self.sectionHeaderHeight = h
        return self
    }

    @discardableResult
    public func bySectionFooterHeight(_ h: CGFloat) -> Self {
        self.sectionFooterHeight = h
        return self
    }
    /// iOS 7.0+
    @available(iOS 7.0, *)
    @discardableResult
    public func byEstimatedRowHeight(_ h: CGFloat) -> Self {
        self.estimatedRowHeight = h
        return self
    }
    /// iOS 7.0+
    @available(iOS 7.0, *)
    @discardableResult
    public func byEstimatedSectionHeaderHeight(_ h: CGFloat) -> Self {
        self.estimatedSectionHeaderHeight = h
        return self
    }
    /// iOS 7.0+
    @available(iOS 7.0, *)
    @discardableResult
    public func byEstimatedSectionFooterHeight(_ h: CGFloat) -> Self {
        self.estimatedSectionFooterHeight = h
        return self
    }
    /// iOS 15.0+ 填充行高度
    @available(iOS 15.0, *)
    @discardableResult
    public func byFillerRowHeight(_ h: CGFloat) -> Self {
        self.fillerRowHeight = h
        return self
    }
    /// iOS 15.0+ （grouped / insetGrouped）专用 section header 顶部间距
    @available(iOS 15.0, *)
    @discardableResult
    public func bySectionHeaderTopPadding(_ padding: CGFloat) -> Self {
        self.sectionHeaderTopPadding = padding
        return self
    }
    /// iOS 11.0+ 分割线 inset 参考系
    @available(iOS 11.0, *)
    @discardableResult
    public func bySeparatorInsetReference(_ ref: UITableView.SeparatorInsetReference) -> Self {
        self.separatorInsetReference = ref
        return self
    }
    /// 分割线 inset
    @discardableResult
    public func bySeparatorInset(_ inset: UIEdgeInsets) -> Self {
        self.separatorInset = inset
        return self
    }
    /// iOS 11.0+ 单元自适应失效控制
    @available(iOS 16.0, *)
    @discardableResult
    public func bySelfSizingInvalidation(_ value: UITableView.SelfSizingInvalidation) -> Self {
        self.selfSizingInvalidation = value
        return self
    }
    /// iOS 11.0+ 子视图是否插入安全区
    @available(iOS 11.0, *)
    @discardableResult
    public func byInsetsContentViewsToSafeArea(_ enable: Bool) -> Self {
        self.insetsContentViewsToSafeArea = enable
        return self
    }

    @discardableResult
    public func byBackgroundView(_ view: UIView?) -> Self {
        self.backgroundView = view
        return self
    }
    // MARK: - Separator & Layout Margins
    @discardableResult
    public func bySeparatorColor(_ color: UIColor?) -> Self {
        self.separatorColor = color
        return self
    }
    /// iOS 8.0+
    @available(iOS 8.0, *)
    @discardableResult
    public func bySeparatorEffect(_ effect: UIVisualEffect?) -> Self {
        self.separatorEffect = effect
        return self
    }
    /// iOS 9.0+
    @available(iOS 9.0, *)
    @discardableResult
    public func byCellLayoutMarginsFollowReadableWidth(_ follow: Bool) -> Self {
        self.cellLayoutMarginsFollowReadableWidth = follow
        return self
    }
    // MARK: - Selection / Focus / Editing
    @discardableResult
    public func byAllowsSelection(_ allow: Bool) -> Self {
        self.allowsSelection = allow
        return self
    }

    @discardableResult
    public func byAllowsSelectionDuringEditing(_ allow: Bool) -> Self {
        self.allowsSelectionDuringEditing = allow
        return self
    }
    /// iOS 5.0+
    @available(iOS 5.0, *)
    @discardableResult
    public func byAllowsMultipleSelection(_ allow: Bool) -> Self {
        self.allowsMultipleSelection = allow
        return self
    }
    /// iOS 5.0+
    @available(iOS 5.0, *)
    @discardableResult
    public func byAllowsMultipleSelectionDuringEditing(_ allow: Bool) -> Self {
        self.allowsMultipleSelectionDuringEditing = allow
        return self
    }
    /// 设置编辑状态（带动画）
    @discardableResult
    public func byEditing(_ editing: Bool, animated: Bool = true) -> Self {
        self.setEditing(editing, animated: animated)
        return self
    }
    /// iOS 14.0+ 焦点移动自动选中
    @available(iOS 14.0, *)
    @discardableResult
    public func bySelectionFollowsFocus(_ enable: Bool) -> Self {
        self.selectionFollowsFocus = enable
        return self
    }
    /// iOS 15.0+ 允许焦点
    @available(iOS 15.0, *)
    @discardableResult
    public func byAllowsFocus(_ allow: Bool) -> Self {
        self.allowsFocus = allow
        return self
    }
    /// iOS 15.0+ 编辑时允许焦点
    @available(iOS 15.0, *)
    @discardableResult
    public func byAllowsFocusDuringEditing(_ allow: Bool) -> Self {
        self.allowsFocusDuringEditing = allow
        return self
    }
    /// iOS 9.0+ 记住上次聚焦行
    @available(iOS 9.0, *)
    @discardableResult
    public func byRemembersLastFocusedIndexPath(_ remember: Bool) -> Self {
        self.remembersLastFocusedIndexPath = remember
        return self
    }
    /// section 索引最少显示行数
    @discardableResult
    public func bySectionIndexMinimumDisplayRowCount(_ count: Int) -> Self {
        self.sectionIndexMinimumDisplayRowCount = count
        return self
    }
    /// iOS 6.0+
    @available(iOS 6.0, *)
    @discardableResult
    public func bySectionIndexColor(_ color: UIColor?) -> Self {
        self.sectionIndexColor = color
        return self
    }
    /// iOS 7.0+
    @available(iOS 7.0, *)
    @discardableResult
    public func bySectionIndexBackgroundColor(_ color: UIColor?) -> Self {
        self.sectionIndexBackgroundColor = color
        return self
    }
    /// iOS 6.0+
    @available(iOS 6.0, *)
    @discardableResult
    public func bySectionIndexTrackingBackgroundColor(_ color: UIColor?) -> Self {
        self.sectionIndexTrackingBackgroundColor = color
        return self
    }
    /// 选择 / 取消选择
    @discardableResult
    public func bySelectRow(_ indexPath: IndexPath?,
                            animated: Bool = true,
                            scrollPosition: UITableView.ScrollPosition = .none) -> Self {
        self.selectRow(at: indexPath, animated: animated, scrollPosition: scrollPosition)
        return self
    }
    @discardableResult
    public func byDeselectRow(_ indexPath: IndexPath, animated: Bool = true) -> Self {
        self.deselectRow(at: indexPath, animated: animated)
        return self
    }
    // MARK: - Batch Updates & Reload APIs
    /// iOS 11.0+
    @available(iOS 11.0, *)
    @discardableResult
    public func byPerformBatchUpdates(_ updates: (jobsByVoidBlock)?, completion: (jobsByBOOLBlock)? = nil) -> Self {
        self.performBatchUpdates(updates, completion: completion)
        return self
    }

    @discardableResult
    public func byBeginUpdates() -> Self {
        self.beginUpdates()
        return self
    }

    @discardableResult
    public func byEndUpdates() -> Self {
        self.endUpdates()
        return self
    }

    @discardableResult
    public func byInsertSections(_ sections: IndexSet, with animation: UITableView.RowAnimation = .automatic) -> Self {
        self.insertSections(sections, with: animation)
        return self
    }

    @discardableResult
    public func byDeleteSections(_ sections: IndexSet, with animation: UITableView.RowAnimation = .automatic) -> Self {
        self.deleteSections(sections, with: animation)
        return self
    }
    /// iOS 5.0+
    @available(iOS 5.0, *)
    @discardableResult
    public func byMoveSection(_ from: Int, to newSection: Int) -> Self {
        self.moveSection(from, toSection: newSection)
        return self
    }
    /// iOS 3.0+
    @available(iOS 3.0, *)
    @discardableResult
    public func byReloadSections(_ sections: IndexSet, with animation: UITableView.RowAnimation = .automatic) -> Self {
        self.reloadSections(sections, with: animation)
        return self
    }

    @discardableResult
    public func byInsertRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation = .automatic) -> Self {
        self.insertRows(at: indexPaths, with: animation)
        return self
    }

    @discardableResult
    public func byDeleteRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation = .automatic) -> Self {
        self.deleteRows(at: indexPaths, with: animation)
        return self
    }
    /// iOS 5.0+
    @available(iOS 5.0, *)
    @discardableResult
    public func byMoveRow(from: IndexPath, to: IndexPath) -> Self {
        self.moveRow(at: from, to: to)
        return self
    }
    /// iOS 3.0+
    @available(iOS 3.0, *)
    @discardableResult
    public func byReloadRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation = .automatic) -> Self {
        self.reloadRows(at: indexPaths, with: animation)
        return self
    }
    /// iOS 15.0+ 仅重新配置（不重载）
    @available(iOS 15.0, *)
    @discardableResult
    public func byReconfigureRows(at indexPaths: [IndexPath]) -> Self {
        self.reconfigureRows(at: indexPaths)
        return self
    }
    /// 重新载入数据 / 索引标题
    @discardableResult
    public func byReloadData() -> Self {
        self.reloadData()
        return self
    }
    /// iOS 3.0+
    @available(iOS 3.0, *)
    @discardableResult
    public func byReloadSectionIndexTitles() -> Self {
        self.reloadSectionIndexTitles()
        return self
    }
    /// iOS 18.0+ 内容 Hugging 策略
    @available(iOS 18.0, *)
    @discardableResult
    public func byContentHuggingElements(_ value: UITableViewContentHuggingElements) -> Self {
        self.contentHuggingElements = value
        return self
    }
}
// MARK: - 🍬语法糖@滚动相关
extension UITableView {
    @discardableResult
    public func byScrollToRow(_ indexPath: IndexPath,
                              at position: UITableView.ScrollPosition,
                              animated: Bool = true) -> Self {
        self.scrollToRow(at: indexPath, at: position, animated: animated)
        return self
    }

    @discardableResult
    public func byScrollToNearestSelectedRow(at position: UITableView.ScrollPosition, animated: Bool = true) -> Self {
        self.scrollToNearestSelectedRow(at: position, animated: animated)
        return self
    }
}
// MARK: - 🍬语法糖@其他
extension UITableView {
    // MARK: - iOS 15.0+ 是否启用预取
    @available(iOS 15.0, *)
    @discardableResult
    public func byPrefetchingEnabled(_ enabled: Bool) -> Self {
        self.isPrefetchingEnabled = enabled
        return self
    }
    // MARK: - iOS 11.0+ 是否允许拖拽交互
    @available(iOS 11.0, *)
    @discardableResult
    public func byDragInteractionEnabled(_ enabled: Bool) -> Self {
        self.dragInteractionEnabled = enabled
        return self
    }
    // MARK: - iOS 14.0+ 配置 contextMenuInteraction（只读属性，提供配置闭包）
    @available(iOS 14.0, *)
    @discardableResult
    public func byContextMenuInteraction(_ config: jobsByContextMenuInteractionBlock) -> Self {
        if let interaction = self.contextMenuInteraction {
            config(interaction)
        };return self
    }
}
