//
//  JobsMetalKitStabilityTests.swift
//  JobsSwiftMetalKit
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import Metal
import XCTest

import JobsSwiftBlock
import JobsSwiftMetalKit

final class JobsMetalKitStabilityTests: XCTestCase {

    func testVideoSamplerPresetClampsAnisotropyWithoutCreatingGPUDevice() {
        for (requested, expected) in [(-5, 1), (4, 4), (100, 16)] {
            let sampler = MTLSamplerDescriptor.videoLinearClamp(aniso: requested)
            XCTAssertEqual(sampler.maxAnisotropy, expected)
            XCTAssertEqual(sampler.minFilter, .linear)
            XCTAssertEqual(sampler.magFilter, .linear)
            XCTAssertEqual(sampler.sAddressMode, .clampToEdge)
            XCTAssertEqual(sampler.tAddressMode, .clampToEdge)
            XCTAssertTrue(sampler.normalizedCoordinates)
        }
    }

    func testReexportedDepthDescriptorChainKeepsSameObject() {
        let descriptor = MTLDepthStencilDescriptor.jobsMake { _ in }
        let result = descriptor
            .byLabel("fixture")
            .byDepthCompare(.lessEqual)
            .byDepthWriteEnabled(true)
        XCTAssertTrue(result === descriptor)
        XCTAssertEqual(descriptor.label, "fixture")
        XCTAssertEqual(descriptor.depthCompareFunction, .lessEqual)
        XCTAssertTrue(descriptor.isDepthWriteEnabled)
    }
}
