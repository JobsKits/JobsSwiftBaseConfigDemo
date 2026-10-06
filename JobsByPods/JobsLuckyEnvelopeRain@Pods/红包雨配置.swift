//
//  红包雨配置.swift
//  JobsLuckyEnvelopeRain
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import Foundation
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines

// MARK: - 红包雨配置
public struct RedPacketRainConfig {
    /// 每次生成红包的间隔
    public var spawnInterval: TimeInterval
    /// 最小下落时长
    public var minFallDuration: TimeInterval
    /// 最大下落时长
    public var maxFallDuration: TimeInterval
    /// 红包尺寸
    public var packetSize: CGSize
    /// 屏幕上最多同时存在多少个红包
    public var maxConcurrentCount: Int
    /// 生成区域的内边距（控制左右 / 顶部安全区）
    public var spawnInsets: UIEdgeInsets
    /// 是否可以点按
    public var tapEnabled: Bool
    /// 红包图片（不传就用红色方块做占位）
    public var packetImage: UIImage?

    public init(
        spawnInterval: TimeInterval = 0.25,
        minFallDuration: TimeInterval = 2.5,
        maxFallDuration: TimeInterval = 4.0,
        packetSize: CGSize = CGSize(width: 44, height: 54),
        maxConcurrentCount: Int = 60,
        spawnInsets: UIEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 10),
        tapEnabled: Bool = true,
        packetImage: UIImage? = nil
    ) {
        self.spawnInterval = spawnInterval
        self.minFallDuration = minFallDuration
        self.maxFallDuration = maxFallDuration
        self.packetSize = packetSize
        self.maxConcurrentCount = maxConcurrentCount
        self.spawnInsets = spawnInsets
        self.tapEnabled = tapEnabled
        self.packetImage = packetImage
    }

    var normalized: Self {
        var result = self
        result.spawnInterval = spawnInterval.isFinite && spawnInterval > 0 ? min(60, max(0.05, spawnInterval)) : 0.25
        let first = minFallDuration.isFinite && minFallDuration > 0 ? min(120, max(0.05, minFallDuration)) : 2.5
        let second = maxFallDuration.isFinite && maxFallDuration > 0 ? min(120, max(0.05, maxFallDuration)) : 4
        result.minFallDuration = min(first, second)
        result.maxFallDuration = max(first, second)
        result.packetSize = CGSize(width: packetSize.width.isFinite && packetSize.width > 0 ? min(1_024, packetSize.width) : 44,
                                   height: packetSize.height.isFinite && packetSize.height > 0 ? min(1_024, packetSize.height) : 54)
        result.maxConcurrentCount = max(0, min(maxConcurrentCount, 500))
        result.spawnInsets.left = spawnInsets.left.isFinite ? max(0, spawnInsets.left) : 10
        result.spawnInsets.right = spawnInsets.right.isFinite ? max(0, spawnInsets.right) : 10
        return result
    }

    public static var `default`: RedPacketRainConfig {
        RedPacketRainConfig()
    }
}

public func makeDefaultIconImage() -> UIImage? {
    let size = CGSize(width: 24, height: 24)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    defer { UIGraphicsEndImageContext() }

    let rect = CGRect(origin: .zero, size: size)
    let path = UIBezierPath.make(ovalIn: rect)
    JobsCor.red.setFill()
    path.byFill()

    let attr: [NSAttributedString.Key: Any] = [
        .font: JobsFont.boldSystemFont(ofSize: 16),
        .foregroundColor: JobsCor.yellow
    ]
    let text = "$" as NSString
    let textSize = text.size(withAttributes: attr)
    let textRect = CGRect(
        x: (size.width - textSize.width) / 2,
        y: (size.height - textSize.height) / 2,
        width: textSize.width,
        height: textSize.height
    )
    text.draw(in: textRect, withAttributes: attr)
    return UIGraphicsGetImageFromCurrentImageContext()
}
