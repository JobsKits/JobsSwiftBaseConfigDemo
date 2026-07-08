//
//  Demo@功能列表根目录.swift
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

import JobsSwiftDSL
import Jobsl10n
import JobsScale
import JobsToast
import JobsByUIKit
import JobsSwiftRefresher
import JobsTextTools
import JobsSwiftTimer
import JobsSwiftTimerMgr
import JobsSwiftPatch
import JobsFuseAnimation
import JobsBy3rdTools
import JobsInheritance
import JobsSwiftAppTools
import JobsSwiftBaseDefines
import JobsSwiftSplash
import JobsSwiftCountryCodeCtrl
import JobsSwiftCalendar
import GKNavigationBarSwift
import SnapKit
import MJRefresh

final class RootListVC: BaseVC {
    private static let demoSectionOrderUserDefaultsKey = "com.BSports.JobsSwiftDemoListSectionOrderUserDefaultsKey"
    private static let pinnedDemoUserDefaultsKey = "com.BSports.JobsSwiftPinnedDemoUserDefaultsKey"

    private enum FunctionMenuAction: CaseIterable {
        case search
        case demoFold
        case settings
    }
    // ================================== JobsSwiftTimer（新版）统一管理 ==================================
    private let timerMgr = JobsSwiftTimerMgr.shared
    private let suspendBtnTimerID = "RootListVC.suspendBtn.timer"
    private let suspendSpinBtnTimerID = "RootListVC.suspendSpinBtn.timer"

    private var suspendBtnTimer: JobsSwiftTimerProtocol?
    private var suspendSpinBtnTimer: JobsSwiftTimerProtocol?
    private var suspendFuseTimer: JobsSwiftTimerProtocol?
    private var suspendFuseStartTS: CFTimeInterval = 0
    private var suspendFuseProgress: CGFloat = 0

    /// 长按后吞掉随后可能冒出来的一次 touchUpInside，避免长按结束后误触发短按音效
    private var suspendFuseLongPressConsumed = false

    /// 旧版 onTimerTick 给 elapsed；新版不再给，自己计数即可
    private var spinSeconds: Int = 0

    deinit {
        suspendBtnTimer?.stop()
        suspendSpinBtnTimer?.stop()
        suspendFuseTimer?.stop()
        try? timerMgr.remove(identifier: suspendBtnTimerID)
        try? timerMgr.remove(identifier: suspendSpinBtnTimerID)

        if let langToken {
            NotificationCenter.default.removeObserver(langToken)
        }
    }

    private var langToken: NSObjectProtocol?
    /// 展开状态（一级目录展开行）
    private var expandedGroups = Set<Int>()
    private var pinnedDemoItems: [DemoItem] = []
    private var demoGroupDragSnapshotView: UIView?
    private var demoGroupDragIndexPath: IndexPath?
    private var demoGroupDragTouchOffsetY: CGFloat = 0
    /// 防抖标记（原逻辑不动）
    private var isPullRefreshing = false
    private var isLoadingMore    = false
    private var demoListHasAppeared = false

    // ================================== 数据源（唯一） ==================================
    private typealias DemoItem  = (title: String, vcType: UIViewController.Type)
    private typealias DemoGroup = (title: String, items: [DemoItem])
    private var demoSearchKeyword = ""
    /// ✅ 唯一数据源：外层=一级目录；内层=二级目录列表
    private lazy var g0 : [DemoItem] = {
        var temp: [DemoItem] = [
            ("🔽 下拉三角小菜单", FSPopoverDemoVC.self),
            ("🏞️ 利用第三方进行图片加载", PicLoadDemoVC.self),
            ("🍚 选择器", BRPickerDemoVC.self),
            ("🌛 朋友圈@GKPhotoBrowserByUIKit", GKPhotoBrowserByUIKitDemoVC.self),
            ("🌛 朋友圈@GKPhotoBrowserByTexture", GKPhotoBrowserByTextureSwiftSupportDemoVC.self),
            ("📖 Texture", ComponentKitLikeKitchenSinkVC.self),
            ("📅 日历", LunarDemoVC.self),
            ("📊 Excel", XLSXDemoVC.self),
//            ("🗃️ ObjectBox", ObjectBoxDemoVC.self),
            ("🪵 PDF", PDFDemoVC.self),
            ("😝 PromiseKit", PromiseKitDemoVC.self),
            ("🧒 Lottie动画", LottieDemoVC.self),
            ("☠️ 骨架屏", SkeletonViewDemoVC.self),
            ("🌹 弹出方式", SwiftEntryKitDemoVC.self),
            ("💬 LiveChat", LiveChatDemoVC.self)
        ]
        #if canImport(FMDB) && !canImport(WCDB)
        temp.insert(("🛢️ FMDB@如需测试WCDB需要在Podfile屏蔽FMDB", FMDBDemoVC.self), at: 1) // 或 append
        #endif

        #if !canImport(FMDB) && canImport(WCDB)
        temp.insert( ("🐧 腾讯数据库@如需测试FMDB需要在Podfile屏蔽WCDB)", WCDBDemoVC.self), at: 2) // 或 append
        #endif
        return temp
    }()

