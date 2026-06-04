//
//  GestureUnlockView.swift
//  JobsGestureUnlock
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public protocol GestureUnlockViewDelegate: AnyObject {
    func gestureUnlockViewDidBeginInput(_ view: GestureUnlockView)
    func gestureUnlockView(_ view: GestureUnlockView, didComplete pattern: GesturePattern)
}

public final class GestureUnlockView: UIView {

    public enum VisualState {
        case normal
        case selected
        case error
    }

    public weak var delegate: GestureUnlockViewDelegate?
    public var onComplete: ((GesturePattern) -> Void)?

    public var configuration: GestureUnlockConfiguration = .init() {
        didSet { rebuildNodes() }
    }

    public var isInputEnabled: Bool = true

    private var nodes: [GestureNodeView] = []
    private var selected: [Int] = []
    private var currentTouchPoint: CGPoint?

    private let lineLayer = CAShapeLayer()
    private var visualState: VisualState = .normal

    private let impact = UIImpactFeedbackGenerator(style: .light)

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        isMultipleTouchEnabled = false
        backgroundColor = .clear

        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.lineCap = .round
        lineLayer.lineJoin = .round
        layer.addSublayer(lineLayer)

        rebuildNodes()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        layoutNodes()
        updateLinePath()
    }

    // MARK: - Public API

    public func reset(animated: Bool = false) {
        selected.removeAll()
        currentTouchPoint = nil
        setVisualState(.normal)

        for node in nodes { node.apply(state: .normal) }
        updateLinePath()

        if animated {
            UIView.animate(withDuration: 0.18) { self.alpha = 1.0 }
        }
    }

    public func showError() {
        setVisualState(.error)
    }

    public func showSelected() {
        setVisualState(.selected)
    }

    // MARK: - Build / Layout

    private func rebuildNodes() {
        nodes.forEach { $0.removeFromSuperview() }
        nodes.removeAll()

        let n = max(2, configuration.gridDimension)
        for idx in 0..<(n * n) {
            let node = GestureNodeView(index: idx)
            node.configuration = configuration
            node.apply(state: .normal)
            addSubview(node)
            nodes.append(node)
        }

        setNeedsLayout()
    }

    private func layoutNodes() {
        let n = max(2, configuration.gridDimension)

        let spacingX = bounds.width / CGFloat(n + 1)
        let spacingY = bounds.height / CGFloat(n + 1)

        let diameter = min(configuration.nodeDiameter, min(spacingX, spacingY) * 0.65)
        let size = CGSize(width: diameter, height: diameter)

        for r in 0..<n {
            for c in 0..<n {
                let idx = r * n + c
                let center = CGPoint(x: spacingX * CGFloat(c + 1),
                                     y: spacingY * CGFloat(r + 1))
                nodes[idx].frame = CGRect(origin: CGPoint(x: center.x - size.width / 2,
                                                          y: center.y - size.height / 2),
                                          size: size)
                nodes[idx].setNeedsLayout()
            }
        }
    }

    // MARK: - Touch

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isInputEnabled, let p = touches.first?.location(in: self) else { return }
        delegate?.gestureUnlockViewDidBeginInput(self)
        if configuration.hapticsEnabled { impact.prepare() }

        reset(animated: false)
        currentTouchPoint = p
        trySelectNode(at: p)
        updateLinePath()
    }

    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isInputEnabled, let p = touches.first?.location(in: self) else { return }
        currentTouchPoint = p
        trySelectNode(at: p)
        updateLinePath()
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isInputEnabled else { return }
        currentTouchPoint = nil
        updateLinePath()

        let pattern = GesturePattern(indices: selected)
        delegate?.gestureUnlockView(self, didComplete: pattern)
        onComplete?(pattern)
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentTouchPoint = nil
        updateLinePath()
    }

    // MARK: - Selection

    private func trySelectNode(at point: CGPoint) {
        guard let hit = hitNodeIndex(at: point) else { return }
        appendNodeIndexWithInterpolation(hit)
    }

    private func hitNodeIndex(at point: CGPoint) -> Int? {
        // 允许稍微“吸附”一点
        for node in nodes {
            let bigger = node.frame.insetBy(dx: -10, dy: -10)
            if bigger.contains(point) {
                return node.index
            }
        }
        return nil
    }

    private func appendNodeIndexWithInterpolation(_ newIndex: Int) {
        guard !selected.contains(newIndex) else { return }

        if let last = selected.last {
            let intermediates = interpolatedIndices(from: last, to: newIndex)
            for idx in intermediates where !selected.contains(idx) {
                selectIndex(idx)
            }
        }

        selectIndex(newIndex)
    }

    private func selectIndex(_ idx: Int) {
        selected.append(idx)
        nodes[idx].apply(state: visualState == .error ? .error : .selected)

        if configuration.hapticsEnabled {
            if #available(iOS 13.0, *) {
                impact.impactOccurred(intensity: 0.8)
            } else {
                impact.impactOccurred()
            }
        }

        if visualState == .normal { setVisualState(.selected) }
    }

    /// 处理“跨点自动补点”，例如 0->2 自动补 1；0->8 自动补 4 等
    private func interpolatedIndices(from: Int, to: Int) -> [Int] {
        let n = max(2, configuration.gridDimension)
        let (r1, c1) = (from / n, from % n)
        let (r2, c2) = (to / n, to % n)

        let dr = r2 - r1
        let dc = c2 - c1

        let g = gcd(abs(dr), abs(dc))
        guard g > 1 else { return [] }

        let stepR = dr / g
        let stepC = dc / g

        var result: [Int] = []
        for k in 1..<(g) {
            let rr = r1 + stepR * k
            let cc = c1 + stepC * k
            if rr >= 0, rr < n, cc >= 0, cc < n {
                result.append(rr * n + cc)
            }
        }
        return result
    }

    private func gcd(_ a: Int, _ b: Int) -> Int {
        var x = a, y = b
        while y != 0 {
            let t = x % y
            x = y
            y = t
        }
        return max(1, x)
    }

    // MARK: - Line

    private func updateLinePath() {
        let path = UIBezierPath()
        let points = selected.compactMap { idx -> CGPoint? in
            guard idx >= 0, idx < nodes.count else { return nil }
            return nodes[idx].center
        }

        if let first = points.first {
            path.move(to: first)
            for p in points.dropFirst() { path.addLine(to: p) }
            if let finger = currentTouchPoint { path.addLine(to: finger) }
        }

        lineLayer.path = path.cgPath
        lineLayer.lineWidth = configuration.lineWidth

        switch visualState {
        case .normal:
            lineLayer.strokeColor = configuration.lineSelectedColor.cgColor
        case .selected:
            lineLayer.strokeColor = configuration.lineSelectedColor.cgColor
        case .error:
            lineLayer.strokeColor = configuration.lineErrorColor.cgColor
        }
    }

    private func setVisualState(_ state: VisualState) {
        visualState = state

        // 线颜色
        updateLinePath()

        // 点颜色（已选中的点跟随状态变化）
        for idx in selected {
            nodes[idx].apply(state: state == .error ? .error : .selected)
        }
    }
}
