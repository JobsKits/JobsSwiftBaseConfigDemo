//
//  MJRefreshAutoNormalFooter.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(MJRefresh)
import MJRefresh
import JobsSwiftBaseDefines
import JobsSwiftDSL
extension MJRefreshAutoNormalFooter {
    static func customFooter(refreshingTarget target: Any?, refreshingAction action: Selector?) -> MJRefreshAutoNormalFooter {
        let footer = MJRefreshAutoNormalFooter(refreshingTarget: target as Any, refreshingAction: action!)
        // 自定义刷新状态文本
        footer.setTitle("MJRefreshAutoFooterIdleText".tr, for: .idle)          // 普通状态
        footer.setTitle("MJRefreshBackFooterPullingText".tr, for: .pulling)            // 松开加载状态
        footer.setTitle("MJRefreshBackFooterRefreshingText".tr, for: .refreshing)    // 正在加载状态
        footer.setTitle("MJRefreshBackFooterNoMoreDataText".tr, for: .noMoreData)        // 没有更多数据状态
        // 可选：调整样式
        footer.stateLabel?.byFont(UIFont.systemFont(ofSize: 12))
        footer.stateLabel?.byTextColor(JobsCor.secondaryLabel)
        footer.stateLabel?.byTextAlignment(.center)
        // 设置是否自动隐藏（例如没有更多数据时隐藏 Footer）
        footer.byHidden(false) // 默认显示，可以根据需求设置隐藏逻辑
        return footer
    }
}
#endif
