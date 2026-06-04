//
//  BRPickerHaptics.swift
//  BRPickerViewSwift
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

enum BRPickerHaptics {
    static func successIfNeeded(_ enabled: Bool) {
        guard enabled else { return }
        if #available(iOS 10.0, *) {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        }
    }
}
