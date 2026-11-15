//
//  JobsPatchStabilityTests.swift
//  JobsSwiftPatch
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import Foundation
import XCTest

import JobsSwiftPatch

final class JobsPatchStabilityTests: XCTestCase {

    private class PayloadBase: NSObject {

        @objc dynamic func payload() -> NSDictionary {
            return ["kind": "base"]
        }

        @objc dynamic func integer() -> Int {
            return 3
        }
    }

    private final class PayloadChild: PayloadBase {}
    private final class PayloadSibling: PayloadBase {}

    func testPatchSnapshotsPayloadAndKeepsInheritedMethodIsolated() {
        let manager = JobsSwiftPatchMgr.shared
        let identifier = "snapshot.\(UUID().uuidString)"
        defer {
            manager.rollbackPatch(identifier: identifier)
        }
        let mutable: NSMutableDictionary = ["value": "before"]
        let patch = JobsSwiftPatchModel(identifier: identifier,
                                         targetClass: PayloadChild.self,
                                         selector: #selector(PayloadBase.payload),
                                         payload: ["nested": mutable])
        XCTAssertTrue(manager.installPayloadPatch(patch))
        mutable["value"] = "after"
        XCTAssertEqual((PayloadChild().payload()["nested"] as? NSDictionary)?["value"] as? String, "before")
        XCTAssertEqual(PayloadBase().payload()["kind"] as? String, "base")
        XCTAssertEqual(PayloadSibling().payload()["kind"] as? String, "base")
        XCTAssertTrue(manager.rollbackPatch(identifier: identifier))
        XCTAssertEqual(PayloadChild().payload()["kind"] as? String, "base")
    }

    func testReplacingPatchRejectsStaleRollbackAndRestoresOriginal() {
        let manager = JobsSwiftPatchMgr.shared
        let first = "first.\(UUID().uuidString)"
        let second = "second.\(UUID().uuidString)"
        defer {
            manager.rollbackPatch(identifier: first)
            manager.rollbackPatch(identifier: second)
        }
        for (identifier, kind) in [(first, "one"), (second, "two")] {
            XCTAssertTrue(manager.installPayloadPatch(.init(identifier: identifier,
                                                             targetClass: PayloadChild.self,
                                                             selector: #selector(PayloadBase.payload),
                                                             payload: ["kind": kind])))
        }
        XCTAssertFalse(manager.containsPatch(identifier: first))
        XCTAssertFalse(manager.rollbackPatch(identifier: first))
        XCTAssertEqual(PayloadChild().payload()["kind"] as? String, "two")
        XCTAssertTrue(manager.rollbackPatch(identifier: second))
        XCTAssertEqual(PayloadChild().payload()["kind"] as? String, "base")
    }

    func testScalarReturnAndEmptyIdentifierAreRejected() {
        let manager = JobsSwiftPatchMgr.shared
        let identifier = "invalid.\(UUID().uuidString)"
        XCTAssertFalse(manager.installPayloadPatch(.init(identifier: identifier,
                                                          targetClass: PayloadChild.self,
                                                          selector: #selector(PayloadBase.integer),
                                                          payload: [:])))
        XCTAssertFalse(manager.installPayloadPatch(.init(identifier: "",
                                                          targetClass: PayloadChild.self,
                                                          selector: #selector(PayloadBase.payload),
                                                          payload: [:])))
        XCTAssertFalse(manager.containsPatch(identifier: identifier))
        XCTAssertEqual(PayloadChild().integer(), 3)
    }
}
