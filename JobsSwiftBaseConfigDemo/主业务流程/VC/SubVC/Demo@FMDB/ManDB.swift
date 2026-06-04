//
//  ManDB.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

#if canImport(FMDB) && !canImport(WCDB)
import FMDB
final class ManDB {
    static let shared = ManDB()
    private let queue: FMDatabaseQueue
    private init() {
        let doc = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? NSTemporaryDirectory()
        let path = (doc as NSString).appendingPathComponent("fmdb_demo.sqlite")
        self.queue = FMDatabaseQueue(path: path)!

        createTableIfNeeded()
    }

    private func createTableIfNeeded() {
        let sql = """
        CREATE TABLE IF NOT EXISTS t_person (
            id   INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT    NOT NULL,
            age  INTEGER NOT NULL
        );
        """
        queue.inDatabase { db in
            do { try db.executeUpdate(sql, values: nil) }
            catch { print("❌ createTable error:", error.localizedDescription) }
        }
    }

    @discardableResult
    func insert(name: String, age: Int) -> Bool {
        let sql = "INSERT INTO t_person (name, age) VALUES (?, ?);"
        var ok = false
        queue.inDatabase { db in
            do {
                try db.executeUpdate(sql, values: [name, age])
                ok = true
            } catch {
                print("❌ insert error:", error.localizedDescription)
            }
        };return ok
    }

    func fetchAll() -> [Man] {
        let sql = "SELECT id, name, age FROM t_person ORDER BY id DESC;"
        var list: [Man] = []
        queue.inDatabase { db in
            do {
                let rs = try db.executeQuery(sql, values: nil)
                while rs.next() {
                    let id = rs.longLongInt(forColumn: "id")
                    let name = rs.string(forColumn: "name") ?? ""
                    let age = Int(rs.int(forColumn: "age"))
                    list.append(Man(id: id, name: name, age: age))
                };rs.close()
            } catch {
                print("❌ fetchAll error:", error.localizedDescription)
            }
        };return list
    }

    @discardableResult
    func update(id: Int64, name: String, age: Int) -> Bool {
        let sql = "UPDATE t_person SET name = ?, age = ? WHERE id = ?;"
        var ok = false
        queue.inDatabase { db in
            do {
                try db.executeUpdate(sql, values: [name, age, id])
                ok = true
            } catch {
                print("❌ update error:", error.localizedDescription)
            }
        };return ok
    }

    @discardableResult
    func delete(id: Int64) -> Bool {
        let sql = "DELETE FROM t_person WHERE id = ?;"
        var ok = false
        queue.inDatabase { db in
            do {
                try db.executeUpdate(sql, values: [id])
                ok = true
            } catch {
                print("❌ delete error:", error.localizedDescription)
            }
        };return ok
    }

    @discardableResult
    func clearAll() -> Bool {
        let sql = "DELETE FROM t_person;"
        var ok = false
        queue.inDatabase { db in
            do {
                try db.executeUpdate(sql, values: nil)
                ok = true
            } catch {
                print("❌ clearAll error:", error.localizedDescription)
            }
        };return ok
    }
}
#endif
