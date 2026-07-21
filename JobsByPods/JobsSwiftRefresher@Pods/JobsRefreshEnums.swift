//
//  JobsRefreshEnums.swift
//  JobsSwiftRefresher
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

// MARK: - Core types
@MainActor
public enum JobsAxis {
    case vertical, horizontal
}

@MainActor
public enum JobsPosition {
    case header      // top
    case footer      // bottom
    case left
    case right
    public var axis: JobsAxis {
        switch self {
        case .header, .footer: return .vertical
        case .left, .right:    return .horizontal
        }
    }
}

@MainActor
public enum JobsRefreshRole: Equatable {
    case refresh
    case loadMore
}

@MainActor
public protocol JobsRefreshRoleConfigurable: AnyObject {
    var refreshRole: JobsRefreshRole { get set }
}

@MainActor
public enum JobsRefreshHorizontalMode: Equatable {
    /// 横向向右拉 = 刷新；横向向左拉 = 加载更多
    case refreshRightLoadLeft
    /// 横向向右拉 = 加载更多；横向向左拉 = 刷新
    case loadRightRefreshLeft

    public func role(for position: JobsPosition) -> JobsRefreshRole {
        switch (self, position) {
        case (_, .header):
            return .refresh
        case (_, .footer):
            return .loadMore
        case (.refreshRightLoadLeft, .left),
             (.loadRightRefreshLeft, .right):
            return .refresh
        case (.refreshRightLoadLeft, .right),
             (.loadRightRefreshLeft, .left):
            return .loadMore
        }
    }
}

@MainActor
public enum JobsState: Equatable {
    case idle                       // 初始/重置
    case pulling(progress: CGFloat) // 拖拽进行中（0...1）
    case ready                      // 达到阈值，松手即可触发
    case refreshing                 // 刷新中
    case ending                     // 结束动画中
    case failed                     // 失败，可由业务切回 normal 重试
    case disabled                   // 禁用，不再响应拖拽
    case noMore                     // 加载更多语义专用：无更多数据
    case removed                    // 组件被移除（不再响应）
}

@MainActor
public enum JobsSwitch {
    case refreshing
    case normal
    case failed
    case disabled
    case removed
    case noMoreData                 // 仅加载更多语义生效
}

@MainActor
public struct JobsRefreshFeedback {
    public let enablesHaptics: Bool
    public let soundFileName: String?

    public init(enablesHaptics: Bool = false,
                soundFileName: String? = nil) {
        self.enablesHaptics = enablesHaptics
        let trimmed = soundFileName?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.soundFileName = trimmed?.isEmpty == true ? nil : trimmed
    }

    public static let disabled = JobsRefreshFeedback()
}
// MARK: - Lottie (Global + Per-slot)
//
// 目标：
// 1) JobsSwiftRefresher target 没引入 Lottie 也能编译（这里只提供配置类型，不引用 Lottie 类型）
// 2) 单独设置（slot）优先于全局设置
// 3) 两者都没设置时回退普通菊花
@MainActor
public enum JobsLottieLoopMode: Equatable {
    case loop
    case playOnce
    case autoReverse
}

@MainActor
public struct JobsLottieSetting: Equatable {
    /// 动画资源名：推荐不带扩展名（"loading"）。也支持 "xxx.json" / "folder/xxx.json"。
    public var animationName: String
    /// 资源所在 bundle（默认 .main）
    public var bundle: Bundle
    public var loopMode: JobsLottieLoopMode
    public var speed: CGFloat
    public init(animationName: String,
                bundle: Bundle = .main,
                loopMode: JobsLottieLoopMode = .loop,
                speed: CGFloat = 1) {
        self.animationName = animationName
        self.bundle = bundle
        self.loopMode = loopMode
        self.speed = speed
    }
}

@MainActor
public enum JobsLottiePreference: Equatable {
    /// 继承全局（全局没配置则回退菊花）
    case inherit
    /// 强制禁用（即使全局有配置也回退菊花）
    case disabled
    /// 使用指定动画
    case custom(JobsLottieSetting)
    public static func custom(_ name: String,
                              bundle: Bundle = .main,
                              loopMode: JobsLottieLoopMode = .loop,
                              speed: CGFloat = 1) -> JobsLottiePreference {
        .custom(.init(animationName: name,
                      bundle: bundle,
                      loopMode: loopMode,
                      speed: speed))
    }
}
/// 视图可被 DSL/Proxy 注入 per-slot Lottie 配置。
@MainActor
public protocol JobsLottieConfigurable: AnyObject {
    var lottiePreference: JobsLottiePreference { get set }
}
/// 全局默认（可选）：单独设置优先级更高。
@MainActor
public enum JobsLottieConfig {
    private static var _global: JobsLottiePreference = .inherit

    public static var global: JobsLottiePreference {
        _global
    }

    public static func configure(_ setting: JobsLottieSetting) {
        _global = .custom(setting)
    }

    public static func disable() {
        _global = .disabled
    }

    public static func clear() {
        _global = .inherit
    }
}

// MARK: - Image / GIF / Network frames
@MainActor
public enum JobsRefreshImageSource: Equatable {
    /// Bundle 内的 gif 文件名，支持带或不带 `.gif`。
    case gif(name: String, bundle: Bundle)
    /// 多张静态图轮播，`interval` 是单帧时长。
    case frames(names: [String], bundle: Bundle, interval: TimeInterval)
    /// 网络图片。安装 SDWebImage 子规格后会使用 SDWebImage 解析，否则回退菊花。
    case network(url: URL, placeholderName: String?)
}

@MainActor
public struct JobsRefreshImageSetting: Equatable {
    public var source: JobsRefreshImageSource

    public init(source: JobsRefreshImageSource) {
        self.source = source
    }
}

@MainActor
public enum JobsRefreshImagePreference: Equatable {
    case inherit
    case disabled
    case custom(JobsRefreshImageSetting)

    public static func gif(_ name: String,
                           bundle: Bundle = .main) -> JobsRefreshImagePreference {
        .custom(.init(source: .gif(name: name, bundle: bundle)))
    }

    public static func frames(_ names: [String],
                              bundle: Bundle = .main,
                              interval: TimeInterval = 0.08) -> JobsRefreshImagePreference {
        .custom(.init(source: .frames(names: names, bundle: bundle, interval: interval)))
    }

    public static func network(_ url: URL,
                               placeholderName: String? = nil) -> JobsRefreshImagePreference {
        .custom(.init(source: .network(url: url, placeholderName: placeholderName)))
    }
}

@MainActor
public protocol JobsRefreshImageConfigurable: AnyObject {
    var imagePreference: JobsRefreshImagePreference { get set }
}

@MainActor
public enum JobsRefreshImageConfig {
    private static var _global: JobsRefreshImagePreference = .inherit

    public static var global: JobsRefreshImagePreference {
        _global
    }

    public static func configure(_ setting: JobsRefreshImageSetting) {
        _global = .custom(setting)
    }

    public static func disable() {
        _global = .disabled
    }

    public static func clear() {
        _global = .inherit
    }
}
