//
//  MosaicBrushDemoVC.swift
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
import JobsToast
import JobsImageTools

final class MosaicBrushDemoVC: MosaicBaseDemoVC {
    override var pageTitle: String { "手势涂抹马赛克" }
    override var preferredLoader: JobsImageLoaderPreference { .kingfisher }
    override var imageForSaving: UIImage? { currentImage ?? imageView.image }

    private let brushDiameter: CGFloat = 56
    private var currentImage: UIImage?
    private var wholeMosaicImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.onBrushPan = { [weak self] previous, current in
            self?.paintMosaic(from: previous, to: current)
        }
    }

    override func makeRightButtons() -> [UIButton] {
        [
            UIButton.sys()
                .byFrame(CGRect(x: 0, y: 0, width: 32.w, height: 32.h))
                .byImage("paintbrush".sysImg, for: .normal)
                .byImage("paintbrush.fill".sysImg, for: .selected)
                .onTap { [weak self] sender in
                    guard let self else { return }
                    sender.isSelected.toggle()
                    self.imageView.isBrushEnabled = sender.isSelected
                    (sender.isSelected ? "涂抹马赛克已开启" : "涂抹马赛克已关闭").toast
                }
        ]
    }

    override func onImageLoaded(_ image: UIImage) {
        currentImage = image
        wholeMosaicImage = image.jobs_mosaicPixelated(blockSize: 18)
    }

    private func paintMosaic(from previousViewPoint: CGPoint?, to currentViewPoint: CGPoint) {
        guard imageView.isBrushEnabled,
              let originalImage,
              let wholeMosaicImage,
              let currentImage else { return }
        guard let currentImagePoint = imageView.jobs_mosaicImagePoint(
            from: currentViewPoint,
            imageSize: originalImage.size
        ) else { return }

        let previousImagePoint = previousViewPoint.flatMap {
            imageView.jobs_mosaicImagePoint(from: $0, imageSize: originalImage.size)
        } ?? currentImagePoint
        let centers = MosaicDemoPointSampler.points(
            from: previousImagePoint,
            to: currentImagePoint,
            step: brushDiameter / 3
        )
        let image = currentImage.jobs_mosaicPainted(
            with: wholeMosaicImage,
            centers: centers,
            brushDiameter: brushDiameter
        )
        self.currentImage = image
        imageView.image = image
        hasEdited = true
    }
}
