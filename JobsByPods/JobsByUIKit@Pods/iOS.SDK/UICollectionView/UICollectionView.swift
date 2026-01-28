//
//  UICollectionView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2025/6/16.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
// MARK: - DSL
extension UICollectionView {
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
    // MARK: - UICollectionViewDataSource
    @discardableResult
    public func numberOfSections(_ block: @escaping (AnyObject, UICollectionView) -> Int) -> Self {
        jobs_blocksProxy()?.numberOfSections = block
        return self
    }

    @discardableResult
    public func numberOfItemsInSection(_ block: @escaping (AnyObject,
                                                           UICollectionView,
                                                           Int) -> Int) -> Self {
        jobs_blocksProxy()?.numberOfItemsInSection = block
        return self
    }

    @discardableResult
    public func cellForItemAt(_ block: @escaping (AnyObject,
                                                  UICollectionView,
                                                  IndexPath) -> UICollectionViewCell) -> Self {
        jobs_blocksProxy()?.cellForItemAt = block
        return self
    }

    @discardableResult
    public func viewForSupplementaryElementOfKind(_ block: @escaping (AnyObject,
                                                                      UICollectionView,
                                                                      String,
                                                                      IndexPath) -> UICollectionReusableView) -> Self {
        jobs_blocksProxy()?.viewForSupplementaryElementOfKind = block
        return self
    }
    // MARK: - UICollectionViewDelegate
    @discardableResult
    public func didSelectItemAt(_ block: @escaping (AnyObject,
                                                    UICollectionView,
                                                    IndexPath) -> Void) -> Self {
        jobs_blocksProxy()?.didSelectItemAt = block
        return self
    }

    @discardableResult
    public func didDeselectItemAt(_ block: @escaping (AnyObject,
                                                      UICollectionView,
                                                      IndexPath) -> Void) -> Self {
        jobs_blocksProxy()?.didDeselectItemAt = block
        return self
    }

    @discardableResult
    public func willDisplayCell(_ block: @escaping (AnyObject,
                                                    UICollectionView,
                                                    UICollectionViewCell,
                                                    IndexPath) -> Void) -> Self {
        jobs_blocksProxy()?.willDisplayCell = block
        return self
    }

    @discardableResult
    public func didEndDisplayingCell(_ block: @escaping (AnyObject,
                                                         UICollectionView,
                                                         UICollectionViewCell,
                                                         IndexPath) -> Void) -> Self {
        jobs_blocksProxy()?.didEndDisplayingCell = block
        return self
    }
    // MARK: - UICollectionViewDelegateFlowLayout
    @discardableResult
    public func sizeForItemAt(_ block: @escaping (AnyObject,
                                                  UICollectionView,
                                                  UICollectionViewLayout,
                                                  IndexPath) -> CGSize) -> Self {
        jobs_blocksProxy()?.sizeForItemAt = block
        return self
    }

    @discardableResult
    public func insetForSectionAt(_ block: @escaping (AnyObject,
                                                      UICollectionView,
                                                      UICollectionViewLayout,
                                                      Int) -> UIEdgeInsets) -> Self {
        jobs_blocksProxy()?.insetForSectionAt = block
        return self
    }

    @discardableResult
    public func minimumLineSpacingForSectionAt(_ block: @escaping (AnyObject,
                                                                   UICollectionView,
                                                                   UICollectionViewLayout,
                                                                   Int) -> CGFloat) -> Self {
        jobs_blocksProxy()?.minimumLineSpacingForSectionAt = block
        return self
    }

    @discardableResult
    public func minimumInteritemSpacingForSectionAt(_ block: @escaping (AnyObject,
                                                                        UICollectionView,
                                                                        UICollectionViewLayout,
                                                                        Int) -> CGFloat) -> Self {
        jobs_blocksProxy()?.minimumInteritemSpacingForSectionAt = block
        return self
    }

    @discardableResult
    public func referenceSizeForHeaderInSection(_ block: @escaping (AnyObject,
                                                                    UICollectionView,
                                                                    UICollectionViewLayout,
                                                                    Int) -> CGSize) -> Self {
        jobs_blocksProxy()?.referenceSizeForHeaderInSection = block
        return self
    }

    @discardableResult
    public func referenceSizeForFooterInSection(_ block: @escaping (AnyObject,
                                                                    UICollectionView,
                                                                    UICollectionViewLayout,
                                                                    Int) -> CGSize) -> Self {
        jobs_blocksProxy()?.referenceSizeForFooterInSection = block
        return self
    }
    // MARK: - UICollectionViewDataSourcePrefetching
    @discardableResult
    public func prefetchItemsAt(_ block: @escaping (AnyObject,
                                                    UICollectionView,
                                                    [IndexPath]) -> Void) -> Self {
        let p = jobs_blocksProxy()!
        p.prefetchItemsAt = block
        prefetchDataSource = p
        return self
    }

