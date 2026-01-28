//
//  UITableView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2025/6/15.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
// MARK: - DSL
extension UITableView {
    @discardableResult
    public func byTarget(_ target: AnyObject) -> Self {
        let p = jobs_blocksProxy()!
        p.target = target
        dataSource = p
        // 关键：delegate 改用 mux，scroll delegate 交给 UIScrollViewBlocksProxy
        byScrollTarget(target)
        jobs_setDelegateMuxIfNeeded(primary: p)
        return self
    }
    // MARK: - UITableViewDataSource
    @discardableResult
    public func numberOfSections(_ block: @escaping (AnyObject, UITableView) -> Int) -> Self {
        jobs_blocksProxy()?.numberOfSections = block
        return self
    }

    @discardableResult
    public func numberOfRowsInSection(_ block: @escaping (AnyObject, UITableView, Int) -> Int) -> Self {
        jobs_blocksProxy()?.numberOfRowsInSection = block
        return self
    }

    @discardableResult
    public func cellForRowAt(_ block: @escaping (AnyObject,
                                                 UITableView,
                                                 IndexPath) -> UITableViewCell) -> Self {
        jobs_blocksProxy()?.cellForRowAt = block
        return self
    }

    @discardableResult
    public func titleForHeaderInSection(_ block: @escaping (AnyObject,
                                                            UITableView,
                                                            Int) -> String?) -> Self {
        jobs_blocksProxy()?.titleForHeaderInSection = block
        return self
    }

    @discardableResult
    public func titleForFooterInSection(_ block: @escaping (AnyObject,
                                                            UITableView,
                                                            Int) -> String?) -> Self {
        jobs_blocksProxy()?.titleForFooterInSection = block
        return self
    }

    @discardableResult
    public func canEditRowAt(_ block: @escaping (AnyObject,
                                                 UITableView,
                                                 IndexPath) -> Bool) -> Self {
        jobs_blocksProxy()?.canEditRowAt = block
        return self
    }

    @discardableResult
    public func commitEditingStyle(_ block: @escaping (AnyObject,
                                                       UITableView,
                                                       UITableViewCell.EditingStyle,
                                                       IndexPath) -> Void) -> Self {
        jobs_blocksProxy()?.commitEditingStyle = block
        return self
    }

    @discardableResult
    public func canMoveRowAt(_ block: @escaping (AnyObject,
                                                 UITableView,
                                                 IndexPath) -> Bool) -> Self {
        jobs_blocksProxy()?.canMoveRowAt = block
        return self
    }

    @discardableResult
    public func moveRowAtTo(_ block: @escaping (AnyObject,
                                                UITableView,
                                                IndexPath,
                                                IndexPath) -> Void) -> Self {
        jobs_blocksProxy()?.moveRowAtTo = block
        return self
    }
    // MARK: - UITableViewDelegate
    @discardableResult
    public func didSelectRowAt(_ block: @escaping (AnyObject,
                                                   UITableView,
                                                   IndexPath) -> Void) -> Self {
        jobs_blocksProxy()?.didSelectRowAt = block
        return self
    }

    @discardableResult
    public func didDeselectRowAt(_ block: @escaping (AnyObject,
                                                     UITableView,
                                                     IndexPath) -> Void) -> Self {
        jobs_blocksProxy()?.didDeselectRowAt = block
        return self
    }

    @discardableResult
    public func willDisplayCell(_ block: @escaping (AnyObject,
                                                    UITableView,
                                                    UITableViewCell,
                                                    IndexPath) -> Void) -> Self {
        jobs_blocksProxy()?.willDisplayCell = block
        return self
    }

    @discardableResult
    public func didEndDisplayingCell(_ block: @escaping (AnyObject,
                                                         UITableView,
                                                         UITableViewCell,
                                                         IndexPath) -> Void) -> Self {
        jobs_blocksProxy()?.didEndDisplayingCell = block
        return self
    }

    @discardableResult
    public func heightForRowAt(_ block: @escaping (AnyObject,
                                                   UITableView,
                                                   IndexPath) -> CGFloat) -> Self {
        jobs_blocksProxy()?.heightForRowAt = block
        return self
    }

    @discardableResult
    public func estimatedHeightForRowAt(_ block: @escaping (AnyObject,
                                                            UITableView,
                                                            IndexPath) -> CGFloat) -> Self {
        jobs_blocksProxy()?.estimatedHeightForRowAt = block
        return self
    }
    // MARK: - UITableViewDataSourcePrefetching
    @discardableResult
    public func prefetchRowsAt(_ block: @escaping (AnyObject,
                                                   UITableView,
                                                   [IndexPath]) -> Void) -> Self {
        let p = jobs_blocksProxy()!
        p.prefetchRowsAt = block
        prefetchDataSource = p
        return self
    }

