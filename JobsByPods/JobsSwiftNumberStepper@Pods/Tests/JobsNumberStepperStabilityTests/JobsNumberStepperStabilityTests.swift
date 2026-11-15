//
//  JobsNumberStepperStabilityTests.swift
//  JobsSwiftNumberStepper
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsSwiftNumberStepper

final class JobsNumberStepperStabilityTests: XCTestCase {

    @MainActor
    func testReversedBoundsAndInvalidStepNormalizeBeforeClamping() {
        let stepper = JobsSwiftNumberStepper(frame: .zero)
            .configure(value: 100,
                       minimumValue: 8,
                       maximumValue: 4,
                       stepValue: 0)
        XCTAssertEqual(stepper.minimumValue, 4)
        XCTAssertEqual(stepper.maximumValue, 8)
        XCTAssertEqual(stepper.stepValue, 1)
        XCTAssertEqual(stepper.value, 8)
        XCTAssertFalse(stepper.increaseButton.isEnabled)
        stepper.setValue(-100)
        XCTAssertEqual(stepper.value, 4)
        XCTAssertFalse(stepper.decreaseButton.isEnabled)
        XCTAssertEqual(stepper.textField.text, "4")
    }

    @MainActor
    func testRemovingBoundsRestoresUnboundedValues() {
        let stepper = JobsSwiftNumberStepper(frame: .zero)
            .configure(value: 5, minimumValue: 0, maximumValue: 10)
        stepper.setBounds(minimumValue: nil, maximumValue: nil)
        stepper.setValue(-25)
        XCTAssertEqual(stepper.value, -25)
        XCTAssertEqual(stepper.textField.text, "-25")
        XCTAssertTrue(stepper.decreaseButton.isEnabled)
        XCTAssertTrue(stepper.increaseButton.isEnabled)
    }
}
