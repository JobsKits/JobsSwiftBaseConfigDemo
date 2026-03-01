//
//  HollowOverlayView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/17/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsByQuartzCore

final class HollowOverlayView: UIView {
    
    enum HoleShape {
        case oval
        case roundedRect(CGFloat)
    }
    var holeRect: CGRect = .zero { didSet { setNeedsLayout() } }
    var holeShape: HoleShape = .oval { didSet { setNeedsLayout() } }
    private let shapeLayer: CAShapeLayer = {
        CAShapeLayer().byFillRule(.evenOdd)
    }()
    /// 半透明遮罩颜色
    var overlayColor: UIColor = UIColor.white.withAlphaComponent(0.5) {
        didSet { shapeLayer.fillColor = overlayColor.cgColor }
    }
    /// 是否允许拖动镂空区域
    var enableDrag: Bool = true {
        didSet { panGR.isEnabled = enableDrag }
    }
    /// 允许从“洞的边缘外扩多少范围”开始拖（避免整屏拦截手势）
    var dragPadding: CGFloat = 30
    private lazy var panGR: UIPanGestureRecognizer = {
        UIPanGestureRecognizer
            .byConfig { [unowned self] gr in
                guard self.enableDrag else { return }
                guard let pan = gr as? UIPanGestureRecognizer else { return }

                let location = pan.location(in: self)
                let hotArea = self.holeRect.insetBy(dx: -self.dragPadding, dy: -self.dragPadding)
                guard hotArea.contains(location) else {
                    pan.setTranslation(.zero, in: self)
                    return
                }

                let t = pan.translation(in: self)
                if pan.state == .changed {
                    self.moveHole(by: t)
                    pan.setTranslation(.zero, in: self)
                } else if pan.state == .ended {
                    // 想要的回调/埋点可以写这里
                }
            }
            .byMinTouches(1)
            .byMaxTouches(2)
            .byCancelsTouchesInView(true)
    }()
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 要能拖动：必须能接收手势
        isUserInteractionEnabled = true
        backgroundColor = .clear
        layer.addSublayer(shapeLayer)
        shapeLayer.fillColor = overlayColor.cgColor
        jobs_addGesture(panGR)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        shapeLayer.frame = bounds

        let path = UIBezierPath(rect: bounds)
        let holePath: UIBezierPath
        switch holeShape {
        case .oval:
            holePath = UIBezierPath(ovalIn: holeRect)
        case .roundedRect(let radius):
            holePath = UIBezierPath(roundedRect: holeRect, cornerRadius: radius)
        }
        path.append(holePath)
        path.usesEvenOddFillRule = true
        shapeLayer.path = path.cgPath
    }
    // 关键：只在“洞附近”吃掉触摸，其它区域放行给下面的 scrollView 等
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard enableDrag else { return false }
        return holeRect.insetBy(dx: -dragPadding, dy: -dragPadding).contains(point)
    }
}

extension HollowOverlayView : UIGestureRecognizerDelegate {
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard enableDrag else { return false }
        let p = gestureRecognizer.location(in: self)
        return holeRect.insetBy(dx: -dragPadding, dy: -dragPadding).contains(p)
    }
}

extension HollowOverlayView {
    
    private func moveHole(by translation: CGPoint) {
        var r = holeRect
        r.origin.x += translation.x
        r.origin.y += translation.y

        let minX = bounds.minX
        let minY = bounds.minY
        let maxX = bounds.maxX - r.width
        let maxY = bounds.maxY - r.height
        r.origin.x = min(max(r.origin.x, minX), maxX)
        r.origin.y = min(max(r.origin.y, minY), maxY)

        holeRect = r
    }
}
// MARK: - HollowOverlayView@DSL
extension HollowOverlayView {
    
    @discardableResult
    func byHoleRect(_ rect: CGRect) -> Self {
        holeRect = rect
        return self
    }
    
    @discardableResult
    func byHoleRect(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) -> Self {
        holeRect = CGRect(x: x, y: y, width: w, height: h)
        return self
    }
    
    @discardableResult
    func byHoleShape(_ shape: HoleShape) -> Self {
        holeShape = shape
        return self
    }
    
    @discardableResult
    func byOverlayColor(_ color: UIColor, alpha: CGFloat? = nil) -> Self {
        overlayColor = alpha == nil ? color : color.withAlphaComponent(alpha!)
        return self
    }
    
    @discardableResult
    func byEnableDrag(_ enable: Bool) -> Self {
        enableDrag = enable
        return self
    }
    
    @discardableResult
    func byDragPadding(_ padding: CGFloat) -> Self {
        dragPadding = padding
        return self
    }
}
