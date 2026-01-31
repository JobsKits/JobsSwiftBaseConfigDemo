//
//  AnySendable+Network.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

extension AnySendable {
    func stringValueForNetwork() -> String {
        if let s = value as? String { return s }
        return value.map { String(describing: $0) } ?? "nil"
    }
}