    @discardableResult
    public func cancelPrefetchingForItemsAt(_ block: @escaping (AnyObject, UICollectionView, [IndexPath]) -> Void) -> Self {
        let p = jobs_blocksProxy()!
        p.cancelPrefetchingForItemsAt = block
        prefetchDataSource = p
        return self
    }
}
// MARK: - Proxy
private final class JobsCollectionViewBlocksProxy: NSObject,
                                                   UICollectionViewDataSource,
                                                   UICollectionViewDelegate,
                                                   UICollectionViewDelegateFlowLayout,
                                                   UICollectionViewDataSourcePrefetching {
    weak var target: AnyObject?
    // MARK: - UICollectionViewDataSource
    var numberOfSections: ((AnyObject, UICollectionView) -> Int)?
    var numberOfItemsInSection: ((AnyObject, UICollectionView, Int) -> Int)?
    var cellForItemAt: ((AnyObject, UICollectionView, IndexPath) -> UICollectionViewCell)?
    var viewForSupplementaryElementOfKind: ((AnyObject, UICollectionView, String, IndexPath) -> UICollectionReusableView)?

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let t = target else { return 1 }
        return numberOfSections?(t, collectionView) ?? 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let t = target else { return 0 }
        return numberOfItemsInSection?(t, collectionView, section) ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let t = target else { return UICollectionViewCell() }
        return cellForItemAt?(t, collectionView, indexPath) ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let t = target else { return UICollectionReusableView() }
        return viewForSupplementaryElementOfKind?(t, collectionView, kind, indexPath) ?? UICollectionReusableView()
    }
    // MARK: - UICollectionViewDelegate
    var didSelectItemAt: ((AnyObject, UICollectionView, IndexPath) -> Void)?
    var didDeselectItemAt: ((AnyObject, UICollectionView, IndexPath) -> Void)?
    var willDisplayCell: ((AnyObject, UICollectionView, UICollectionViewCell, IndexPath) -> Void)?
    var didEndDisplayingCell: ((AnyObject, UICollectionView, UICollectionViewCell, IndexPath) -> Void)?

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let t = target else { return }
        didSelectItemAt?(t, collectionView, indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let t = target else { return }
        didDeselectItemAt?(t, collectionView, indexPath)
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        guard let t = target else { return }
        willDisplayCell?(t, collectionView, cell, indexPath)
    }

    func collectionView(_ collectionView: UICollectionView,
                        didEndDisplaying cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        guard let t = target else { return }
        didEndDisplayingCell?(t, collectionView, cell, indexPath)
    }
    // MARK: - UICollectionViewDelegateFlowLayout
    var sizeForItemAt: ((AnyObject, UICollectionView, UICollectionViewLayout, IndexPath) -> CGSize)?
    var insetForSectionAt: ((AnyObject, UICollectionView, UICollectionViewLayout, Int) -> UIEdgeInsets)?
    var minimumLineSpacingForSectionAt: ((AnyObject, UICollectionView, UICollectionViewLayout, Int) -> CGFloat)?
    var minimumInteritemSpacingForSectionAt: ((AnyObject, UICollectionView, UICollectionViewLayout, Int) -> CGFloat)?
    var referenceSizeForHeaderInSection: ((AnyObject, UICollectionView, UICollectionViewLayout, Int) -> CGSize)?
    var referenceSizeForFooterInSection: ((AnyObject, UICollectionView, UICollectionViewLayout, Int) -> CGSize)?

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let t = target else { return (collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize ?? .zero }
        return sizeForItemAt?(t, collectionView, collectionViewLayout, indexPath)
        ?? (collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize
        ?? .zero
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let t = target else { return (collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero }
        return insetForSectionAt?(t, collectionView, collectionViewLayout, section)
        ?? (collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset
        ?? .zero
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard let t = target else { return (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumLineSpacing ?? 0 }
        return minimumLineSpacingForSectionAt?(t, collectionView, collectionViewLayout, section)
        ?? (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumLineSpacing
        ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        guard let t = target else { return (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0 }
        return minimumInteritemSpacingForSectionAt?(t, collectionView, collectionViewLayout, section)
        ?? (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard let t = target else { return (collectionViewLayout as? UICollectionViewFlowLayout)?.headerReferenceSize ?? .zero }
        return referenceSizeForHeaderInSection?(t, collectionView, collectionViewLayout, section)
        ?? (collectionViewLayout as? UICollectionViewFlowLayout)?.headerReferenceSize
        ?? .zero
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        guard let t = target else { return (collectionViewLayout as? UICollectionViewFlowLayout)?.footerReferenceSize ?? .zero }
        return referenceSizeForFooterInSection?(t, collectionView, collectionViewLayout, section)
        ?? (collectionViewLayout as? UICollectionViewFlowLayout)?.footerReferenceSize
        ?? .zero
    }

    // MARK: - UICollectionViewDataSourcePrefetching
    var prefetchItemsAt: ((AnyObject, UICollectionView, [IndexPath]) -> Void)?
    var cancelPrefetchingForItemsAt: ((AnyObject, UICollectionView, [IndexPath]) -> Void)?

    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        guard let t = target else { return }
        prefetchItemsAt?(t, collectionView, indexPaths)
    }

    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        guard let t = target else { return }
        cancelPrefetchingForItemsAt?(t, collectionView, indexPaths)
    }
}
// MARK: - Associated
private enum JobsCollectionViewBlocksAssociatedKeys {
    static var proxyKey = "jobs.collectionview.blocks.proxy.key"
}

extension UICollectionView {
     private func jobs_blocksProxy(createIfNeeded: Bool = true) -> JobsCollectionViewBlocksProxy? {
        if let p = objc_getAssociatedObject(self, &JobsCollectionViewBlocksAssociatedKeys.proxyKey) as? JobsCollectionViewBlocksProxy {
            return p
        }
        guard createIfNeeded else { return nil }
        let p = JobsCollectionViewBlocksProxy()
        objc_setAssociatedObject(self, &JobsCollectionViewBlocksAssociatedKeys.proxyKey, p, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return p
    }
}
