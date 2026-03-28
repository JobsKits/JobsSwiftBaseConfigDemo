//
//  ObjectBoxManager.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 27/3/26.
//

import Foundation
import ObjectBox

final class ObjectBoxManager {
    static let shared = ObjectBoxManager()

    let store: Store
    let humanBox: Box<Human>

    private init() {
        let appSupport = try! FileManager.default.url(
            for: .applicationSupportDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )
        let directory = appSupport.appendingPathComponent("objectbox-demo")
        try? FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        store = try! Store(directoryPath: directory.path)
        humanBox = store.box(for: Human.self)
    }
}
