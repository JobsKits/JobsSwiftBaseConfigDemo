//
//  JobsDialogBox.swift
//  Pods
//
//  Created by Jobs on 7/2/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
// MARK: - Config + Builder
public final class DialogBoxBuilder {
    public weak var anchorView: UIView?
    public var size: CGSize = CGSize(width: 240, height: 120)
    public var direction: JobsDirection = .bottom
    public var margin: CGFloat = 8
    public var arrowSize: CGSize = CGSize(width: 14, height: 10) // base, height
    public var cornerRadius: CGFloat = 12
    public var arrowPositionRatio: CGFloat = 0.5 // 0~1, along edge
    public var contentPadding: UIEdgeInsets = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
    public var configureContent: ((UIView) -> Void)?
    public var bubbleColor: UIColor = UIColor(white: 0.15, alpha: 0.95)
    public var shadowColor: UIColor = .black
    public var shadowOpacity: Float = 0.25
    public var shadowRadius: CGFloat = 10
    public var shadowOffset: CGSize = CGSize(width: 0, height: 6)

    public init(anchorView: UIView) {
        self.anchorView = anchorView
    }

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
    /// 可选：离 anchor 的间距
    @discardableResult
    public func byMargin(_ margin: CGFloat) -> Self {
        self.margin = margin
        return self
    }
    /// 可选：箭头在边上的位置比例（0~1），默认 0.5 即居中
    @discardableResult
    public func byArrowPositionRatio(_ ratio: CGFloat) -> Self {
        self.arrowPositionRatio = min(max(ratio, 0.0), 1.0)
        return self
    }
    /// 可选：气泡颜色/阴影等
    @discardableResult
    public func byStyle(bubbleColor: UIColor? = nil,
                        cornerRadius: CGFloat? = nil,
                        shadowOpacity: Float? = nil,
                        shadowRadius: CGFloat? = nil,
                        shadowOffset: CGSize? = nil) -> Self {
        if let v = bubbleColor { self.bubbleColor = v }
        if let v = cornerRadius { self.cornerRadius = v }
        if let v = shadowOpacity { self.shadowOpacity = v }
        if let v = shadowRadius { self.shadowRadius = v }
        if let v = shadowOffset { self.shadowOffset = v }
        return self
    }
    /// 显示
    @discardableResult
    public func byShowDialogBox(in container: UIView) -> DialogBoxView? {
        guard let anchor = anchorView else { return nil }
        // anchor frame -> container 坐标
        let anchorFrame = anchor.convert(anchor.bounds, to: container)
        let dialog = DialogBoxView()
        dialog.backgroundColor = .clear
        dialog.bubbleColor = bubbleColor
        dialog.cornerRadius = cornerRadius
        dialog.arrowSize = arrowSize
        dialog.direction = direction
        dialog.arrowPositionRatio = arrowPositionRatio
        dialog.contentPadding = contentPadding

        dialog.layer.shadowColor = shadowColor.cgColor
        dialog.layer.shadowOpacity = shadowOpacity
        dialog.layer.shadowRadius = shadowRadius
        dialog.layer.shadowOffset = shadowOffset

        // 先给 frame，后绘制 path
        let finalFrame = DialogBoxBuilder.computeFrame(
            anchorFrame: anchorFrame,
            dialogSize: size,
            direction: direction,
            margin: margin,
            inBounds: container.bounds
        )
        dialog.frame = finalFrame
        dialog.layoutIfNeeded()
        dialog.updateShape()
        // 填充内容
        if let configure = configureContent {
            configure(dialog.contentView)
        }
        // 点击外部消失（可按需删掉）
        dialog.installOutsideTapDismiss(in: container)
        dialog.alpha = 0
        dialog.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        UIView.animate(withDuration: 0.18, delay: 0, options: [.curveEaseOut]) {
            dialog.alpha = 1
            dialog.transform = .identity
        };return dialog
    }
    // MARK: - frame positioning
    private static func computeFrame(anchorFrame: CGRect,
                                     dialogSize: CGSize,
                                     direction: JobsDirection,
                                     margin: CGFloat,
                                     inBounds bounds: CGRect) -> CGRect {
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        switch direction {
        case .bottom:
            x = anchorFrame.midX - dialogSize.width / 2
            y = anchorFrame.maxY + margin
        case .top:
            x = anchorFrame.midX - dialogSize.width / 2
            y = anchorFrame.minY - margin - dialogSize.height
        case .left:
            x = anchorFrame.minX - margin - dialogSize.width
            y = anchorFrame.midY - dialogSize.height / 2
        case .right:
            x = anchorFrame.maxX + margin
            y = anchorFrame.midY - dialogSize.height / 2
        }
        // clamp into container bounds (简单处理，保证不出界太多)
        let minX = bounds.minX + 8
        let maxX = bounds.maxX - dialogSize.width - 8
        let minY = bounds.minY + 8
        let maxY = bounds.maxY - dialogSize.height - 8

        x = min(max(x, minX), maxX)
        y = min(max(y, minY), maxY)

        return CGRect(x: x,
                      y: y,
                      width: dialogSize.width,
                      height: dialogSize.height)
    }
}
// MARK: - UIView Extension Entry
extension UIView {
    public func byDialogBox() -> DialogBoxBuilder {
        DialogBoxBuilder(anchorView: self)
    }

