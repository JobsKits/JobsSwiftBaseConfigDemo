//
//  BaseDebug.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/1/25.
//
import Foundation
import UIKit
// MARK: - 私有：蓝色占位图（1x1）
// 统一的纯色占位（1×1）；需要更大就改 size
public func jobsSolidBlue(
    color: UIColor = .systemBlue,
    size: CGSize = .init(width: 1, height: 1),
    scale: CGFloat = 0
) -> UIImage {
    let fmt = UIGraphicsImageRendererFormat.default(); fmt.scale = scale
    return UIGraphicsImageRenderer(size: size, format: fmt).image { ctx in
        color.setFill()
        ctx.fill(CGRect(origin: .zero, size: size))
    }
}
