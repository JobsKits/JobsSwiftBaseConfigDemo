//
//  MosaicBaseDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年6月30日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsByUIKit
import JobsSwiftDSL
import JobsScale
import JobsToast
import JobsImageTools
import JobsInheritance
import SnapKit
import GKNavigationBarSwift

class MosaicBaseDemoVC: BaseVC {
    var pageTitle: String { "打马赛克" }
    var preferredLoader: JobsImageLoaderPreference { .automatic }
    var imageForSaving: UIImage? { imageView.image }

    var originalImage: UIImage?
    var hasEdited = false

    private var imageLoadToken: JobsImageLoadToken?
    private var isExitAlertShowing = false
    private var previousInteractivePopEnabled: Bool?
    private var exitAlertController: UIAlertController?

    lazy var imageContainerView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.black)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    lazy var imageView: MosaicBrushImageView = {
        MosaicBrushImageView(frame: .zero)
            .byContentMode(.scaleAspectFit)
            .byClipsToBounds()
            .byUserInteractionEnabled(true)
            .byAddTo(imageContainerView) { make in
                make.edges.equalToSuperview().inset(12)
            }
    }()

    lazy var loadingLabel: UILabel = {
        UILabel()
            .byText("图片加载中...".tr)
            .byTextColor(JobsCor.white)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byAddTo(imageContainerView) { make in
                make.center.equalToSuperview()
                make.left.right.equalToSuperview().inset(24.w)
            }
    }()

    deinit {
        imageLoadToken?.cancel()
        restoreInteractivePopGesture()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(
            title: pageTitle,
            leftButton: makeBackButton(),
            rightButtons: makeRightButtons()
        )
        imageContainerView.byVisible(true)
        imageView.byVisible(true)
        loadingLabel.byVisible(true)
        loadRemoteImage()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lockInteractivePopGesture()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isMovingFromParent || isBeingDismissed || navigationController == nil {
            restoreInteractivePopGesture()
        }
    }

    func makeRightButtons() -> [UIButton] { [] }

    func onImageLoaded(_ image: UIImage) {}

    func requestLeavePage() {
        guard hasEdited, let image = imageForSaving else {
            leavePage()
            return
        }
        guard isExitAlertShowing == false else { return }
        isExitAlertShowing = true
        exitAlertController = UIAlertController(
            title: "是否保存修改后的照片？".tr,
            message: "保存后会写入系统相册。".tr,
            preferredStyle: .alert
        )
        exitAlertController?.addAction(UIAlertAction(title: "取消".tr, style: .cancel) { [weak self] _ in
            self?.isExitAlertShowing = false
        })
        exitAlertController?.addAction(UIAlertAction(title: "不保存".tr, style: .destructive) { [weak self] _ in
            self?.isExitAlertShowing = false
            self?.leavePage()
        })
        exitAlertController?.addAction(UIAlertAction(title: "保存并退出".tr, style: .default) { [weak self] _ in
            guard let self else { return }
            self.saveImageAndLeave(image)
        })
        if let exitAlertController {
            present(exitAlertController, animated: true)
        }
    }

    func makeBackButton() -> UIButton {
        UIButton.sys()
            .byFrame(CGRect(x: 0, y: 0, width: 32.w, height: 32.h))
            .byImage("chevron.left".sysImg, for: .normal)
            .onTap { [weak self] _ in
                self?.requestLeavePage()
            }
    }

    private func loadRemoteImage() {
        guard let url = URL(string: MosaicDemoImageURLProvider.sampleImage) else {
            loadingLabel.byText("图片地址无效".tr)
            return
        }
        imageView.byImage("Ani".img)
        loadingLabel.byText("图片加载中...".tr).byHidden(false)
        imageLoadToken = JobsImageLoader.shared.load(
            .remote(url),
            options: JobsImageLoadOptions(preferredLoader: preferredLoader)
        ) { [weak self] result in
            guard let self else { return }
            switch result {
            /// 处理 .success 分支
            case .success(let value):
                let image = value.image.jobs_mosaicNormalized()
                self.originalImage = image
                self.imageView.byImage(image)
                self.loadingLabel.byHidden(true)
                self.onImageLoaded(image)
            /// 处理 .failure 分支
            case .failure(let error):
                self.loadingLabel.byText("图片加载失败".tr)
                "图片加载失败：\(error)".toast
            }
        }
    }

    private func saveImageAndLeave(_ image: UIImage) {
        loadingLabel.byText("正在保存到系统相册...".tr).byHidden(false)
        MosaicPhotoAlbumSaver.save(image) { [weak self] result in
            guard let self else { return }
            self.loadingLabel.byHidden(true)
            self.isExitAlertShowing = false
            switch result {
            /// 处理 .success 分支
            case .success:
                "已保存到系统相册".tr.toast
                self.leavePage()
            /// 处理 .failure 分支
            case .failure(let error):
                "保存失败：\(error.localizedDescription)".toast
            }
        }
    }

    private func leavePage() {
        restoreInteractivePopGesture()
        goBack(nil)
    }

    private func lockInteractivePopGesture() {
        guard let gesture = navigationController?.interactivePopGestureRecognizer else { return }
        if previousInteractivePopEnabled == nil {
            previousInteractivePopEnabled = gesture.isEnabled
        }
        gesture.byEnabled(false)
    }

    private func restoreInteractivePopGesture() {
        guard let gesture = navigationController?.interactivePopGestureRecognizer,
              let previousInteractivePopEnabled else { return }
        gesture.byEnabled(previousInteractivePopEnabled)
        self.previousInteractivePopEnabled = nil
    }
}
