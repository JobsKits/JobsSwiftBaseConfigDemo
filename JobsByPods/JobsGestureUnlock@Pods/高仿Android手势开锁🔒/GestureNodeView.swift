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

    private let borderLayer = CAShapeLayer.jobsMake { _ in }
    private let fillLayer = CAShapeLayer.jobsMake { _ in }

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
        borderLayer.byFillColor(JobsCor.clear)
        fillLayer.byFillColor(JobsCor.clear)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath.make(ovalIn: bounds).cgPath
        borderLayer.byPath(path)
        fillLayer.byPath(path)
        borderLayer.byFrame(bounds)
        fillLayer.byFrame(bounds)
    }

    func apply(state: State) {
        self.state = state
        borderLayer.byLineWidth(configuration.nodeBorderWidth)
        switch state {
        /// 处理 .normal 分支
        case .normal:
            borderLayer.byStrokeColor(configuration.nodeNormalColor)
            fillLayer.byFillColor(JobsCor.clear)
        /// 处理 .selected 分支
        case .selected:
            borderLayer.byStrokeColor(configuration.nodeSelectedColor)
            fillLayer.byFillColor(configuration.nodeFillSelectedColor)
        /// 处理 .error 分支
        case .error:
            borderLayer.byStrokeColor(configuration.nodeErrorColor)
            fillLayer.byFillColor(configuration.nodeFillErrorColor)
        }
    }
}
