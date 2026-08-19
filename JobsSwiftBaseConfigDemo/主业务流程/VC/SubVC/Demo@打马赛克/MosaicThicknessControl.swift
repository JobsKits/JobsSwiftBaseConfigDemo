//
//  MosaicThicknessControl.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年6月30日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftBaseDefines
import JobsSwiftDSL

final class MosaicThicknessControl: UIControl {
    private let minBlockSize: CGFloat = 4
    private let maxBlockSize: CGFloat = 52

    private let trackView = UIView.jobsMake { _ in }
    private let thumbView = UIView.jobsMake { _ in }
    private let valueLabel = UILabel.jobsMake { _ in }

    private(set) var value: CGFloat = 18
    private var onValueChanged: ((CGFloat) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:))))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        byCornerRadius(min(bounds.width / 2, 22))
        trackView.byCornerRadius(4)
        thumbView.byCornerRadius(16)
        trackView.byFrame(CGRect(
            x: bounds.midX - 4,
            y: 22,
            width: 8,
            height: max(1, bounds.height - 76)
        ))
        valueLabel.byFrame(CGRect(
            x: 0,
            y: bounds.height - 40,
            width: bounds.width,
            height: 28
        ))
        layoutThumb()
    }

    @discardableResult
    func byValueChanged(_ block: @escaping (CGFloat) -> Void) -> Self {
        onValueChanged = block
        return self
    }

    private func setupUI() {
        self.byBackgroundColor(JobsCor.secondarySystemBackground.withAlphaComponent(0.92))
        layer.shadowColor = JobsCor.black.cgColor
        layer.shadowOpacity = 0.18
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 3)
        trackView
            .byBackgroundColor(JobsCor.tertiaryLabel)
            .byAddTo(self)
        thumbView
            .byBackgroundColor(JobsCor.systemBlue)
            .byAddTo(self)
        valueLabel
            .byText("\(Int(value))")
            .byTextAlignment(.center)
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 12, weight: .bold))
            .byAddTo(self)
    }

    private func layoutThumb() {
        let progress = (value - minBlockSize) / (maxBlockSize - minBlockSize)
        let centerY = trackView.frame.maxY - progress * trackView.bounds.height
        thumbView.byFrame(CGRect(
            x: bounds.midX - 16,
            y: centerY - 16,
            width: 32,
            height: 32
        ))
    }

    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        let point = gesture.location(in: self)
        updateValue(with: point.y)
    }

    private func updateValue(with locationY: CGFloat) {
        let top = trackView.frame.minY
        let bottom = trackView.frame.maxY
        let clampedY = min(max(locationY, top), bottom)
        let progress = 1 - ((clampedY - top) / max(1, bottom - top))
        value = minBlockSize + progress * (maxBlockSize - minBlockSize)
        valueLabel.byText("\(Int(value))")
        layoutThumb()
        sendActions(for: .valueChanged)
        onValueChanged?(value)
    }
}
