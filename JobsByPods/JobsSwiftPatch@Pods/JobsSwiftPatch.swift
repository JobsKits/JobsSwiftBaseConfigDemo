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

    private struct SlotKey: Hashable {
        let target: ObjectIdentifier
        let selector: String
    }

    /// 每个 Class+SEL 只有一个永久 trampoline，回滚时在途调用仍然有效。
    private final class Slot {
        let targetClass: AnyClass
        let selector: Selector
        let originalIMP: IMP
        var patchIMP: IMP!
        var identifier: String?
        private let lock = NSLock()
        private var payload: NSDictionary?

        init(targetClass: AnyClass, selector: Selector, originalIMP: IMP) {
            self.targetClass = targetClass
            self.selector = selector
            self.originalIMP = originalIMP
        }

        func setPayload(_ payload: NSDictionary?) {
            lock.lock()
            self.payload = payload
            lock.unlock()
        }

        func invoke(_ receiver: AnyObject) -> AnyObject? {
            lock.lock()
            let value = payload
            lock.unlock()
            if let value {
                return value
            }
            typealias Original = @convention(c) (AnyObject, Selector) -> Unmanaged<AnyObject>?
            let original = unsafeBitCast(originalIMP, to: Original.self)
            return original(receiver, selector)?.takeUnretainedValue()
        }
    }

    private var slots: [SlotKey: Slot] = [:]
    private var identifiers: [String: SlotKey] = [:]
    private let lock = NSLock()

    private init() {}

    /// 只接受无业务参数、返回对象的实例方法；拒绝 ARC retained-return 方法族。
    @discardableResult
    public func installPayloadPatch(_ patch: JobsSwiftPatchModel) -> Bool {
        guard !patch.identifier.isEmpty, let payload = Self.snapshot(patch.payload) as? NSDictionary else {
            return false
        }
        lock.lock()
        defer {
            lock.unlock()
        }
        guard let inheritedMethod = class_getInstanceMethod(patch.targetClass, patch.selector),
              Self.acceptsPayloadMethod(inheritedMethod, selector: patch.selector),
              let encoding = method_getTypeEncoding(inheritedMethod) else {
            return false
        }
        let key = SlotKey(target: ObjectIdentifier(patch.targetClass), selector: NSStringFromSelector(patch.selector))
        let slot: Slot
        if let existing = slots[key] {
            let current = method_getImplementation(inheritedMethod)
            guard current == existing.patchIMP || current == existing.originalIMP else {
                return false
            }
            slot = existing
        } else {
            let original = method_getImplementation(inheritedMethod)
            // class_getInstanceMethod 会搜索父类；先创建本类 override，禁止修改继承 Method。
            _ = class_addMethod(patch.targetClass, patch.selector, original, encoding)
            slot = Slot(targetClass: patch.targetClass, selector: patch.selector, originalIMP: original)
            let block: @convention(block) (AnyObject) -> AnyObject? = { receiver in
                slot.invoke(receiver)
            }
            slot.patchIMP = imp_implementationWithBlock(block as Any)
            slots[key] = slot
        }
        guard let localMethod = class_getInstanceMethod(patch.targetClass, patch.selector) else {
            return false
        }
        if let previousKey = identifiers[patch.identifier], previousKey != key {
            guard rollbackLocked(identifier: patch.identifier) else {
                return false
            }
        }
        if let replaced = slot.identifier {
            identifiers.removeValue(forKey: replaced)
        }
        slot.setPayload(payload)
        slot.identifier = patch.identifier
        identifiers[patch.identifier] = key
        method_setImplementation(localMethod, slot.patchIMP)
        return true
    }

    @discardableResult
    public func rollbackPatch(identifier: String) -> Bool {
        lock.lock()
        defer {
            lock.unlock()
        }
        return rollbackLocked(identifier: identifier)
    }

    private func rollbackLocked(identifier: String) -> Bool {
        guard let key = identifiers[identifier], let slot = slots[key],
              slot.identifier == identifier,
              let method = class_getInstanceMethod(slot.targetClass, slot.selector),
              method_getImplementation(method) == slot.patchIMP else {
            return false
        }
        method_setImplementation(method, slot.originalIMP)
        slot.setPayload(nil)
        slot.identifier = nil
        identifiers.removeValue(forKey: identifier)
        return true
    }

    public func rollbackAllPatches() {
        lock.lock()
        defer {
            lock.unlock()
        }
        for identifier in Array(identifiers.keys) {
            _ = rollbackLocked(identifier: identifier)
        }
    }

    public func containsPatch(identifier: String) -> Bool {
        lock.lock()
        defer {
            lock.unlock()
        }
        return identifiers[identifier] != nil
    }

    /// 深拷贝支持的 Foundation 值，拒绝自定义可变对象和过深/循环容器。
    private static func snapshot(_ object: Any, depth: Int = 0) -> Any? {
        guard depth <= 64 else {
            return nil
        }
        if let dictionary = object as? NSDictionary {
            var result: [String: Any] = [:]
            for (key, value) in dictionary {
                guard let key = key as? String, let copy = snapshot(value, depth: depth + 1) else {
                    return nil
                }
                result[key] = copy
            }
            return result as NSDictionary
        }
        if let array = object as? NSArray {
            var result: [Any] = []
            for value in array {
                guard let copy = snapshot(value, depth: depth + 1) else {
                    return nil
                }
                result.append(copy)
            }
            return result as NSArray
        }
        if let string = object as? String {
            return String(string)
        }
        if let number = object as? NSNumber, number.doubleValue.isFinite {
            return number.copy()
        }
        if object is NSNull {
            return NSNull()
        }
        if let data = object as? NSData {
            return Data(bytes: data.bytes, count: data.length) as NSData
        }
        if let date = object as? NSDate, date.timeIntervalSince1970.isFinite {
            return Date(timeIntervalSince1970: date.timeIntervalSince1970) as NSDate
        }
        return nil
    }

    private static func acceptsPayloadMethod(_ method: Method, selector: Selector) -> Bool {
        guard method_getNumberOfArguments(method) == 2 else {
            return false
        }
        let returnType = method_copyReturnType(method)
        defer {
            free(returnType)
        }
        let encoding = String(cString: returnType)
        guard encoding == "@" || encoding.hasPrefix("@\"NSDictionary") else {
            return false
        }
        let name = NSStringFromSelector(selector).drop(while: { $0 == "_" })
        for family in ["alloc", "new", "copy", "mutableCopy", "init"] {
            guard name.hasPrefix(family) else {
                continue
            }
            let suffix = name.dropFirst(family.count)
            if suffix.isEmpty || suffix.first?.isLowercase == false {
                return false
            }
        }
        return true
    }
}
