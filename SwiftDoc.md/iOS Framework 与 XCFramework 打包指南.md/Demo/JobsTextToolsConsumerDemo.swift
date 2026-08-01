//
//  JobsTextToolsConsumerDemo.swift
//  JobsTextToolsFrameworkDemo
//
//  Created by Jobs on 2026年7月30日，星期四.
//

import JobsTextTools

enum JobsTextToolsConsumerDemo {
    static func run() -> String {
        let text: JobsText = "JobsTextTools XCFramework 可用"
        return text.asString
    }
}
