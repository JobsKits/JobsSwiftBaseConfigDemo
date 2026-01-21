//
//  TabBarDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 10/16/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC

import SnapKit
import GKNavigationBarSwift
import JobsInheritance
import JobsByUIKit
import JobsTextTools
import JobsSwiftTimer
import JobsToast
// MARK: - ✅ 新版 JobsTimer：给任意 UIButton 挂一个倒计时驱动（替代旧 startTimer/onCountdownTick/onCountdownFinish）
private final class JobsCountdownBinder {

    private weak var button: UIButton?
    private var timer: JobsTimerProtocol?

    private var total: Int = 0
    private var remain: Int = 0
    private var interval: TimeInterval = 1.0
    private var kind: JobsTimerKind = .gcd

    deinit {
        timer?.stop()
        timer = nil
    }

    @MainActor
    func start(on button: UIButton,
               total: Int,
               interval: TimeInterval,
               kind: JobsTimerKind) {

        stop()

        self.button = button
        self.total = max(1, total)
        self.remain = self.total
        self.interval = max(0.000_001, interval)
        self.kind = kind

        // 先把 UI 初始化成 “还剩 xxxs”
        applyUI(remain: self.remain, total: self.total, kind: kind)

        let cfg = JobsTimerConfig(
            interval: self.interval,
            repeats: true,
            tolerance: 0,
            queue: .main,
            runLoop: .main,
            runLoopMode: .common,
            pauseInBackground: true,
            autoManageAppState: true
        )

        let t = JobsTimer(kind: kind, config: cfg) { [weak self] in
            // ✅ Swift 6 / Sendable 同等待遇：先冻结 self，再切 MainActor
            guard let strongSelf = self else { return }
            Task { @MainActor in
                guard let btn = strongSelf.button else {
                    strongSelf.stop()
                    return
                }

                strongSelf.remain -= 1
                let remain = max(0, strongSelf.remain)

                print("⏱️ [\(strongSelf.kind.displayName)] \(remain)/\(strongSelf.total)")

                if remain <= 0 {
                    print("✅ [\(strongSelf.kind.displayName)] 倒计时完成")
                    strongSelf.stop()

                    // 完成态 UI
                    btn.byTitle("活动".tr, for: .normal)
                        .byTitle("活动".tr, for: .selected)
                        .bySubTitle("倒计时".tr, for: .normal)
                        .bySubTitle("倒计时".tr, for: .selected)
                        .bySetNeedsUpdateConfiguration()
                    return
                }

                strongSelf.applyUI(remain: remain, total: strongSelf.total, kind: strongSelf.kind)
            }
        }

        timer = t
        t.start()
    }

    @MainActor
    func stop() {
        timer?.stop()
        timer = nil
    }

    @MainActor
    private func applyUI(remain: Int, total: Int, kind: JobsTimerKind) {
        guard let btn = button else { return }
        // 你原逻辑：主标题固定“还剩”，副标题显示剩余秒数
        btn.byTitle("还剩".tr, for: .normal)
            .byTitle("还剩".tr, for: .selected)
            .bySubTitle("\(remain)s", for: .normal)
            .bySubTitle("\(remain)s", for: .selected)
            .bySetNeedsUpdateConfiguration()
    }
}

// MARK: - 通过 AssociatedObject 挂到 UIButton 上（一个按钮一个 binder）
private enum JobsCountdownBinderKey {
    static var key: UInt8 = 0
}

private extension UIButton {
    var jobs_countdownBinder: JobsCountdownBinder {
        if let obj = objc_getAssociatedObject(self, &JobsCountdownBinderKey.key) as? JobsCountdownBinder {
            return obj
        }
        let obj = JobsCountdownBinder()
        objc_setAssociatedObject(self, &JobsCountdownBinderKey.key, obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return obj
    }
}

// MARK: - Demo：多按钮（>5）以便直观看 ScrollView 横向滑动
final class TabBarDemoVC: BaseVC {

