//
//  GestureNodeView.swift
//  JobsGestureUnlock
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

final class GestureNodeView: UIView {
    enum State {
        case normal
        case selected
        case error
    }

    private let borderLayer = CAShapeLayer()
    private let fillLayer = CAShapeLayer()

    var configuration: GestureUnlockConfiguration = .init() {
        didSet { apply(state: state) }
    }

    private(set) var index: Int = 0
    private(set) var state: State = .normal

    init(index: Int) {
        self.index = index
        super.init(frame: .zero)
        isUserInteractionEnabled = false
        layer.addSublayer(fillLayer)
        layer.addSublayer(borderLayer)
        borderLayer.fillColor = JobsCor.clear.cgColor
        fillLayer.fillColor = JobsCor.clear.cgColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath.make(ovalIn: bounds).cgPath
        borderLayer.path = path
        fillLayer.path = path
        borderLayer.byFrame(bounds)
        fillLayer.byFrame(bounds)
    }

    func apply(state: State) {
        self.state = state
        borderLayer.lineWidth = configuration.nodeBorderWidth
        switch state {
        /// 处理 .normal 分支
        case .normal:
            borderLayer.strokeColor = configuration.nodeNormalColor.cgColor
            fillLayer.fillColor = JobsCor.clear.cgColor
        /// 处理 .selected 分支
        case .selected:
            borderLayer.strokeColor = configuration.nodeSelectedColor.cgColor
            fillLayer.fillColor = configuration.nodeFillSelectedColor.cgColor
        /// 处理 .error 分支
        case .error:
            borderLayer.strokeColor = configuration.nodeErrorColor.cgColor
            fillLayer.fillColor = configuration.nodeFillErrorColor.cgColor
        }
    }
}