    @discardableResult
    public func cancelPrefetchingForRowsAt(_ block: @escaping (AnyObject,
                                                               UITableView,
                                                               [IndexPath]) -> Void) -> Self {
        let p = jobs_blocksProxy()!
        p.cancelPrefetchingForRowsAt = block
        prefetchDataSource = p
        return self
    }
}
// MARK: - Proxy
private final class JobsTableViewBlocksProxy: NSObject,
                                              UITableViewDelegate,
                                              UITableViewDataSource,
                                              UITableViewDataSourcePrefetching {
    weak var target: AnyObject?
    // MARK: - UITableViewDataSource
    var numberOfSections: ((AnyObject, UITableView) -> Int)?
    var numberOfRowsInSection: ((AnyObject, UITableView, Int) -> Int)?
    var cellForRowAt: ((AnyObject, UITableView, IndexPath) -> UITableViewCell)?
    var titleForHeaderInSection: ((AnyObject, UITableView, Int) -> String?)?
    var titleForFooterInSection: ((AnyObject, UITableView, Int) -> String?)?
    var canEditRowAt: ((AnyObject, UITableView, IndexPath) -> Bool)?
    var canMoveRowAt: ((AnyObject, UITableView, IndexPath) -> Bool)?
    var commitEditingStyle: ((AnyObject, UITableView, UITableViewCell.EditingStyle, IndexPath) -> Void)?
    var moveRowAtTo: ((AnyObject, UITableView, IndexPath, IndexPath) -> Void)?

    func numberOfSections(in tableView: UITableView) -> Int {
        guard let t = target else { return 1 }
        return numberOfSections?(t, tableView) ?? 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let t = target else { return 0 }
        return numberOfRowsInSection?(t, tableView, section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let t = target else { return UITableViewCell() }
        return cellForRowAt?(t, tableView, indexPath) ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let t = target else { return nil }
        return titleForHeaderInSection?(t, tableView, section)
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard let t = target else { return nil }
        return titleForFooterInSection?(t, tableView, section)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard let t = target else { return false }
        return canEditRowAt?(t, tableView, indexPath) ?? false
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        guard let t = target else { return false }
        return canMoveRowAt?(t, tableView, indexPath) ?? false
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        guard let t = target else { return }
        commitEditingStyle?(t, tableView, editingStyle, indexPath)
    }

    func tableView(_ tableView: UITableView,
                   moveRowAt sourceIndexPath: IndexPath,
                   to destinationIndexPath: IndexPath) {
        guard let t = target else { return }
        moveRowAtTo?(t, tableView, sourceIndexPath, destinationIndexPath)
    }
    // MARK: - UITableViewDelegate
    var didSelectRowAt: ((AnyObject, UITableView, IndexPath) -> Void)?
    var didDeselectRowAt: ((AnyObject, UITableView, IndexPath) -> Void)?
    var willDisplayCell: ((AnyObject, UITableView, UITableViewCell, IndexPath) -> Void)?
    var didEndDisplayingCell: ((AnyObject, UITableView, UITableViewCell, IndexPath) -> Void)?
    var heightForRowAt: ((AnyObject, UITableView, IndexPath) -> CGFloat)?
    var estimatedHeightForRowAt: ((AnyObject, UITableView, IndexPath) -> CGFloat)?

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let t = target else { return }
        didSelectRowAt?(t, tableView, indexPath)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let t = target else { return }
        didDeselectRowAt?(t, tableView, indexPath)
    }

    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        guard let t = target else { return }
        willDisplayCell?(t, tableView, cell, indexPath)
    }

    func tableView(_ tableView: UITableView,
                   didEndDisplaying cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        guard let t = target else { return }
        didEndDisplayingCell?(t, tableView, cell, indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let t = target else { return UITableView.automaticDimension }
        return heightForRowAt?(t, tableView, indexPath) ?? UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let t = target else { return UITableView.automaticDimension }
        return estimatedHeightForRowAt?(t, tableView, indexPath) ?? UITableView.automaticDimension
    }
    // MARK: - UITableViewDataSourcePrefetching
    var prefetchRowsAt: ((AnyObject, UITableView, [IndexPath]) -> Void)?
    var cancelPrefetchingForRowsAt: ((AnyObject, UITableView, [IndexPath]) -> Void)?

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let t = target else { return }
        prefetchRowsAt?(t, tableView, indexPaths)
    }

    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        guard let t = target else { return }
        cancelPrefetchingForRowsAt?(t, tableView, indexPaths)
    }
}
// MARK: - Associated
private enum JobsTableViewBlocksAssociatedKeys {
    static var proxyKey = "jobs.tableview.blocks.proxy.key"
}

extension UITableView {
     private func jobs_blocksProxy(createIfNeeded: Bool = true) -> JobsTableViewBlocksProxy? {
        if let p = objc_getAssociatedObject(self, &JobsTableViewBlocksAssociatedKeys.proxyKey) as? JobsTableViewBlocksProxy {
            return p
        }
        guard createIfNeeded else { return nil }
        let p = JobsTableViewBlocksProxy()
        objc_setAssociatedObject(self, &JobsTableViewBlocksAssociatedKeys.proxyKey, p, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return p
    }
}
