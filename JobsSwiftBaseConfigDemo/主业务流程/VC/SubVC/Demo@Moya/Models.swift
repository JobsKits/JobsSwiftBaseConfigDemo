//
//  Models.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

public struct GHUser: Decodable {
    public let login: String
    public let id: Int
    public let avatar_url: URL
}

public struct CreateUserReq: Encodable {
    public let name: String
    public let email: String
}

public struct UpdateUserReq: Encodable {
    public let name: String?
    public let email: String?
}

public struct APIErrorEnvelope: Decodable, Error {
    public let code: Int
    public let message: String
}
