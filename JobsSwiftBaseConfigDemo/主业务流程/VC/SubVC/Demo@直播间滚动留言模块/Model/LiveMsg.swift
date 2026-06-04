//
//  LiveMsg.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

// ============================== Model ==============================
struct LiveMsg: Hashable {
    let id = UUID()
    let time = Date()
    let text: String
}
