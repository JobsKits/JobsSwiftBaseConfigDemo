//
//  Human.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 27/3/26.
//

import ObjectBox
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
