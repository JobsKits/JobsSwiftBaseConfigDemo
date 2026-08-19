//
//  Demo@图片加载.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsToast
import JobsScale
import JobsSwiftBaseDefines
import JobsImageTools
import JobsTextTools
import SnapKit
import GKNavigationBarSwift

#if canImport(Kingfisher)
import Kingfisher
#endif
#if canImport(SDWebImage)
import SDWebImage
#endif

/// UIImageView、UIButton网络图@请求时呼吸占位只有请求失败或者解析失败才执行兜底图

final class PicLoadDemoVC: BaseVC {
    private lazy var scrollView: UIScrollView = {
        UIScrollView.jobsMake { _ in }
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
        UILabel.jobsMake { _ in }
            .byText("UIImageView（可点击、长按）➤ 字符串本地图".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(scrollView.contentLayoutGuide.snp.top).offset(10.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIImageView@字符串本地图
    private lazy var localImgView: UIImageView = {
        UIImageView.jobsMake { _ in }
            .byImage("Ani".img)
            .byContentMode(.scaleToFill)
            .byClipsToBounds()
            .addTapAction { [weak self] (iv: UIImageView) in
                 "单击图片：\(iv)".toast
            }
            .addLongPressAction(minimumPressDuration: 0.8,
                                allowableMovement: 12,
                                numberOfTouchesRequired: 1) { gr in
                 guard let iv = gr.view as? UIImageView else { return }
                 switch gr.state {
                 /// 处理 .began 分支
                 case .began:
                     "长按开始 on \(iv)".toast
                 /// 合并处理 .ended、.cancelled、.failed 分支
                 case .ended, .cancelled, .failed:
                     "长按结束 on \(iv)".toast
                 /// 未匹配已知分支时执行兜底处理
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
        UILabel.jobsMake { _ in }
            .byText("UIImageView（可点击、长按）➤ 字符串网络图（自动加载、呼吸请求、失败兜底）".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(localImgView.snp.bottom).offset(12.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIImageView字符串网络图@自动加载
    private lazy var asyncImgView: UIImageView = {
        UIImageView.jobsMake { _ in }
            /// 如果图片URL为空 ==> 执行兜底图
            /// 如果图片URL不为空，请求阶段是呼吸效果，请求失败 ==> 执行兜底图
            .jobs_setImage(JobsDemoImageURLProvider.common_400x300, fallback: "Ani".img)
            .byContentMode(.scaleToFill)
            .byClipsToBounds()
            .addTapAction {[weak self] (iv: UIImageView) in
                 "单击图片：\(iv)".toast
            }
             .addLongPressAction(minimumPressDuration: 0.8,
                                 allowableMovement: 12,
                                 numberOfTouchesRequired: 1) { gr in
                 guard let iv = gr.view as? UIImageView else { return }
                 switch gr.state {
                 /// 处理 .began 分支
                 case .began:
                     "长按开始 on \(iv)".toast
                 /// 合并处理 .ended、.cancelled、.failed 分支
                 case .ended, .cancelled, .failed:
                     "长按结束 on \(iv)".toast
                 /// 未匹配已知分支时执行兜底处理
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
        UILabel.jobsMake { _ in }
            .byText("UIImageView（可点击、长按）➤ 字符串网络图（指定 SDWebImage、呼吸请求、失败兜底）".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(asyncImgView.snp.bottom).offset(12.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIImageView字符串网络图@指定 SDWebImage
    private lazy var asyncImgViewSD: UIImageView = {
        UIImageView.jobsMake { _ in }
            .jobs_setImage(JobsDemoImageURLProvider.common_400x300, fallback: "Ani".img, preferredLoader: .sdwebimage)
            .byContentMode(.scaleToFill)
            .byClipsToBounds()
            .addTapAction {[weak self] (iv: UIImageView) in
                "单击图片：\(iv)".toast
            }
            .addLongPressAction(minimumPressDuration: 0.8,
                                allowableMovement: 12,
                                numberOfTouchesRequired: 1) { gr in
                guard let iv = gr.view as? UIImageView else { return }
                switch gr.state {
                /// 处理 .began 分支
                case .began:
                    "长按开始 on \(iv)".toast
                /// 合并处理 .ended、.cancelled、.failed 分支
                case .ended, .cancelled, .failed:
                    "长按结束 on \(iv)".toast
                /// 未匹配已知分支时执行兜底处理
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
        UILabel.jobsMake { _ in }
            .byText("UIImageView（可点击、长按）➤ 字符串网络图（指定 Kingfisher、失败兜底）".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(asyncImgViewSD.snp.bottom).offset(12.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIImageView网络图（不带呼吸效果、失败兜底）@指定 Kingfisher
    private lazy var wrapperImgView: UIImageView = {
        UIImageView.jobsMake { _ in }
            .byContentMode(.scaleToFill)
            .byClipsToBounds()
            .jobs_setImage(JobsDemoImageURLProvider.common_400x300, fallback: "Ani".img, shimmerConfig: nil, preferredLoader: .kingfisher)
            .addTapAction {[weak self] (iv: UIImageView) in
                "单击图片：\(iv)".toast
            }
            .addLongPressAction(minimumPressDuration: 0.8,
                                allowableMovement: 12,
                                numberOfTouchesRequired: 1) { gr in
                guard let iv = gr.view as? UIImageView else { return }
                switch gr.state {
                /// 处理 .began 分支
                case .began:
                    "长按开始 on \(iv)".toast
                /// 合并处理 .ended、.cancelled、.failed 分支
                case .ended, .cancelled, .failed:
                    "长按结束 on \(iv)".toast
                /// 未匹配已知分支时执行兜底处理
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
        UILabel.jobsMake { _ in }
            .byText("UIImageView（可点击、长按）➤ 字符串网络图（指定 URLSession、失败兜底）".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(wrapperImgView.snp.bottom).offset(12.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIImageView网络图（不带呼吸效果、失败兜底）@指定 URLSession
    private lazy var wrapperImgViewSD: UIImageView = {
        UIImageView.jobsMake { _ in }
            .byContentMode(.scaleToFill)
            .byClipsToBounds()
            .jobs_setImage(JobsDemoImageURLProvider.common_400x300, fallback: "Ani".img, shimmerConfig: nil, preferredLoader: .urlSession)
            .addTapAction {[weak self] (iv: UIImageView) in
                "单击图片：\(iv)".toast
            }
            .addLongPressAction(minimumPressDuration: 0.8,
                                allowableMovement: 12,
                                numberOfTouchesRequired: 1) { gr in
                guard let iv = gr.view as? UIImageView else { return }
                switch gr.state {
                /// 处理 .began 分支
                case .began:
                    "长按开始 on \(iv)".toast
                /// 合并处理 .ended、.cancelled、.failed 分支
                case .ended, .cancelled, .failed:
                    "长按结束 on \(iv)".toast
                /// 未匹配已知分支时执行兜底处理
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
        UILabel.jobsMake { _ in }
            .byText("UIButton背景图(主副标题) ➤ 字符串网络图（带呼吸效果、失败兜底）@SDWebImage".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(wrapperImgViewSD.snp.bottom).offset(18.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIButton网络背景图@SDWebImage
    private lazy var btnBG: UIButton = {
        UIButton.sys()
            .byCornerRadius(12)
            .byClipsToBounds(true)
            .byTitle("我是UIButton主标题@SDWebImage".tr).byTitleColor(JobsCor.red)
            .bySubTitle("我是UIButton副标题@SDWebImage".tr).bySubTitleColor(JobsCor.yellow)
            .sd_imageURL(JobsDemoImageURLProvider.common_400x300)
            .sd_placeholderImage("Ani".img)
            .sd_options([.scaleDownLargeImages, .retryFailed])
            .sd_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
            .onTap { sender in
                print("🔴 Kingfisher@背景图 2 tapped, selected=\(sender.isSelected)")
                "点击了UIButton网络背景图@SDWebImage".tr.toast
            }
            .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                if gr.state == .began {
                    btn.byAlpha(0.6)
                    print("长按开始 on \(btn)")
                } else if gr.state == .ended || gr.state == .cancelled {
                    btn.byAlpha(1.0)
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
        UILabel.jobsMake { _ in }
            .byText("UIButton前景图(主副标题) ➤ 字符串网络图（指定 SDWebImage、失败兜底）@SDWebImage".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(btnBG.snp.bottom).offset(12.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIButton网络前景图@SDWebImage
    private lazy var btnImage: UIButton = {
        UIButton.sys()
            .byNormalBgColor(JobsCor.yellow)
            .byCornerRadius(12)
            .byBorderWidth(1)
            .byBorderColor(JobsCor.systemGray3)
            .byClipsToBounds(true)
            .byTitle("我是UIButton主标题@SDWebImage".tr).byTitleColor(JobsCor.red)
            .bySubTitle("我是UIButton副标题@SDWebImage".tr).bySubTitleColor(JobsCor.green)
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
                "UIButton网络前景图@SDWebImage".tr.toast
            }
            .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                if gr.state == .began {
                    btn.byAlpha(0.6)
                    print("长按开始 on \(btn)")
                } else if gr.state == .ended || gr.state == .cancelled {
                    btn.byAlpha(1.0)
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
        UILabel.jobsMake { _ in }
            .byText("UIButton背景图(主副标题) ➤ 字符串网络图（呼吸效果、失败兜底）@Kingfisher".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(btnImage.snp.bottom).offset(18.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIButton网络背景图@Kingfisher
    private lazy var btnBG_KF: UIButton = {
        UIButton.sys()
            .byCornerRadius(12)
            .byClipsToBounds(true)
            .byTitle("我是UIButton主标题@Kingfisher".tr).byTitleColor(JobsCor.red)
            .bySubTitle("我是UIButton副标题@Kingfisher".tr).bySubTitleColor(JobsCor.yellow)
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
                "UIButton网络背景图@Kingfisher".tr.toast
            }
            .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                if gr.state == .began {
                    btn.byAlpha(0.6)
                    print("长按开始 on \(btn)")
                } else if gr.state == .ended || gr.state == .cancelled {
                    btn.byAlpha(1.0)
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
        UILabel.jobsMake { _ in }
            .byText("UIButton前景图(主副标题) ➤ 字符串网络图（指定 Kingfisher、失败兜底）@Kingfisher".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byNumberOfLines(0)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(btnBG_KF.snp.bottom).offset(12.h)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20.w)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).inset(20.w)
            }
    }()
    /// UIButton网络前景图@Kingfisher
    private lazy var btnImage_KF: UIButton = {
        UIButton.sys()
            .byNormalBgColor(JobsCor.yellow)
            .byCornerRadius(12)
            .byBorderWidth(1)
            .byBorderColor(JobsCor.systemGray3)
            .byClipsToBounds(true)
            .byTitle("我是UIButton主标题@Kingfisher".tr).byTitleColor(JobsCor.red)
            .bySubTitle("我是UIButton副标题@Kingfisher".tr).bySubTitleColor(JobsCor.green)
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
                "UIButton网络前景图@Kingfisher".tr.toast
            }
            .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                if gr.state == .began {
                    btn.byAlpha(0.6)
                    print("长按开始 on \(btn)")
                } else if gr.state == .ended || gr.state == .cancelled {
                    btn.byAlpha(1.0)
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
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(
            title: "图片加载".tr,
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
                            "清完并重下完成".tr.toast
                        }
                    },
                UIButton.sys()
                    .byTitle(JobsDemoImageURLSwitch.useBadURL ? "切可用URL" : "切不可达URL", for: .normal)
                    .byTitleFont(JobsFont.systemFont(ofSize: 10, weight: .medium))
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
