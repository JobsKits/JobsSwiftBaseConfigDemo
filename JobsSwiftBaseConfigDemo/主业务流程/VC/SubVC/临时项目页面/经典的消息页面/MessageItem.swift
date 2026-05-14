//
//  MessageItem.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

struct MessageItem: Identifiable, Equatable {
    let id: UUID
    var title: String
    var preview: String
    var time: String
    var isUnread: Bool
}
