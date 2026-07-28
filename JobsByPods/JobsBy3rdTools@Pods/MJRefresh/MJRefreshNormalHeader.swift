//
//  MJRefreshNormalHeader.swift
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
extension MJRefreshNormalHeader {
    static func customHeader(refreshingTarget target: Any?, refreshingAction action: Selector?) -> MJRefreshNormalHeader {
        let header = MJRefreshNormalHeader(refreshingTarget: target as Any, refreshingAction: action!)
        header.setTitle("MJRefreshHeaderIdleText".tr, for: .idle)           // 普通状态
        header.setTitle("MJRefreshHeaderPullingText".tr, for: .pulling)        // 松开刷新状态
        header.setTitle("MJRefreshHeaderRefreshingText".tr, for: .refreshing)  // 正在刷新状态
        header.lastUpdatedTimeText = { (lastUpdatedTime) -> String in
            guard let time = lastUpdatedTime else { return "MJRefreshHeaderNoneLastDateText".tr } // 没有更新时间时显示
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            return "MJRefreshHeaderLastTimeText".tr + formatter.string(from: time)
        }
        // 可选：调整字体和颜色
        header.stateLabel?.byFont(UIFont.systemFont(ofSize: 12))
        header.stateLabel?.byTextColor(JobsCor.secondaryLabel)
        header.lastUpdatedTimeLabel?.byFont(UIFont.systemFont(ofSize: 12))
        header.lastUpdatedTimeLabel?.byTextColor(JobsCor.secondaryLabel)
        return header
    }
}
#endif
