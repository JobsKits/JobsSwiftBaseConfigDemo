//
//  JobsAppDoorLogoView.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import UIKit
import JobsByUIKit
import JobsSwiftDSL
import SnapKit

enum JobsAppDoorLogoStyle {
    case wide
    case square
}

final class JobsAppDoorLogoView: UIView {
    private lazy var imageView: UIImageView = {
        UIImageView.jobsMake { _ in }
            .byImage(JobsAppDoorResource.image(named: "MainLogo"))
            .byContentMode(.scaleAspectFit)
            .byClipsToBounds(true)
            .byAddTo(self) { make in
                make.edges.equalToSuperview()
            }
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.byVisible(true)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(style: JobsAppDoorLogoStyle) {
        switch style {
        /// 处理 Style1 横向 Logo 分支
        case .wide:
            imageView.byContentMode(.scaleAspectFit)
        /// 处理 Style2 正方形 Logo 分支
        case .square:
            imageView.byContentMode(.scaleAspectFit)
        }
    }
}
