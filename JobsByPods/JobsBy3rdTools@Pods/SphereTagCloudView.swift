//
//  SphereTagCloudView.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftDSL
import simd
/// UIKit Swift 版 SphereView：3D 球形标签云
/// - Features:
///   - Auto rotate (CADisplayLink)
///   - Pan to rotate (inertia supported)
///   - Pinch to zoom (radius scale)
///   - Tap items: use the item's own target-action or gesture

public final class SphereTagCloudView: UIView, UIGestureRecognizerDelegate {
    deinit {
        stop()
    }
    // MARK: - Public Config
    /// 球半径（如果为 nil，会在 layoutSubviews 里用 bounds 自动计算）
    public var radius: CGFloat? { didSet { setNeedsLayout() } }
    /// 透视强度：越大越“扁”，越小越“立体”（建议 1.5~3）
    public var perspective: CGFloat = 2.2 { didSet { setNeedsLayout() } }
    /// 深度映射到缩放的范围
    public var minScale: CGFloat = 0.35
    public var maxScale: CGFloat = 1.00
    /// 深度映射到透明度的范围
    public var minAlpha: CGFloat = 0.35
    public var maxAlpha: CGFloat = 1.00
    /// 自动旋转开关
    public var isAutoRotating: Bool = true
    /// 自动旋转速度（弧度/秒）
    public var autoRotateSpeed: CGFloat = 0.55
    /// 手势灵敏度：越大拖动越“跟手”
    public var rotationSensitivity: CGFloat = 0.008
    /// 惯性阻尼（0~1，越接近 1 惯性越持久）
    public var inertiaDamping: CGFloat = 0.94
    /// 是否允许同时识别（比如按钮点击 + 轻微拖动）
    public var allowSimultaneousGestures: Bool = true
    // MARK: - Internal Node
    private struct Node {
        weak var view: UIView?
        var pos: SIMD3<Double> // sphere coordinate, length ~ 1
    }

