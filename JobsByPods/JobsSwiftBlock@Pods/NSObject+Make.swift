//
//  NSObject+Make.swift
//  JobsSwiftBlock
//
//  Created by Jobs on 2026年8月7日，星期五.
//

import Foundation

public extension NSObject {

    static func jobsMake(_ configure: (Self) -> Void) -> Self {
        let object = self.init()
        configure(object)
        return object
    }
}
