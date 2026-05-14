//
//  JobsDialogBox.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
import JobsSwiftBaseDefines
// MARK: - Builder
public final class JobsDialogBoxBuilder {
    public weak var anchorView: UIView?
    public var size: CGSize = CGSize(width: 240, height: 120)
    public var direction: JobsDirection = .bottom
    /// 箭头与发起点UIView距离默认 3，可外部设置
    public var arrowSpacing: CGFloat = 3
    /// 箭头尺寸：width=基底宽，height=尖角伸出/预留厚度
    public var arrowSize: CGSize = CGSize(width: 14, height: 10)
    public var cornerRadius: CGFloat = 12
    public var contentPadding: UIEdgeInsets = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
    public var bubbleColor: UIColor = UIColor(white: 0.15, alpha: 0.95)
    public var shadowColor: UIColor = .black
    public var shadowOpacity: Float = 0.25
    public var shadowRadius: CGFloat = 10
    public var shadowOffset: CGSize = CGSize(width: 0, height: 6)
    public var configureContent: ((UIView) -> Void)?

    public init(anchorView: UIView) {
        self.anchorView = anchorView
    }
    // MARK: chain api
    @discardableResult
    public func byDialogBoxContent(_ block: @escaping (UIView) -> Void) -> Self {
        self.configureContent = block
        return self
    }

    @discardableResult
    public func byDialogBoxSize(_ size: CGSize) -> Self {
        self.size = size
        return self
    }

    @discardableResult
    public func byShownDirection(_ dir: JobsDirection) -> Self {
        self.direction = dir
        return self
    }

    @discardableResult
    public func byArrowSpacing(_ v: CGFloat) -> Self {
        self.arrowSpacing = v
        return self
    }

    @discardableResult
    public func byArrowSize(_ size: CGSize) -> Self {
        self.arrowSize = size
        return self
    }

    @discardableResult
    public func byCornerRadius(_ r: CGFloat) -> Self {
        self.cornerRadius = r
        return self
    }

    @discardableResult
    public func byContentPadding(_ inset: UIEdgeInsets) -> Self {
        self.contentPadding = inset
        return self
    }

    @discardableResult
    public func byStyle(bubbleColor: UIColor? = nil,
                        shadowColor: UIColor? = nil,
                        shadowOpacity: Float? = nil,
                        shadowRadius: CGFloat? = nil,
                        shadowOffset: CGSize? = nil) -> Self {
        if let v = bubbleColor { self.bubbleColor = v }
        if let v = shadowColor { self.shadowColor = v }
        if let v = shadowOpacity { self.shadowOpacity = v }
        if let v = shadowRadius { self.shadowRadius = v }
        if let v = shadowOffset { self.shadowOffset = v }
        return self
    }
    // MARK: show
    @discardableResult
    public func byShowDialogBox(in container: UIView) -> JobsDialogBoxView? {
        guard let anchor = anchorView else { return nil }
        // anchor frame -> container 坐标
        let anchorFrame = anchor.convert(anchor.bounds, to: container)
        let dialog = JobsDialogBoxView()
        dialog.backgroundColor = .clear
        dialog.bubbleColor = bubbleColor
        dialog.cornerRadius = cornerRadius
        dialog.arrowSize = arrowSize
        dialog.contentPadding = contentPadding

        dialog.layer.shadowColor = shadowColor.cgColor
        dialog.layer.shadowOpacity = shadowOpacity
        dialog.layer.shadowRadius = shadowRadius
        dialog.layer.shadowOffset = shadowOffset
        // direction resolved (supports RTL, no iOS13 type used)
        let resolved = direction.resolved(for: container.effectiveUserInterfaceLayoutDirection)
        dialog.resolvedEdge = resolved
        // 1) frame：严格按方向贴边 + spacing（默认 3）
        let dialogFrame = Self.computeDialogFrame(
            anchorFrame: anchorFrame,
            dialogSize: size,
            direction: resolved,
            spacing: arrowSpacing,
            inBounds: container.bounds
        )
        // 2) arrow ratio：箭头尖端对准 anchor 中心（并避开圆角）
        let ratio = Self.computeArrowRatio(
            anchorFrame: anchorFrame,
            dialogFrame: dialogFrame,
            resolvedDirection: resolved,
            cornerRadius: cornerRadius,
            arrowBaseWidth: arrowSize.width
        )
        dialog.frame = dialogFrame
        dialog.arrowPositionRatio = ratio
        dialog.setNeedsLayout()
        dialog.layoutIfNeeded()
        // 内容
        if let configure = configureContent {
            configure(dialog.contentView)
        }
        // outside tap dismiss（可按需删）
        dialog.installOutsideTapDismiss(in: container)
        // 动画
        dialog.alpha = 0
        dialog.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        UIView.animate(withDuration: 0.18, delay: 0, options: [.curveEaseOut]) {
            dialog.alpha = 1
            dialog.transform = .identity
        };return dialog
    }
    // MARK: - Positioning
    private static func computeDialogFrame(anchorFrame: CGRect,
                                          dialogSize: CGSize,
                                          direction: JobsResolvedEdge,
                                          spacing: CGFloat,
                                          inBounds bounds: CGRect) -> CGRect {
        var x: CGFloat = 0
        var y: CGFloat = 0

        switch direction {
        case .bottom:
            x = anchorFrame.midX - dialogSize.width / 2
            y = anchorFrame.maxY + spacing
        case .top:
            x = anchorFrame.midX - dialogSize.width / 2
            y = anchorFrame.minY - spacing - dialogSize.height
        case .left:
            x = anchorFrame.minX - spacing - dialogSize.width
            y = anchorFrame.midY - dialogSize.height / 2
        case .right:
            x = anchorFrame.maxX + spacing
            y = anchorFrame.midY - dialogSize.height / 2
        }
        // clamp: 保证基本不出屏
        let minX = bounds.minX + 8
        let maxX = bounds.maxX - dialogSize.width - 8
        let minY = bounds.minY + 8
        let maxY = bounds.maxY - dialogSize.height - 8

        x = min(max(x, minX), maxX)
        y = min(max(y, minY), maxY)

        return CGRect(x: x, y: y, width: dialogSize.width, height: dialogSize.height)
    }

