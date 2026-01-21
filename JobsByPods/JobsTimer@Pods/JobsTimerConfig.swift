//
//  JobsTimerConfig.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/24/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
import JobsSwiftBlock
// MARK: - 配置
public struct JobsTimerConfig {
    public var interval: TimeInterval    // 时间间隔（最小会被 clamp 到 0.000001）
    public var repeats: Bool             // 是否重复；false 就是 one-shot
    public var tolerance: TimeInterval   // 容忍误差（对 `Timer` 有意义；GCD 用 leeway）

    public var queue: DispatchQueue      // 回调实际执行的队列
    public var runLoop: RunLoop          // 非 GCD 内核用（且必须 `.main`）
    public var runLoopMode: RunLoop.Mode // 非 GCD 内核用（且必须 `.main`）

    public var pauseInBackground: Bool   // 进入后台是否 pause（UIKit 下有效）
    public var autoManageAppState: Bool  // 是否自动监听前后台（UIKit 下有效）

    public init(
        interval: TimeInterval = 1.0,
        repeats: Bool = true,
        tolerance: TimeInterval = 0,
        queue: DispatchQueue = .main,
        runLoop: RunLoop = .main,
        runLoopMode: RunLoop.Mode = .common,
        pauseInBackground: Bool = true,
        autoManageAppState: Bool = true
    ) {
        self.interval = max(0.000_001, interval)
        self.repeats = repeats
        self.tolerance = max(0, tolerance)
        self.queue = queue
        self.runLoop = runLoop
        self.runLoopMode = runLoopMode
        self.pauseInBackground = pauseInBackground
        self.autoManageAppState = autoManageAppState
    }
}
