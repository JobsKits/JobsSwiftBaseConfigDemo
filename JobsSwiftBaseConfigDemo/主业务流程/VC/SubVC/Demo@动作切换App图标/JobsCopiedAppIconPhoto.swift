//
//  JobsCopiedAppIconPhoto.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import Foundation

struct JobsCopiedAppIconPhoto: Codable, Hashable, Identifiable {
    let id: UUID
    let fileName: String
    let createdAt: Date
    let pixelWidth: Int
    let pixelHeight: Int
}
