//
//  DemoDB.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import JobsByUIKit

#if !canImport(FMDB) && canImport(WCDB)
import WCDB
final class DemoDB {
    static let shared = DemoDB()
    private let table = "demo_message"
    private lazy var database: Database = {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let path = dir.appendingPathComponent("demo_wcdb.sqlite").path
        return Database(at: path) // ✅ 修正：withPath -> at
    }()

    var dbPath: String { database.path }

    private init() {
        do {
            try database.create(table: table, of: DemoMessage.self)
        } catch {
            print("create table error:", error)
        }
    }

    @discardableResult
    func insert(_ text: String) throws -> Int64 {
        let msg = DemoMessage()
        msg.content = text
        msg.createdAt = Date()
        msg.isAutoIncrement = true
        try database.insert(msg, intoTable: table) // ✅ 修正：去掉 objects:
        return msg.lastInsertedRowID
    }

    func fetchLatest(limit: Int = 20) throws -> [DemoMessage] {
        let list: [DemoMessage] = try database.getObjects(
            on: DemoMessage.Properties.all,
            fromTable: table,
            where: nil,
            orderBy: [DemoMessage.Properties.identifier.asOrder().order(.descending)], // ✅ 修正
            limit: limit,
            offset: nil
        )
        return list
    }

    func clear() throws {
        try database.delete(fromTable: table)
    }
}
#endif
