//
//  镂空特效DemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/17/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import JobsByUIKit
import Inheritance

final class TransparentRegionVC: BaseVC {
    private let horizontalInset: CGFloat = 16
    private var didInitHoleRect = false
    private lazy var titleLabel: UILabel = {
        UILabel()
            .byText("iOS-UIView设置阴影效果")
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byBgCor(.systemYellow)
            .byShadowColor(.systemBlue)
            .byShadowOpacity(0.8)
            .byShadowOffset(.zero)
            .byCornerRadius(9)
            .byShadowRadius(9)
            .byMasksToBounds(NO)
            .byAddTo(view) { [unowned self] make in
                make.top.equalToSuperview().offset(400)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(200)
            }
    }()

    private lazy var overlayView: HollowOverlayView = {
        let v = HollowOverlayView()
        v.overlayColor = UIColor.white.withAlphaComponent(0.5)
        v.holeShape = .oval              // 想要圆角矩形：.roundedRect(12)
        return v.byAddTo(view) { make in
            make.edges.equalToSuperview()
        }
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        jobsSetupGKNav(title: "镂空效果")
        titleLabel.byVisible(YES)
        overlayView.byVisible(YES)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !didInitHoleRect {
            didInitHoleRect = true
            let size: CGFloat = 200
            let x = (view.bounds.width - size) * 0.5
            let y = view.safeAreaInsets.top + 60
            overlayView.holeRect = CGRect(x: x, y: y, width: size, height: size)
        }
        titleLabel.layer.shadowPath = UIBezierPath(
            roundedRect: titleLabel.bounds,
            cornerRadius: 9
        ).cgPath
    }
}