    private static func computeArrowRatio(anchorFrame: CGRect,
                                         dialogFrame: CGRect,
                                         resolvedDirection: JobsResolvedEdge,
                                         cornerRadius: CGFloat,
                                         arrowBaseWidth: CGFloat) -> CGFloat {
        let halfBase = arrowBaseWidth / 2
        func clamp(_ v: CGFloat, _ a: CGFloat, _ b: CGFloat) -> CGFloat { min(max(v, a), b) }
        switch resolvedDirection {
        case .bottom, .top:
            let localX = anchorFrame.midX - dialogFrame.minX
            let safeMin = cornerRadius + halfBase + 1
            let safeMax = dialogFrame.width - cornerRadius - halfBase - 1
            let cx = clamp(localX, safeMin, safeMax)
            return cx / dialogFrame.width
        case .left, .right:
            let localY = anchorFrame.midY - dialogFrame.minY
            let safeMin = cornerRadius + halfBase + 1
            let safeMax = dialogFrame.height - cornerRadius - halfBase - 1
            let cy = clamp(localY, safeMin, safeMax)
            return cy / dialogFrame.height
        }
    }
}
// MARK: - UIView extension entry
extension UIView {
    public func byDialogBox() -> JobsDialogBoxBuilder {
        JobsDialogBoxBuilder(anchorView: self)
    }

