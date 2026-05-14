//
//  JobsParameterEncoding.swift
//  JobsNetworking
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

public enum JobsParameterEncoding: Codable, Sendable {
    case urlQuery
    case jsonBody
    case formURLEncoded
    case multipart
    case rawData(Data)
}
