//
//  HTTPMethod.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

public enum HTTPMethod: String, Codable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case head = "HEAD"
}
