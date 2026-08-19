//
//  Human.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import ObjectBox

// 该标记由 ObjectBox Sourcery 扫描，生成 EntityInfo 时不可删除。
// objectbox: entity
final class Human: Entity {
    var id: Id = 0
    var name: String = ""
    var age: Int32 = 0

    init() {}

    init(id: Id = 0, name: String, age: Int32) {
        self.id = id
        self.name = name
        self.age = age
    }
}
