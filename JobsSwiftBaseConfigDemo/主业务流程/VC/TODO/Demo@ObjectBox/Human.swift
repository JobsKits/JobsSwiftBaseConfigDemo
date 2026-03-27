//
//  Human.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 27/3/26.
//

import ObjectBox
/// pod 'ObjectBox'                          # https://github.com/objectbox/objectbox-swift        ❤️ 高性能的本地嵌入式NoSQL数据库,比 SQLite 更快、更简单、面向对象的本地数据库。
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
