//
//  JobsSwiftPatch.swift
//  JobsSwiftPatch
//
//  Created by Jobs on 2026年6月25日，星期四.
//

import Foundation
import ObjectiveC

public struct JobsSwiftPatchModel {
    public let identifier: String
    public let targetClass: AnyClass
    public let selector: Selector
    public let payload: NSDictionary

    public init(identifier: String,
                targetClass: AnyClass,
                selector: Selector,
                payload: NSDictionary) {
        self.identifier = identifier
        self.targetClass = targetClass
        self.selector = selector
        self.payload = payload
    }
}

public final class JobsSwiftPatchMgr {

    public static let shared = JobsSwiftPatchMgr()

    private struct PatchRecord {
        let targetClass: AnyClass
        let selector: Selector
        let originalIMP: IMP
        let patchIMP: IMP
    }

    private var records: [String: PatchRecord] = [:]
    private let lock = NSLock()

    private init() {}

    @discardableResult
    public func installPayloadPatch(_ patch: JobsSwiftPatchModel) -> Bool {
        guard !patch.identifier.isEmpty else { return false }
        rollbackPatch(identifier: patch.identifier)
        guard let method = class_getInstanceMethod(patch.targetClass, patch.selector) else { return false }

        let payload = patch.payload.copy() as? NSDictionary ?? NSDictionary()
        let block: @convention(block) (AnyObject) -> NSDictionary = { _ in
            payload
        }
        let patchIMP = imp_implementationWithBlock(block as Any)
        let originalIMP = method_getImplementation(method)
        method_setImplementation(method, patchIMP)

        lock.lock()
        records[patch.identifier] = PatchRecord(targetClass: patch.targetClass,
                                                selector: patch.selector,
                                                originalIMP: originalIMP,
                                                patchIMP: patchIMP)
        lock.unlock()
        return true
    }

    @discardableResult
    public func rollbackPatch(identifier: String) -> Bool {
        guard !identifier.isEmpty else { return false }

        lock.lock()
        let record = records.removeValue(forKey: identifier)
        lock.unlock()

        guard let record else { return false }
        if let method = class_getInstanceMethod(record.targetClass, record.selector) {
            method_setImplementation(method, record.originalIMP)
        }
        imp_removeBlock(record.patchIMP)
        return true
    }

    public func rollbackAllPatches() {
        lock.lock()
        let identifiers = Array(records.keys)
        lock.unlock()

        identifiers.forEach { rollbackPatch(identifier: $0) }
    }

    public func containsPatch(identifier: String) -> Bool {
        lock.lock()
        let contains = records[identifier] != nil
        lock.unlock()
        return contains
    }
}
