//
//  JobsHandwritingCanvasView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftBaseDefines
import JobsSwiftDSL

final class JobsHandwritingCanvasView: UIView {
    private struct NormalizedPoint: Codable {
        let x: CGFloat
        let y: CGFloat
    }

    var contentDidChange: (() -> Void)?
    var hasStrokes: Bool { !normalizedStrokes.isEmpty }

    private var normalizedStrokes: [[NormalizedPoint]] = []
    private var strokeLayers: [CAShapeLayer] = []
    private var lastLayoutSize = CGSize.zero
    private var strokeColor = JobsThemeCenter.shared.resolvedColor(.textPrimary)

    override init(frame: CGRect) {
        super.init(frame: frame)
        byMultipleTouchEnabled(false)
            .byExclusiveTouch(true)
        JobsThemeCenter.shared.bind(
            self,
            slot: "JobsHandwritingCanvasView.strokeColor"
        ) { object, center in
            guard let canvasView = object as? JobsHandwritingCanvasView else { return }
            canvasView.strokeColor = center.resolvedColor(.textPrimary)
            canvasView.strokeLayers.forEach { $0.byStrokeColor(canvasView.strokeColor) }
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        guard bounds.size != lastLayoutSize else { return }
        lastLayoutSize = bounds.size
        rebuildStrokeLayers()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first,
              let point = normalizedPoint(from: touch.location(in: self)) else { return }
        normalizedStrokes.append([point])
        let strokeLayer = makeStrokeLayer()
        strokeLayers.append(strokeLayer)
        layer.byAddSublayer(strokeLayer)
        updateLatestStrokeLayer()
        contentDidChange?()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first,
              !normalizedStrokes.isEmpty else { return }
        let coalescedTouches = event?.coalescedTouches(for: touch) ?? [touch]
        var appendedPoint = false
        for coalescedTouch in coalescedTouches {
            guard let point = normalizedPoint(from: coalescedTouch.location(in: self)),
                  shouldAppend(point) else { continue }
            normalizedStrokes[normalizedStrokes.count - 1].append(point)
            appendedPoint = true
        }
        guard appendedPoint else { return }
        updateLatestStrokeLayer()
        contentDidChange?()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        appendFinalPoint(from: touches.first)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        appendFinalPoint(from: touches.first)
    }

    func loadEncodedStrokes(_ data: Data) throws {
        normalizedStrokes = try JSONDecoder.make { _ in }.decode([[NormalizedPoint]].self, from: data)
            .map { stroke in
                stroke.filter { (0...1).contains($0.x) && (0...1).contains($0.y) }
            }
            .filter { !$0.isEmpty }
        rebuildStrokeLayers()
    }

    func encodedStrokes() throws -> Data {
        try JSONEncoder.make { _ in }.encode(normalizedStrokes)
    }

    func clearCanvas(notifyChange: Bool = true) {
        guard hasStrokes else { return }
        normalizedStrokes.removeAll()
        strokeLayers.forEach { $0.byRemoveFromSuperlayer() }
        strokeLayers.removeAll()
        if notifyChange {
            contentDidChange?()
        }
    }
}

private extension JobsHandwritingCanvasView {
    private func normalizedPoint(from point: CGPoint) -> NormalizedPoint? {
        guard bounds.width > 0, bounds.height > 0 else { return nil };return NormalizedPoint(
            x: min(max(point.x / bounds.width, 0), 1),
            y: min(max(point.y / bounds.height, 0), 1)
        )
    }

    private func shouldAppend(_ point: NormalizedPoint) -> Bool {
        guard let lastPoint = normalizedStrokes.last?.last else { return true };return hypot(
            point.x - lastPoint.x,
            point.y - lastPoint.y
        ) > 0.001
    }

    func appendFinalPoint(from touch: UITouch?) {
        guard let touch,
              !normalizedStrokes.isEmpty,
              let point = normalizedPoint(from: touch.location(in: self)),
              shouldAppend(point) else { return }
        normalizedStrokes[normalizedStrokes.count - 1].append(point)
        updateLatestStrokeLayer()
        contentDidChange?()
    }

    func makeStrokeLayer() -> CAShapeLayer {
        CAShapeLayer.jobsMake { _ in }
            .byFrame(bounds)
            .byFillColor(JobsCor.clear)
            .byStrokeColor(strokeColor)
            .byLineWidth(4)
            .byLineCap(.round)
            .byLineJoin(.round)
    }

    func rebuildStrokeLayers() {
        strokeLayers.forEach { $0.byRemoveFromSuperlayer() }
        strokeLayers.removeAll()
        for stroke in normalizedStrokes {
            let strokeLayer = makeStrokeLayer()
            strokeLayers.append(strokeLayer)
            layer.byAddSublayer(strokeLayer)
            strokeLayer.byPath(path(for: stroke).cgPath)
        }
    }

    func updateLatestStrokeLayer() {
        guard let stroke = normalizedStrokes.last,
              let strokeLayer = strokeLayers.last else { return }
        strokeLayer.byPath(path(for: stroke).cgPath)
    }

    private func path(for stroke: [NormalizedPoint]) -> UIBezierPath {
        let path = UIBezierPath.make()
        guard let firstPoint = stroke.first else { return path }
        let startPoint = denormalizedPoint(firstPoint)
        path.byMove(to: startPoint)
        if stroke.count == 1 {
            path.byAddLine(to: CGPoint(x: startPoint.x + 0.1, y: startPoint.y))
        } else {
            stroke.dropFirst().forEach { path.byAddLine(to: denormalizedPoint($0)) }
        };return path
    }

    private func denormalizedPoint(_ point: NormalizedPoint) -> CGPoint {
        CGPoint(x: point.x * bounds.width, y: point.y * bounds.height)
    }
}