    public func byDialogBoxContent(_ block: @escaping (UIView) -> Void) -> JobsDialogBoxBuilder {
        self.byDialogBox().byDialogBoxContent(block)
    }
}
// MARK: - DialogBox View
public final class JobsDialogBoxView: UIControl {
    // 不要用 NSDirectionalRectEdge 存储字段（否则 iOS13 以下 availability 报错）
    fileprivate var resolvedEdge: JobsResolvedEdge = .bottom
    fileprivate var arrowPositionRatio: CGFloat = 0.5 // 0...1
    fileprivate var arrowSize: CGSize = CGSize(width: 14, height: 10)
    fileprivate var cornerRadius: CGFloat = 12
    fileprivate var bubbleColor: UIColor = UIColor(white: 0.15, alpha: 0.95)
    fileprivate var contentPadding: UIEdgeInsets = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)

    private let shapeLayer = CAShapeLayer()
    public let contentView = UIView()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        backgroundColor = .clear

        layer.insertSublayer(shapeLayer, at: 0)
        shapeLayer.fillColor = bubbleColor.cgColor

        contentView.backgroundColor = .clear
        addSubview(contentView)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateShape()
        layoutContent()
    }

    fileprivate func updateShape() {
        shapeLayer.fillColor = bubbleColor.cgColor
        shapeLayer.frame = bounds
        shapeLayer.path = makePath().cgPath
    }

    private func layoutContent() {
        let bubble = bubbleRect()
        let padded = bubble.inset(by: contentPadding)
        contentView.frame = padded
    }
    // bubble rect excluding arrow area（别写反，否则箭头高度为 0）
    private func bubbleRect() -> CGRect {
        var r = bounds
        let arrowH = arrowSize.height

        switch resolvedEdge {
        case .bottom:
            r.origin.y += arrowH
            r.size.height -= arrowH
        case .top:
            r.size.height -= arrowH
        case .left:
            r.size.width -= arrowH
        case .right:
            r.origin.x += arrowH
            r.size.width -= arrowH
        };return r
    }

    private func makePath() -> UIBezierPath {
        
        let full = bounds
        let bubble = bubbleRect()
        let path = UIBezierPath(roundedRect: bubble, cornerRadius: cornerRadius)
        let halfBase = arrowSize.width / 2

        switch resolvedEdge {
        case .bottom:
            // 箭头在顶部，指向上
            let tipY = full.minY
            let baseY = bubble.minY
            let cx = bubble.minX + bubble.width * arrowPositionRatio
            path.move(to: CGPoint(x: cx - halfBase, y: baseY))
            path.addLine(to: CGPoint(x: cx, y: tipY))
            path.addLine(to: CGPoint(x: cx + halfBase, y: baseY))
            path.close()
        case .top:
            // 箭头在底部，指向下
            let tipY = full.maxY
            let baseY = bubble.maxY
            let cx = bubble.minX + bubble.width * arrowPositionRatio
            path.move(to: CGPoint(x: cx - halfBase, y: baseY))
            path.addLine(to: CGPoint(x: cx, y: tipY))
            path.addLine(to: CGPoint(x: cx + halfBase, y: baseY))
            path.close()
        case .left:
            // 箭头在右侧，指向右
            let tipX = full.maxX
            let baseX = bubble.maxX
            let cy = bubble.minY + bubble.height * arrowPositionRatio
            path.move(to: CGPoint(x: baseX, y: cy - halfBase))
            path.addLine(to: CGPoint(x: tipX, y: cy))
            path.addLine(to: CGPoint(x: baseX, y: cy + halfBase))
            path.close()
        case .right:
            // 箭头在左侧，指向左
            let tipX = full.minX
            let baseX = bubble.minX
            let cy = bubble.minY + bubble.height * arrowPositionRatio
            path.move(to: CGPoint(x: baseX, y: cy - halfBase))
            path.addLine(to: CGPoint(x: tipX, y: cy))
            path.addLine(to: CGPoint(x: baseX, y: cy + halfBase))
            path.close()
        };return path
    }
    // MARK: - outside tap dismiss (optional)
    fileprivate func installOutsideTapDismiss(in container: UIView) {
        let mask = UIControl(frame: container.bounds)
        mask.backgroundColor = .clear
        // ✅ 用你的 DSL：byAddAction(for:_:)（iOS12/13/14+ 都能跑）
        mask.byAddAction(for: .touchUpInside) { [weak self] _ in
            self?.dismiss()
        }
        container.addSubview(mask)
        container.addSubview(self)
        objc_setAssociatedObject(self,
                                 &AssociatedKeys.maskKey,
                                 mask,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    public func dismiss() {
        let mask = objc_getAssociatedObject(self, &AssociatedKeys.maskKey) as? UIControl
        UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseIn]) {
            self.alpha = 0
            self.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        } completion: { _ in
            mask?.removeFromSuperview()
            self.removeFromSuperview()
        }
    }

    private struct AssociatedKeys {
        static var maskKey: UInt8 = 0
    }
}