    public func byDialogBoxContent(_ block: @escaping (UIView) -> Void) -> DialogBoxBuilder {
        self.byDialogBox().byDialogBoxContent(block)
    }
}
// MARK: - DialogBoxView
public final class DialogBoxView: UIControl {

    fileprivate var direction: JobsDirection = .bottom
    fileprivate var arrowSize: CGSize = CGSize(width: 14, height: 10)
    fileprivate var cornerRadius: CGFloat = 12
    fileprivate var arrowPositionRatio: CGFloat = 0.5
    fileprivate var contentPadding: UIEdgeInsets = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
    fileprivate var bubbleColor: UIColor = UIColor(white: 0.15, alpha: 0.95)

    private let shapeLayer = CAShapeLayer()
    public let contentView = UIView()
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true

        layer.insertSublayer(shapeLayer, at: 0)
        shapeLayer.fillColor = bubbleColor.cgColor

        contentView.backgroundColor = .clear
        addSubview(contentView)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        updateShape()
        layoutContent()
    }

    fileprivate func updateShape() {
        shapeLayer.fillColor = bubbleColor.cgColor
        shapeLayer.path = makePath().cgPath
        shapeLayer.frame = bounds
    }

    private func layoutContent() {
        let inset = bubbleInset()
        let padded = inset.inset(by: contentPadding)
        contentView.frame = padded
    }
    // bubble rect excluding arrow area
    private func bubbleInset() -> CGRect {
        var r = bounds
        let arrow = arrowSize.height

        switch direction {
        case .bottom:
            // 气泡在下方，箭头在顶部 → 顶部预留 arrow，高度减 arrow
            r.origin.y += arrow
            r.size.height -= arrow
        case .top:
            // 气泡在上方，箭头在底部 → 底部预留 arrow，高度减 arrow
            r.size.height -= arrow
        case .left:
            // 气泡在左侧，箭头在右侧 → 右侧预留 arrow，宽度减 arrow
            r.size.width -= arrow
        case .right:
            // 气泡在右侧，箭头在左侧 → 左侧预留 arrow，x 右移，宽度减 arrow
            r.origin.x += arrow
            r.size.width -= arrow
        };return r
    }

    private func makePath() -> UIBezierPath {
        let full = bounds
        let bubble = bubbleInset()
        let path = UIBezierPath(roundedRect: bubble, cornerRadius: cornerRadius)
        // arrow tip point on outside edge
        switch direction {
        case .bottom:
            // arrow on top edge of full? 注意：down 表示气泡在 anchor 下方，箭头在气泡顶部朝上指向 anchor
            let tipY = full.minY
            let baseY = bubble.minY
            let cx = bubble.minX + bubble.width * arrowPositionRatio
            let halfBase = arrowSize.width / 2

            path.move(to: CGPoint(x: cx - halfBase, y: baseY))
            path.addLine(to: CGPoint(x: cx, y: tipY))
            path.addLine(to: CGPoint(x: cx + halfBase, y: baseY))
            path.close()
        case .top:
            let tipY = full.maxY
            let baseY = bubble.maxY
            let cx = bubble.minX + bubble.width * arrowPositionRatio
            let halfBase = arrowSize.width / 2

            path.move(to: CGPoint(x: cx - halfBase, y: baseY))
            path.addLine(to: CGPoint(x: cx, y: tipY))
            path.addLine(to: CGPoint(x: cx + halfBase, y: baseY))
            path.close()
        case .left:
            // 气泡在 anchor 左侧，箭头在气泡右侧朝右
            let tipX = full.maxX
            let baseX = bubble.maxX
            let cy = bubble.minY + bubble.height * arrowPositionRatio
            let halfBase = arrowSize.width / 2

            path.move(to: CGPoint(x: baseX, y: cy - halfBase))
            path.addLine(to: CGPoint(x: tipX, y: cy))
            path.addLine(to: CGPoint(x: baseX, y: cy + halfBase))
            path.close()
        case .right:
            let tipX = full.minX
            let baseX = bubble.minX
            let cy = bubble.minY + bubble.height * arrowPositionRatio
            let halfBase = arrowSize.width / 2

            path.move(to: CGPoint(x: baseX, y: cy - halfBase))
            path.addLine(to: CGPoint(x: tipX, y: cy))
            path.addLine(to: CGPoint(x: baseX, y: cy + halfBase))
            path.close()
        };return path
    }
    // MARK: - outside tap dismiss
    fileprivate func installOutsideTapDismiss(in container: UIView) {
        // 透明遮罩层：点击空白处关闭
        let mask = UIControl(frame: container.bounds)
        mask.backgroundColor = .clear
        mask.addTarget(self, action: #selector(dismissFromMask(_:)), for: .touchUpInside)
        container.addSubview(mask)
        container.addSubview(self)
        // 让 dialog 在 mask 之上
        self.removeFromSuperview()
        container.addSubview(self)
        // 关联（简单存一下）
        objc_setAssociatedObject(
            self,
            &AssociatedKeys.maskKey,
            mask,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    @objc private func dismissFromMask(_ sender: UIControl) {
        dismiss()
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
