//
//  JobsAppDoorConfig.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import CoreGraphics
import Foundation
import UIKit

public enum JobsAppDoorBackgroundType: Equatable {
    case image
    case video
}

public struct JobsAppDoorConfig {
    public var backgroundType: JobsAppDoorBackgroundType
    public var registerConfig: JobsAppDoorRegisterConfig
    public var backgroundImageName: String
    public var notchVideoResourceName: String
    public var compactVideoResourceName: String
    public var videoMuted: Bool
    public var verificationCodeDuration: Int

    public init(
        backgroundType: JobsAppDoorBackgroundType = .image,
        registerConfig: JobsAppDoorRegisterConfig = .basicConfig,
        backgroundImageName: String = "bg_video",
        notchVideoResourceName: String = "iph_X.mp4",
        compactVideoResourceName: String = "非iph_X.mp4",
        videoMuted: Bool = false,
        verificationCodeDuration: Int = 60
    ) {
        self.backgroundType = backgroundType
        self.registerConfig = registerConfig
        self.backgroundImageName = backgroundImageName
        self.notchVideoResourceName = notchVideoResourceName
        self.compactVideoResourceName = compactVideoResourceName
        self.videoMuted = videoMuted
        self.verificationCodeDuration = max(1, verificationCodeDuration)
    }

    public static var defaultConfig: Self { Self() }
    public static var fullConfig: Self {
        Self(
            backgroundType: .video,
            registerConfig: .fullConfig
        )
    }

    public var registerFieldCount: Int {
        3 + (registerConfig.showsMobileBinding ? 2 : 0) + (registerConfig.showsGraphicCaptcha ? 1 : 0)
    }

    public var registerContentHeight: CGFloat {
        let fieldsHeight = CGFloat(registerFieldCount) * 50
        let spacingHeight = CGFloat(max(0, registerFieldCount - 1)) * 12
        return max(394, 166 + fieldsHeight + spacingHeight)
    }

    // TODO: Compatibility properties have no view context. Multi-scene callers use contentLayout(in:).
    @available(*, deprecated, message: "Use contentLayout(in:) with the caller view bounds.")
    public var registerContentY: CGFloat {
        return max(80, contentLayout(in: UIScreen.main.bounds).registerY)
    }
    @available(*, deprecated, message: "Use contentLayout(in:) with the caller view bounds.")
    public var loginContentHeight: CGFloat {
        return contentLayout(in: UIScreen.main.bounds).loginHeight
    }
    @available(*, deprecated, message: "Use contentLayout(in:) with the caller view bounds.")
    public var loginContentY: CGFloat {
        return contentLayout(in: UIScreen.main.bounds).loginY
    }
    @available(*, deprecated, message: "Use contentLayout(in:) with the caller view bounds.")
    public var forgotPasswordContentHeight: CGFloat {
        return contentLayout(in: UIScreen.main.bounds).forgotHeight
    }
    @available(*, deprecated, message: "Use contentLayout(in:) with the caller view bounds.")
    public var forgotPasswordContentY: CGFloat {
        return contentLayout(in: UIScreen.main.bounds).forgotY
    }

    public func contentLayout(in bounds: CGRect) -> (registerY: CGFloat,
                                                    loginHeight: CGFloat,
                                                    loginY: CGFloat,
                                                    forgotHeight: CGFloat,
                                                    forgotY: CGFloat) {
        let height = max(0, bounds.height)
        let tall = height / max(bounds.width, 1) > 2
        return (
            registerY: max(0, (height - registerContentHeight) / 2),
            loginHeight: height / (tall ? 2.3 : 2),
            loginY: height / (tall ? 4 : 5),
            forgotHeight: height / (tall ? 1.6 : 1.3),
            forgotY: height / 4
        )
    }
}
