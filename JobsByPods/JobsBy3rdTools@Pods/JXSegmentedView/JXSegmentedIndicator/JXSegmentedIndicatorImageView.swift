//
//  JXSegmentedIndicatorImageView.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(JXSegmentedView)
import JXSegmentedView
// MARK: - Image
extension JXSegmentedIndicatorImageView {
    @discardableResult
    public func byImage(_ v: UIImage?) -> Self {
        image = v
        return self
    }
}
#endif
