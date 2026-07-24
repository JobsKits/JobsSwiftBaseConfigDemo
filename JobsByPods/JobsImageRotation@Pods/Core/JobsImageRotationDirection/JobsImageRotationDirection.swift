//
//  JobsImageRotationDirection.swift
//  JobsImageRotation
//
//  Created by Jobs on 2026年7月24日，星期五.
//

import CoreGraphics

public enum JobsImageRotationDirection: Sendable {
    case clockwise
    case counterclockwise

    var angularMultiplier: CGFloat {
        self == .clockwise ? 1 : -1
    }
}
