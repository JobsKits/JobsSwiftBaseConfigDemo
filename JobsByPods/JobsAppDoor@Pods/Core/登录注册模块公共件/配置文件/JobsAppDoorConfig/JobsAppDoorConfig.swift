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

    public var registerContentY: CGFloat {
        max(80, (UIScreen.main.bounds.height - registerContentHeight) / 2)
    }

    public var loginContentHeight: CGFloat {
        let screen = UIScreen.main.bounds
        let usesNotchLayout = screen.height / max(screen.width, 1) > 2
        return screen.height / (usesNotchLayout ? 2.3 : 2)
    }

    public var loginContentY: CGFloat {
        let screen = UIScreen.main.bounds
        let usesNotchLayout = screen.height / max(screen.width, 1) > 2
        return screen.height / (usesNotchLayout ? 4 : 5)
    }

    public var forgotPasswordContentHeight: CGFloat {
        let screen = UIScreen.main.bounds
        let usesNotchLayout = screen.height / max(screen.width, 1) > 2
        return screen.height / (usesNotchLayout ? 1.6 : 1.3)
    }

    public var forgotPasswordContentY: CGFloat {
        UIScreen.main.bounds.height / 4
    }
}
