//
//  GetHeadersRequest.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
import YTKNetwork
/// GET /headers => {"headers": {...}}
final class GetHeadersRequest: YTKRequest {

    override func requestUrl() -> String {
        return "/headers"
    }

    override func requestMethod() -> YTKRequestMethod {
        return .GET
    }

    override func responseSerializerType() -> YTKResponseSerializerType {
        return .JSON
    }

    var headers: [String: String]? {
        (responseJSONObject as? [String: Any])?["headers"] as? [String: String]
    }
}
