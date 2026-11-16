//
//  main.swift
//  JobsCoreDataUserStoreTests
//
//  Created by Jobs on 2026年11月16日，星期一.
//

import Foundation
import CoreData

func expect(_ condition: @autoclosure () throws -> Bool,
             _ message: String) throws {
    guard try condition() else {
        throw NSError(domain: "JobsCoreDataUserStoreTests",
                      code: 1,
                      userInfo: [NSLocalizedDescriptionKey: message])
    }
}

func expectRejected(_ operation: () throws -> Void,
                     _ message: String) throws {
    do {
        try operation()
    } catch {
        return
    }
    throw NSError(domain: "JobsCoreDataUserStoreTests",
                  code: 2,
                  userInfo: [NSLocalizedDescriptionKey: message])
}

let arguments = CommandLine.arguments
let isChild = arguments.contains("--verify-persisted")
let paths = arguments.dropFirst().filter { $0 != "--verify-persisted" }
guard paths.count == 2 else {
    fatalError("Usage: tests [--verify-persisted] <compiled momd> <isolated sqlite>")
}
let modelURL = URL(fileURLWithPath: paths[paths.startIndex])
let sqliteURL = URL(fileURLWithPath: paths[paths.index(after: paths.startIndex)])

do {
    if isChild {
        let reopened = try JobsCoreDataUserStore(modelURL: modelURL,
                                                  storeURL: sqliteURL)
        let rows = try reopened.fetchUsers()
        try expect(rows.count == 1 && rows[0].name == "Persisted Jobs" && rows[0].age == 42,
                   "A fresh process must read the committed SQLite record")
        try reopened.saveUser(objectID: rows[0].objectID,
                               name: "Persisted Jobs",
                               ageText: "43")
        print("PASS: fresh process reads and updates persisted records")
    } else {
        try expectRejected({
            _ = try JobsCoreDataUserStore(modelURL: nil,
                                           storeURL: sqliteURL)
        }, "A missing model must fail visibly")

        let store = try JobsCoreDataUserStore(modelURL: modelURL,
                                               storeURL: sqliteURL)
        try expect(try store.fetchUsers().isEmpty, "A new database must start empty")
        try expectRejected({
            try store.saveUser(name: " \n ", ageText: "18")
        }, "Whitespace-only names must be rejected")
        for invalidAge in ["-1", "151", "3.5", "abc", "", "2147483648"] {
            try expectRejected({
                try store.saveUser(name: "Jobs", ageText: invalidAge)
            }, "Invalid ages must be rejected: \(invalidAge)")
        }
        try expect(try store.fetchUsers().isEmpty, "Rejected input must not insert drafts")

        try store.saveUser(name: "  Alpha  ", ageText: "0")
        try store.saveUser(name: "Beta", ageText: "150")
        var users = try store.fetchUsers()
        try expect(users.count == 2 && users[0].name == "Alpha" && users[0].age == 0,
                   "Insert must trim names, preserve boundary ages, and query real records")
        try expect(users[1].age == 150, "The upper age boundary must persist")
        try store.saveUser(objectID: users[0].objectID,
                            name: "Edited Jobs",
                            ageText: "27")
        users = try store.fetchUsers()
        try expect(users.count == 2 && users.contains { $0.name == "Edited Jobs" && $0.age == 27 },
                   "Editing must change one existing object without duplicating it")
        let secondSceneStore = try JobsCoreDataUserStore(modelURL: modelURL,
                                                           storeURL: sqliteURL)
        let peerUsers = try secondSceneStore.fetchUsers()
        guard let peerUser = peerUsers.first(where: { $0.name == "Edited Jobs" }) else {
            fatalError("The second container must see the first container's commit")
        }
        try secondSceneStore.saveUser(objectID: peerUser.objectID,
                                        name: "Updated in another Scene",
                                        ageText: "33")
        users = try store.fetchUsers()
        try expect(users.count == 2 && users.contains {
            $0.name == "Updated in another Scene" && $0.age == 33
        }, "Reload must refresh cached objects after another container changes their fields")
        try store.deleteUser(objectID: users[0].objectID)
        try expect(try store.fetchUsers().count == 1, "Single deletion must preserve other records")
        try store.deleteAllUsers()
        try expect(try store.fetchUsers().isEmpty, "Clear must remove every record")
        try store.saveUser(name: "Persisted Jobs", ageText: "42")
        let signature = try Data(contentsOf: sqliteURL).prefix(16)
        try expect(signature == Data("SQLite format 3\0".utf8),
                   "The store must be an actual SQLite file")

        let child = Process()
        child.executableURL = URL(fileURLWithPath: arguments[0])
        child.arguments = ["--verify-persisted", modelURL.path, sqliteURL.path]
        try child.run()
        child.waitUntilExit()
        try expect(child.terminationStatus == 0, "Fresh-process persistence test must pass")
        let reopened = try JobsCoreDataUserStore(modelURL: modelURL,
                                                  storeURL: sqliteURL)
        users = try reopened.fetchUsers()
        try expect(users.count == 1 && users[0].age == 43,
                   "The child process edit must survive its exit")
        try reopened.deleteAllUsers()
        let emptyReopen = try JobsCoreDataUserStore(modelURL: modelURL,
                                                     storeURL: sqliteURL)
        try expect(try emptyReopen.fetchUsers().isEmpty,
                   "Clear must remain empty when reopening SQLite")
        print("PASS: compiled model, real SQLite CRUD, validation, single delete, clear, and cross-process persistence")
    }
} catch {
    fputs("FAIL: \(error)\n", stderr)
    exit(1)
}
