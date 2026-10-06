//
//  JobsBlockStorageRegression.swift
//  JobsPodsUpgradeCoreRegression
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation
import JobsSwiftBlock

private final class ObjectHost: NSObject, JobsCallbackable {}
private final class SwiftHost: JobsCallbackable {}

private final class ReleaseRecorder {
    var releases = 0
    var reentries = 0
}

private final class CallbackCapture {
    weak var host: (any JobsCallbackable)?
    let expectedReplacement: Int?
    let recorder: ReleaseRecorder

    init(host: any JobsCallbackable, expectedReplacement: Int?, recorder: ReleaseRecorder) {
        self.host = host
        self.expectedReplacement = expectedReplacement
        self.recorder = recorder
    }

    deinit {
        guard let host else {
            preconditionFailure("Host must outlive replacement and removal")
        }
        let replacement: (() -> Int)? = host.jobs_callback("outer")
        precondition(replacement?() == expectedReplacement)
        host.jobsBy("nested", { [recorder] in recorder.reentries += 1 })
        host.jobsCall("nested")
        host.jobsBy("nested", Optional<() -> Void>.none)
        recorder.releases += 1
    }
}

private final class WeakCapture {
    weak var value: CallbackCapture?

    init(_ value: CallbackCapture) {
        self.value = value
    }
}

@main
private enum JobsBlockStorageRegression {
    static func main() {
        verifyRelease(on: ObjectHost(), replacement: nil)
        verifyRelease(on: ObjectHost(), replacement: 101)
        verifyRelease(on: SwiftHost(), replacement: nil)
        verifyRelease(on: SwiftHost(), replacement: 101)
        print("JobsSwiftBlock capture deinit reentry checks passed (removal / replacement, NSObject / Swift)")
    }

    private static func installCapture<Host: JobsCallbackable>(
        on host: Host, replacement: Int?, recorder: ReleaseRecorder
    ) -> WeakCapture {
        let owner = CallbackCapture(host: host, expectedReplacement: replacement, recorder: recorder)
        host.jobsBy("outer", { [owner] in withExtendedLifetime(owner) {} })
        return WeakCapture(owner)
    }

    private static func verifyRelease<Host: JobsCallbackable>(on host: Host, replacement: Int?) {
        let recorder = ReleaseRecorder()
        let capture = installCapture(on: host, replacement: replacement, recorder: recorder)
        precondition(capture.value != nil)
        if let replacement {
            host.jobsBy("outer", { replacement })
        } else {
            host.jobsBy("outer", Optional<() -> Void>.none)
        }
        precondition(capture.value == nil)
        precondition(recorder.releases == 1)
        precondition(recorder.reentries == 1)
        let value: (() -> Int)? = host.jobs_callback("outer")
        precondition(value?() == replacement)
    }
}
