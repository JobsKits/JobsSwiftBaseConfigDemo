//
//  JobsAppDoorFormValues.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import Foundation

public struct JobsAppDoorFormValues {
    public var username: String
    public var password: String
    public var confirmPassword: String
    public var countryCode: String
    public var phone: String
    public var smsCode: String
    public var graphicCaptcha: String
    public var remembersPassword: Bool

    public init(
        username: String = "",
        password: String = "",
        confirmPassword: String = "",
        countryCode: String = "+86",
        phone: String = "",
        smsCode: String = "",
        graphicCaptcha: String = "",
        remembersPassword: Bool = true
    ) {
        self.username = username
        self.password = password
        self.confirmPassword = confirmPassword
        self.countryCode = countryCode
        self.phone = phone
        self.smsCode = smsCode
        self.graphicCaptcha = graphicCaptcha
        self.remembersPassword = remembersPassword
    }
}
