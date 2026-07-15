//
//  JobsSwiftGraphicCaptchaView.swift
//  JobsSwiftGraphicCaptcha
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsSwiftDSL

#if os(iOS) || os(tvOS)
public final class JobsSwiftGraphicCaptchaView: UIView {
    public var config: JobsSwiftGraphicCaptchaConfig = .defaultConfig {
        didSet { refreshCaptcha() }
    }
    public var captchaText: String = "" {
        didSet { setNeedsDisplay() }
    }
    public var font: UIFont = JobsFont.boldSystemFont(ofSize: 18)
    public var textColor: UIColor?
    public var captchaBackgroundColor: UIColor = UIColor(gray: 255, alpha: 0.92)
    public var interferenceLineCount: Int = 7
    public var noisePointCount: Int = 18
    public var shouldRefreshWhenTapped: Bool = true
    public var refreshHandler: ((String) -> Void)?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    public func refreshCaptcha() {
        captchaText = JobsSwiftGraphicCaptchaGenerator.randomText(config: config)
        refreshHandler?(captchaText)
    }

    public func validateInput(_ input: String?) -> Bool {
        JobsSwiftGraphicCaptchaGenerator.validate(input: input,
                                                  captcha: captchaText,
                                                  caseSensitive: config.caseSensitive)
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard !rect.isEmpty, let context = UIGraphicsGetCurrentContext() else { return }
        captchaBackgroundColor.setFill()
        UIRectFill(rect)
        drawNoise(in: rect, context: context)
        drawCaptchaText(in: rect, context: context)
    }
}

private extension JobsSwiftGraphicCaptchaView {
    func commonInit() {
        isOpaque = false
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                    action: #selector(jobs_refreshCaptchaByTap)))
        refreshCaptcha()
    }

    @objc func jobs_refreshCaptchaByTap() {
        if shouldRefreshWhenTapped {
            refreshCaptcha()
        }
    }

    func drawCaptchaText(in rect: CGRect, context: CGContext) {
        let text = captchaText.isEmpty ? JobsSwiftGraphicCaptchaGenerator.randomText(config: config) : captchaText
        let characters = text.map { String($0) }
        guard !characters.isEmpty else { return }
        let cellWidth = rect.width / CGFloat(characters.count)
        let centerY = rect.midY
        for (idx, character) in characters.enumerated() {
            let textColor = self.textColor ?? JobsSwiftGraphicCaptchaView.randomColor(alpha: 0.95)
            let attributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: textColor
            ]
            let textSize = character.size(withAttributes: attributes)
            let x = cellWidth * CGFloat(idx) + max(2, (cellWidth - textSize.width) / 2) + Self.randomCGFloat(-2, 2)
            let y = centerY - textSize.height / 2 + Self.randomCGFloat(-4, 4)
            context.saveGState()
            context.translateBy(x: x + textSize.width / 2, y: y + textSize.height / 2)
            context.rotate(by: Self.randomCGFloat(-0.28, 0.28))
            character.draw(at: CGPoint(x: -textSize.width / 2, y: -textSize.height / 2),
                           withAttributes: attributes)
            context.restoreGState()
        }
    }

    func drawNoise(in rect: CGRect, context: CGContext) {
        context.setLineWidth(1)
        for _ in 0..<max(interferenceLineCount, 0) {
            context.setStrokeColor(Self.randomColor(alpha: 0.72).cgColor)
            context.move(to: CGPoint(x: Self.randomCGFloat(rect.minX, rect.maxX),
                                     y: Self.randomCGFloat(rect.minY, rect.maxY)))
            context.addLine(to: CGPoint(x: Self.randomCGFloat(rect.minX, rect.maxX),
                                        y: Self.randomCGFloat(rect.minY, rect.maxY)))
            context.strokePath()
        }
        for _ in 0..<max(noisePointCount, 0) {
            let pointRect = CGRect(x: Self.randomCGFloat(rect.minX, rect.maxX),
                                   y: Self.randomCGFloat(rect.minY, rect.maxY),
                                   width: Self.randomCGFloat(1, 2.4),
                                   height: Self.randomCGFloat(1, 2.4))
            Self.randomColor(alpha: 0.55).setFill()
            UIRectFill(pointRect)
        }
    }

    static func randomCGFloat(_ minValue: CGFloat, _ maxValue: CGFloat) -> CGFloat {
        guard maxValue > minValue else { return minValue };return minValue + (maxValue - minValue) * CGFloat.random(in: 0...1)
    }

    static func randomColor(alpha: CGFloat) -> UIColor {
        UIColor(h: randomCGFloat(0, 1),
                s: randomCGFloat(0.45, 0.95),
                b: randomCGFloat(0.45, 0.95),
                a: alpha)
    }
}
#endif
