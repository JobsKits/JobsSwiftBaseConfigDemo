//
//  NumberFormatter.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/9/25.
//

import Foundation
import JobsSwiftBlock

extension NumberFormatter {
    /// 统一入口：NumberFormatter.make { $0.byNumberStyle(...).byLocale(...) }
    public static func make(_ configure: jobsByNumberFormatterBlock) -> NumberFormatter {
        let formatter = NumberFormatter()
        configure(formatter)
        return formatter
    }
}
