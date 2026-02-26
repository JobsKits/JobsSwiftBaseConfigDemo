//
//  Demo@动效数字（按钮标题）.swift
//  JobsByUIKitDemo
//
//  Created by Jobs on 21/2/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import GKNavigationBarSwift
import JobsScale
import JobsToast
import JobsByUIKit
import JobsTextTools
import JobsInheritance
import JobsSwiftBaseDefines

final class AnimatedButtonNumberDemoVC: BaseVC {

    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byAddTo(view) { [unowned self] make in
                make.left.right.bottom.equalToSuperview()
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()

    private lazy var contentView: UIView = {
        UIView()
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalToSuperview()
                make.width.equalToSuperview()
            }
    }()

    private lazy var titleLab1: UILabel = {
        UILabel()
            .byText("① 无图：主标题（普通字符串）")
            .byFont(.systemFont(ofSize: 14, weight: .semibold))
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var tf1Start: UITextField = {
        _makeTF(ph: "默认：99")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(titleLab1.snp.bottom).offset(10)
                make.left.equalToSuperview().inset(16)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()

    private lazy var tf1End: UITextField = {
        _makeTF(ph: "默认：199")
            .byAddTo(contentView) { [unowned self] make in
                make.centerY.equalTo(tf1Start)
                make.left.equalTo(tf1Start.snp.right).offset(10)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()
    
    private lazy var titleLab2: UILabel = {
        UILabel()
            .byText("② 无图：副标题（富文本，只动数字）")
            .byFont(.systemFont(ofSize: 14, weight: .semibold))
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(btn_1.snp.bottom).offset(18)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var tf2Start: UITextField = {
        _makeTF(ph: "默认：199")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(titleLab2.snp.bottom).offset(10)
                make.left.equalToSuperview().inset(16)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()

    private lazy var tf2End: UITextField = {
        _makeTF(ph: "默认：99")
            .byAddTo(contentView) { [unowned self] make in
                make.centerY.equalTo(tf2Start)
                make.left.equalTo(tf2Start.snp.right).offset(10)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()
    
    private lazy var titleLab3: UILabel = {
        UILabel()
            .byText("③ 有图：主标题（富文本，只动数字，图文关系不变）")
            .byFont(.systemFont(ofSize: 14, weight: .semibold))
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(btn_3.snp.bottom).offset(18)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var tf3Start: UITextField = {
        _makeTF(ph: "默认：99")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(titleLab3.snp.bottom).offset(10)
                make.left.equalToSuperview().inset(16)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()

    private lazy var tf3End: UITextField = {
        _makeTF(ph: "默认：299")
            .byAddTo(contentView) { [unowned self] make in
                make.centerY.equalTo(tf3Start)
                make.left.equalTo(tf3Start.snp.right).offset(10)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()

    private lazy var titleLab4: UILabel = {
        UILabel()
            .byText("④ 有图：副标题（普通字符串，只动数字）")
            .byFont(.systemFont(ofSize: 14, weight: .semibold))
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(btn_2.snp.bottom).offset(18)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var tf4Start: UITextField = {
        _makeTF(ph: "默认：199")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(titleLab4.snp.bottom).offset(10)
                make.left.equalToSuperview().inset(16)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()

    private lazy var tf4End: UITextField = {
        _makeTF(ph: "默认：9")
            .byAddTo(contentView) { [unowned self] make in
                make.centerY.equalTo(tf4Start)
                make.left.equalTo(tf4Start.snp.right).offset(10)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()
    /// 数字动效按钮@主标题（普通文本）
    private lazy var btn_1: UIButton = {
        UIButton.sys()
            .byTitle("¥99", for: .normal)
            .byTitle("¥99", for: .selected)
            .byTitle("¥99", for: .disabled)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 18, weight: .semibold))
            .byBackgroundColor(.systemBlue)
            /// 数字动效按钮@关键配置
            .byAnimationTitleConfig({ cfg in
                cfg.byDuration(10) // 动画的作用时间
                    .byFps(60) //
                    .byTitleColor(.white, for: .normal)
                    .byTitleFont(.DINPro.Bold(14.fz))
                    .byStartValue("\(Double(tf1Start.text ?? "") ?? 99)") // 如果这个地方没有配置，则从按钮的主标题取值
                    .byEndValue("\(Double(tf1End.text ?? "") ?? 199)") // 如果这个地方没有配置，则从按钮的主标题取值
                    .byShowsDecimals(true)// 是否展示小数（默认不展示）
                    .bySeparate(",")// 分隔符是 , 不写也行
                    .byDecimals(2)// 保留2位小数（默认）
                    .byTitleDecimalsCor(.red)
                    .byTitleDecimalsFont(.DINPro.Bold(12.fz))
            })
            .onTap { [weak self] sender in
                guard let self else { return }
                /// 启动动效@回调倒计时行为：进行中（多次）
                sender.byStartAnim { m in
                    print("title:", m.title ?? "nil",
                          "sub:", m.subTitle ?? "nil",
                          "seconds:", m.seconds)
                }
                /// 启动动效@回调倒计时行为：结束（一次）
                .byEndAnim {
                    "动画结束".tr.toast
                }
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tf1Start.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(52)
            }
    }()
    /// 数字动效按钮@主标题（富文本）
    private lazy var btn_2: UIButton = {
        UIButton.sys()
            // 初始展示：你原来的 rich title 仍然可以保留（首次显示用）
            .byRichTitle(JobsRichText.make([
                JobsRichRun(.text("¥99")).font(.systemFont(ofSize: 18, weight: .semibold)).color(.systemRed),
                JobsRichRun(.text(" /月")).font(.systemFont(ofSize: 16)).color(.white)
            ]))
            .byTitleColor(.white, for: .normal)
            .byImage("star.fill".sysImg, for: .normal)
            .byImagePlacement(.leading, padding: 8)
            .byBackgroundColor(.systemGreen)
            /// 数字动效按钮@关键配置➤主标题富文本Builder
            .byAnimationTitleConfig { cfg in
                cfg.byDuration(10)
                    .byFps(60)
                    .byStartValue("\(Int(0))")
                    .byEndValue("\(Int(1000))")
                    .byShowsDecimals(true)
                    .bySeparate(",")
                    .byDecimals(2)
                    // 如果仍然希望 plain/fallback 的字体颜色也一致，可以保留
                    .byTitleColor(.white, for: .normal)
                    .byTitleFont(.DINPro.Bold(14.fz))
                    .byTitleDecimalsCor(.red)
                    .byTitleDecimalsFont(.DINPro.Bold(12.fz))
                    // 主标题整体富文本（¥ + 数字 + /月）
                    .byTitleAttributedBuilder { text, decimalsRange, _ in
                        // full: "¥1,234.56 /月"
                        let full = "¥\(text) /月"
                        let attr = NSMutableAttributedString(string: full)
                        // 数字段（含 ¥）：红色 18 semibold
                        let numberRange = NSRange(location: 0, length: 1 + (text as NSString).length) // "¥" + text
                        attr.addAttributes([
                            .font: UIFont.systemFont(ofSize: 18, weight: .semibold),
                            .foregroundColor: UIColor.systemRed
                        ], range: numberRange)
                        // 后缀段：白色 16
                        let suffixStart = numberRange.length
                        let suffixRange = NSRange(location: suffixStart, length: (full as NSString).length - suffixStart)
                        attr.addAttributes([
                            .font: UIFont.systemFont(ofSize: 16),
                            .foregroundColor: UIColor.white
                        ], range: suffixRange)
                        // 小数段（如果存在）：DINPro 12 + 红色（只改小数部分，不影响整数）
                        if let dr = decimalsRange {
                            // decimalsRange 是在 text 里的 range，要平移到 full 里（前面多了一个 "¥"）
                            let shifted = NSRange(location: 1 + dr.location, length: dr.length)
                            attr.addAttributes([
                                .font: UIFont.DINPro.Bold(12.fz),
                                .foregroundColor: UIColor.red
                            ], range: shifted)
                        };return attr
                    }
            }
            .onTap { [weak self] sender in
                guard let self else { return }

                // 你这里读 tf 的 start/end 只是业务参数；真正动画起终值由 config 的 startValue/endValue 控制
                // 如果你想“按输入框变更动画起终值”，需要在点击时重新调用 byAnimationTitleConfig 覆盖 start/end
                // 这里先按你原逻辑保留回调即可
                sender.byStartAnim { m in
                    print("title:", m.title ?? "nil",
                          "sub:", m.subTitle ?? "nil",
                          "seconds:", m.seconds)
                }
                .byEndAnim {
                    "动画结束".tr.toast
                }
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tf3Start.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(56)
            }
    }()
    /// 数字动效按钮@副标题（普通文本）
    private lazy var btn_3: UIButton = {
        UIButton.sys()
            .byTitle("会员价格", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .bySubTitle("原价 ¥199 /月", for: .normal)
            .bySubTitleColor(.white.withAlphaComponent(0.85), for: .normal)
            .bySubTitleFont(.systemFont(ofSize: 13))
            .byBackgroundColor("#2F2F2F".cor)
            /// 数字动效按钮@关键配置
            .byAnimationSubTitleConfig({ cfg in
                cfg.byDuration(10) // 动画的作用时间
                    .byFps(60) //
                    .bySubTitleColor(.blue)
                    .bySubTitleFont(.DINPro.Bold(14.fz))
                    .byStartValue("\(Double(tf1Start.text ?? "") ?? 99)") // 如果这个地方没有配置，则从按钮的主标题取值
                    .byEndValue("\(Double(tf1End.text ?? "") ?? 199)") // 如果这个地方没有配置，则从按钮的主标题取值
                    .byShowsDecimals(true)// 是否展示小数（默认不展示）
                    .bySeparate(",")// 分隔符是 , 不写也行
                    .byDecimals(2)// 保留2位小数（默认）
                    .bySubTitleDecimalsCor(.red)
                    .bySubTitleDecimalsFont(.DINPro.Bold(12.fz))
            })
            .onTap { [weak self] sender in
                guard let self else { return }
                /// 启动动效@回调倒计时行为：进行中（多次）
                sender.byStartAnim { m in
                    print("title:", m.title ?? "nil",
                          "sub:", m.subTitle ?? "nil",
                          "seconds:", m.seconds)
                }
                /// 启动动效@回调倒计时行为：结束（一次）
                .byEndAnim {
                    "动画结束".tr.toast
                }
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tf2Start.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(64)
            }
    }()
    /// 数字动效按钮@副标题（富文本）
    private lazy var btn_4: UIButton = {
        UIButton.sys()
            .byTitle("限时折扣", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            // 初始展示：先给一个普通副标题（首次显示用）
            .bySubTitle("倒计时 199 秒", for: .normal)
            .bySubTitleColor(.white.withAlphaComponent(0.85), for: .normal)
            .bySubTitleFont(.systemFont(ofSize: 13))
            .byImage("clock".sysImg, for: .normal)
            .byImagePlacement(.leading, padding: 8)
            .byBackgroundColor(.systemPurple)
            .byCornerRadius(10)
            /// 数字动效按钮@关键配置➤副标题富文本Builder
            .byAnimationSubTitleConfig { cfg in
                cfg.byDuration(10)
                    .byFps(60)

                    // 这里的 start/end 才是副标题动画的数值来源
                    .byStartValue("199")
                    .byEndValue("9")

                    // 倒计时一般不需要小数，这里关掉
                    .byShowsDecimals(false)

                    // 可选：给副标题的基础样式（非 builder 场景兜底）
                    .bySubTitleColor(.white.withAlphaComponent(0.85), for: .normal)
                    .bySubTitleFont(.systemFont(ofSize: 13))

                    // ✅ 副标题整体富文本： "倒计时 199 秒"
                    .bySubTitleAttributedBuilder { text, _, _ in
                        let prefix = "倒计时 "
                        let suffix = " 秒"
                        let full = prefix + text + suffix
                        let attr = NSMutableAttributedString(string: full)

                        // 全段默认（灰白 13）
                        attr.addAttributes([
                            .font: UIFont.systemFont(ofSize: 13),
                            .foregroundColor: UIColor.white.withAlphaComponent(0.85)
                        ], range: NSRange(location: 0, length: (full as NSString).length))

                        // 数字段强调（白色 13 medium，或你想要的高亮色）
                        let numberRange = NSRange(location: (prefix as NSString).length,
                                                  length: (text as NSString).length)
                        attr.addAttributes([
                            .font: UIFont.systemFont(ofSize: 13, weight: .semibold),
                            .foregroundColor: UIColor.white
                        ], range: numberRange)

                        return attr
                    }
            }

            .onTap { [weak self] sender in
                guard let self else { return }
                sender.byStartAnim { m in
                    print("title:", m.title ?? "nil",
                          "sub:", m.subTitle ?? "nil",
                          "seconds:", m.seconds)
                }
                .byEndAnim {
                    "动画结束".tr.toast
                }
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tf4Start.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(64)
                make.bottom.equalToSuperview().offset(-24)
            }
    }()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        jobsSetupGKNav(title: "UIButton 数字动效 Demo".tr)
        scrollView.byVisible(YES)
        contentView.byVisible(YES)
        titleLab1.byVisible(YES)
        tf1Start.byVisible(YES)
        tf1End.byVisible(YES)
        btn_1.byVisible(YES)
        titleLab2.byVisible(YES)
        tf2Start.byVisible(YES)
        tf2End.byVisible(YES)
        btn_3.byVisible(YES)
        titleLab3.byVisible(YES)
        tf3Start.byVisible(YES)
        tf3End.byVisible(YES)
        btn_2.byVisible(YES)
        titleLab4.byVisible(YES)
        tf4Start.byVisible(YES)
        tf4End.byVisible(YES)
        btn_4.byVisible(YES)
    }
}

extension AnimatedButtonNumberDemoVC {

    private func _makeTF(ph: String) -> UITextField {
        UITextField()
            .byPlaceholder(ph)
            .byKeyboardType(.decimalPad)
            .byBorderStyle(.roundedRect)
            .byFont(.systemFont(ofSize: 14))
    }
}
