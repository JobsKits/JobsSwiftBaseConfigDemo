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

final class MosaicBrushImageView: UIImageView {
    var isBrushEnabled = false
    var onBrushPan: ((CGPoint?, CGPoint) -> Void)?

    private var previousPoint: CGPoint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        isMultipleTouchEnabled = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isBrushEnabled, let point = touches.first?.location(in: self) else {
            super.touchesBegan(touches, with: event)
            return
        }
        previousPoint = point
        onBrushPan?(nil, point)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isBrushEnabled, let point = touches.first?.location(in: self) else {
            super.touchesMoved(touches, with: event)
            return
        }
        onBrushPan?(previousPoint, point)
        previousPoint = point
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        previousPoint = nil
        super.touchesEnded(touches, with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        previousPoint = nil
        super.touchesCancelled(touches, with: event)
    }
}