    private var nodes: [Node] = []
    // rotation velocity (radians per frame step, applied in displayLink)
    private var velX: CGFloat = 0
    private var velY: CGFloat = 0
    private var displayLink: CADisplayLink?
    private var lastTimestamp: CFTimeInterval = 0
    // pinch state
    private var baseRadius: CGFloat = 0
    // pan state
    private var lastPanPoint: CGPoint = .zero
    // MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        clipsToBounds = false
        isUserInteractionEnabled = true
        setupGestures()
        start()
    }
    // MARK: - Public API
    /// 设置标签（会清空旧的）
    public func setItems(_ views: [UIView]) {
        // remove old
        subviews.forEach { $0.removeFromSuperview() }
        nodes.removeAll()

        for v in views {
            addItem(v)
        }
        distributeIfNeeded()
        setNeedsLayout()
    }
    /// 添加一个标签
    public func addItem(_ view: UIView) {
        view.byAddTo(self)

        // 如果 view 没尺寸，用 intrinsic 做一次兜底
        if view.bounds.size == .zero {
            if let label = view as? UILabel {
                label.sizeToFit()
            } else if let btn = view as? UIButton {
                btn.sizeToFit()
                // 给按钮一点 padding（可按需删）
                let pad: CGFloat = 10
                btn.bounds.size = CGSize(width: btn.bounds.width + pad * 2,
                                         height: btn.bounds.height + pad)
            } else {
                view.sizeToFit()
            }
        }
        nodes.append(Node(view: view, pos: SIMD3<Double>(0, 0, 0)))
    }
    /// 开始动画
    public func start() {
        if displayLink != nil { return }
        let link = CADisplayLink(target: self, selector: #selector(tick(_:)))
        link.add(to: .main, forMode: .common)
        displayLink = link
    }
    /// 停止动画
    public func stop() {
        displayLink?.invalidate()
        displayLink = nil
        lastTimestamp = 0
    }
    /// 重新均匀分布到球面（当动态增删 items 后可手动调）
    public func redistribute() {
        distributeIfNeeded(force: true)
        setNeedsLayout()
    }
    // MARK: - Layout
    public override func layoutSubviews() {
        super.layoutSubviews()
        if nodes.isEmpty { return }
        distributeIfNeeded()
        renderAll()
    }
    // MARK: - Gestures (Jobs DSL)
    private func setupGestures() {
        self.jobs_addGesture(
            UIPanGestureRecognizer
                .byConfig { [weak self] gr in
                    guard
                        let self,
                        let pan = gr as? UIPanGestureRecognizer
                    else { return }
                    self.onPan(pan) // 复用原来的处理函数
                }
                .byMinTouches(1)
                .byMaxTouches(1)
                .byCancelsTouchesInView(false)
                .byDelaysTouchesBegan(false)
                .byDelegate(self))
        // 捏合 Pinch
        self.jobs_addGesture(
            UIPinchGestureRecognizer
                .byConfig { [weak self] gr in
                    guard
                        let self,
                        let pinch = gr as? UIPinchGestureRecognizer
                    else { return }
                    self.onPinch(pinch) // 复用原来的处理函数
                }
                .byScale(1.0)
                .byCancelsTouchesInView(false)
                .byDelegate(self))
    }

    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                                  shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        allowSimultaneousGestures
    }

    @objc private func onPan(_ gr: UIPanGestureRecognizer) {
        guard !nodes.isEmpty else { return }
        let p = gr.location(in: self)

        switch gr.state {
        case .began:
            lastPanPoint = p
            // 进入手势时，先把自动旋转“让路”
            velX = 0
            velY = 0

        case .changed:
            let dx = p.x - lastPanPoint.x
            let dy = p.y - lastPanPoint.y
            lastPanPoint = p

            // 手指水平移动 -> 绕 Y 轴转；垂直移动 -> 绕 X 轴转
            let angleY = dx * rotationSensitivity
            let angleX = -dy * rotationSensitivity

            rotate(byX: angleX, y: angleY)
            renderAll()

            // 实时更新速度，用于惯性
            velX = angleX
            velY = angleY

        case .ended, .cancelled, .failed:
            let v = gr.velocity(in: self)
            // 把像素速度映射成角速度（经验值）
            velY = (v.x * rotationSensitivity) / 60.0
            velX = (-v.y * rotationSensitivity) / 60.0

        default:
            break
        }
    }

    @objc private func onPinch(_ gr: UIPinchGestureRecognizer) {
        switch gr.state {
        case .began:
            baseRadius = effectiveRadius
        case .changed:
            let r = max(40, baseRadius * gr.scale)
            radius = r
            renderAll()
        default:
            break
        }
    }
    // MARK: - Ticking
    @objc private func tick(_ link: CADisplayLink) {
        guard !nodes.isEmpty else { return }

        if lastTimestamp == 0 {
            lastTimestamp = link.timestamp
            return
        }
        let dt = CGFloat(link.timestamp - lastTimestamp)
        lastTimestamp = link.timestamp

        // 惯性旋转
        let hasInertia = abs(velX) > 0.00001 || abs(velY) > 0.00001
        if hasInertia {
            rotate(byX: velX, y: velY)
            velX *= inertiaDamping
            velY *= inertiaDamping
        } else if isAutoRotating {
            // 自动旋转
            let angle = autoRotateSpeed * dt
            rotate(byX: angle * 0.25, y: angle)
        } else {
            return
        }

        renderAll()
    }
    // MARK: - Core Math
    private var effectiveRadius: CGFloat {
        if let r = radius { return r }
        // 自动半径：取短边的一半再乘一个系数
        return min(bounds.width, bounds.height) * 0.42
    }

    /// 均匀分布到球面：Fibonacci sphere
    private func distributeIfNeeded(force: Bool = false) {
        guard !nodes.isEmpty else { return }
        if !force, nodes.allSatisfy({ $0.pos != SIMD3<Double>(0, 0, 0) }) { return }

        let n = Double(nodes.count)
        // golden angle
        let ga = Double.pi * (3.0 - sqrt(5.0))

        for i in 0..<nodes.count {
            let y = 1.0 - (Double(i) + 0.5) * (2.0 / n)
            let r = sqrt(max(0.0, 1.0 - y * y))
            let theta = ga * (Double(i) + 0.5)

            let x = cos(theta) * r
            let z = sin(theta) * r

            nodes[i].pos = SIMD3<Double>(x, y, z)
        }
    }

    private func rotate(byX angleX: CGFloat, y angleY: CGFloat) {
        if angleX == 0 && angleY == 0 { return }

        let ax = Double(angleX)
        let ay = Double(angleY)

        // rotation around X
        let rx = double3x3(
            SIMD3<Double>(1, 0, 0),
            SIMD3<Double>(0, cos(ax), -sin(ax)),
            SIMD3<Double>(0, sin(ax), cos(ax))
        )

        // rotation around Y
        let ry = double3x3(
            SIMD3<Double>(cos(ay), 0, sin(ay)),
            SIMD3<Double>(0, 1, 0),
            SIMD3<Double>(-sin(ay), 0, cos(ay))
        )

        for i in 0..<nodes.count {
            var p = nodes[i].pos
            p = ry * (rx * p)
            nodes[i].pos = p
        }
    }
    // MARK: - Rendering
    private func renderAll() {
        guard !nodes.isEmpty else { return }
        let r = effectiveRadius
        let center = CGPoint(x: bounds.midX, y: bounds.midY)

        // 先按 z 排序：远的先画，近的后画（更符合视觉）
        let sortedIdx = nodes.indices.sorted { nodes[$0].pos.z < nodes[$1].pos.z }

        for idx in sortedIdx {
            guard let v = nodes[idx].view else { continue }
            let p = nodes[idx].pos

            // p.z in [-1, 1]
            let z = CGFloat(p.z)

            // 透视：z 越大（越靠近屏幕），perspectiveFactor 越大
            let persp = r / (r + (perspective * r) * (1 - z) * 0.5)

            let x2d = center.x + CGFloat(p.x) * r * persp
            let y2d = center.y + CGFloat(p.y) * r * persp

            // scale/alpha by depth
            let depth01 = (z + 1) * 0.5 // [-1..1] -> [0..1]
            let scale = minScale + (maxScale - minScale) * depth01
            let alpha = minAlpha + (maxAlpha - minAlpha) * depth01

            // place view (keep its own size)
            let size = v.bounds.size
            v.center = CGPoint(x: x2d, y: y2d)
            v.bounds = CGRect(origin: .zero, size: size)

            v.byAlpha(alpha)
            v.transform = CGAffineTransform(scaleX: scale, y: scale)

            // 让更靠前的更容易点到（也可不要）
            v.isUserInteractionEnabled = true
        }

        // bring frontmost to top (z 最大的最后 bringToFront)
        for idx in sortedIdx {
            if let v = nodes[idx].view {
                bringSubviewToFront(v)
            }
        }
    }
}
/// SphereTagCloudView@DSL
public extension SphereTagCloudView {
    @discardableResult
    func byRadius(_ value: CGFloat?) -> Self {
        radius = value
        return self
    }

