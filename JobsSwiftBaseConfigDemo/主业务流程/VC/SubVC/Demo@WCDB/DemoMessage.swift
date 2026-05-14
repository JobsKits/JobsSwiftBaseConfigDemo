//
//  DemoMessage.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import JobsByUIKit
#if !canImport(FMDB) && canImport(WCDB)
import WCDB
final class DemoMessage: Codable, TableCodable {
    var identifier: Int? = nil
    var content: String? = nil
    var createdAt: Date? = nil
    // 自增插入用
    var isAutoIncrement: Bool = true
    var lastInsertedRowID: Int64 = 0
    enum CodingKeys: String, CodingTableKey {
        typealias Root = DemoMessage

        case identifier
        case content
        case createdAt

        static let objectRelationalMapping = TableBinding(CodingKeys.self) {
            // 主键 + 自增
            BindColumnConstraint(identifier, isPrimary: true, isAutoIncrement: true)

            // 非空 + 默认值
            BindColumnConstraint(content, isNotNull: true, defaultTo: "")
        }
    }
}
#endif
