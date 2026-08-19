//
//  JobsChargingProgressIconView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月29日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftBaseDefines
import SnapKit

final class JobsChargingProgressIconView: UIView {
    private static let segmentCount = 3
    private var phase = 0

    private lazy var firstSegment: UIView = {
        makeSegment()
            .byAddTo(self) { [unowned self] make in
                make.right.equalTo(self.secondSegment.snp.left).offset(-3)
                make.bottom.equalToSuperview()
                make.width.equalTo(5)
                make.height.equalTo(8)
            }
    }()

    private lazy var secondSegment: UIView = {
        makeSegment()
            .byAddTo(self) { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview()
                make.width.equalTo(5)
                make.height.equalTo(13)
            }
    }()

    private lazy var thirdSegment: UIView = {
        makeSegment()
            .byAddTo(self) { [unowned self] make in
                make.left.equalTo(self.secondSegment.snp.right).offset(3)
                make.bottom.equalToSuperview()
                make.width.equalTo(5)
                make.height.equalTo(18)
            }
    }()

    private lazy var segments: [UIView] = [
        firstSegment,
        secondSegment,
        thirdSegment
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        segments.forEach { $0.byVisible(YES) }
        update(phase: 0)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        isUserInteractionEnabled = false
        segments.forEach { $0.byVisible(YES) }
        update(phase: 0)
    }

    override func tintColorDidChange() {
        super.tintColorDidChange()
        applyColors()
    }

    func update(phase: Int) {
        self.phase = max(0, phase) % Self.segmentCount
        applyColors()
    }
}

private extension JobsChargingProgressIconView {
    func makeSegment() -> UIView {
        UIView.jobsMake { _ in }
            .byCornerRadius(1.5)
            .byClipsToBounds(YES)
    }

    func applyColors() {
        let activeCount = phase + 1
        segments.enumerated().forEach { index, segment in
            segment.byBackgroundColor(
                index < activeCount
                    ? JobsCor.systemGreen
                    : (tintColor ?? JobsCor.secondaryLabel).withAlphaComponent(0.35)
            )
        }
    }
}
