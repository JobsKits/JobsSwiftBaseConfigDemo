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
import JobsSwiftDSL

final class MosaicThicknessControl: UIControl {
    private let minBlockSize: CGFloat = 4
    private let maxBlockSize: CGFloat = 52

    private let trackView = UIView()
    private let thumbView = UIView()
    private let valueLabel = UILabel()

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
        layer.cornerRadius = min(bounds.width / 2, 22)
        trackView.layer.cornerRadius = 4
        thumbView.layer.cornerRadius = 16
        trackView.frame = CGRect(
            x: bounds.midX - 4,
            y: 22,
            width: 8,
            height: max(1, bounds.height - 76)
        )
        valueLabel.frame = CGRect(
            x: 0,
            y: bounds.height - 40,
            width: bounds.width,
            height: 28
        )
        layoutThumb()
    }

    @discardableResult
    func byValueChanged(_ block: @escaping (CGFloat) -> Void) -> Self {
        onValueChanged = block
        return self
    }

    private func setupUI() {
        backgroundColor = UIColor.secondarySystemBackground.withAlphaComponent(0.92)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.18
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 3)

        trackView
            .byBackgroundColor(.tertiaryLabel)
            .byAddTo(self)

        thumbView
            .byBackgroundColor(.systemBlue)
            .byAddTo(self)

        valueLabel
            .byText("\(Int(value))")
            .byTextAlignment(.center)
            .byTextColor(.label)
            .byFont(.systemFont(ofSize: 12, weight: .bold))
            .byAddTo(self)
    }

    private func layoutThumb() {
        let progress = (value - minBlockSize) / (maxBlockSize - minBlockSize)
        let centerY = trackView.frame.maxY - progress * trackView.bounds.height
        thumbView.frame = CGRect(
            x: bounds.midX - 16,
            y: centerY - 16,
            width: 32,
            height: 32
        )
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