    private lazy var g1 : [DemoItem] = {
        var temp: [DemoItem] = [
            ("🐦 Swift ➤ Flutter", FlutterDemoVC.self),
        ]
        #if !targetEnvironment(simulator)
        temp.insert(("🚀 Unity", UnityDemoVC.self), at: 0) // 或 append
        #endif
        return temp
    }()
    /// ✅ 懒加载，数组配置写在这里
    private var allDemo2D: [DemoGroup] = []
    private var demo2D: [DemoGroup] = []
    private func makeDemo2D() -> [DemoGroup] {
        return [
            (title: "Swift Package Manager 集成示例", items: [
                ("📦 本地 SPM 综合能力", SwiftPackageManagerDemoVC.self)
            ]),
            (title: "JobsSwiftTimer系列衍生产品", items: [
                ("🐯 节流防抖", JobsWorkerDemoVC.self),
                ("🧠 任务中枢@TaskCenter", TaskCenterComponentDemoVC.self),
                ("⏰ JobsSwiftTimer", TimerDemoVC.self),
                ("🛠️ Jobs时间管理大师", JobsTimerMgrDemoVC.self),
                ("🎲 时时彩@单页面管理多个Timer", JobsMultiTimerTableDemoVC.self),
                ("🏷️ 动效数字标签", AnimationEffectLabelDemoVC.self),
                ("🏷️ 动效数字按钮", AnimatedButtonNumberDemoVC.self),
                ("🐎 跑马灯 / 🛞 轮播图", JobsMarqueeDemoVC.self),
                ("💥 倒计时按钮", JobsCountdownDemoVC.self),
                ("🕖 时钟", ClockDemoVC.self),
                ("🎲 抽奖轮盘@仿系统减速曲线", LuckyWheelDemoVC.self),
                ("🧧 红包雨", RedPacketRainDemoVC.self),
                ("💣 任意UIView.layer@导火索倒计时效果", JobsCountdownLayerDemoVC.self),
                ("🟩⬜⬜ 系统进度条", JobsSysProgressDemoVC.self),
                ("🟩🟩⬜ 自定义进度条（进度值+前进方向）", JobsProgressDemoVC.self)
            ]),
            (title: "Pods集成@其他外源框架使用示例", items: g0),
            (title: "Pods集成@网络请求适用示例", items: [
                ("🌍 JobsNetworking 公共网络接口", JobsNetworkingListDemoVC.self),
                ("🌍 JobsNetworking 本地模拟数据", JobsNetworkingDemoVC.self),
                ("🐒 猿题库网络请求框架@Objc", YTKNetworkDemoVC.self),
                ("🛜 Moya网络请求框架", MoyaDemoVC.self),
                ("🛜 Alamofire网络请求框架", AFDemoVC.self),
            ]),
            (title: "3rd集成@区分设备条件编译", items: g1),
            (title: "直播项目相关", items: [
                ("⏺️ 本地录制到系统相册", HKLocalRecordVC.self),
                ("🌘 直播间@滚动留言", LiveCommentDemoVC.self),
                ("📺 直播推流", HKLiveVC.self),
                ("📹 播放器@BMPlayer(🛜 网络流量监控)", BMPlayerDemoVC.self),
                ("📹 播放器@PNPlayer", PNPlayerDemoVC.self),
            ]),
            (title: "炫技特效", items: [
                ("🗜️ UITableViewCell的折叠效果", FoldTableDemoVC.self),
                ("👛 钱包卡片效果", JobsWalletDemoVC.self),
                ("☁️ 镂空特效", TransparentRegionVC.self),
                ("🧩 打马赛克", MosaicDemoListVC.self),
                ("🌍 球形特效（可拖动点选）", SphereDemoVC.self),
                ("🔘 不规则形状按钮", IrregularButtonDemoVC.self),
                ("🧭 苹果滑动开锁@带骨架屏的呼吸效果", SlideToUnlockDemoVC.self),
                ("🔒 手势解锁", GestureUnlockDemoVC.self),
                ("⏱️ 仪表盘", FTDashboadDemoVC.self),
            ]),
            (title: "实用UI@Sys", items: [
                ("🔘 按钮的替代解决方案", JobsButtonDemoVC.self),
                ("🔘 按钮", UIButtonDemoVC.self),
                ("🔘 依据状态为按钮设置不同背景颜色", UIButtonBackgroundColorDemoVC.self),
                ("🌞 BaseWebView", BaseWebViewDemoVC.self),
                ("✍️ UITextField", UITextFieldDemoVC.self),
                ("✍️ UITextView", UITextViewDemoVC.self),
                ("🗄️ UITableView", EmptyTableViewDemoVC.self),
                ("🗄️ UITableView设置圆角和边距", UITableViewCellCornerDemoVC.self),
                ("🗄️ UICollectionView", EmptyCollectionViewDemoVC.self),
                ("💬 JobsSwiftComment", JobsSwiftCommentDemoVC.self),
                ("🔍 JobsSwiftSearcher", JobsSwiftSearcherDemoVC.self),
                ("😂 按钮完全覆盖在UICollectionViewCell上", BtnFullOnCVCellDemoVC.self),
                ("😂 按钮完全覆盖在UITableViewCell上", BtnFullOnTBVCellDemoVC.self),
                ("🧭 系统导航栏@富文本标题", JobsNavigationDemoVC.self),
            ]),
            (title: "实用工具集", items: [
                ("📢 本地通知", LocalNotificationDemoVC.self),
                ("🧹 JobsSwiftRefresher", JobsSwiftRefresherDemoVC.self),
                ("🧹 JobsSwiftRefresher（非正式协议闭包化）", JobsSwiftRefresherBy非正式协议闭包化DemoVC.self),
                ("⌨️ 键盘", KeyboardDemoVC.self),
                ("📷 鉴权后调用相机/相册", PhotoAlbumDemoVC.self),
                ("🌍 JobsSwiftCountryCodeCtrl", JobsSwiftCountryCodeCtrlDemoVC.self),
                ("📅 JobsSwiftCalendar", JobsSwiftCalendarDemoVC.self),
                ("🔥 JobsSwiftPatch", JobsSwiftPatchDemoVC.self),
                ("🕹️ ControlEvents", JobsControlEventsDemoVC.self),
                ("图形验证码", JobsSwiftGraphicCaptchaDemoVC.self),
                ("🌍 JobsTabBarCtrl", TabBarDemoVC.self),
                ("🏷️ Toast", ToastDemoVC.self),
                ("⚠️ 系统的弹出框", UIAlertDemoVC.self),
                ("🐎 二维码/条形码", QRCodeDemoVC.self),
                ("👮 中国大陆公民身份证号码校验", CNIDDemoVC.self),
                ("🧧 TraitChange", TraitChangeDemoVC.self),
                ("🚀 JobsOpen", JobsOpenDemoVC.self),
            ]),
            (title: "一些常见功能模块页面", items: [
                ("📮 经典的消息页面", MessageListDemoVC.self),
                ("🔥 编辑个人资料", LGOEditProfileVC.self),
                ("🏠 首页联动", HomeLinkageDemoListVC.self),
                ("🔑 注册登录".tr + " (TODO)", JobsAppDoorDemoVC.self),
            ]),
            (title: "富文本/普通文本处理", items: [
                ("🌋 富文本", RichTextDemoVC.self),
                ("🌋 普通文本和富文本的融合数据类型", JobsTextDemoVC.self),
            ]),
            (title: "安全推页面（高度自定义）", items: [
                ("🧩 UIView支持上下左右Push和原路返回", JobsViewPushDemoVC.self),
                ("⛑️ 支持上下左右安全Push和原路返回", SafetyPushDemoVC.self),
                ("⛑️ 安全Present", SafetyPresentDemoVC.self),
            ]),
            (title: "其他", items: [
//                ("📌 自定义注解", 自定义注解DemoVC.self),
                ("🛢️ 解码", SafeCodableDemoVC.self),
                ("❄️ 雪花算法", SnowflakeDemoVC.self),
            ])
        ]
    }
    // ================================== 悬浮控件（原逻辑不动） ==================================
    private lazy var suspendBtn: UIButton = {
        UIButton(type: .system)
            .byTitle("当前时间", for: .normal)
            .byTitleFont(.systemFont(ofSize: 18, weight: .bold))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemBlue, for: .normal)
            .byCornerRadius(10)
            .byMasksToBounds(true)
            .onLongPress(minimumPressDuration: 0.8) { _, _ in
                "长按了悬浮按钮".toast
            }
            .onTap { [weak self] _ in
                guard let self else { return }
                "点击了悬浮按钮".toast
            }
            .bySuspend { cfg in
                cfg
                    .byContainer(view)
                    .byStart { _ in
                        CGPoint(x: 15, y: 120)  // 这里就是“safeArea 内部坐标”，不用再加 safeAreaInsets.top
                    }
                    .byFallbackSize(CGSize(width: 110, height: 66))
                    .byDocking(.nearestEdge)
                    .byHapticOnDock(true)
            }
    }()

    private lazy var suspendSpinBtn: UIButton = {
        UIButton(type: .system)
            .byTitle("0", for: .normal)
            .byTitleFont(.systemFont(ofSize: 22, weight: .bold))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemOrange, for: .normal)
            .byCornerRadius(25)
            .byMasksToBounds(true)
            .onLongPress(minimumPressDuration: 0.8) { _, _ in
                "长按了悬浮按钮".toast
            }
            .onTap { [weak self] btn in
                guard let self else { return }
                if btn.jobs_isSpinning {
                    btn.bySpinPause()
                    self.suspendSpinBtnTimer?.pause()
                    "已暂停旋转 & 计时".toast
                } else {
                    btn.bySpinStart()
                    self.suspendSpinBtnTimer?.resume()
                    "继续旋转 & 计时".toast
                }
                btn.playTapBounce(haptic: .light)
            }
            .bySuspend { cfg in
                cfg
                    .byContainer(view)
                    .byStart(.point(CGPoint(x: Screen.width - 60, y: Screen.height - 100)))
                    .byFallbackSize(CGSize(width: 50, height: 50))
                    .byHapticOnDock(true)
            }
    }()

    private lazy var suspendFuseBtn: UIButton = {
        UIButton(type: .system)
            .byTitle("按".tr, for: .normal)
            .byTitleFont(.systemFont(ofSize: 10, weight: .bold))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemPurple, for: .normal)
            .byCornerRadius(25)
            .byMasksToBounds(true)
            .byPointerInteractionEnabled(false)
            .byAccessibilityIdentifier("RootListVC.suspendFuseBtn")
            .onTap { [weak self] sender in
                guard let self else { return }
                // 短按：只播放声音；长按结束后可能冒出来的 tap 直接吞掉
                guard !self.suspendFuseLongPressConsumed else { return }
                sender.byFusePlaySystemSound()
            }
            .onLongPress(minimumPressDuration: 0.8) { [weak self] btn, gr in
                guard let self else { return }
                switch gr.state {
                case .began:
                    self.suspendFuseLongPressConsumed = true
                    btn.byFusePressStart(
                        ringConfig: JobsFuseOuterRingConfig(
                            lineWidth: 4,
                            strokeColor: .white,
                            trackColor: UIColor.white.withAlphaComponent(0.22),
                            fromOpacity: 1.0,
                            toOpacity: 1.0,
                            growDuration: 1.2,
                            timerInterval: 1.0 / 60.0,
                            repeatsWhileHolding: false,
                            fadeOutDuration: 0.18,
                            inset: 1,
                            startsFromTop: true
                        ),
                        scale: 1.18
                    )

                case .ended, .cancelled, .failed:
                    btn.byFusePressStop()
                    // 给 UIControl 的 touchUpInside 留一点时间，避免长按结束后被当成短按
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) { [weak self] in
                        self?.suspendFuseLongPressConsumed = false
                    }

                default:
                    break
                }
            }
            // ✅ 悬浮：复用 RootListVC 这套 bySuspend 写法
            .bySuspend { cfg in
                cfg
                    .byContainer(view)
                    .byStart(.point(CGPoint(x: 15, y: Screen.height - 100)))
                    .byFallbackSize(CGSize(width: 50, height: 50))
                    .byDocking(.nearestEdge)
                    .byHapticOnDock(true)
            }
    }()
    // ================================== TableView（一级目录） ==================================
    private lazy var functionMenuButton: UIButton = {
        UIButton.sys()
            .byImage("ellipsis.circle".sysImg, for: .normal)
            .byImage("ellipsis.circle.fill".sysImg, for: .selected)
            .onTap { [weak self] sender in
                guard let self else { return }
                sender.isSelected.toggle()
                toggleFunctionMenu(sender.isSelected)
            }
    }()

    private lazy var functionMenuDismissTapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleFunctionMenuDismissTap(_:)))
        gesture.cancelsTouchesInView = false
        return gesture
    }()

    private lazy var demoGroupReorderLongPressGesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleDemoGroupReorderLongPress(_:)))
        gesture.minimumPressDuration = 0.45
        gesture.cancelsTouchesInView = false
        return gesture
    }()

    private lazy var functionMenuTableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(UITableViewCell.self)
            .byScrollEnabled(false)
            .bySeparatorStyle(.singleLine)
            .byCornerRadius(8)
            .byMasksToBounds(true)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(6)
                make.right.equalToSuperview().inset(12)
                make.width.equalTo(210)
                make.height.equalTo(FunctionMenuAction.allCases.count * 44)
            }
    }()

    private lazy var demoSearchBar: UISearchBar = {
        UISearchBar()
            .byPlaceholder("输入关键词搜索 Demo".tr)
            .byDelegate(self)
            .byShowsCancelButton(true)
            .byBarTintColor(.systemBackground)
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview()
                make.height.equalTo(52)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(6)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            // ✅ 关键：禁用预估高度，避免首次布局“画错一遍”
            .byEstimatedRowHeight(0)
            .byEstimatedSectionHeaderHeight(0)
            .byEstimatedSectionFooterHeight(0)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(RootFoldTableCell.self)
            .byNoContentInsetAdjustment()
            .bySeparatorStyle(.none)
            .byNoSectionHeaderTopPadding()
            .byContentInset(UIEdgeInsets(
                top: 0,left: 0, bottom: 0, right: 0
            ))
            // 下拉刷新 Header
            .byRefreshHeader(component: JobsDefaultHeader(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                Task { @MainActor in
                    self.tableView.byReloadData()
                    self.tableView.switchRefreshHeader(to: .normal)
                    self.tableView.switchRefreshFooter(to: .normal) // 复位“无更多”
                }
            }
            // 上拉加载 Footer
            .byRefreshFooter(component: JobsDefaultFooter(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                Task { @MainActor in
                    self.tableView.switchRefreshFooter(to: .noMoreData)
                }
            }
            .byAddTo(view) {[unowned self] make in
                make.left.bottom.right.equalToSuperview()
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
            .onResult { [weak self] tableView in
                guard let self,
                      let tableView = tableView as? UITableView else { return }
                tableView.addGestureRecognizer(self.demoGroupReorderLongPressGesture)
            }
    }()
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
//        OCCls().string("q", image: "".img)
        reloadDemoDataFromSource()
        langToken = NotificationCenter.default.addObserver(
            forName: .JobsLanguageDidChange, object: nil, queue: .main
        ) { [weak self] _ in
            guard let self else { return }
            self.reloadDemoDataFromSource()
            self.gk_navTitle = "演武堂".tr
            self.tableView.reloadData()
            self.functionMenuTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        RootListPreferences.applyPreferredInterfaceStyle()
        jobsSetupGKNav(
            title: "演武堂".tr,
            leftButton: UIButton.sys()
                .byFrame(CGRect(x: 0, y: 0, width: 32.w, height: 32.h))
                .byImage("list.bullet".sysImg, for: .normal)
                .byImage("list.bullet".sysImg, for: .selected)
                .onTap { [weak self] sender in
                    guard let self else { return }
                    sender.isSelected.toggle()
                    self.jobsSideDrawer?.toggleDrawer()
                    print("")
                }
                .onTapAppend { _ in
                    print("追加的点按事件")
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
                .onLongPressAppend(minimumPressDuration: 0.8) { _, _ in
                    print("追加的长按事件")
                },
            rightButtons: [functionMenuButton]
        )
        demoSearchBar.byVisible(NO)
        tableView.byVisible(YES)
        functionMenuTableView.byVisible(NO)
        view.addGestureRecognizer(functionMenuDismissTapGesture)
        updateFooterAvailability()

        suspendSpinBtn.bySpinStart()
        suspendBtn.byVisible(YES)
        suspendFuseBtn.byVisible(YES)

        setupJobsTimers()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.beginUpdates()
        tableView.endUpdates()
        if demoListHasAppeared && RootListPreferences.returnToTopAndRefreshEnabled {
            reloadDemoListToTopAndRefresh()
        }
        demoListHasAppeared = true

        suspendBtnTimer?.resume()
        suspendSpinBtnTimer?.resume()
    }
}

extension RootListVC{
    // ================================== JobsSwiftTimer（新版）创建与绑定 UI ==================================
    private func setupJobsTimers() {
        // 1) suspendBtn：每秒刷新当前时间
        do {
            let cfg = JobsSwiftTimerConfig(interval: 1.0,
                                           repeats: true,
                                           tolerance: 0,
                                           queue: .main)
            suspendBtnTimer = try timerMgr.create(
                kind: .gcd,
                identifier: suspendBtnTimerID,
                config: cfg,
                dedupPolicy: .replace
            ) { [weak self] in
                onMainAsync(self) { vc in
                    let btn = vc.suspendBtn
                    if btn.title(for: .normal) != "当前时间" {
                        btn.byTitle("当前时间", for: .normal)
                    }
                    btn.bySubTitle(nowClock(), for: .normal)
                    btn.bySetNeedsUpdateConfiguration()
                }
            }
            suspendBtnTimer?.start()
        } catch {
            print("❌ create suspendBtnTimer failed: \(error)")
        }

        // 2) suspendSpinBtn：每秒 +1 显示秒数（替代旧 elapsed）
        do {
            spinSeconds = 0
            let cfg = JobsSwiftTimerConfig(interval: 1.0,
                                           repeats: true,
                                           tolerance: 0,
                                           queue: .main)
            suspendSpinBtnTimer = try timerMgr.create(
                kind: .gcd,
                identifier: suspendSpinBtnTimerID,
                config: cfg,
                dedupPolicy: .replace
            ) { [weak self] in
                onMainAsync(self) { vc in
                    vc.spinSeconds += 1
                    let btn = vc.suspendSpinBtn
                    let sec = vc.spinSeconds
                    if btn.title(for: .normal) != "\(sec)" {
                        btn.byTitle("\(sec)", for: .normal)
                            .bySetNeedsUpdateConfiguration()
                    }
                }
            }
            suspendSpinBtnTimer?.start()
        } catch {
            print("❌ create suspendSpinBtnTimer failed: \(error)")
        }
    }

    private var hasPinnedDemoSection: Bool {
        !pinnedDemoItems.isEmpty
    }

    private var demoGroupTableSection: Int {
        hasPinnedDemoSection ? 1 : 0
    }

    private var demoSearchEnabled: Bool {
        !demoSearchBar.isHidden
    }

    private func reloadDemoDataFromSource() {
        allDemo2D = makeDemo2D()
        applySavedDemoSectionOrderIfNeeded()
        applySavedPinnedDemosIfNeeded()
        applySearchKeyword(demoSearchKeyword)
    }

    private func demoPersistentKey(for item: DemoItem) -> String {
        "cls:\(String(reflecting: item.vcType))"
    }

    private func isPinnedDemoItem(_ item: DemoItem) -> Bool {
        let key = demoPersistentKey(for: item)
        return pinnedDemoItems.contains { demoPersistentKey(for: $0) == key }
    }

    private func savedPinnedDemoKeys() -> [String] {
        guard let keys = UserDefaults.standard.array(forKey: Self.pinnedDemoUserDefaultsKey) as? [String] else { return [] }
        var result: [String] = []
        for key in keys where !key.isEmpty && !result.contains(key) {
            result.append(key)
        };return result
    }

    private func applySavedPinnedDemosIfNeeded() {
        let savedKeys = savedPinnedDemoKeys()
        guard !savedKeys.isEmpty else {
            pinnedDemoItems.removeAll()
            return
        }
        let allItems = allDemo2D.flatMap { $0.items }
        pinnedDemoItems = savedKeys.compactMap { key in
            allItems.first { demoPersistentKey(for: $0) == key }
        }
        if pinnedDemoItems.count != savedKeys.count {
            savePinnedDemos()
        }
    }

    private func savePinnedDemos() {
        let keys = pinnedDemoItems.map { demoPersistentKey(for: $0) }
        if keys.isEmpty {
            UserDefaults.standard.removeObject(forKey: Self.pinnedDemoUserDefaultsKey)
        } else {
            UserDefaults.standard.set(keys, forKey: Self.pinnedDemoUserDefaultsKey)
        }
        UserDefaults.standard.synchronize()
    }

    private func pinDemoItem(_ item: DemoItem) {
        guard !isPinnedDemoItem(item) else { return }
        pinnedDemoItems.append(item)
        savePinnedDemos()
        applySearchKeyword(demoSearchKeyword)
        tableView.reloadData()
        tableView.layoutIfNeeded()
        tableView.setContentOffset(CGPoint(x: 0, y: -tableView.adjustedContentInset.top), animated: true)
    }

    private func unpinPinnedDemo(at index: Int) {
        guard pinnedDemoItems.indices.contains(index) else { return }
        let item = pinnedDemoItems.remove(at: index)
        let key = demoPersistentKey(for: item)
        savePinnedDemos()
        applySearchKeyword(demoSearchKeyword)
        if let row = demo2D.firstIndex(where: { group in
            group.items.contains { demoPersistentKey(for: $0) == key }
        }) {
            expandedGroups.insert(row)
        }
        tableView.reloadData()
    }

    private func savedDemoSectionOrder() -> [String] {
        guard let titles = UserDefaults.standard.array(forKey: Self.demoSectionOrderUserDefaultsKey) as? [String] else { return [] };return titles.filter { !$0.isEmpty }
    }

    private func applySavedDemoSectionOrderIfNeeded() {
        let titles = savedDemoSectionOrder()
        guard !titles.isEmpty, allDemo2D.count > 1 else { return }
        var unorderedGroups = allDemo2D
        var orderedGroups: [DemoGroup] = []
        for title in titles {
            guard let index = unorderedGroups.firstIndex(where: { $0.title == title }) else { continue }
            orderedGroups.append(unorderedGroups.remove(at: index))
        }
        orderedGroups.append(contentsOf: unorderedGroups)
        if orderedGroups.count == allDemo2D.count {
            allDemo2D = orderedGroups
        }
    }

    private func saveDemoSectionOrder() {
        UserDefaults.standard.set(allDemo2D.map { $0.title }, forKey: Self.demoSectionOrderUserDefaultsKey)
        UserDefaults.standard.synchronize()
    }

    private func applySearchKeyword(_ keyword: String) {
        demoSearchKeyword = keyword.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !demoSearchKeyword.isEmpty else {
            demo2D = allDemo2D.compactMap { group in
                let items = group.items.filter { !isPinnedDemoItem($0) };return items.isEmpty ? nil : (title: group.title, items: items)
            }
            expandedGroups.removeAll()
            return
        }
        demo2D = allDemo2D.compactMap { group in
            let unpinnedItems = group.items.filter { !isPinnedDemoItem($0) }
            let matchedItems = unpinnedItems.filter {
                demoSearchKeyword.inStr($0.title)
                    || demoSearchKeyword.inStr(String(describing: $0.vcType))
            }
            if demoSearchKeyword.inStr(group.title) {
                return unpinnedItems.isEmpty ? nil : (title: group.title, items: unpinnedItems)
            };return matchedItems.isEmpty ? nil : (title: group.title, items: matchedItems)
        }
        expandedGroups = Set(demo2D.indices)
    }

    @objc private func handleFunctionMenuDismissTap(_ gesture: UITapGestureRecognizer) {
        guard !functionMenuTableView.isHidden else { return }
        let point = gesture.location(in: view)
        let buttonFrame = functionMenuButton.convert(functionMenuButton.bounds, to: view)
        if functionMenuTableView.frame.contains(point) || buttonFrame.contains(point) {
            return
        }
        toggleFunctionMenu(false)
    }

    @objc private func handleDemoGroupReorderLongPress(_ gesture: UILongPressGestureRecognizer) {
        guard gesture.view === tableView else { return }
        if demoSearchEnabled {
            if gesture.state == .began {
                "搜索状态下不可排序".tr.toast
            }
            finishDemoGroupDrag()
            return
        }
        let point = gesture.location(in: tableView)
        switch gesture.state {
        case .began:
            guard let indexPath = tableView.indexPathForRow(at: point),
                  canDragDemoGroup(at: indexPath),
                  let cell = tableView.cellForRow(at: indexPath),
                  let snapshotView = cell.snapshotView(afterScreenUpdates: false) else { return }
            snapshotView.frame = cell.frame
            snapshotView.layer.shadowColor = UIColor.black.cgColor
            snapshotView.layer.shadowOpacity = 0.18
            snapshotView.layer.shadowRadius = 10
            snapshotView.layer.shadowOffset = CGSize(width: 0, height: 6)
            tableView.addSubview(snapshotView)
            demoGroupDragSnapshotView = snapshotView
            demoGroupDragIndexPath = indexPath
            demoGroupDragTouchOffsetY = point.y - cell.frame.midY
            cell.isHidden = true
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()

        case .changed:
            guard let snapshotView = demoGroupDragSnapshotView,
                  let sourceIndexPath = demoGroupDragIndexPath else { return }
            var center = snapshotView.center
            center.y = point.y - demoGroupDragTouchOffsetY
            snapshotView.center = center
            guard let destinationIndexPath = tableView.indexPathForRow(at: center),
                  canDragDemoGroup(at: destinationIndexPath),
                  destinationIndexPath != sourceIndexPath else { return }
            moveDemoGroup(from: sourceIndexPath, to: destinationIndexPath)
            tableView.beginUpdates()
            tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
            tableView.endUpdates()
            demoGroupDragIndexPath = destinationIndexPath
            tableView.visibleCells.forEach { $0.isHidden = false }
            tableView.cellForRow(at: destinationIndexPath)?.isHidden = true

        case .ended, .cancelled, .failed:
            finishDemoGroupDrag()

        default:
            break
        }
    }

    private func canDragDemoGroup(at indexPath: IndexPath) -> Bool {
        indexPath.section == demoGroupTableSection &&
        demo2D.indices.contains(indexPath.row) &&
        demo2D.count > 1
    }

    private func moveDemoGroup(from sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let sourceRow = sourceIndexPath.row
        let destinationRow = destinationIndexPath.row
        guard sourceRow != destinationRow,
              demo2D.indices.contains(sourceRow),
              demo2D.indices.contains(destinationRow) else { return }
        let sourceTitle = demo2D[sourceRow].title
        let destinationTitle = demo2D[destinationRow].title
        guard let sourceIndex = allDemo2D.firstIndex(where: { $0.title == sourceTitle }),
              let destinationIndex = allDemo2D.firstIndex(where: { $0.title == destinationTitle }) else { return }
        let visibleGroup = demo2D.remove(at: sourceRow)
        demo2D.insert(visibleGroup, at: destinationRow)
        let group = allDemo2D.remove(at: sourceIndex)
        allDemo2D.insert(group, at: min(destinationIndex, allDemo2D.count))
        moveExpandedDemoGroupState(from: sourceRow, to: destinationRow)
    }

    private func moveExpandedDemoGroupState(from sourceRow: Int, to destinationRow: Int) {
        guard sourceRow != destinationRow else { return }
        var next = Set<Int>()
        for row in expandedGroups {
            if row == sourceRow {
                next.insert(destinationRow)
            } else if sourceRow < destinationRow && row > sourceRow && row <= destinationRow {
                next.insert(row - 1)
            } else if destinationRow < sourceRow && row >= destinationRow && row < sourceRow {
                next.insert(row + 1)
            } else {
                next.insert(row)
            }
        }
        expandedGroups = next
    }

    private func finishDemoGroupDrag() {
        guard let snapshotView = demoGroupDragSnapshotView else { return }
        let indexPath = demoGroupDragIndexPath
        let cell = indexPath.flatMap { tableView.cellForRow(at: $0) }
        let clearState = { [weak self, weak cell, weak snapshotView] in
            cell?.isHidden = false
            snapshotView?.removeFromSuperview()
            self?.demoGroupDragSnapshotView = nil
            self?.demoGroupDragIndexPath = nil
            self?.demoGroupDragTouchOffsetY = 0
            self?.saveDemoSectionOrder()
        }
        guard let cell else {
            clearState()
            return
        }
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: [.curveEaseOut, .allowUserInteraction]) {
            snapshotView.frame = cell.frame
        } completion: { _ in
            clearState()
        }
    }

    private func menuTitle(for action: FunctionMenuAction) -> String {
        switch action {
        case .search:
            return "搜索 Demo".tr
        case .demoFold:
            return demoFoldSwitchTitle()
        case .settings:
            return "设置".tr
        }
    }

    private func demoFoldSwitchTitle() -> String {
        anyVisibleDemoGroupExpanded() ? "全部收缩".tr : "全部展开".tr
    }

    private func anyVisibleDemoGroupExpanded() -> Bool {
        !expandedGroups.isEmpty
    }

    private func setAllDemoGroupsExpanded(_ expanded: Bool) {
        expandedGroups = expanded ? Set(demo2D.indices) : []
        tableView.reloadData()
        updateFooterAvailability()
    }

    private func reloadDemoListToTopAndRefresh() {
        reloadDemoDataFromSource()
        tableView.reloadData()
        tableView.layoutIfNeeded()
        tableView.setContentOffset(CGPoint(x: 0, y: -tableView.adjustedContentInset.top), animated: false)
        tableView.mj_header?.beginRefreshing()
    }

    private func toggleFunctionMenu(_ visible: Bool) {
        functionMenuButton.isSelected = visible
        functionMenuTableView.byVisible(visible)
        if visible {
            functionMenuTableView.reloadData()
            view.bringSubviewToFront(functionMenuTableView)
        }
    }

    private func searchCancelButton(in view: UIView) -> UIButton? {
        if let button = view as? UIButton {
            return button
        }
        for subview in view.subviews {
            if let button = searchCancelButton(in: subview) {
                return button
            }
        };return nil
    }

    private func updateSearchCancelButtonStyle() {
        demoSearchBar.tintColor = .systemBlue
        demoSearchBar.layoutIfNeeded()
        guard let button = searchCancelButton(in: demoSearchBar) else { return }
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.75), for: .highlighted)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }

    private func handleMenuAction(_ action: FunctionMenuAction) {
        toggleFunctionMenu(false)
        switch action {
        case .search:
            setSearchEnabled(true)
        case .demoFold:
            setAllDemoGroupsExpanded(!anyVisibleDemoGroupExpanded())
        case .settings:
            RootListSettingsVC().byPush(self)
        }
    }

    private func setSearchEnabled(_ enabled: Bool) {
        demoSearchBar.byVisible(enabled)
        tableView.snp.remakeConstraints { [unowned self] make in
            make.left.bottom.right.equalToSuperview()
            if enabled {
                make.top.equalTo(demoSearchBar.snp.bottom).offset(6)
            } else if view.jobs_hasVisibleTopBar() {
                make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
            } else {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            }
        }
        if enabled {
            demoSearchBar.becomeFirstResponder()
            updateSearchCancelButtonStyle()
            DispatchQueue.main.async { [weak self] in
                self?.updateSearchCancelButtonStyle()
            }
        } else {
            demoSearchBar.byText("")
            applySearchKeyword("")
            demoSearchBar.resignFirstResponder()
            tableView.reloadData()
            updateFooterAvailability()
        }
    }

    // MARK: - Footer 自动显隐逻辑（原逻辑不动）
    private func updateFooterAvailability() {
        tableView.layoutIfNeeded()
        let contentH = tableView.contentSize.height
        let visibleH = tableView.bounds.height
            - tableView.adjustedContentInset.top
            - tableView.adjustedContentInset.bottom
        let enableLoadMore = contentH > visibleH + 20
        tableView.mj_footer?.isHidden = !enableLoadMore
        if !enableLoadMore {
            /// TODO
        }
    }
}
// MARK: —— UISearchBarDelegate
extension RootListVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        applySearchKeyword(searchText)
        tableView.reloadData()
        updateFooterAvailability()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        setSearchEnabled(false)
    }
}
// MARK: —— UITableViewDataSource & UITableViewDelegate
extension RootListVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView === functionMenuTableView { return 1 };return hasPinnedDemoSection ? 2 : 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView === functionMenuTableView {
            return FunctionMenuAction.allCases.count
        }
        if hasPinnedDemoSection && section == 0 {
            return 1
        };return section == demoGroupTableSection ? demo2D.count : 0
    }
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView === functionMenuTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
            let action = FunctionMenuAction.allCases[indexPath.row]
            cell.textLabel?.text = menuTitle(for: action)
            cell.textLabel?.font = .systemFont(ofSize: 15, weight: .medium)
            cell.accessoryType = .none
            cell.selectionStyle = .default
            return cell
        }
        if hasPinnedDemoSection && indexPath.section == 0 {
            let cell: RootFoldTableCell = tableView.byDequeueReusableCell(withType: RootFoldTableCell.self,for: indexPath)
            cell.configurePinned(groupTitle: "置顶".tr,
                                 items: pinnedDemoItems) { [weak self] itemIndex in
                guard let self,
                      self.pinnedDemoItems.indices.contains(itemIndex) else { return }
                self.pinnedDemoItems[itemIndex].vcType.init().byPush(self)
            } unpinItem: { [weak self] itemIndex in
                self?.unpinPinnedDemo(at: itemIndex)
            };return cell
        }
        guard indexPath.section == demoGroupTableSection,
              demo2D.indices.contains(indexPath.row) else { return UITableViewCell() }
        let cell: RootFoldTableCell = tableView.byDequeueReusableCell(withType: RootFoldTableCell.self,for: indexPath)
        let row = indexPath.row
        let g = demo2D[row]
        let expanded = expandedGroups.contains(row)
        cell.configure(groupTitle: g.title,
                       items: g.items,
                       expanded: expanded) { [weak self] itemIndex in
            guard let self else { return }
            let vcType = g.items[itemIndex].vcType
            /// 这里推入控制器
            vcType.init().byPush(self)
        } pinItem: { [weak self] itemIndex in
            guard let self,
                  g.items.indices.contains(itemIndex) else { return }
            self.pinDemoItem(g.items[itemIndex])
        };return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView === functionMenuTableView { return 44 }
        if hasPinnedDemoSection && indexPath.section == 0 {
            return RootFoldTableCell.expandedHeight(itemCount: pinnedDemoItems.count)
        }
        guard indexPath.section == demoGroupTableSection,
              demo2D.indices.contains(indexPath.row) else { return .leastNonzeroMagnitude }
        let row = indexPath.row
        return expandedGroups.contains(row)
        ? RootFoldTableCell.expandedHeight(itemCount: demo2D[row].items.count)
        : RootFoldTableCell.collapsedHeight()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView === functionMenuTableView {
            handleMenuAction(FunctionMenuAction.allCases[indexPath.row])
            return
        }
        if hasPinnedDemoSection && indexPath.section == 0 { return }
        guard indexPath.section == demoGroupTableSection,
              demo2D.indices.contains(indexPath.row) else { return }
        let row = indexPath.row
        if expandedGroups.contains(row) {
            expandedGroups.remove(row)
        } else {
            expandedGroups.insert(row)
        }

        if let cell = tableView.cellForRow(at: indexPath) as? RootFoldTableCell {
            cell.setExpanded(expandedGroups.contains(row), animated: true)
        }

        tableView.performBatchUpdates(nil) { [weak self] _ in
            self?.updateFooterAvailability()
        }
    }
}
// MARK: —— UIScrollViewDelegate
extension RootListVC: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        guard scrollView === tableView else { return }
        toggleFunctionMenu(false)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView === tableView else { return }
        updateFooterAvailability()
    }
}
