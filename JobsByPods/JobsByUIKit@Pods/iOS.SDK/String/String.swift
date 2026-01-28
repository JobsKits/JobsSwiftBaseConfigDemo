//
//  String.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 9/25/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
// MARK: String? 扩展：nil 安全
extension Optional where Wrapped == String {
    @inlinable public var byTrimmedOrNil: String? {
        self?.byTrimmedOrNil
    }
    @inlinable public var isNonEmptyHttpURL: Bool {
        self?.isNonEmptyHttpURL ?? false
    }
    @inlinable public var asHttpURLOrNil: String? {
        self?.asHttpURLOrNil
    }
}
