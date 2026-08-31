//
//  JobsSwiftBlockRegression.swift
//  JobsSwiftBlockRegression
//
//  Created by Jobs on 2026年8月31日，星期一.
//

import Foundation
import JobsSwiftBlock

private class JobsFactoryProbe: NSObject, JobsCallbackable {
    var value = 0
}

private final class JobsFactoryChildProbe: JobsFactoryProbe {}

private final class JobsPureSwiftCallbackProbe: JobsCallbackable {}

@main
private enum JobsSwiftBlockRegression {
    static func main() {
        verifyFactoryTypesAndConfiguration()
        verifyGenericAndDynamicMetatypes()
        verifyCallbacks()
        verifyPureSwiftCallbacks()
        print("JobsSwiftBlock regression checks passed")
    }

    private static func verifyFactoryTypesAndConfiguration() {
        var configurationCount = 0
        var configuredObject: JobsFactoryChildProbe?
        let object: JobsFactoryChildProbe = JobsFactoryChildProbe.jobsMake {
            configurationCount += 1
            $0.value = 42
            configuredObject = $0
        }
        precondition(configurationCount == 1)
        precondition(object === configuredObject)
        precondition(object.value == 42)

        let other = JobsFactoryChildProbe.jobsMake { _ in }
        precondition(object !== other)

        let dictionary: NSMutableDictionary = NSMutableDictionary.jobsMake {
            $0["value"] = 42
        }
        precondition(dictionary["value"] as? Int == 42)

        let array: NSMutableArray = NSMutableArray.jobsMake { $0.add(42) }
        precondition(array.firstObject as? Int == 42)
    }

    private static func verifyGenericAndDynamicMetatypes() {
        let object: JobsFactoryChildProbe = makeGeneric(JobsFactoryChildProbe.self)
        precondition(object.value == 0)

        let dynamicType: NSObject.Type = JobsFactoryChildProbe.self
        let dynamicObject = dynamicType.jobsMake { object in
            precondition(object is JobsFactoryChildProbe)
        }
        precondition(dynamicObject is JobsFactoryChildProbe)
    }

    private static func makeGeneric<T: NSObject>(_ type: T.Type) -> T {
        type.jobsMake { _ in }
    }

    private static func verifyCallbacks() {
        let first = JobsFactoryChildProbe.jobsMake { _ in }
        let second = JobsFactoryChildProbe.jobsMake { _ in }
        var value = 0
        let returned = first.jobsBy("event", { (input: Int) in value = input })
        precondition(returned === first)
        first.jobsCall("event", 7)
        precondition(value == 7)

        let missing: ((Int) -> Void)? = second.jobs_callback("event")
        precondition(missing == nil)

        first.jobsBy("event", { (input: Int) in value = input * 2 })
        first.jobsCall("event", 7)
        precondition(value == 14)

        first.jobsBy("event", Optional<((Int) -> Void)>.none)
        first.jobsCall("event", 9)
        precondition(value == 14)
        let removed: ((Int) -> Void)? = first.jobs_callback("event")
        precondition(removed == nil)

        first.jobsBy("answer", { 42 })
        let answer: Int? = first.jobsCall("answer")
        precondition(answer == 42)

        first.jobsBy("optional", { Optional<Int>.none })
        let optional: Int? = first.jobsCallOptional("optional")
        precondition(optional == nil)
    }

    private static func verifyPureSwiftCallbacks() {
        let object = JobsPureSwiftCallbackProbe()
        var called = false
        object.jobsBy("event", { called = true })
        object.jobsCall("event")
        precondition(called)
    }
}
