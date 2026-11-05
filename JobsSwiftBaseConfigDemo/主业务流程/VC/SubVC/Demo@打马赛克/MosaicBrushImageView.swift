//
//  MosaicBrushImageView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年6月30日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if DEBUG
import CryptoKit
#endif

final class MosaicBrushImageView: UIImageView {

    var isBrushEnabled = false
    var onBrushPan: ((CGPoint?, CGPoint) -> Void)?

    private var previousPoint: CGPoint?

#if DEBUG
    private var coverageStrokeStart: String?
    private var coverageRenderedMoves = 0
    private var coverageStrokeState = "brush:idle"

    private var isCoverageRun: Bool {
        ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route")
    }

    private var coverageImageDigest: String? {
        let data: Data?
        if let pixels = image?.cgImage?.dataProvider?.data {
            data = pixels as Data
        } else {
            data = image?.pngData()
        }
        guard let data else {
            return nil
        }
        return SHA256.hash(data: data).map {
            String(format: "%02x", $0)
        }.joined()
    }

    override var isAccessibilityElement: Bool {
        get {
            isCoverageRun || super.isAccessibilityElement
        }
        set {
            super.isAccessibilityElement = newValue
        }
    }

    override var accessibilityIdentifier: String? {
        get {
            isCoverageRun ? "jobs.coverage.mosaic.brush.canvas" : super.accessibilityIdentifier
        }
        set {
            super.accessibilityIdentifier = newValue
        }
    }

    override var accessibilityLabel: String? {
        get {
            isCoverageRun ? coverageStrokeState : super.accessibilityLabel
        }
        set {
            super.accessibilityLabel = newValue
        }
    }

    override var accessibilityValue: String? {
        get {
            isCoverageRun ? (coverageImageDigest ?? "noImage") : super.accessibilityValue
        }
        set {
            super.accessibilityValue = newValue
        }
    }
#endif

    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        isMultipleTouchEnabled = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        guard isBrushEnabled, let point = touches.first?.location(in: self) else {
            super.touchesBegan(touches,
                               with: event)
            return
        }
        previousPoint = point
#if DEBUG
        if isCoverageRun, onBrushPan != nil {
            coverageStrokeStart = coverageImageDigest
            coverageRenderedMoves = 0
            coverageStrokeState = "brush:began"
        }
#endif
        onBrushPan?(nil,
                    point)
    }

    override func touchesMoved(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        guard isBrushEnabled, let point = touches.first?.location(in: self) else {
            super.touchesMoved(touches,
                               with: event)
            return
        }
#if DEBUG
        let imageBefore = isCoverageRun ? coverageImageDigest : nil
#endif
        onBrushPan?(previousPoint,
                    point)
        previousPoint = point
#if DEBUG
        if isCoverageRun, onBrushPan != nil,
           let imageBefore, let imageAfter = coverageImageDigest,
           imageBefore != imageAfter {
            coverageRenderedMoves += 1
        }
#endif
    }

    override func touchesEnded(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
#if DEBUG
        if isCoverageRun, let initial = coverageStrokeStart {
            let completed = coverageRenderedMoves > 0 && coverageImageDigest != initial
            coverageStrokeState = completed ? "brush:completed" : "brush:noRenderedStroke"
            coverageStrokeStart = nil
        }
#endif
        previousPoint = nil
        super.touchesEnded(touches,
                           with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>,
                                   with event: UIEvent?) {
#if DEBUG
        if isCoverageRun, coverageStrokeStart != nil {
            coverageStrokeState = "brush:cancelled"
            coverageStrokeStart = nil
        }
#endif
        previousPoint = nil
        super.touchesCancelled(touches,
                               with: event)
    }
}
