//
//  MessageItem.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/17/25.
//

import Foundation

struct MessageItem: Identifiable, Equatable {
    let id: UUID
    var title: String
    var preview: String
    var time: String
    var isUnread: Bool
}
