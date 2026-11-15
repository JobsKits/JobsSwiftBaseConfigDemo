//
//  JobsImageToolsStabilityTests.swift
//  JobsImageTools
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsImageTools

final class JobsImageToolsStabilityTests: XCTestCase {

    func testImageSourceRejectsBlankInputAndClassifiesTrimmedSources() {
        XCTAssertNil(JobsImageSource(nil))
        XCTAssertNil(JobsImageSource(" \n\t"))
        guard let remoteSource = JobsImageSource(" https://example.com/image.png\n"),
              case .remote(let url) = remoteSource else {
            XCTFail("HTTP 图片必须解析为远程来源")
            return
        }
        XCTAssertEqual(url.absoluteString, "https://example.com/image.png")
        guard let localSource = JobsImageSource(" local-logo "),
              case .local(let name) = localSource else {
            XCTFail("资源名必须解析为本地来源")
            return
        }
        XCTAssertEqual(name, "local-logo")
    }

    func testImageLoadTokenCancellationIsIdempotent() {
        var calls = 0
        let token = JobsImageLoadToken { calls += 1 }
        token.cancel()
        token.cancel()

        XCTAssertEqual(calls, 1)
    }
}
