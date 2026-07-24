//
//  JobsLabelScrollController.swift
//  JobsSwiftUILabelScrolling
//
//  Created by Jobs on 2026年7月17日，星期五.
//

import UIKit
import QuartzCore
import JobsSwiftDSL
import JobsSwiftTimer

private enum JobsLabelScrollAttribute {
    static let concealed = NSAttributedString.Key("com.jobs.scrolling-label.concealed")
}

final class JobsLabelScrollController: @unchecked Sendable {
    private weak var label: UILabel?
    private let viewportLayer = CALayer()
    private let textLayer = JobsCoreTextScrollLayer()

    private var configuration: JobsLabelScrollConfiguration = .continuous()
    private var timer: JobsSwiftTimerProtocol?
    private var startRequested = false
    private var needsRebuild = false
    private var isOverflowing = false
    private var isConcealed = false

    private var sourceInitialized = false
    private var sourceAttributedText: NSAttributedString?
    private var sourcePlainText: String?
    private var sourceTextColor = UIColor.black
    private var sourceFont = UIFont.systemFont(ofSize: UIFont.labelFontSize)
    private var sourceShadowColor: UIColor?

    private var concealedAttributedText: NSAttributedString?
    private var lastBoundsSize = CGSize.zero
    private var lastTimestamp: CFTimeInterval = 0
    private var offsetX: CGFloat = 0
    private var travelDirection: CGFloat = 1
    private var delayRemaining: TimeInterval = 0

    var isRunning: Bool {
        isOverflowing && timer?.isRunning == true
    }

    init(label: UILabel) {
        self.label = label
        viewportLayer.masksToBounds = true
        viewportLayer.contentsScale = UIScreen.main.scale
        viewportLayer.addSublayer(textLayer)
    }

    deinit {
        timer?.stop()
    }

    func configure(_ configuration: JobsLabelScrollConfiguration) {
        requireMainThread()
        self.configuration = configuration
        guard startRequested else { return }
        captureExternalSourceIfNeeded()
        // 刷新频率或定时器内核可能已经变化，重建时必须使用新配置。
        stopTimer()
        rebuild()
    }

    func start() {
        requireMainThread()
        startRequested = true
        if !sourceInitialized {
            captureCurrentSource()
        } else {
            captureExternalSourceIfNeeded()
        }
        rebuild()
    }

    func pause() {
        requireMainThread()
        timer?.pause()
        lastTimestamp = 0
    }

    func resume() {
        requireMainThread()
        guard startRequested else { return }
        if needsRebuild || !isOverflowing {
            captureExternalSourceIfNeeded()
            rebuild()
        } else if let timer {
            timer.resume()
            lastTimestamp = CACurrentMediaTime()
        } else {
            createAndStartTimer()
        }
    }

    func reload() {
        requireMainThread()
        captureExternalSourceIfNeeded(force: true)
        guard startRequested else { return }
        rebuild()
    }

    func stop() {
        requireMainThread()
        captureExternalSourceIfNeeded()
        startRequested = false
        stopTimer()
        isOverflowing = false
        needsRebuild = false
        removeRenderedText()
        revealSourceText()
    }
}

private extension JobsLabelScrollController {
    func rebuild() {
        guard let label else {
            stopTimer()
            return
        }
        let size = label.bounds.size
        guard size.width > 0, size.height > 0 else {
            needsRebuild = true
            createAndStartTimer()
            return
        }
        needsRebuild = false
        lastBoundsSize = size

        guard label.numberOfLines == 1,
              let attributedText = renderedAttributedText(),
              attributedText.length > 0 else {
            stopForStaticText()
            return
        }
        textLayer.update(
            attributedText: attributedText,
            height: size.height,
            duplicateSpacing: configuration.mode == .continuous ? configuration.spacing : nil
        )
        guard textLayer.textWidth > size.width + 0.5,
              !(configuration.respectsReduceMotion && UIAccessibility.isReduceMotionEnabled) else {
            stopForStaticText()
            return
        }

        isOverflowing = true
        concealSourceText()
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        viewportLayer.frame = label.bounds
        if viewportLayer.superlayer !== label.layer {
            viewportLayer.removeFromSuperlayer()
            label.layer.addSublayer(viewportLayer)
        }
        textLayer.isHidden = false
        offsetX = 0
        travelDirection = 1
        delayRemaining = configuration.startDelay
        applyCurrentOffset()
        CATransaction.commit()
        createAndStartTimer()
    }

    func stopForStaticText() {
        stopTimer()
        isOverflowing = false
        removeRenderedText()
        revealSourceText()
    }

    func createAndStartTimer() {
        guard startRequested else { return }
        if timer == nil {
            let interval = 1.0 / Double(configuration.framesPerSecond)
            let config = JobsSwiftTimerConfig(
                interval: interval,
                repeats: true,
                tolerance: 0,
                queue: .main,
                runLoop: .main,
                runLoopMode: .common,
                pauseInBackground: true,
                autoManageAppState: true
            )
            timer = JobsTimer(kind: configuration.timerKind, config: config) { [weak self] in
                guard let self else { return }
                if Thread.isMainThread {
                    self.tick()
                } else {
                    DispatchQueue.main.async { [weak self] in
                        self?.tick()
                    }
                }
            }
        }
        lastTimestamp = CACurrentMediaTime()
        timer?.start()
    }

