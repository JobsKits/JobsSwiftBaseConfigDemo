//
//  JXSegmentedIndicatorImageView.swift
//  Pods
//
//  Created by Jobs on 9/3/26.
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