    @discardableResult
    func byPerspective(_ value: CGFloat) -> Self {
        perspective = value
        return self
    }

    @discardableResult
    func byScaleRange(min: CGFloat, max: CGFloat) -> Self {
        minScale = min
        maxScale = max
        return self
    }

    @discardableResult
    func byAlphaRange(min: CGFloat, max: CGFloat) -> Self {
        minAlpha = min
        maxAlpha = max
        return self
    }

    @discardableResult
    func byAutoRotating(_ enabled: Bool) -> Self {
        isAutoRotating = enabled
        return self
    }

    @discardableResult
    func byAutoRotateSpeed(_ value: CGFloat) -> Self {
        autoRotateSpeed = value
        return self
    }

    @discardableResult
    func byRotationSensitivity(_ value: CGFloat) -> Self {
        rotationSensitivity = value
        return self
    }

    @discardableResult
    func byInertiaDamping(_ value: CGFloat) -> Self {
        inertiaDamping = value
        return self
    }

    @discardableResult
    func byAllowSimultaneousGestures(_ enabled: Bool) -> Self {
        allowSimultaneousGestures = enabled
        return self
    }
    /// 一把梭：直接塞 items
    @discardableResult
    func byItems(_ views: [UIView]) -> Self {
        setItems(views)
        return self
    }
}
