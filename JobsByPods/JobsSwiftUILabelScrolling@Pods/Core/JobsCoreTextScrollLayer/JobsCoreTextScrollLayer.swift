//
//  JobsCoreTextScrollLayer.swift
//  JobsSwiftUILabelScrolling
//
//  Created by Jobs on 2026年7月17日，星期五.
//

import UIKit
import CoreText

/// 文字只由 CoreText 排版和绘制；滚动阶段只改变当前 Layer 的位移。
final class JobsCoreTextScrollLayer: CALayer {
    private var textLine: CTLine?
    private var lineOriginX: CGFloat = 0
    private var baselineY: CGFloat = 0
    private var duplicateOriginX: CGFloat?

    private(set) var textWidth: CGFloat = 0

    override init() {
        super.init()
        contentsScale = UIScreen.main.scale
        drawsAsynchronously = true
        needsDisplayOnBoundsChange = true
        anchorPoint = .zero
    }

    override init(layer: Any) {
        if let layer = layer as? JobsCoreTextScrollLayer {
            textLine = layer.textLine
            lineOriginX = layer.lineOriginX
            baselineY = layer.baselineY
            duplicateOriginX = layer.duplicateOriginX
            textWidth = layer.textWidth
        }
        super.init(layer: layer)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentsScale = UIScreen.main.scale
        drawsAsynchronously = true
        needsDisplayOnBoundsChange = true
        anchorPoint = .zero
    }

    func update(attributedText: NSAttributedString,
                height: CGFloat,
                duplicateSpacing: CGFloat?) {
        let line = CTLineCreateWithAttributedString(attributedText as CFAttributedString)
        var ascent: CGFloat = 0
        var descent: CGFloat = 0
        var leading: CGFloat = 0
        let typographicWidth = CGFloat(
            CTLineGetTypographicBounds(line, &ascent, &descent, &leading)
        )
        let glyphBounds = CTLineGetBoundsWithOptions(
            line,
            [.useOpticalBounds, .includeLanguageExtents]
        )
        let minimumX = min(0, glyphBounds.minX)
        let maximumX = max(typographicWidth, glyphBounds.maxX)
        let measuredWidth = max(0, maximumX - minimumX)
        let normalizedHeight = max(0, height)

        textLine = line
        lineOriginX = -minimumX
        baselineY = max(0, (normalizedHeight - ascent - descent) * 0.5 + descent)
        textWidth = ceil(measuredWidth)

        if let duplicateSpacing {
            duplicateOriginX = lineOriginX + textWidth + max(0, duplicateSpacing)
        } else {
            duplicateOriginX = nil
        }
        let canvasWidth = duplicateOriginX.map { $0 + textWidth } ?? textWidth
        bounds = CGRect(x: 0, y: 0, width: ceil(canvasWidth), height: normalizedHeight)
        position = .zero
        setNeedsDisplay()
    }

    override func draw(in context: CGContext) {
        guard let textLine else { return }
        context.saveGState()
        context.setShouldAntialias(true)
        context.setShouldSmoothFonts(true)
        context.textMatrix = .identity
        context.translateBy(x: 0, y: bounds.height)
        context.scaleBy(x: 1, y: -1)
        context.textPosition = CGPoint(x: lineOriginX, y: baselineY)
        CTLineDraw(textLine, context)
        if let duplicateOriginX {
            context.textPosition = CGPoint(x: duplicateOriginX, y: baselineY)
            CTLineDraw(textLine, context)
        }
        context.restoreGState()
    }
}