    func stopTimer() {
        timer?.stop()
        timer = nil
        lastTimestamp = 0
    }

    func tick() {
        guard startRequested, let label else { return }
        if captureExternalSourceIfNeeded() {
            rebuild()
            return
        }
        if needsRebuild || label.bounds.size != lastBoundsSize {
            rebuild()
            return
        }
        guard isOverflowing else { return }

        let now = CACurrentMediaTime()
        guard lastTimestamp > 0 else {
            lastTimestamp = now
            return
        }
        let elapsed = min(max(0, now - lastTimestamp), 0.1)
        lastTimestamp = now
        if delayRemaining > 0 {
            delayRemaining = max(0, delayRemaining - elapsed)
            return
        }

        switch configuration.mode {
        /// 处理 .continuous 分支
        case .continuous:
            let cycleWidth = textLayer.textWidth + configuration.spacing
            guard cycleWidth > 0 else { return }
            offsetX += configuration.speed * elapsed
            while offsetX >= cycleWidth {
                offsetX -= cycleWidth
            }
        /// 处理 .pingPong 分支
        case .pingPong:
            let maximumOffset = max(0, textLayer.textWidth - label.bounds.width)
            guard maximumOffset > 0 else { return }
            offsetX += travelDirection * configuration.speed * elapsed
            if offsetX >= maximumOffset {
                offsetX = maximumOffset
                travelDirection = -1
                delayRemaining = configuration.edgePause
            } else if offsetX <= 0 {
                offsetX = 0
                travelDirection = 1
                delayRemaining = configuration.edgePause
            }
        }
        applyCurrentOffset()
    }

    func applyCurrentOffset() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        textLayer.setAffineTransform(CGAffineTransform(translationX: -offsetX, y: 0))
        CATransaction.commit()
    }

    func removeRenderedText() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        viewportLayer.removeFromSuperlayer()
        textLayer.setAffineTransform(.identity)
        CATransaction.commit()
    }
}

private extension JobsLabelScrollController {
    @discardableResult
    func captureExternalSourceIfNeeded(force: Bool = false) -> Bool {
        guard let label else { return false }
        guard sourceInitialized else {
            captureCurrentSource()
            return true
        }

        let textChanged: Bool
        if isConcealed {
            if let concealedAttributedText {
                textChanged = !(label.attributedText?.isEqual(to: concealedAttributedText) ?? false)
            } else {
                textChanged = label.attributedText != nil || label.text != sourcePlainText
            }
        } else if let sourceAttributedText {
            textChanged = !(label.attributedText?.isEqual(to: sourceAttributedText) ?? false)
        } else {
            textChanged = label.attributedText != nil || label.text != sourcePlainText
        }

        let fontChanged = !label.font.isEqual(sourceFont)
        let colorChanged: Bool
        if isConcealed {
            colorChanged = !label.textColor.isEqual(UIColor.clear)
        } else {
            colorChanged = !label.textColor.isEqual(sourceTextColor)
        }
        guard force || textChanged || fontChanged || colorChanged else { return false }

        if force, isConcealed, !textChanged, !fontChanged, !colorChanged {
            return true
        }
        captureCurrentSource()
        return true
    }

    func captureCurrentSource() {
        guard let label else { return }
        let currentAttributedText: NSAttributedString?
        if isConcealed,
           let concealedAttributedText,
           label.attributedText?.isEqual(to: concealedAttributedText) == true {
            currentAttributedText = sourceAttributedText
        } else {
            currentAttributedText = label.attributedText
        }

        let inheritsConcealedStyle = currentAttributedText.map {
            guard $0.length > 0 else { return false };return $0.attribute(
                JobsLabelScrollAttribute.concealed,
                at: 0,
                effectiveRange: nil
            ) as? Bool == true
        } ?? false
        if let currentAttributedText,
           currentAttributedText.length > 0,
           !inheritsConcealedStyle,
           !isSystemPlainTextRepresentation(currentAttributedText, for: label) {
            sourceAttributedText = currentAttributedText.copy() as? NSAttributedString
            sourcePlainText = nil
        } else {
            sourceAttributedText = nil
            sourcePlainText = label.text ?? currentAttributedText?.string
        }
        if !isConcealed || !label.textColor.isEqual(UIColor.clear) {
            sourceTextColor = label.textColor
        }
        sourceFont = label.font
        if !isConcealed || label.shadowColor != UIColor.clear {
            sourceShadowColor = label.shadowColor
        }
        sourceInitialized = true
    }

