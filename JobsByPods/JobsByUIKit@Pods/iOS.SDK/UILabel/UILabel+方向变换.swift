//
//  UILabel+方向变换.swift
//  JobsByUIKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftDSL
import JobsSwiftBaseDefines

extension UILabel {
    // MARK: 方向变换（使用 CATextLayer，避免富文本/对齐丢失）
    @discardableResult
    public func transformLayer(_ direction: TransformLayerDirectionType) -> Self {
        superview?.layoutIfNeeded()
        // 清理旧 layer（避免重复叠加）
        layer.sublayers?
            .filter { $0 is CATextLayer && $0.name == "JobsTextLayer" }
            .forEach { $0.removeFromSuperlayer() }
        let textLayer = CATextLayer()
            .byName("JobsTextLayer")
            .byContentsScale(UIScreen.main.scale)
            .byAlignmentMode(._jobs_fromNSTextAlignment(textAlignment))
            .byTruncationMode((lineBreakMode == .byTruncatingHead) ? .start :
                                (lineBreakMode == .byTruncatingMiddle) ? .middle :
                                (lineBreakMode == .byTruncatingTail) ? .end : .none)
            .byWrapped((numberOfLines == 0))
        if let attributed = attributedText {
            textLayer.byString(attributed)
        } else {
            textLayer.byString(text ?? "")
                .byForegroundColor(textColor.cgColor)
                .byFont(font)
                .byFontSize(font.pointSize)
        }
        textLayer.byFrame(bounds)
        switch direction {
        case .up:
            break
        case .left:
            textLayer
                .byAnchorPoint(CGPoint(x: 0.5, y: 0.5))
                .byPosition(CGPoint(x: bounds.midX, y: bounds.midY))
                .byTransform(CATransform3DMakeRotation(-.pi/2, 0, 0, 1))
        case .down:
            textLayer
                .byAnchorPoint(CGPoint(x: 0.5, y: 0.5))
                .byPosition(CGPoint(x: bounds.midX, y: bounds.midY))
                .byTransform(CATransform3DMakeRotation(.pi, 0, 0, 1))
        case .right:
            textLayer.byAnchorPoint(CGPoint(x: 0.5, y: 0.5))
                .byPosition(CGPoint(x: bounds.midX, y: bounds.midY))
                .byTransform(CATransform3DMakeRotation(.pi/2, 0, 0, 1))
        }
        self.byAddSublayer(textLayer)
        byTextColor(JobsCor.clear) // 只显示 layer 的文字
        return self
    }
}
// MARK: - 对齐映射（CATextLayerAlignmentMode ← NSTextAlignment）
extension CATextLayerAlignmentMode {
    internal static func _jobs_fromNSTextAlignment(_ a: NSTextAlignment) -> CATextLayerAlignmentMode {
        switch a {
        case .left: return .left
        case .right: return .right
        case .center: return .center
        case .justified: return .justified
        case .natural: return .natural
        @unknown default: return .natural
        }
    }
}
