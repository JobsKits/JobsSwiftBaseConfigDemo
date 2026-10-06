//
//  JobsObservable+Combine.swift
//  JobsSwiftWorker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation

public extension JobsObservable {
    static func combineLatest<A, B>(_ lhs: JobsObservable<A>,
                                    _ rhs: JobsObservable<B>,
                                    name: String? = nil) -> JobsObservable<(A, B)> where A: Sendable, B: Sendable, Value == (A, B) {
        let combined = JobsObservable<(A, B)>((lhs.currentValue, rhs.currentValue), name: name)
        let leftToken = lhs.observe { [weak combined, weak rhs] change in
            guard let rhs else {
                return
            }
            combined?.accept((change.newValue, rhs.currentValue))
        }
        let rightToken = rhs.observe { [weak combined, weak lhs] change in
            guard let lhs else {
                return
            }
            combined?.accept((lhs.currentValue, change.newValue))
        }
        combined.retainUpstream {
            lhs.removeObserver(leftToken)
            rhs.removeObserver(rightToken)
        }
        return combined
    }
}