    func renderedAttributedText() -> NSAttributedString? {
        if let sourceAttributedText {
            let result = NSMutableAttributedString(attributedString: sourceAttributedText)
            let fullRange = NSRange(location: 0, length: result.length)
            var missingFontRanges = [NSRange]()
            var missingColorRanges = [NSRange]()
            result.enumerateAttribute(.font, in: fullRange) { value, range, _ in
                if value == nil { missingFontRanges.append(range) }
            }
            result.enumerateAttribute(.foregroundColor, in: fullRange) { value, range, _ in
                if value == nil { missingColorRanges.append(range) }
            }
            missingFontRanges.forEach { result.addAttribute(.font, value: sourceFont, range: $0) }
            missingColorRanges.forEach {
                result.addAttribute(
                    .foregroundColor,
                    value: resolvedColor(sourceTextColor),
                    range: $0
                )
            }
            resolveDynamicForegroundColors(in: result)
            return result
        }
        guard let sourcePlainText, !sourcePlainText.isEmpty else { return nil }
        var attributes: [NSAttributedString.Key: Any] = [
            .font: sourceFont,
            .foregroundColor: resolvedColor(sourceTextColor)
        ]
        if let sourceShadowColor, let label {
            let shadow = NSShadow()
            shadow.shadowColor = resolvedColor(sourceShadowColor)
            shadow.shadowOffset = label.shadowOffset
            attributes[.shadow] = shadow
        };return NSAttributedString(string: sourcePlainText, attributes: attributes)
    }

    /// CoreText 不会随 UILabel 自动重解析动态 UIColor，重建 CTLine 前先固化为当前主题颜色。
    func resolveDynamicForegroundColors(in attributedText: NSMutableAttributedString) {
        guard #available(iOS 13.0, tvOS 13.0, *),
              let label else { return }
        let fullRange = NSRange(location: 0, length: attributedText.length)
        var resolvedColors = [(color: UIColor, range: NSRange)]()
        attributedText.enumerateAttribute(.foregroundColor, in: fullRange) { value, range, _ in
            guard let color = value as? UIColor else { return }
            resolvedColors.append((
                color.resolvedColor(with: label.traitCollection),
                range
            ))
        }
        resolvedColors.forEach {
            attributedText.addAttribute(.foregroundColor, value: $0.color, range: $0.range)
        }
    }

    func resolvedColor(_ color: UIColor) -> UIColor {
        guard #available(iOS 13.0, tvOS 13.0, *),
              let label else { return color };return color.resolvedColor(with: label.traitCollection)
    }

    func concealSourceText() {
        guard let label,
              let renderedText = renderedAttributedText(),
              renderedText.length > 0 else { return }
        let hiddenText = NSMutableAttributedString(attributedString: renderedText)
        let fullRange = NSRange(location: 0, length: hiddenText.length)
        let hiddenShadow = NSShadow()
        hiddenShadow.shadowColor = UIColor.clear
        hiddenShadow.shadowOffset = .zero
        hiddenShadow.shadowBlurRadius = 0
        hiddenText.addAttributes(
            [
                .foregroundColor: UIColor.clear,
                .backgroundColor: UIColor.clear,
                .strokeColor: UIColor.clear,
                .underlineStyle: 0,
                .strikethroughStyle: 0,
                .shadow: hiddenShadow,
                JobsLabelScrollAttribute.concealed: true
            ],
            range: fullRange
        )
        let concealedText = hiddenText.copy() as? NSAttributedString

        concealedAttributedText = concealedText
        label
            .byTextColor(.clear)
            .byLabelShadowColor(.clear)
            .byAttributedString(concealedText)
        isConcealed = true
        label.setNeedsDisplay()
    }

    func revealSourceText() {
        guard isConcealed, let label else { return }
        label
            .byTextColor(sourceTextColor)
            .byLabelShadowColor(sourceShadowColor)
        if let sourceAttributedText {
            label.byAttributedString(sourceAttributedText)
        } else {
            label
                .byAttributedString(nil)
                .byText(sourcePlainText)
        }
        concealedAttributedText = nil
        isConcealed = false
        label.setNeedsDisplay()
    }

    /// UILabel 会把普通 `text` 动态包装成 attributedText；用同配置 UILabel 反向判定其是否为系统合成结果。
    func isSystemPlainTextRepresentation(_ attributedText: NSAttributedString,
                                         for label: UILabel) -> Bool {
        guard attributedText.string == label.text else { return false }
        let referenceLabel = UILabel()
            .byFont(label.font)
            .byTextColor(label.textColor)
            .byTextAlignment(label.textAlignment)
            .byLineBreakMode(label.lineBreakMode)
            .byNumberOfLines(label.numberOfLines)
            .byLabelShadowColor(label.shadowColor)
            .byLabelShadowOffset(label.shadowOffset)
            .byAdjustsFontSizeToFitWidth(label.adjustsFontSizeToFitWidth)
            .byMinimumScaleFactor(label.minimumScaleFactor)
            .byBaselineAdjustment(label.baselineAdjustment)
            .byAllowsDefaultTighteningForTruncation(label.allowsDefaultTighteningForTruncation)
            .byText(attributedText.string)
        return referenceLabel.attributedText?.isEqual(to: attributedText) == true
    }

    func requireMainThread() {
        precondition(Thread.isMainThread, "UILabel+Scrolling must be configured on the main thread.")
    }
}
