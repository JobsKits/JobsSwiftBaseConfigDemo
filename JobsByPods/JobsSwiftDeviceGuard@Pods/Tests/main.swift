//
//  main.swift
//  JobsSwiftDeviceGuardRegression
//
//  Created by Jobs on 2026年10月27日，星期二.
//

import Foundation
import Darwin

enum JobsSwiftDeviceGuardRegression {

    static func main() throws {
        let detectedFile = JobsDeviceGuardCheck(category: .fileSystem,
                                                state: .detected,
                                                evidence: ["a", "b"])
        let detectedRuntime = JobsDeviceGuardCheck(category: .runtime,
                                                   state: .detected,
                                                   evidence: ["image"])
        let detectedSandbox = JobsDeviceGuardCheck(category: .sandbox,
                                                   state: .detected,
                                                   evidence: ["directory"])
        let passed = JobsDeviceGuardCheck(category: .runtime,
                                          state: .passed)
        let unavailable = JobsDeviceGuardCheck(category: .fileSystem,
                                               state: .unavailable)
        let skipped = JobsDeviceGuardCheck(category: .sandbox,
                                           state: .skipped)
        func report(_ checks: [JobsDeviceGuardCheck],
                    threshold: Int = 2,
                    supported: Bool = true) -> JobsDeviceGuardReport {
            JobsDeviceGuardReport(platform: "test",
                                  supported: supported,
                                  checks: checks,
                                  minimumDetectedCategories: threshold)
        }

        precondition(report([detectedFile, detectedFile, passed]).verdict == .suspicious)
        precondition(report([detectedFile, detectedRuntime]).verdict == .jailbroken)
        precondition(report([detectedFile, detectedRuntime],
                            threshold: 3).verdict == .suspicious)
        precondition(report([detectedFile, detectedRuntime, detectedSandbox],
                            threshold: 99).verdict == .jailbroken)
        precondition(report([detectedFile],
                            threshold: 0).minimumDetectedCategories == 2)
        precondition(report([unavailable, passed]).verdict == .indeterminate)
        precondition(report([skipped]).verdict == .indeterminate)
        precondition(report([]).verdict == .indeterminate)
        precondition(report([passed, skipped]).verdict == .noIndicators)
        precondition(!report([passed]).shouldRestrict)
        precondition(report([unavailable]).shouldRestrict)
        precondition(report([detectedFile]).shouldRestrict)
        precondition(report([passed],
                            supported: false).verdict == .unsupported)
        precondition(report([passed],
                            supported: false).shouldRestrict)

        let imageHit = JobsDeviceGuard.checkLoadedImages(["FridaGadget.dylib"],
                                                         images: ["/sandbox/FRIDAGADGET.DYLIB"])
        precondition(imageHit.state == .detected)
        let imageMiss = JobsDeviceGuard.checkLoadedImages(["FridaGadget.dylib"],
                                                          images: ["/cydia/business/MyFridaGadget.dylib"])
        precondition(imageMiss.state == .passed)
        precondition(JobsDeviceGuard.checkLoadedImages([],
                                                       images: []).state == .skipped)
        precondition(JobsDeviceGuard.checkFeaturePaths([]).state == .skipped)
        precondition(JobsDeviceGuard.checkFeaturePaths(["relative", "/bad\0path"]).state == .unavailable)

        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("JobsDeviceGuardRegression-" + UUID().uuidString)
        try FileManager.default.createDirectory(at: directory,
                                                withIntermediateDirectories: true)
        defer {
            try? FileManager.default.removeItem(at: directory)
        }
        let fixture = directory.appendingPathComponent("fixture")
        try Data("keep".utf8).write(to: fixture)
        precondition(JobsDeviceGuard.checkFeaturePaths([fixture.path]).state == .detected)
        precondition(JobsDeviceGuard.checkFeaturePaths([directory.appendingPathComponent("missing").path]).state == .passed)
        let before = try FileManager.default.contentsOfDirectory(atPath: directory.path)
        let write = JobsDeviceGuard.checkSandboxWrites([directory.path])
        precondition(write.state == .detected && write.diagnostics.isEmpty)
        let after = try FileManager.default.contentsOfDirectory(atPath: directory.path)
        let fixtureContents = try String(contentsOf: fixture,
                                         encoding: .utf8)
        precondition(after == before)
        precondition(fixtureContents == "keep")
        precondition(JobsDeviceGuard.checkSandboxWrites([directory.appendingPathComponent("missing").path]).state == .unavailable)
        precondition(JobsDeviceGuard.checkSandboxWrites([]).state == .skipped)
        precondition(JobsDeviceGuard.checkLoadedImages(["", "/bad/path"],
                                                       images: []).state == .unavailable)
        let deniedOperations = JobsDeviceGuardFileOperations(openExclusive: { _ in
            -1
        },
                                                             closeDescriptor: { _ in
            preconditionFailure("创建失败不得关闭文件。")
        },
                                                             removePath: { _ in
            preconditionFailure("创建失败不得删除文件。")
        },
                                                             errorCode: {
            EPERM
        })
        precondition(JobsDeviceGuard.checkSandboxWrites(["/private"],
                                                        operations: deniedOperations).state == .passed)
        var collisionOperations = deniedOperations
        collisionOperations.errorCode = {
            EEXIST
        }
        precondition(JobsDeviceGuard.checkSandboxWrites(["/private"],
                                                        operations: collisionOperations).state == .unavailable)
        let cleanupFailureOperations = JobsDeviceGuardFileOperations(openExclusive: { _ in
            42
        },
                                                                     closeDescriptor: { descriptor in
            precondition(descriptor == 42)
            return -1
        },
                                                                     removePath: { path in
            precondition(path.hasPrefix("/private/.jobs-device-guard-"))
            return -1
        },
                                                                     errorCode: {
            EIO
        })
        let cleanupFailure = JobsDeviceGuard.checkSandboxWrites(["/private"],
                                                                operations: cleanupFailureOperations)
        precondition(cleanupFailure.state == .detected && cleanupFailure.diagnostics.count == 2)
        precondition(report([cleanupFailure]).verdict == .suspicious)
        precondition(report([cleanupFailure]).hasUnavailableChecks)

        let original = JobsDeviceGuardConfiguration()
        let modified = original
            .bySandboxWriteProbe(true)
            .byFeaturePaths([])
        precondition(!original.enablesSandboxWriteProbe && !original.featurePaths.isEmpty)
        precondition(modified.enablesSandboxWriteProbe && modified.featurePaths.isEmpty)
        #if os(macOS)
        precondition(JobsDeviceGuard.inspect().verdict == .unsupported)
        #endif
        let completionState = CompletionState()
        JobsDeviceGuard.inspectAsync { _ in
            precondition(Thread.isMainThread)
            completionState.finished = true
        }
        let deadline = Date().addingTimeInterval(5)
        while !completionState.finished && Date() < deadline {
            RunLoop.current.run(until: Date().addingTimeInterval(0.01))
        }
        precondition(completionState.finished)
        print("JobsSwiftDeviceGuard: policy/probe/cleanup/async assertions passed")
    }
}

private final class CompletionState: @unchecked Sendable {

    var finished = false
}

try JobsSwiftDeviceGuardRegression.main()