    // MARK: JobsTabBarCtrl（链式点语法 + 中间按钮凸起 + 横竖屏自适应）
    private lazy var tabCtrl: JobsTabBarCtrl = {
        JobsTabBarCtrl()
            .bySwipeEnabled(true)
            .byHorizontalOnly(true)                // ✅ 只允许横向
            .bySuppressChildVerticalScrolls(true)  // ✅（可选）禁子 VC 内纵向滚动
            .byBarBackgroundColor(.secondarySystemBackground)
            .byCustomBarHeight(nil)              // 默认：49 + 安全区
            .byBarBottomOffset(0)                // 贴底
            .byBarBackgroundImage(nil)
            // 布局策略（1 居中；2~5 等分；>5 继续按“5 等分”的单元宽/间距去排，超出横滑）
            .byContentInset(.init(top: 6, left: 12, bottom: 6, right: 12))
            .byEqualSpacing(10)
            .byEqualVisibleRange(2...5)
            .byLockUnitToMaxEqualCount(true)
            .byAutoRelayoutForBoundsChange(true)
            // 首次构建回调（此处无需处理）
            .onButtonsBuilt { _ in }
            // 每次布局后：做“中间按钮凸起”（横竖屏都会回调）
            .onButtonsLayoutedWeakOwner { owner, btns in
                guard !btns.isEmpty else { return }
                btns[2].byHeightOffset(0)
                    .byOriginYOffset(-24)
                    .byCornerRadius(14)
            }.byDataSource(
                buttons: [
                    /// 普通按钮@（无副标题、不配置事件、无富文本）
                    UIButton(type: .system)
                        .byNormalBgColor(.clear)
                        .byTitle("首页".tr, for: .normal)
                        .byTitleColor(.label, for: .normal)
                        .byTitleColor(.systemRed, for: .selected)
                        .byTitleFont(.systemFont(ofSize: 12, weight: .semibold))
                        .byImage("house".sysImg, for: .normal)
                        .byImage("house.fill".sysImg, for: .selected)
                        .byImagePlacement(.top)
                        .byTapSound("Sound.wav")
                        .byContentEdgeInsets(.init(top: 6, left: 10, bottom: 6, right: 10))
                        .byCornerBadgeText("NEW".tr) { cfg in
                            cfg.byOffset(.init(horizontal: -6, vertical: 6))
                                .byInset(.init(top: 2, left: 6, bottom: 2, right: 6))
                                .byBgColor(.systemRed)
                                .byFont(.systemFont(ofSize: 11, weight: .bold))
                                .byShadow(color: UIColor.black.withAlphaComponent(0.25),
                                          radius: 2,
                                          opacity: 0.6,
                                          offset: .init(width: 0, height: 1))
                        },

                    /// 普通按钮@（配置事件）
                    UIButton(type: .system)
                        .byNormalBgColor(.clear)
                        .byTitle("优惠".tr, for: .normal)
                        .byTitleColor(.label, for: .normal)
                        .byTitleColor(.systemRed, for: .selected)
                        .byTitleFont(.systemFont(ofSize: 12, weight: .medium))
                        .byImage("tag".sysImg, for: .normal)
                        .byImage("tag.fill".sysImg, for: .selected)
                        .byImagePlacement(.top)
                        .byTapSound("Sound.wav")
                        .byContentEdgeInsets(.init(top: 6, left: 10, bottom: 6, right: 10))
                        .byCornerDot(diameter: 10, offset: .init(horizontal: -4, vertical: 4))// 红点
                        /// 事件触发@点按
                        .onTap { [weak self] sender in
                            guard let self else { return }
                            sender.isSelected.toggle()
                            if sender.isSelected {
                                sender.byCornerDot(diameter: 10, offset: .init(horizontal: -4, vertical: 4))
                            } else {
                                sender.removeCornerBadge()
                            }
                            "优惠@点按事件".toast
                        }
                        /// 事件触发@长按
                        .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                             if gr.state == .began {
                                 btn.alpha = 0.6
                                 print("长按开始 on \(btn)")
                                 "优惠@长按事件".toast
                             } else if gr.state == .ended || gr.state == .cancelled {
                                 btn.alpha = 1.0
                                 print("长按结束")
                             }
                         },

                    /// 普通按钮@（富文本）
                    UIButton(type: .system)
                        .byNormalBgColor(.clear)
                        .byRichTitle(JobsRichText.make([
                            JobsRichRun(.text("¥99")).font(.systemFont(ofSize: 10, weight: .semibold)).color(.systemRed),
                            JobsRichRun(.text(" /月")).font(.systemFont(ofSize: 12)).color(.green)
                        ]))
                        .byRichSubTitle(JobsRichText.make([
                            JobsRichRun(.text("原价 ")).font(.systemFont(ofSize: 10)).color(.blue.withAlphaComponent(0.8)),
                            JobsRichRun(.text("¥199")).font(.systemFont(ofSize: 12, weight: .medium)).color(.systemYellow)
                        ]))
                        .byImage("creditcard".sysImg, for: .normal)
                        .byImage("creditcard.fill".sysImg, for: .selected)
                        .byImagePlacement(.top)
                        .byContentEdgeInsets(.init(top: 6, left: 10, bottom: 6, right: 10)),

                    UIButton(type: .system)
                        .byNormalBgColor(.clear)
                        .byTitle("好友", for: .normal)
                        .byTitleColor(.label, for: .normal)
                        .byTitleColor(.systemRed, for: .selected)
                        .byTitleFont(.systemFont(ofSize: 12, weight: .medium))
                        .byImage("person.2".sysImg, for: .normal)
                        .byImage("person.2.fill".sysImg, for: .selected)
                        .byImagePlacement(.top)
                        .byContentEdgeInsets(.init(top: 6, left: 10, bottom: 6, right: 10)),

                    /// ✅ 倒计时按钮@（点击触发）—— 适配新版 JobsTimer（替代旧 startTimer/onCountdownTick/onCountdownFinish）
                    UIButton(type: .system)
                        .byTitle("活动", for: .normal)
                        .byTitleColor(.label, for: .normal)
                        .byTitleColor(.systemRed, for: .selected)
                        .byTitleFont(.systemFont(ofSize: 12, weight: .medium))
                        .bySubTitle("倒计时", for: .normal)
                        .bySubTitleColor(.label, for: .normal)
                        .bySubTitleColor(.systemRed, for: .selected)
                        .bySubTitleFont(.systemFont(ofSize: 12, weight: .medium))
                        .byImage("sparkles".sysImg, for: .normal)
                        .byImage("sparkles".sysImg, for: .selected)
                        .byImagePlacement(.top)
                        .byContentEdgeInsets(.init(top: 6, left: 10, bottom: 6, right: 10))
                        .onTap { [weak self] btn in
                            guard let self else { return }
                            // 点击以后倒计时：300s
                            // 你原来写死 kind:.gcd，这里保持一致
                            Task { @MainActor in
                                btn.jobs_countdownBinder.start(
                                    on: btn,
                                    total: 300,
                                    interval: 1.0,
                                    kind: .gcd
                                )
                            }
                        },

                    UIButton(type: .system)
                        .byNormalBgColor(.clear)
                        .byTitle("客服", for: .normal)
                        .byTitleColor(.label, for: .normal)
                        .byTitleColor(.systemRed, for: .selected)
                        .byTitleFont(.systemFont(ofSize: 12, weight: .medium))
                        .byImage("message".sysImg, for: .normal)
                        .byImage("message.fill".sysImg, for: .selected)
                        .byImagePlacement(.top)
                        .byContentEdgeInsets(.init(top: 6, left: 10, bottom: 6, right: 10)),

                    /// 普通按钮@（展示副标题）
                    UIButton(type: .system)
                        .byNormalBgColor(.clear)
                        .byTitle("我的", for: .normal)
                        .byTitleColor(.label, for: .normal)
                        .byTitleColor(.systemRed, for: .selected)
                        .byTitleFont(.systemFont(ofSize: 12, weight: .semibold))
                        .bySubTitle("未登录", for: .normal)
                        .bySubTitleColor(.label, for: .normal)
                        .bySubTitleColor(.systemRed, for: .selected)
                        .bySubTitleFont(.systemFont(ofSize: 10, weight: .semibold))
                        .byImage("person.crop.circle".sysImg, for: .normal)
                        .byImage("person.crop.circle.fill".sysImg, for: .selected)
                        .byImagePlacement(.top)
                        .byContentEdgeInsets(.init(top: 6, left: 10, bottom: 6, right: 10))
                ],
                controllers: [
                    HomeVC(),
                    DiscountVC(),
                    WalletVC(),
                    FriendsVC(),
                    ActivityVC(),
                    ServiceVC()
                ]
            )
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "JobsTabBarCtrl@横滑 Demo（>5 个按钮）")

