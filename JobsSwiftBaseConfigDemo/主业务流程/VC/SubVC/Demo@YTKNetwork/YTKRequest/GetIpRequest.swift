//
//  GetIpRequest.swift
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
/// GET /ip => {"origin": "x.x.x.x"}

final class GetIpRequest: YTKRequest {
    override func requestUrl() -> String {
        return "/ip"
    }

    override func requestMethod() -> YTKRequestMethod {
        return .GET
    }

    override func responseSerializerType() -> YTKResponseSerializerType {
        return .JSON
    }

    var ip: String? {
        (responseJSONObject as? [String: Any])?["origin"] as? String
    }
}
