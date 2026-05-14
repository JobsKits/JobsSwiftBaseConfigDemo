//
//  HTTPMethod.swift
//  JobsNetworking
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

public enum HTTPMethod: String, Codable, Sendable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case head = "HEAD"
}
