//
//  PicLoadDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 10/1/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(Kingfisher)
import Kingfisher
#endif

#if canImport(SDWebImage)
import SDWebImage
#endif

import SnapKit
import GKNavigationBarSwift
import JobsInheritance
import JobsByUIKit
import JobsToast
import JobsScale
import JobsSwiftBaseDefines
import JobsImageTools
import JobsTextTools
/// UIImageView、UIButton网络图@请求时呼吸占位只有请求失败或者解析失败才执行兜底图
final class PicLoadDemoVC: BaseVC {
    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byShowsIndicators(vertical: true, horizontal: false)
            .byAlwaysBounceVertical(true)
            .byContentInset(.init(top: 0, left: 0, bottom: 24, right: 0))
            .byContentInsetAdjustmentBehavior(.never)
            .byAddTo(view) { [unowned self] make in
                make.left.right.bottom.equalTo(view) // 占满
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10.h)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()
    // MARK: - UIImageView
    private lazy var localImgLabel: UILabel = {
        UILabel()
            .byText("UIImageView（可点击、长按）➤ 字符串本地图")
            .byTextColor(.secondaryLabel)
            .byFont(.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(scrollView.contentLayoutGuide.snp.top).offset(10.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIImageView@字符串本地图
    private lazy var localImgView: UIImageView = {
        UIImageView()
            .byImage("Ani".img)
            .byContentMode(.scaleToFill)
            .byClipsToBounds()
            .addTapAction { (iv: UIImageView) in
                 "单击图片：\(iv)".toast
            }
            .addLongPressAction(minimumPressDuration: 0.8,
                                allowableMovement: 12,
                                numberOfTouchesRequired: 1) { gr in
                 guard let iv = gr.view as? UIImageView else { return }
                 switch gr.state {
                 case .began:
                     "长按开始 on \(iv)".toast
                 case .ended, .cancelled, .failed:
                     "长按结束 on \(iv)".toast
                 default:
                     break
                 }
             }
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(localImgLabel.snp.bottom).offset(6.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
                make.height.equalTo(180.h)
            }
    }()
    private lazy var asyncImgLabel: UILabel = {
        UILabel()
            .byText("UIImageView（可点击、长按）➤ 字符串网络图（呼吸请求、失败兜底）@Kingfisher")
            .byTextColor(.secondaryLabel)
            .byFont(.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(localImgView.snp.bottom).offset(12.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIImageView字符串网络图@Kingfisher
    private lazy var asyncImgView: UIImageView = {
        UIImageView()
            /// 如果图片URL为空 ==> 执行兜底图
            /// 如果图片URL不为空，请求阶段是呼吸效果，请求失败 ==> 执行兜底图
            .byShimmeringAsyncImageKF(JobsDemoImageURLProvider.common_400x300, placeholder: "Ani".img)
            .byContentMode(.scaleToFill)
            .byClipsToBounds()
             .addTapAction { (iv: UIImageView) in
                 "单击图片：\(iv)".toast
             }
             .addLongPressAction(minimumPressDuration: 0.8,
                                 allowableMovement: 12,
                                 numberOfTouchesRequired: 1) { gr in
                 guard let iv = gr.view as? UIImageView else { return }
                 switch gr.state {
                 case .began:
                     "长按开始 on \(iv)".toast
                 case .ended, .cancelled, .failed:
                     "长按结束 on \(iv)".toast
                 default:
                     break
                 }
             }
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(asyncImgLabel.snp.bottom).offset(6.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
                make.height.equalTo(180.h)
            }
    }()
    private lazy var asyncImgSDLabel: UILabel = {
        UILabel()
            .byText("UIImageView（可点击、长按）➤ 字符串网络图（呼吸请求、失败兜底）@SDWebImage")
            .byTextColor(.secondaryLabel)
            .byFont(.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(asyncImgView.snp.bottom).offset(12.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIImageView字符串网络图@SDWebImage
    private lazy var asyncImgViewSD: UIImageView = {
        UIImageView()
            // .sd_setImage(JobsDemoImageURLProvider.common_400x300, placeholder: "Ani".img)
            .byShimmeringAsyncImageSD(JobsDemoImageURLProvider.common_400x300, placeholder: "Ani".img)
            .byContentMode(.scaleToFill)
            .byClipsToBounds()
            .addTapAction { (iv: UIImageView) in
                "单击图片：\(iv)".toast
            }
            .addLongPressAction(minimumPressDuration: 0.8,
                                allowableMovement: 12,
                                numberOfTouchesRequired: 1) { gr in
                guard let iv = gr.view as? UIImageView else { return }
                switch gr.state {
                case .began:
                    "长按开始 on \(iv)".toast
                case .ended, .cancelled, .failed:
                    "长按结束 on \(iv)".toast
                default:
                    break
                }
            }
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(asyncImgSDLabel.snp.bottom).offset(6.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
                make.height.equalTo(180.h)
            }
    }()
    private lazy var wrapperImgKFLabel: UILabel = {
        UILabel()
            .byText("UIImageView（可点击、长按）➤ 字符串网络图（不带呼吸效果、失败兜底）@Kingfisher")
            .byTextColor(.secondaryLabel)
            .byFont(.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(asyncImgViewSD.snp.bottom).offset(12.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIImageView网络图（不带呼吸效果、失败兜底）@Kingfisher
    private lazy var wrapperImgView: UIImageView = {
        UIImageView()
            .byContentMode(.scaleToFill)
            .byClipsToBounds()
//            .kf_setImage(JobsDemoImageURLProvider.common_400x300, placeholder: "Ani".img)
            .kf_setImage(JobsDemoImageURLProvider.common_400x300, placeholder: "Ani".img)
            .byShimmeringAsyncImageKF(JobsDemoImageURLProvider.common_400x300, placeholder: "Ani".img)
            .addTapAction { (iv: UIImageView) in
                "单击图片：\(iv)".toast
            }
            .addLongPressAction(minimumPressDuration: 0.8,
                                allowableMovement: 12,
                                numberOfTouchesRequired: 1) { gr in
                guard let iv = gr.view as? UIImageView else { return }
                switch gr.state {
                case .began:
                    "长按开始 on \(iv)".toast
                case .ended, .cancelled, .failed:
                    "长按结束 on \(iv)".toast
                default:
                    break
                }
            }
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(wrapperImgKFLabel.snp.bottom).offset(6.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
                make.height.equalTo(180.h)
            }
    }()
    private lazy var wrapperImgSDLabel: UILabel = {
        UILabel()
            .byText("UIImageView（可点击、长按）➤ 字符串网络图（不带呼吸效果、失败兜底）@SDWebImage")
            .byTextColor(.secondaryLabel)
            .byFont(.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(wrapperImgView.snp.bottom).offset(12.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIImageView网络图（不带呼吸效果、失败兜底）@SDWebImage
    private lazy var wrapperImgViewSD: UIImageView = {
        UIImageView()
            .byContentMode(.scaleToFill)
            .byClipsToBounds()
//            .byShimmeringAsyncImageSD(JobsDemoImageURLProvider.common_400x300, placeholder: "Ani".img)
            .sd_setImage(JobsDemoImageURLProvider.common_400x300, placeholder: "Ani".img)
            .addTapAction { (iv: UIImageView) in
                "单击图片：\(iv)".toast
            }
            .addLongPressAction(minimumPressDuration: 0.8,
                                allowableMovement: 12,
                                numberOfTouchesRequired: 1) { gr in
                guard let iv = gr.view as? UIImageView else { return }
                switch gr.state {
                case .began:
                    "长按开始 on \(iv)".toast
                case .ended, .cancelled, .failed:
                    "长按结束 on \(iv)".toast
                default:
                    break
                }
            }
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(wrapperImgSDLabel.snp.bottom).offset(6.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
                make.height.equalTo(180.h)
            }
    }()
    // MARK: - UIButton
    private lazy var btnBGLabel: UILabel = {
        UILabel()
            .byText("UIButton背景图(主副标题) ➤ 字符串网络图（带呼吸效果、失败兜底）@SDWebImage")
            .byTextColor(.secondaryLabel)
            .byFont(.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(wrapperImgViewSD.snp.bottom).offset(18.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIButton网络背景图@SDWebImage
    private lazy var btnBG: UIButton = {
        UIButton(type: .system)
            .byCornerRadius(12)
            .byClipsToBounds(true)
            .byTitle("我是UIButton主标题@SDWebImage").byTitleColor(.red)
            .bySubTitle("我是UIButton副标题@SDWebImage").bySubTitleColor(.yellow)
            .sd_imageURL(JobsDemoImageURLProvider.common_400x300)
            .sd_placeholderImage("Ani".img)
            .sd_options([.scaleDownLargeImages, .retryFailed])
            .sd_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
            .onTap { sender in
                print("🔴 Kingfisher@背景图 2 tapped, selected=\(sender.isSelected)")
                "点击了UIButton网络背景图@SDWebImage".toast
            }
            .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                if gr.state == .began {
                    btn.alpha = 0.6
                    print("长按开始 on \(btn)")
                } else if gr.state == .ended || gr.state == .cancelled {
                    btn.alpha = 1.0
                    print("长按结束")
                }
            }
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(btnBGLabel.snp.bottom).offset(6.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
                make.height.equalTo(64.h)
            }
    }()
    private lazy var btnImageLabel: UILabel = {
        UILabel()
            .byText("UIButton前景图(主副标题) ➤ 字符串网络图（不带呼吸效果、失败兜底）@SDWebImage")
            .byTextColor(.secondaryLabel)
            .byFont(.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(btnBG.snp.bottom).offset(12.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIButton网络前景图@SDWebImage
    private lazy var btnImage: UIButton = {
        UIButton(type: .system)
            .byNormalBgColor(.yellow)
            .byCornerRadius(12)
            .byBorderWidth(1)
            .byBorderColor(.systemGray3)
            .byClipsToBounds(true)
            .byTitle("我是UIButton主标题@SDWebImage").byTitleColor(.red)
            .bySubTitle("我是UIButton副标题@SDWebImage").bySubTitleColor(.green)
            .sd_imageURL(JobsDemoImageURLProvider.common_400x300)
            .sd_placeholderImage("Ani".img)
            .sd_options([
                .retryFailed,
                .highPriority,
                .scaleDownLargeImages
            ])
            .sd_normalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
            .onTap { sender in
                print("🔴 Kingfisher@背景图 2 tapped, selected=\(sender.isSelected)")
                "UIButton网络前景图@SDWebImage".toast
            }
            .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                if gr.state == .began {
                    btn.alpha = 0.6
                    print("长按开始 on \(btn)")
                } else if gr.state == .ended || gr.state == .cancelled {
                    btn.alpha = 1.0
                    print("长按结束")
                }
            }
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(btnImageLabel.snp.bottom).offset(6.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
                make.height.greaterThanOrEqualTo(64.h)
            }
    }()
    private lazy var btnBGKFLabel: UILabel = {
        UILabel()
            .byText("UIButton背景图(主副标题) ➤ 字符串网络图（呼吸效果、失败兜底）@Kingfisher")
            .byTextColor(.secondaryLabel)
            .byFont(.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(btnImage.snp.bottom).offset(18.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIButton网络背景图@Kingfisher
    private lazy var btnBG_KF: UIButton = {
        UIButton(type: .system)
            .byCornerRadius(12)
            .byClipsToBounds(true)
            .byTitle("我是UIButton主标题@Kingfisher").byTitleColor(.red)
            .bySubTitle("我是UIButton副标题@Kingfisher").bySubTitleColor(.yellow)
            .kf_imageURL(JobsDemoImageURLProvider.kfButtonFG)
            .kf_placeholderImage("Ani".img)
            .kf_options([
                .processor(DownsamplingImageProcessor(size: CGSize(width: 500, height: 200))),
                .scaleFactor(UIScreen.main.scale),
                .cacheOriginalImage,
                .transition(.fade(0.25)),
                .retryStrategy(DelayRetryStrategy(maxRetryCount: 2, retryInterval: .seconds(1)))
            ])
            .kf_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
            .onTap { sender in
                print("🔴 Kingfisher@背景图 2 tapped, selected=\(sender.isSelected)")
                "UIButton网络背景图@Kingfisher".toast
            }
            .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                if gr.state == .began {
                    btn.alpha = 0.6
                    print("长按开始 on \(btn)")
                } else if gr.state == .ended || gr.state == .cancelled {
                    btn.alpha = 1.0
                    print("长按结束")
                }
            }
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(btnBGKFLabel.snp.bottom).offset(6.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
                make.height.equalTo(64.h)
            }
    }()
    private lazy var btnImageKFLabel: UILabel = {
        UILabel()
            .byText("UIButton前景图(主副标题) ➤ 字符串网络图（不带呼吸效果、失败兜底）@Kingfisher")
            .byTextColor(.secondaryLabel)
            .byFont(.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(btnBG_KF.snp.bottom).offset(12.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIButton网络前景图@Kingfisher
    private lazy var btnImage_KF: UIButton = {
        UIButton(type: .system)
            .byNormalBgColor(.yellow)
            .byCornerRadius(12)
            .byBorderWidth(1)
            .byBorderColor(.systemGray3)
            .byClipsToBounds(true)
            .byTitle("我是UIButton主标题@Kingfisher").byTitleColor(.red)
            .bySubTitle("我是UIButton副标题@Kingfisher").bySubTitleColor(.green)
            .kf_imageURL(JobsDemoImageURLProvider.kfButtonFG)
            .kf_placeholderImage("Ani".img)
            .kf_options([
                .processor(DownsamplingImageProcessor(size: CGSize(width: 500, height: 200))),
                .scaleFactor(UIScreen.main.scale),
                .cacheOriginalImage,
                .transition(.fade(0.25)),
                .retryStrategy(DelayRetryStrategy(maxRetryCount: 2, retryInterval: .seconds(1)))
            ])
            .kf_normalLoad() // 之前是配置项，这里才是真正决定渲染背景图/前景图
            .onTap { sender in
                print("🔴 Kingfisher@背景图 2 tapped, selected=\(sender.isSelected)")
                "UIButton网络前景图@Kingfisher".toast
            }
            .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                if gr.state == .began {
                    btn.alpha = 0.6
                    print("长按开始 on \(btn)")
                } else if gr.state == .ended || gr.state == .cancelled {
                    btn.alpha = 1.0
                    print("长按结束")
                }
            }
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(btnImageKFLabel.snp.bottom).offset(6.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
                make.height.equalTo(64.h)
            }
    }()
    // MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(
            title: "图片加载",
            rightButtons: [
                UIButton.sys()
                    .byTitle("🧹", for: .normal)
                    .onTap { _ in
                        JobsImageCacheCleaner.clearSDWebImageCache { print("清理SDWebImage缓存结束") }
                        JobsImageCacheCleaner.clearKingfisherCache { print("清理Kingfisher缓存结束") }
                    },
                UIButton.sys()
                    .byTitle("⬇️", for: .normal)
                    .onTap { [weak self] _ in
                        guard let self else { return }
                        JobsImageCacheCleaner.clearAllCachesAndForceRedownload(in: self.view) {
                            "清完并重下完成".toast
                        }
                    },
                UIButton.sys()
                    .byTitle(JobsDemoImageURLSwitch.useBadURL ? "切可用URL" : "切不可达URL", for: .normal)
                    .byTitleFont(.systemFont(ofSize: 10, weight: .medium))
                    .byNumberOfLines(1)
                    .byAdd({ make in
                        make.size.equalTo(CGSize(width: 60, height: 44))
                    })
                    .onTap { [weak self] sender in
                        guard let self else { return }
                        JobsDemoImageURLSwitch.useBadURL.toggle()
                        goBack("") // 系统通用返回
                    }
            ]
        )

        scrollView.byVisible(YES)

        localImgLabel.byVisible(YES)
        localImgView.byVisible(YES)     // UIImageView@字符串本地图
        asyncImgLabel.byVisible(YES)
        asyncImgView.byVisible(YES)     // UIImageView字符串网络图@Kingfisher
        asyncImgSDLabel.byVisible(YES)
        asyncImgViewSD.byVisible(YES)   // UIImageView字符串网络图@SDWebImage
        wrapperImgKFLabel.byVisible(YES)
        wrapperImgView.byVisible(YES)   // UIImageView网络图（失败兜底图）@Kingfisher
        wrapperImgSDLabel.byVisible(YES)
        wrapperImgViewSD.byVisible(YES) // UIImageView网络图（失败兜底图）@SDWebImage

        btnBGLabel.byVisible(YES)
        btnBG.byVisible(YES)            // UIButton网络背景图@SDWebImage
        btnImageLabel.byVisible(YES)
        btnImage.byVisible(YES)         // UIButton网络前景图@SDWebImage
        btnBGKFLabel.byVisible(YES)
        btnBG_KF.byVisible(YES)         // UIButton网络背景图@Kingfisher
        btnImageKFLabel.byVisible(YES)
        btnImage_KF.byVisible(YES)      // UIButton网络前景图@Kingfisher
        // 结束滚动内容
        scrollView.contentLayoutGuide.snp.makeConstraints { make in
            make.bottom.equalTo(btnImage_KF.snp.bottom).offset(24)
        }
    }
}
