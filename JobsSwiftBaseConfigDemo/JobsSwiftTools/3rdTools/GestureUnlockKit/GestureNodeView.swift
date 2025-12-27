//
//  GestureNodeView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/16/25.
//

import UIKit

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

        borderLayer.fillColor = UIColor.clear.cgColor
        fillLayer.fillColor = UIColor.clear.cgColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath(ovalIn: bounds).cgPath
        borderLayer.path = path
        fillLayer.path = path
        borderLayer.frame = bounds
        fillLayer.frame = bounds
    }

    func apply(state: State) {
        self.state = state

        borderLayer.lineWidth = configuration.nodeBorderWidth

        switch state {
        case .normal:
            borderLayer.strokeColor = configuration.nodeNormalColor.cgColor
            fillLayer.fillColor = UIColor.clear.cgColor
        case .selected:
            borderLayer.strokeColor = configuration.nodeSelectedColor.cgColor
            fillLayer.fillColor = configuration.nodeFillSelectedColor.cgColor
        case .error:
            borderLayer.strokeColor = configuration.nodeErrorColor.cgColor
            fillLayer.fillColor = configuration.nodeFillErrorColor.cgColor
        }
    }
}
