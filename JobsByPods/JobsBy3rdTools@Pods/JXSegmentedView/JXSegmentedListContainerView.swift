//
//  JXSegmentedListContainerView.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
import JobsByUIKit

#if canImport(JXSegmentedView)
import JXSegmentedView
// MARK: - 便捷工厂
extension JXSegmentedListContainerView {
    public static func make(dataSource: JXSegmentedListContainerViewDataSource,
                            type: JXSegmentedListContainerType = .scrollView) -> JXSegmentedListContainerView {
        JXSegmentedListContainerView(dataSource: dataSource, type: type)
    }
}

extension JXSegmentedListContainerView {
    // MARK: 行为&外观
    /// 初始化阈值（0~1，默认 0.01）
    @discardableResult
    public func byInitListPercent(_ p: CGFloat) -> Self {
        self.initListPercent = p; return self
    }

    @discardableResult
    public func byListCellBackgroundColor(_ color: UIColor) -> Self {
        self.listCellBackgroundColor = color; return self
    }
    /// 默认选中 index（务必与 segmentedView.defaultSelectedIndex 保持一致）
    @discardableResult
    public func byDefaultSelectedIndex(_ index: Int) -> Self {
        self.defaultSelectedIndex = index; return self
    }

    // MARK: Scroll 属性（scrollView/collectionView 统一写）
    @discardableResult
    public func byPagingEnabled(_ on: Bool = true) -> Self {
        self.scrollView.isPagingEnabled = on; return self
    }

    @discardableResult
    public func byBounces(_ on: Bool = false) -> Self {
        self.scrollView.bounces = on; return self
    }

    @discardableResult
    public func byShowsIndicators(horizontal: Bool = false, vertical: Bool = false) -> Self {
        self.scrollView.showsHorizontalScrollIndicator = horizontal
        self.scrollView.showsVerticalScrollIndicator = vertical
        return self
    }

    @discardableResult
    public func byScrollsToTop(_ on: Bool = false) -> Self {
        self.scrollView.scrollsToTop = on; return self
    }

    @discardableResult
    public func byDecelerationRate(_ rate: UIScrollView.DecelerationRate) -> Self {
        self.scrollView.decelerationRate = rate; return self
    }

    @discardableResult
    public func byNeverAdjustContentInset() -> Self {
        if #available(iOS 11.0, *) { self.scrollView.contentInsetAdjustmentBehavior = .never };return self
    }
    // MARK: 绑定 / 刷新
    /// 绑定到 SegmentedView（等价于 `segmentedView.listContainer = self`）
    @discardableResult
    public func byBind(to segmentedView: JXSegmentedView, defaultIndex: Int? = nil) -> Self {
        if let i = defaultIndex { self.defaultSelectedIndex = i; segmentedView.defaultSelectedIndex = i }
        segmentedView.listContainer = self
        return self
    }
    /// 触发 reload
    @discardableResult
    public func byReload() -> Self { self.reloadData(); return self }
}
// MARK: - 切换代理 ➤ 转回调
private struct AssociatedKeys {
    static var proxy: UInt8 = 0
    static var handler: UInt8 = 0
    static var lastIndex: UInt8 = 0
}

extension JXSegmentedListContainerView {
    
    public typealias JXIndexChangedHandler = (_ from: Int, _ to: Int) -> Void
    /// 开启“统一切换完成回调”（点击标题 + 手势滑动都会走到同一个回调）
    /// 建议：创建后 / 设置好 segmentedView 绑定关系后调用一次即可。
    public func byIndexChange() -> Self {
        // 安装代理转发器（只装一次）
        if objc_getAssociatedObject(self, &AssociatedKeys.proxy) as? _JXScrollDelegateProxy != nil {
            return self
        }
        // 记录初始 index（用 defaultSelectedIndex / current visible offset 推断一个合理值）
        jx_lastReportedIndex = jx_currentIndexFromContentOffset()

        let proxy = _JXScrollDelegateProxy(owner: self, forwardTo: self)
        objc_setAssociatedObject(
            self,
            &AssociatedKeys.proxy,
            proxy,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
        // 把 scrollView.delegate 改成 proxy，proxy 再转发给原本的 self（pod 内部逻辑不受影响）
        self.contentScrollView().delegate = proxy
        self.on("jx.segmented.scrollViewDidEndScrollingAnimation",
                object: self.contentScrollView()) { [weak self] noti, obj, userInfo in
            guard let self else { return }
            self.jx_reportIfNeeded()
        };return self
    }
    /// 设置统一回调：切换完成时触发一次（from -> to）
    public func byDidIndexChanged(_ handler: JXIndexChangedHandler?) -> Self {
        objc_setAssociatedObject(
            self,
            &AssociatedKeys.handler,
            handler,
            .OBJC_ASSOCIATION_COPY_NONATOMIC
        );return self
    }
}
// MARK: - Internal (associated storage)
extension JXSegmentedListContainerView {

    private var jx_handler: JXIndexChangedHandler? {
        get { objc_getAssociatedObject(self, &AssociatedKeys.handler) as? JXIndexChangedHandler }
        set { objc_setAssociatedObject(
            self,
            &AssociatedKeys.handler,
            newValue,
            .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }

    private var jx_lastReportedIndex: Int {
        get { (objc_getAssociatedObject(self, &AssociatedKeys.lastIndex) as? Int) ?? 0 }
        set { objc_setAssociatedObject(
            self,
            &AssociatedKeys.lastIndex,
            newValue,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    private func jx_currentIndexFromContentOffset() -> Int {
        let sv = contentScrollView()
        let w = sv.bounds.width
        guard w > 0 else { return defaultSelectedIndex }
        let raw = sv.contentOffset.x / w
        // round 比 floor 更符合“落页”语义
        return max(0, Int(round(raw)))
    }

    public func jx_reportIfNeeded() {
        let to = jx_currentIndexFromContentOffset()
        let from = jx_lastReportedIndex
        guard to != from else { return }
        jx_lastReportedIndex = to
        jx_handler?(from, to)
    }
}
// MARK: - Delegate Proxy
private final class _JXScrollDelegateProxy: NSObject, UIScrollViewDelegate {
    
    weak var owner: JXSegmentedListContainerView?
    weak var forwardTo: UIScrollViewDelegate?

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    init(owner: JXSegmentedListContainerView, forwardTo: UIScrollViewDelegate) {
        self.owner = owner
        self.forwardTo = forwardTo
        super.init()
    }
    // 关键：把未实现的方法都转发给 forwardTo（也就是 pod 内部的 listContainerView self）
    override func responds(to aSelector: Selector!) -> Bool {
        if super.responds(to: aSelector) { return true };return (forwardTo?.responds(to: aSelector) ?? false)
    }

    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        return forwardTo
    }
    // 我们只“插入”几个时机：滚动停止/减速结束/拖拽结束
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 先让 pod 内部逻辑走完
        (forwardTo)?.scrollViewDidEndDecelerating?(scrollView)
        owner?.jx_reportIfNeeded()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        (forwardTo)?.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate)
        // 如果不再减速，说明已经停住（例如轻微拖拽）
        if !decelerate {
            owner?.jx_reportIfNeeded()
        }
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        (forwardTo)?.scrollViewDidEndScrollingAnimation?(scrollView)
        // 这里也报告一次（但有些情况下 delegate 不一定走到，所以我们额外发 notification 兜底）
        owner?.jx_reportIfNeeded()
        self.post("jx.segmented.scrollViewDidEndScrollingAnimation", object: scrollView)
    }
}
#endif
