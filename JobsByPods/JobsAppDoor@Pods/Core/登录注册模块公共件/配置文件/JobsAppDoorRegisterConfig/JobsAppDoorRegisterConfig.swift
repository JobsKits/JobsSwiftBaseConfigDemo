//
//  JobsAppDoorRegisterConfig.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import Foundation

public struct JobsAppDoorRegisterConfig {
    public var showsMobileBinding: Bool
    public var showsGraphicCaptcha: Bool
    public var graphicCaptchaConfig: JobsAppDoorGraphicCaptchaConfig

    public init(
        showsMobileBinding: Bool = false,
        showsGraphicCaptcha: Bool = false,
        graphicCaptchaConfig: JobsAppDoorGraphicCaptchaConfig = .defaultConfig
    ) {
        self.showsMobileBinding = showsMobileBinding
        self.showsGraphicCaptcha = showsGraphicCaptcha
        self.graphicCaptchaConfig = graphicCaptchaConfig
    }

    public static var basicConfig: Self { Self() }
    public static var fullConfig: Self {
        Self(
            showsMobileBinding: true,
            showsGraphicCaptcha: true,
            graphicCaptchaConfig: .allCharactersConfig
        )
    }
}
