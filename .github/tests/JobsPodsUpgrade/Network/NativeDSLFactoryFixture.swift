//
//  NativeDSLFactoryFixture.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

/// 为 macOS 网络回归提供 JSONDecoder 创建与日期解码策略设置两个最小入口，承接生产网络模块的 DSL 依赖。
/// 由本目录 run_regressions.rb 编译为测试用 JobsSwiftDSL 模块，本文件没有独立执行入口。
/// 不替代网络传输或密码实现；iOS 构建使用真实 DSL，不得把本替身加入主 App 或替代真实模块。
public extension JSONDecoder {
    static func make(_ configure: (JSONDecoder) -> Void) -> JSONDecoder {
        let decoder = JSONDecoder()
        configure(decoder)
        return decoder
    }

    @discardableResult
    func byDateDecodingStrategy(_ strategy: DateDecodingStrategy) -> Self {
        dateDecodingStrategy = strategy
        return self
    }
}
