//
//  JobsPatchRegression.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

private class PatchBase: NSObject {
    @objc dynamic func payload() -> NSDictionary { ["kind": "base"] }
    @objc dynamic func count() -> Int { 3 }
    @objc dynamic func payload(_ argument: String) -> NSDictionary { ["arg": argument] }
}
private final class PatchChild: PatchBase {}
private final class PatchSibling: PatchBase {}

@main
struct JobsPatchRegression {
    static func main() {
        let manager = JobsSwiftPatchMgr.shared
        let selector = #selector(PatchBase.payload as (PatchBase) -> () -> NSDictionary)
        nonisolated func patch(_ id: String, _ kind: String) -> JobsSwiftPatchModel {
            JobsSwiftPatchModel(
                identifier: id, targetClass: PatchChild.self, selector: selector, payload: ["kind": kind])
        }
        precondition(manager.installPayloadPatch(patch("first", "one")))
        precondition(PatchBase().payload()["kind"] as? String == "base")
        precondition(PatchSibling().payload()["kind"] as? String == "base")
        precondition(PatchChild().payload()["kind"] as? String == "one")
        precondition(manager.installPayloadPatch(patch("second", "two")))
        precondition(!manager.rollbackPatch(identifier: "first"))
        precondition(PatchChild().payload()["kind"] as? String == "two")
        precondition(manager.rollbackPatch(identifier: "second"))
        precondition(PatchChild().payload()["kind"] as? String == "base")
        precondition(
            !manager.installPayloadPatch(
                JobsSwiftPatchModel(
                    identifier: "bad", targetClass: PatchChild.self, selector: #selector(PatchBase.count), payload: [:])
            ))
        precondition(
            !manager.installPayloadPatch(
                JobsSwiftPatchModel(
                    identifier: "arg", targetClass: PatchChild.self, selector: NSSelectorFromString("payload:"),
                    payload: [:])))
        let mutable = NSMutableDictionary(dictionary: ["value": "snapshot"])
        precondition(
            manager.installPayloadPatch(
                JobsSwiftPatchModel(
                    identifier: "snapshot", targetClass: PatchChild.self, selector: selector,
                    payload: ["nested": mutable])))
        mutable["value"] = "changed-after-install"
        precondition((PatchChild().payload()["nested"] as? NSDictionary)?["value"] as? String == "snapshot")
        precondition(manager.rollbackPatch(identifier: "snapshot"))
        precondition(
            !manager.installPayloadPatch(
                JobsSwiftPatchModel(
                    identifier: "custom", targetClass: PatchChild.self, selector: selector,
                    payload: ["object": NSObject()])))
        DispatchQueue.concurrentPerform(iterations: 500) { index in
            let id = "concurrent.\(index)"
            _ = manager.installPayloadPatch(patch(id, "changed"))
            let kind = PatchChild().payload()["kind"] as? String
            precondition(kind == "changed" || kind == "base")
            _ = manager.rollbackPatch(identifier: id)
        }
        manager.rollbackAllPatches()
        precondition(PatchChild().payload()["kind"] as? String == "base")
        print("Jobs Patch inheritance/ABI/replacement/concurrent rollback regression checks passed")
    }
}
