//
//  MosaicWholeImageDemoVC.swift
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
import JobsScale
import JobsImageTools
import SnapKit
import GKNavigationBarSwift

final class MosaicWholeImageDemoVC: MosaicBaseDemoVC {
    override var pageTitle: String { "整图粗细马赛克" }
    override var preferredLoader: JobsImageLoaderPreference { .sdwebimage }

    private var renderVersion = 0

    private lazy var thicknessControl: MosaicThicknessControl = {
        MosaicThicknessControl()
            .byHidden(true)
            .byAlpha(0)
            .byValueChanged { [weak self] value in
                self?.applyMosaic(blockSize: value)
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(24.h)
                make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(8.w)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(24.h)
                make.width.equalTo(58.w)
            }
    }()

    override func makeRightButtons() -> [UIButton] {
        [
            UIButton.sys()
                .byFrame(CGRect(x: 0, y: 0, width: 32.w, height: 32.h))
                .byImage("slider.vertical.3".sysImg, for: .normal)
                .byImage("slider.vertical.3".sysImg, for: .selected)
                .onTap { [weak self] sender in
                    guard let self else { return }
                    sender.byToggleSelected()
                    let isSelected = sender.isSelected
                    self.toggleThicknessControl(isSelected)
                    if isSelected {
                        self.applyMosaic(blockSize: self.thicknessControl.value)
                    }
                }
        ]
    }

    private func toggleThicknessControl(_ visible: Bool) {
        if visible {
            thicknessControl.byHidden(false)
        }

        UIView.jobsAnimateWithCompletion(
            0.2,
            animations: { [weak self] in
                self?.thicknessControl.byAlpha(visible ? 1 : 0)
            },
            completion: { [weak self] _ in
                if visible == false {
                    self?.thicknessControl.byHidden(true)
                }
            }
        )
    }

    private func applyMosaic(blockSize: CGFloat) {
        guard let originalImage else { return }
        renderVersion += 1
        let currentVersion = renderVersion
        hasEdited = true
        loadingLabel.byText("马赛克处理中...".tr).byHidden(false)

        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let image = originalImage.jobs_mosaicPixelated(blockSize: blockSize)
            DispatchQueue.main.async {
                guard let self, self.renderVersion == currentVersion else { return }
                self.imageView.byImage(image)
                self.loadingLabel.byHidden(true)
            }
        }
    }
}
