//
//  JobsByPDFKitStabilityTests.swift
//  JobsByPDFKit
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import PDFKit
import XCTest
import JobsByPDFKit

final class JobsByPDFKitStabilityTests: XCTestCase {

    @MainActor
    func testBridgeExportsPDFDisplayDSLWithoutLoadingADocument() {
        let view = PDFView.jobsMake { _ in }
        let configured = view
            .byDisplayMode(.singlePage)
            .byDisplayDirection(.horizontal)
            .byDisplaysPageBreaks(false)

        XCTAssertTrue(configured === view)
        XCTAssertEqual(view.displayMode, .singlePage)
        XCTAssertEqual(view.displayDirection, .horizontal)
        XCTAssertFalse(view.displaysPageBreaks)
        XCTAssertNil(view.document)
    }
}
