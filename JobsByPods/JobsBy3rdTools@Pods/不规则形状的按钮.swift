//
//  不规则形状的按钮.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsByUIKit
import JobsSwiftDSL

/// UI控件始终还是矩形，但是不规则区域以外是无法响应点击事件的

public class IrregularButton: UIButton {

    var points: [CGPoint] = [] { didSet { setNeedsLayout() } }
    var designSize: CGSize? { didSet { setNeedsLayout() } }

    private let maskLayer = CAShapeLayer()
    private let strokeLayer = CAShapeLayer()
    private var cachedPath: CGPath?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        // ✅ 关键：把“整个视图”裁成不规则形状
        layer.mask = maskLayer
        maskLayer.fillColor = JobsCor.black.cgColor

        // 描边层（可选）
        layer.addSublayer(strokeLayer)
        strokeLayer.fillColor = JobsCor.clear.cgColor
        strokeLayer.strokeColor = JobsCor.clear.cgColor
        strokeLayer.lineWidth = 0

        // 不要系统按钮那套高亮干预
//        adjustsImageWhenHighlighted = false
//        showsTouchWhenHighlighted = false
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        let path = buildPath().cgPath
        cachedPath = path

        maskLayer.byFrame(bounds)
        maskLayer.path = path

        strokeLayer.byFrame(bounds)
        strokeLayer.path = path
    }
    // ✅ 点击区域也按不规则形状来
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard let path = cachedPath else { return super.point(inside: point, with: event) };return path.contains(point)
    }

    private func buildPath() -> UIBezierPath {
        let p = UIBezierPath.make()
        guard bounds.width > 0, bounds.height > 0, points.count >= 3 else { return p }

        let pts = scaled(points)
        p.byMove(to: pts[0])
        for i in 1..<pts.count { p.byAddLine(to: pts[i]) }
        p.byClose()
        return p
    }

    private func scaled(_ pts: [CGPoint]) -> [CGPoint] {
        guard let ds = designSize, ds.width > 0, ds.height > 0 else { return pts }
        let sx = bounds.width / ds.width
        let sy = bounds.height / ds.height
        return pts.map { CGPoint(x: $0.x * sx, y: $0.y * sy) }
    }
}
// MARK: - Chain
extension IrregularButton {
    @discardableResult
    public func byPoints(_ pts: [CGPoint], designSize: CGSize? = nil) -> Self {
        points = pts
        self.designSize = designSize
        return self
    }
    @discardableResult
    public func byStroke(_ c: UIColor, _ w: CGFloat) -> Self {
        strokeLayer.strokeColor = c.cgColor
        strokeLayer.lineWidth = w
        return self
    }
}