        addChild(tabCtrl)
        view.addSubview(tabCtrl.view)
        tabCtrl.view.snp.makeConstraints { $0.edges.equalToSuperview() }
        tabCtrl.didMove(toParent: self)
    }
}

// MARK: - 示例子页（简化）
final class HomeVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "首页")
    }
}

final class DiscountVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        jobsSetupGKNav(title: "优惠")
    }
}

final class WalletVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        jobsSetupGKNav(title: "钱包")
    }
}

final class FriendsVC: BaseVC {
    private lazy var exampleButton: UIButton = {
        UIButton(type: .system)
            .byTitle("显示", for: .normal)
            .byTitle("隐藏", for: .selected)
            .byTitleColor(.systemBlue, for: .normal)
            .byTitleColor(.systemRed, for: .selected)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .onTap { [weak self] sender in
                guard let self else { return }
                DemoDetailVC()
                    .byData(DemoModel(id: 7, title: "详情"))
                    .onResult { id in
                        print("回来了 id=\(String(describing: id))")
                    }
                    .byPush(self)
                    .byCompletion{
                        print("❤️结束❤️")
                    }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(10)
                make.center.equalToSuperview()
                make.height.equalTo(44)
                make.width.equalTo(44)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        jobsSetupGKNav(title: "好友")
        exampleButton.byAlpha(1)
    }
}

final class ActivityVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        jobsSetupGKNav(title: "活动")
    }
}

final class ServiceVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        jobsSetupGKNav(title: "客服")
    }
}
