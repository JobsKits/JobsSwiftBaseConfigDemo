//
//  JobsMarqueeDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2025/10/11.
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
import JobsSwiftBaseDefines
import JobsBy3rdTools
import JobsToast
import JobsScale
import JobsTextTools
import JobsMarqueeView
import JobsSwiftFoundation_extensions
/// Demo：13 组 JobsMarqueeView
/// 1. 向上连续滚动
/// 2. 向下连续滚动
/// 3. 向左连续滚动
/// 4. 向右连续滚动
/// 5. 向上间隔滚动
/// 6. 向下间隔滚动
/// 7. 向左间隔滚动
/// 8. 向右间隔滚动
/// 9. 极端：只有 1 个按钮
/// 10. 极端：只有 2 个按钮
/// 11. 本地背景图
/// 12. SDWebImage@背景图
/// 13. Kingfisher@背景图
final class JobsMarqueeDemoVC: BaseVC {
    private let horizontalInset: CGFloat = 16
    private let verticalSpacing: CGFloat = 12
    private let marqueeHeight: CGFloat = 50
    /// 所有 JobsMarqueeView 统一加在这个 scrollView 上
    private lazy var scrollView: UIScrollView = { [unowned self] in
        UIScrollView()
            .byShowsVerticalScrollIndicator(YES)
            .byAlwaysBounceVertical(YES)
            .byAddTo(self.view) { [unowned self] make in
                make.top.equalTo(self.gk_navigationBar.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
    }()
    // MARK: - 1. 向上连续滚动
    private lazy var upContinuousMarquee: JobsMarqueeView = { [unowned self] in
        JobsMarqueeView()
            .byDirection(.top)
            .byScrollMode(.continuous(speed: 40))
            .byItemSizeMode(.fitContent)   // 典型公告跑马灯
            .byDataSourceButtons([
                UIButton.sys()
                    .byBackgroundColor(.systemYellow.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向上连续 · 公告 1", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("更多内容 1", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("megaphone.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向上连续 · 公告 1 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemYellow.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向上连续 · 公告 2", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("更多内容 2", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("megaphone.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向上连续 · 公告 2 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemYellow.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向上连续 · 公告 3", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("更多内容 3", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("megaphone.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向上连续 · 公告 3 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
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
            ])
            .byBgColor(.randomColor)
            .byAddTo(self.scrollView) { [unowned self] make in
                if #available(iOS 11.0, *) {
                    make.top.equalTo(self.scrollView.contentLayoutGuide.snp.top).offset(10)
                    make.left.equalTo(self.scrollView.frameLayoutGuide.snp.left).offset(self.horizontalInset)
                    make.right.equalTo(self.scrollView.frameLayoutGuide.snp.right).inset(self.horizontalInset)
                } else {
                    make.top.equalTo(self.scrollView.snp.top).offset(10)
                    make.left.equalTo(self.scrollView).offset(self.horizontalInset)
                    make.right.equalTo(self.scrollView).inset(self.horizontalInset)
                }
                make.height.equalTo(self.marqueeHeight)
            }
    }()
    // MARK: - 2. 向下连续滚动
    private lazy var downContinuousMarquee: JobsMarqueeView = { [unowned self] in
        JobsMarqueeView()
            .byDirection(.bottom)
            .byScrollMode(.continuous(speed: 40))
            .byItemSizeMode(.fitContent)
            .byDataSourceButtons([
                UIButton.sys()
                    .byBackgroundColor(.systemGreen.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向下连续 · 公告 1", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("更多内容 1", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.down.circle.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向下连续 · 公告 1 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemGreen.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向下连续 · 公告 2", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("更多内容 2", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.down.circle.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向下连续 · 公告 2 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemGreen.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向下连续 · 公告 3", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("更多内容 3", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.down.circle.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向下连续 · 公告 3 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
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
            ])
            .byBgColor(.randomColor)
            .byAddTo(self.scrollView) { [unowned self] make in
                make.top.equalTo(self.upContinuousMarquee.snp.bottom).offset(self.verticalSpacing)
                make.left.right.height.equalTo(self.upContinuousMarquee)
            }
    }()
    // MARK: - 3. 向左连续滚动（典型横向跑马灯）
    private lazy var leftContinuousMarquee: JobsMarqueeView = { [unowned self] in
        JobsMarqueeView()
            .byDirection(.left)
            .byScrollMode(.continuous(speed: 60))
            .byItemSizeMode(.fitContent)
            .byDataSourceButtons([
                UIButton.sys()
                    .byBackgroundColor(.systemOrange.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向左连续 · 公告 1", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("更多内容 1", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.left.circle.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向左连续 · 公告 1 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemOrange.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向左连续 · 公告 2", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("更多内容 2", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.left.circle.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向左连续 · 公告 2 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemOrange.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向左连续 · 公告 3", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("更多内容 3", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.left.circle.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向左连续 · 公告 3 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
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
            ])
            .byBgColor(.randomColor)
            .byAddTo(self.scrollView) { [unowned self] make in
                make.top.equalTo(self.downContinuousMarquee.snp.bottom).offset(self.verticalSpacing)
                make.left.right.height.equalTo(self.upContinuousMarquee)
            }
    }()
    // MARK: - 4. 向右连续滚动
    private lazy var rightContinuousMarquee: JobsMarqueeView = { [unowned self] in
        JobsMarqueeView()
            .byDirection(.right)
            .byScrollMode(.continuous(speed: 60))
            .byItemSizeMode(.fitContent)
            .byDataSourceButtons([
                UIButton.sys()
                    .byBackgroundColor(.systemPink.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向右连续 · 公告 1", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("更多内容 1", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.right.circle.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向右连续 · 公告 1 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemPink.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向右连续 · 公告 2", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("更多内容 2", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.right.circle.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向右连续 · 公告 2 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemPink.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向右连续 · 公告 3", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("更多内容 3", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.right.circle.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向右连续 · 公告 3 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
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
            ])
            .byBgColor(.randomColor)
            .byAddTo(self.scrollView) { [unowned self] make in
                make.top.equalTo(self.leftContinuousMarquee.snp.bottom).offset(self.verticalSpacing)
                make.left.right.height.equalTo(self.upContinuousMarquee)
            }
    }()
    // MARK: - 5. 向上间隔滚动（公告一条一条翻）
    private lazy var upFrequencyMarquee: JobsMarqueeView = { [unowned self] in
        JobsMarqueeView()
            .byDirection(.top)
            .byScrollMode(.frequency(interval: 1.0))
            .byItemSizeMode(.fillBounds)   // 每页 1 行
            .byDataSourceButtons([
                UIButton.sys()
                    .byBackgroundColor(.systemBlue.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向上间隔 · 公告 1", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("每 1 秒翻页", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.up.square.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向上间隔 · 公告 1 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemBlue.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向上间隔 · 公告 2", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("每 1 秒翻页", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.up.square.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向上间隔 · 公告 2 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemBlue.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向上间隔 · 公告 3", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("每 1 秒翻页", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.up.square.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向上间隔 · 公告 3 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
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
            ])
            .byBgColor(.randomColor)
            .byAddTo(self.scrollView) { [unowned self] make in
                make.top.equalTo(self.rightContinuousMarquee.snp.bottom).offset(self.verticalSpacing * 2)
                make.left.right.height.equalTo(self.upContinuousMarquee)
            }
    }()
    // MARK: - 6. 向下间隔滚动
    private lazy var downFrequencyMarquee: JobsMarqueeView = { [unowned self] in
        JobsMarqueeView()
            .byDirection(.bottom)
            .byScrollMode(.frequency(interval: 1.0))
            .byItemSizeMode(.fillBounds)
            .byDataSourceButtons([
                UIButton.sys()
                    .byBackgroundColor(.systemTeal.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向下间隔 · 公告 1", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("每 1 秒翻页", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.down.square.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向下间隔 · 公告 1 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemTeal.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向下间隔 · 公告 2", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("每 1 秒翻页", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.down.square.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向下间隔 · 公告 2 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemTeal.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向下间隔 · 公告 3", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("每 1 秒翻页", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("arrow.down.square.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向下间隔 · 公告 3 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
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
            ])
            .byBgColor(.randomColor)
            .byAddTo(self.scrollView) { [unowned self] make in
                make.top.equalTo(self.upFrequencyMarquee.snp.bottom).offset(self.verticalSpacing)
                make.left.right.height.equalTo(self.upContinuousMarquee)
            }
    }()
    // MARK: - 7. 向左间隔滚动（轮播图：一屏一页）
    private lazy var leftFrequencyMarquee: JobsMarqueeView = { [unowned self] in
        JobsMarqueeView()
            .byDirection(.left)
            .byScrollMode(.frequency(interval: 1.5))
            .byItemSizeMode(.fillBounds)   // 轮播图：一页一个按钮
            .byDataSourceButtons([
                UIButton.sys()
                    .byBackgroundColor(.systemPurple.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向左间隔 · Banner 1", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("轮播图左滑", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("rectangle.portrait.on.rectangle.portrait".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向左间隔 · Banner 1 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemPurple.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向左间隔 · Banner 2", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("轮播图左滑", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("rectangle.portrait.on.rectangle.portrait".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向左间隔 · Banner 2 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemPurple.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向左间隔 · Banner 3", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("轮播图左滑", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("rectangle.portrait.on.rectangle.portrait".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向左间隔 · Banner 3 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
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
            ])
            .byBgColor(.randomColor)
            .byAddTo(self.scrollView) { [unowned self] make in
                make.top.equalTo(self.downFrequencyMarquee.snp.bottom).offset(self.verticalSpacing)
                make.left.right.height.equalTo(self.upContinuousMarquee)
            }
    }()
    // MARK: - 8. 向右间隔滚动（轮播图）
    private lazy var rightFrequencyMarquee: JobsMarqueeView = { [unowned self] in
        JobsMarqueeView()
            .byDirection(.right)
            .byScrollMode(.frequency(interval: 1.5))
            .byItemSizeMode(.fillBounds)
            .byDataSourceButtons([
                UIButton.sys()
                    .byBackgroundColor(.systemIndigo.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向右间隔 · Banner 1", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("轮播图右滑", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("rectangle.portrait.on.rectangle.portrait".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向右间隔 · Banner 1 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemIndigo.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向右间隔 · Banner 2", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("轮播图右滑", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("rectangle.portrait.on.rectangle.portrait".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向右间隔 · Banner 2 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemIndigo.withAlphaComponent(0.2), for: .normal)
                    .byTitle("向右间隔 · Banner 3", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("轮播图右滑", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("rectangle.portrait.on.rectangle.portrait".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔔 向右间隔 · Banner 3 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
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
            ])
            .byBgColor(.randomColor)
            .byAddTo(self.scrollView) { [unowned self] make in
                make.top.equalTo(self.leftFrequencyMarquee.snp.bottom).offset(self.verticalSpacing)
                make.left.right.height.equalTo(self.upContinuousMarquee)
            }
    }()
    // MARK: - 9. 极端：只有 1 个按钮
    private lazy var oneButtonMarquee: JobsMarqueeView = { [unowned self] in
        JobsMarqueeView()
            .byDirection(.left)
            .byScrollMode(.continuous(speed: 40))
            .byItemSizeMode(.fillBounds)   // 视图宽度 == 按钮宽度，内部会复制到至少 3 个
            .byDataSourceButtons([
                UIButton.sys()
                    .byBackgroundColor(.systemRed.withAlphaComponent(0.2), for: .normal)
                    .byTitle("极端 · 只有 1 个按钮", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("测试少量数据源", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("1.circle.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔴 极端 1 个按钮 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
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
            ])
            .byBgColor(.randomColor)
            .byAddTo(self.scrollView) { [unowned self] make in
                make.top.equalTo(self.rightFrequencyMarquee.snp.bottom).offset(self.verticalSpacing * 2)
                make.left.right.height.equalTo(self.upContinuousMarquee)
            }
    }()
    // MARK: - 10. 极端：只有 2 个按钮
    private lazy var twoButtonsMarquee: JobsMarqueeView = { [unowned self] in
        JobsMarqueeView()
            .byDirection(.left)
            .byScrollMode(.continuous(speed: 40))
            .byItemSizeMode(.fillBounds)
            .byDataSourceButtons([
                UIButton.sys()
                    .byBackgroundColor(.systemRed.withAlphaComponent(0.2), for: .normal)
                    .byTitle("极端 · 按钮 1/2", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("测试 2 个按钮", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("2.circle.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔴 极端 2 个按钮 · 1 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
                    },
                UIButton.sys()
                    .byBackgroundColor(.systemRed.withAlphaComponent(0.2), for: .normal)
                    .byTitle("极端 · 按钮 2/2", for: .normal)
                    .byTitleColor(.label, for: .normal)
                    .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
                    .bySubTitle("测试 2 个按钮", for: .normal)
                    .bySubTitleColor(.secondaryLabel, for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 11, weight: .regular))
                    .byImage("2.circle.fill".sysImg, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                    .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔴 极端 2 个按钮 · 2 tapped, selected=\(sender.isSelected)")
                        sender.title?.toast
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
            ])
            .byBgColor(.randomColor)
            .byAddTo(self.scrollView) { [unowned self] make in
                make.top.equalTo(self.oneButtonMarquee.snp.bottom).offset(self.verticalSpacing)
                make.left.right.height.equalTo(self.upContinuousMarquee)
            }
    }()
    // MARK: - 11. 本地@背景图
    private lazy var localImageButtonsMarquee: JobsMarqueeView = {  [unowned self] in
        JobsMarqueeView()
            .byDirection(.left)
            .byScrollMode(.frequency(interval: 1.0))
            .byItemSizeMode(.fillBounds)
            .byManualScrollEnabled(true)   // ✅ 开启手动拖拽
            .byDataSourceButtons([
                UIButton.sys()
                    .byImage("唐老鸭".img, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔴 极端 本地图 · 唐老鸭 tapped, selected=\(sender.isSelected)")
                        "点击了唐老鸭".toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byImage("米老鼠".img, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔴 极端 本地图 · 米老鼠 tapped, selected=\(sender.isSelected)")
                        "点击了米老鼠".toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byImage("迪斯尼".img, for: .normal)
                    .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔴 极端 本地图 · 迪斯尼 tapped, selected=\(sender.isSelected)")
                        "点击了迪斯尼".toast
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
            ])
            .byBgColor(.randomColor)
            .byAddTo(self.scrollView) { [unowned self] make in
                make.top.equalTo(self.twoButtonsMarquee.snp.bottom).offset(self.verticalSpacing)
                make.left.right.height.equalTo(self.upContinuousMarquee)
            }
            .then { v in
//                v.pageControlPosition = .bottomCenter   // 默认（不写也行）
//                v.pageControlPosition = .leftBottom
                v.pageControlPosition = .rightBottom
                v.isPageControlEnabled = true
                v.pageControl.jobs_setIndicatorImageURLs(
                    normalURL: URL(string: "https://picsum.photos/seed/dot_normal/18/18"),
                    currentURL: URL(string: "https://picsum.photos/seed/dot_current/18/18"),
                    fallbackNormal: "circle".sysImg,
                    fallbackCurrent: "circle.fill".sysImg
                )
            }
    }()
    // MARK: - 12. SDWebImage@背景图
    private lazy var sdWebImageButtonsMarquee: JobsMarqueeView = { [unowned self] in
        JobsMarqueeView()
            .byDirection(.left)
            .byScrollMode(.frequency(interval: 1.0))
            .byItemSizeMode(.fillBounds)
            .byManualScrollEnabled(true)   // ✅ 开启手动拖拽
            .byDataSourceButtons([
                UIButton.sys()
                    .byBorderColor(UIColor.systemGray3)
                    .byTitle("我是UIButton主标题@SDWebImage")
                    .bySubTitle("我是UIButton副标题@SDWebImage")
                    .sd_imageURL("https://picsum.photos/" + ScreenWidth().toString(0) + "/" + self.marqueeHeight.toString(0))
                    .sd_placeholderImage(nil)
                    .sd_options([.retryFailed, .highPriority, .scaleDownLargeImages])
                    .sd_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔴 SDWebImage@背景图 1 tapped, selected=\(sender.isSelected)")
                        "点击了SDWebImage@背景图".toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBorderColor(UIColor.systemGray3)
                    .byTitle("我是UIButton主标题@SDWebImage")
                    .bySubTitle("我是UIButton副标题@SDWebImage")
                    .sd_imageURL("https://picsum.photos/" + ScreenWidth().toString(0) + "/" + self.marqueeHeight.toString(0))
                    .sd_placeholderImage(nil)
                    .sd_options([.retryFailed, .highPriority, .scaleDownLargeImages])
                    .sd_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔴 SDWebImage@背景图 2 tapped, selected=\(sender.isSelected)")
                        "点击了SDWebImage@背景图".toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byBorderColor(UIColor.systemGray3)
                    .byTitle("我是UIButton主标题@SDWebImage")
                    .bySubTitle("我是UIButton副标题@SDWebImage")
                    .sd_imageURL("https://picsum.photos/" + ScreenWidth().toString(0) + "/" + self.marqueeHeight.toString(0))
                    .sd_placeholderImage(nil)
                    .sd_options([.retryFailed, .highPriority, .scaleDownLargeImages])
                    .sd_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔴 SDWebImage@背景图 3 tapped, selected=\(sender.isSelected)")
                        "点击了SDWebImage@背景图".toast
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
            ])
            .byBgColor(.randomColor)
            .byAddTo(self.scrollView) { [unowned self] make in
                make.top.equalTo(self.localImageButtonsMarquee.snp.bottom).offset(self.verticalSpacing)
                make.left.right.height.equalTo(self.upContinuousMarquee)
            }
            .then { v in
//                v.pageControlPosition = .bottomCenter   // 默认（不写也行）
//                v.pageControlPosition = .leftBottom
                v.pageControlPosition = .rightBottom
                v.isPageControlEnabled = true
                v.pageControl.jobs_setIndicatorImageURLs(
                    normalURL: URL(string: "https://picsum.photos/seed/dot_normal/18/18"),
                    currentURL: URL(string: "https://picsum.photos/seed/dot_current/18/18"),
                    fallbackNormal: "circle".sysImg,
                    fallbackCurrent: "circle.fill".sysImg
                )
            }
            .then { v in
//                v.pageControlPosition = .bottomCenter   // 默认（不写也行）
//                v.pageControlPosition = .leftBottom
                v.pageControlPosition = .rightBottom
                v.isPageControlEnabled = true
                v.pageControl.jobs_setIndicatorImageURLs(
                    normalURL: URL(string: "https://picsum.photos/seed/dot_normal/18/18"),
                    currentURL: URL(string: "https://picsum.photos/seed/dot_current/18/18"),
                    fallbackNormal: "circle".sysImg,
                    fallbackCurrent: "circle.fill".sysImg
                )
            }
    }()
    // MARK: - 13. Kingfisher@背景图
    private lazy var kingfisherImageButtonsMarquee: JobsMarqueeView = { [unowned self] in
        JobsMarqueeView()
            .byDirection(.left)
            .byScrollMode(.frequency(interval: 1.0))
            .byItemSizeMode(.fillBounds)
            .byManualScrollEnabled(true)   // ✅ 开启手动拖拽
            .byDataSourceButtons ([
                UIButton.sys()
                    .byTitle("我是UIButton主标题@Kingfisher").byTitleColor(.red)
                    .bySubTitle("我是UIButton副标题@Kingfisher").bySubTitleColor(.yellow)
                    .kf_imageURL("https://picsum.photos/" + ScreenWidth().toString(0) + "/" + self.marqueeHeight.toString(0))
                    .kf_placeholderImage("唐老鸭".img)
                    .kf_options([
                        .processor(DownsamplingImageProcessor(size: CGSize(width: 500, height: 200))),
                        .scaleFactor(UIScreen.main.scale),
                        .cacheOriginalImage,
                        .transition(.fade(0.25)),
                        .retryStrategy(DelayRetryStrategy(maxRetryCount: 2, retryInterval: .seconds(1)))
                    ])
                    .kf_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔴 Kingfisher@背景图 1 tapped, selected=\(sender.isSelected)")
                        "点击了Kingfisher@背景图".toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byTitle("我是UIButton主标题@Kingfisher").byTitleColor(.red)
                    .bySubTitle("我是UIButton副标题@Kingfisher").bySubTitleColor(.yellow)
                    .kf_imageURL("https://picsum.photos/" + ScreenWidth().toString(0) + "/" + self.marqueeHeight.toString(0))
                    .kf_placeholderImage("唐老鸭".img)
                    .kf_options([
                        .processor(DownsamplingImageProcessor(size: CGSize(width: 500, height: 200))),
                        .scaleFactor(UIScreen.main.scale),
                        .cacheOriginalImage,
                        .transition(.fade(0.25)),
                        .retryStrategy(DelayRetryStrategy(maxRetryCount: 2, retryInterval: .seconds(1)))
                    ])
                    .kf_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔴 Kingfisher@背景图 2 tapped, selected=\(sender.isSelected)")
                        "点击了Kingfisher@背景图".toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
                UIButton.sys()
                    .byTitle("我是UIButton主标题@Kingfisher").byTitleColor(.red)
                    .bySubTitle("我是UIButton副标题@Kingfisher").bySubTitleColor(.yellow)
                    .kf_imageURL("https://picsum.photos/" + ScreenWidth().toString(0) + "/" + self.marqueeHeight.toString(0))
                    .kf_placeholderImage("唐老鸭".img)
                    .kf_options([
                        .processor(DownsamplingImageProcessor(size: CGSize(width: 500, height: 200))),
                        .scaleFactor(UIScreen.main.scale),
                        .cacheOriginalImage,
                        .transition(.fade(0.25)),
                        .retryStrategy(DelayRetryStrategy(maxRetryCount: 2, retryInterval: .seconds(1)))
                    ])
                    .kf_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
                    .byTapSound("Sound.wav")
                    .onTap { sender in
                        print("🔴 Kingfisher@背景图 3 tapped, selected=\(sender.isSelected)")
                        "点击了Kingfisher@背景图".toast
                    }
                    .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                        if gr.state == .began {
                            btn.alpha = 0.6
                            print("长按开始 on \(btn)")
                        } else if gr.state == .ended || gr.state == .cancelled {
                            btn.alpha = 1.0
                            print("长按结束")
                        }
                    },
            ])
            .byBgColor(.randomColor)
            .byAddTo(self.scrollView) { [unowned self] make in
                make.top.equalTo(self.sdWebImageButtonsMarquee.snp.bottom).offset(self.verticalSpacing)
                make.left.right.height.equalTo(self.upContinuousMarquee)
                // 🔚 最后一条封底，决定 scrollView.contentSize.height
                if #available(iOS 11.0, *) {
                    make.bottom.equalTo(self.scrollView.contentLayoutGuide.snp.bottom).inset(20)
                } else {
                    make.bottom.equalTo(self.scrollView.snp.bottom).inset(20)
                }
            }
            .then { v in
//                v.pageControlPosition = .bottomCenter   // 默认（不写也行）
//                v.pageControlPosition = .leftBottom
                v.pageControlPosition = .rightBottom
                v.isPageControlEnabled = true
                v.pageControl.jobs_setIndicatorImageURLs(
                    normalURL: URL(string: "https://picsum.photos/seed/dot_normal/18/18"),
                    currentURL: URL(string: "https://picsum.photos/seed/dot_current/18/18"),
                    fallbackNormal: "circle".sysImg,
                    fallbackCurrent: "circle.fill".sysImg
                )
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(
            title: "JobsMarqueeView@Demo",
            rightButtons: [
                UIButton.sys()
                    .byImage("play.circle.fill".sysImg, for: .normal)
                    .byImage("play.circle.fill".sysImg, for: .selected)
                    .onTap { [weak self] sender in
                        guard let self = self else { return }
                        sender.isSelected.toggle()
                        self.allMarquees.forEach { $0.resume() }
                    },
                UIButton.sys()
                    .byImage("pause.circle.fill".sysImg, for: .normal)
                    .byImage("pause.circle.fill".sysImg, for: .selected)
                    .onTap { [weak self] sender in
                        guard let self = self else { return }
                        sender.isSelected.toggle()
                        self.allMarquees.forEach { $0.pause() }
                    }
            ]
        )
        /// JobsMarqueeView@跑马灯
        upContinuousMarquee.byVisible(YES)
        downContinuousMarquee.byVisible(YES)
        leftContinuousMarquee.byVisible(YES)
        rightContinuousMarquee.byVisible(YES)

        upFrequencyMarquee.byVisible(YES)
        downFrequencyMarquee.byVisible(YES)
        leftFrequencyMarquee.byVisible(YES)
        rightFrequencyMarquee.byVisible(YES)

        oneButtonMarquee.byVisible(YES)
        twoButtonsMarquee.byVisible(YES)
        /// JobsMarqueeView@轮播图 & 图片
        localImageButtonsMarquee.byVisible(YES)
        sdWebImageButtonsMarquee.byVisible(YES)
        kingfisherImageButtonsMarquee.byVisible(YES)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        allMarquees.forEach { $0.start() }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        allMarquees.forEach { $0.stop() }
    }

    private var allMarquees: [JobsMarqueeView] {
        [
            upContinuousMarquee,          // 向上连续滚动
            downContinuousMarquee,        // 向下连续滚动
            leftContinuousMarquee,        // 向左连续滚动（典型横向跑马灯）
            rightContinuousMarquee,       // 向右连续滚动
            upFrequencyMarquee,           // 向上间隔滚动（公告@一条一条翻）
            downFrequencyMarquee,         // 向下间隔滚动（公告@一条一条翻）
            leftFrequencyMarquee,         // 向左间隔滚动（轮播图@一屏一页）
            rightFrequencyMarquee,        // 向右间隔滚动（轮播图@一屏一页）
            oneButtonMarquee,             // 极端：只有 1 个按钮
            twoButtonsMarquee,            // 极端：只有 2 个按钮
            localImageButtonsMarquee,     // 本地@背景图
            sdWebImageButtonsMarquee,     // SDWebImage@背景图
            kingfisherImageButtonsMarquee // Kingfisher@背景图
        ]
    }
}
