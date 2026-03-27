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
        store = try! Store(directoryPath: "objectbox-demo")
        humanBox = store.box(for: Human.self)
    }
}
