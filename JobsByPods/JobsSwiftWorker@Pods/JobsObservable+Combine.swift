//
//  JobsObservable+Combine.swift
//  JobsSwiftWorker
//
//  Created by OpenAI on 2026/3/26.
//

import Foundation

public extension JobsObservable {
    static func combineLatest<A, B>(_ lhs: JobsObservable<A>,
                                    _ rhs: JobsObservable<B>,
                                    name: String? = nil) -> JobsObservable<(A, B)> where A: Sendable, B: Sendable, Value == (A, B) {
        let combined = JobsObservable<(A, B)>((lhs.currentValue, rhs.currentValue), name: name)
        _ = lhs.observe { change in
            combined.accept((change.newValue, rhs.currentValue))
        }
        _ = rhs.observe { change in
            combined.accept((lhs.currentValue, change.newValue))
        }
        return combined
    }
}
