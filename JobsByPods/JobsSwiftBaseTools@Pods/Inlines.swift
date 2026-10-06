//
//  Inlines.swift
//  JobsSwiftBaseTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC

@_exported import JobsGetWindow

// MARK: - 手势封装
// self.view.jobs_addGesture(jobsMakeTapGesture { $0.numberOfTapsRequired = 2 })
@inline(__always)
public func jobsMakeTapGesture(_ block: ((UITapGestureRecognizer) -> Void)? = nil) -> UITapGestureRecognizer {
    let gesture = UITapGestureRecognizer()
    block?(gesture)
    return gesture
}

@inline(__always)
public func jobsMakeLongPressGesture(_ block: ((UILongPressGestureRecognizer) -> Void)? = nil) -> UILongPressGestureRecognizer {
    let gesture = UILongPressGestureRecognizer()
    block?(gesture)
    return gesture
}

@inline(__always)
public func jobsMakeSwipeGesture(_ block: ((UISwipeGestureRecognizer) -> Void)? = nil) -> UISwipeGestureRecognizer {
    let gesture = UISwipeGestureRecognizer()
    block?(gesture)
    return gesture
}

@inline(__always)
public func jobsMakePanGesture(_ block: ((UIPanGestureRecognizer) -> Void)? = nil) -> UIPanGestureRecognizer {
    let gesture = UIPanGestureRecognizer()
    block?(gesture)
    return gesture
}

@inline(__always)
public func jobsMakePinchGesture(_ block: ((UIPinchGestureRecognizer) -> Void)? = nil) -> UIPinchGestureRecognizer {
    let gesture = UIPinchGestureRecognizer()
    block?(gesture)
    return gesture
}

@inline(__always)
public func jobsMakeRotationGesture(_ block: ((UIRotationGestureRecognizer) -> Void)? = nil) -> UIRotationGestureRecognizer {
    let gesture = UIRotationGestureRecognizer()
    block?(gesture)
    return gesture
}

@inline(__always)
public func jobsMakeScreenEdgePanGesture(_ block: ((UIScreenEdgePanGestureRecognizer) -> Void)? = nil) -> UIScreenEdgePanGestureRecognizer {
    let gesture = UIScreenEdgePanGestureRecognizer()
    block?(gesture)
    return gesture
}
