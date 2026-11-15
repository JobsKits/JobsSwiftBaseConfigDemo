//
//  JobsAppDoorStabilityTests.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsAppDoor

final class JobsAppDoorStabilityTests: XCTestCase {

    func testFormValueCopiesPreserveOriginalCredentialsAndChallenge() {
        let original = JobsAppDoorFormValues(username: "Jobs",
                                             password: "secret",
                                             graphicCaptchaChallengeID: "challenge-A")
        var edited = original
        edited.username = "Edited"
        edited.graphicCaptchaChallengeID = nil

        XCTAssertEqual(original.username, "Jobs")
        XCTAssertEqual(original.password, "secret")
        XCTAssertEqual(original.graphicCaptchaChallengeID, "challenge-A")
        XCTAssertEqual(edited.countryCode, "+86")
        XCTAssertTrue(edited.remembersPassword)
    }

    @MainActor
    func testFullRegistrationEnablesBothAdditionalFields() {
        let basic = JobsAppDoorRegisterConfig.basicConfig
        let full = JobsAppDoorRegisterConfig.fullConfig

        XCTAssertFalse(basic.showsMobileBinding)
        XCTAssertFalse(basic.showsGraphicCaptcha)
        XCTAssertTrue(full.showsMobileBinding)
        XCTAssertTrue(full.showsGraphicCaptcha)
    }
}
