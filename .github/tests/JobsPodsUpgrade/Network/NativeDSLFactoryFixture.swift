//
//  NativeDSLFactoryFixture.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

// 原生 CLI 回归只替代 UIKit DSL 模块中这两个无业务逻辑的构造/赋值入口。
// iOS Pod / 宿主构建仍使用真实 JobsSwiftDSL，不能用此 fixture 替代模块构建。
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
