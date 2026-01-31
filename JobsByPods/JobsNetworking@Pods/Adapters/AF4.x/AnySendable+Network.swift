//
//  AnySendable+Network.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation
// NOTE: In JobsNetworking/Core subspec, the original extension lives under `Types/`,
// which is not included by default. AF4 adapter needs this helper.
extension AnySendable {
    func stringValueForNetwork() -> String {
        if let s = value as? String { return s }
        return value.map { String(describing: $0) } ?? "nil"
    }
}
