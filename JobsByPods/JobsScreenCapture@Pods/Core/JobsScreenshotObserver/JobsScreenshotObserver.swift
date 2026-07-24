//
//  JobsScreenshotObserver.swift
//  JobsScreenCapture
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#if os(iOS) || os(tvOS)
import UIKit
#endif

public final class JobsScreenshotObserver {
    private var screenshotToken: NSObjectProtocol?

    public private(set) var isObserving = false

    public init() {}

    deinit {
        stop()
    }

    @discardableResult
    public func start(_ onScreenshot: @escaping () -> Void) -> Self {
        stop()
        screenshotToken = NotificationCenter.default.addObserver(
            forName: UIApplication.userDidTakeScreenshotNotification,
            object: nil,
            queue: .main
        ) { _ in
            onScreenshot()
        }
        isObserving = true
        return self
    }

    @discardableResult
    public func stop() -> Self {
        if let screenshotToken {
            NotificationCenter.default.removeObserver(screenshotToken)
        }
        screenshotToken = nil
        isObserving = false
        return self
    }
}
