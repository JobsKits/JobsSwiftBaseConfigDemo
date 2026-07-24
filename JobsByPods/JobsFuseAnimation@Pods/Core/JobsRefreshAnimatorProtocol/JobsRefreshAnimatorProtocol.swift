//
//  JobsRefreshAnimatorProtocol.swift
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

/// 刷新状态机传给动画插件的统一阶段。
@MainActor
public enum JobsRefreshAnimatorPhase {
    case idle
    case pulling
    case ready
    case refreshing
    case ending
    case inactive
}

/// 刷新宿主只依赖此协议；图片、Lottie、GIF 和品牌动画均可作为同级插件实现。
@MainActor
public protocol JobsRefreshAnimatorProtocol: AnyObject {
    var refreshAnimatorView: UIView { get }
    var refreshAnimatorPreferredSize: CGSize { get }

    func refreshAnimatorApply(phase: JobsRefreshAnimatorPhase,
                              progress: CGFloat)
}
