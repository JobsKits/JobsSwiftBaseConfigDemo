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
import JobsViewPush
#endif

import Jobsl10n
import JobsSwiftSearcher

import JobsSwiftDSL
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
import JobsScreenCapture
import GKNavigationBarSwift
import SnapKit
import MJRefresh

#if DEBUG
import JobsDebugPanel
import JobsSwiftDebugTools
#endif

final class RootListVC: BaseVC {

    #if DEBUG
    /// 直接复用页面注册工厂，避免列表的搜索、折叠和持久化排序影响确定性巡检。
    static func debugCoverageLaunchController() -> UIViewController? {
        let arguments = ProcessInfo.processInfo.arguments
        guard let optionIndex = arguments.firstIndex(of: "--jobs-coverage-route") else {
            return nil
        }
        guard arguments.indices.contains(optionIndex + 1) else {
            print("[JobsCoverage] 缺少页面路由 ID")
            return UIViewController.jobsMake { _ in }
        }
        let routeID = arguments[optionIndex + 1]
        let registry = RootListVC()
        let items: [DemoItem] = registry.makeDemo2D().flatMap(\.items) + [
            ("目录设置", RootListSettingsVC.self),
            ("我的", JobsMeCenterVC.self)
        ]
        print("[JobsCoverage] availableRoutes=\(items.map { String(describing: $0.vcType) }.sorted().joined(separator: ","))")
        let target: UIViewController
        if routeID == "RootListVC" {
            target = registry
        } else if let item = items.first(where: { String(describing: $0.vcType) == routeID }) {
            target = item.vcType.init().byTitle(item.title)
        } else if let module = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String,
                  let type = NSClassFromString("\(module).\(routeID)") as? UIViewController.Type,
                  Bundle(for: type) == Bundle.main {
            target = type.init()
        } else {
            print("[JobsCoverage] 当前构建不包含页面：\(routeID)")
            return UIViewController.jobsMake { _ in }
        }
        JobsCoverageReadyLabel.install(on: registry, routeID: "RootListVC")
        if target !== registry {
            JobsCoverageReadyLabel.install(on: target, routeID: routeID)
        }
        let navigationController = registry.jobsNav.jobsNavContainer
        if target !== registry {
            navigationController.byViewControllers([registry, target])
        }
        return navigationController
    }
    #endif

    private static var demoSectionOrderUserDefaultsKey: String {
        #if DEBUG
        return coveragePreferenceKey("com.BSports.JobsSwiftDemoListSectionOrderUserDefaultsKey")
        #else
        return "com.BSports.JobsSwiftDemoListSectionOrderUserDefaultsKey"
        #endif
    }
    private static let demoSearchHistoryUserDefaultsKey = "com.BSports.JobsSwiftDemoSearchHistoryUserDefaultsKey"
    private static var pinnedDemoUserDefaultsKey: String {
        #if DEBUG
        return coveragePreferenceKey("com.BSports.JobsSwiftPinnedDemoUserDefaultsKey")
        #else
        return "com.BSports.JobsSwiftPinnedDemoUserDefaultsKey"
        #endif
    }
    private static let maximumDemoSearchHistoryCount = 20
    private static let demoProjectTitle = "JobsSwiftBaseConfigDemo"

    #if DEBUG
    private static var initializedCoveragePreferenceKeys = Set<String>()

    private static func coveragePreferenceKey(_ original: String) -> String {
        guard ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") else {
            return original
        }
        let key = "jobs.coverage." + original
        if initializedCoveragePreferenceKeys.insert(key).inserted {
            UserDefaults.standard.removeObject(forKey: key)
        }
        return key
    }

    private lazy var coverageRootOrderLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byTextColor(JobsCor.clear)
            .byFrame(CGRect(x: 8, y: 112, width: 1, height: 1))
            .byAccessibilityIdentifier("jobs.root.groupOrder")
            .byUserInteractionEnabled(false)
            .byAddTo(view)
    }()

    private var coverageRootDragPreparedCount = 0
    private var coverageRootDragBeganCount = 0
    private var coverageRootDropCount = 0
    private var coverageRootDragSourceRow = -1
    private var coverageRootDropDestinationRow = -1
    private lazy var coverageRootDragStateLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byTextColor(JobsCor.clear)
            .byFrame(CGRect(x: 8, y: 114, width: 1, height: 1))
            .byAccessibilityIdentifier("jobs.coverage.root.dragState")
            .byUserInteractionEnabled(false)
            .byAddTo(view)
    }()

    private func refreshCoverageRootDragState() {
        guard ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") else {
            return
        }
        coverageRootDragStateLabel.byText(
            "prepared:\(coverageRootDragPreparedCount);began:\(coverageRootDragBeganCount);drop:\(coverageRootDropCount);source:\(coverageRootDragSourceRow);destination:\(coverageRootDropDestinationRow)"
        )
    }

    private func refreshCoverageRootOrder() {
        guard ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") else {
            return
        }
        refreshCoverageRootDragState()
        coverageRootOrderLabel.byText(allDemo2D.compactMap { group in
            group.items.first.map { String(describing: $0.vcType) }
        }.joined(separator: ","))
    }

    private var coverageActiveRootGestures = Set<String>()
    private lazy var coverageRootGestureLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("idle")
            .byTextColor(JobsCor.clear)
            .byFrame(CGRect(x: 8, y: 110, width: 1, height: 1))
            .byAccessibilityIdentifier("jobs.root.gesture.state")
            .byUserInteractionEnabled(false)
            .byAddTo(view)
    }()

    private func recordCoverageRootGesture(_ name: String,
                                           state: UIGestureRecognizer.State,
                                           condition: Bool = true) {
        guard ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") else {
            return
        }
        if state == .began, condition {
            coverageActiveRootGestures.insert(name)
            coverageRootGestureLabel.byText("\(name):began")
        } else if state == .ended,
                  condition,
                  coverageActiveRootGestures.remove(name) != nil {
            coverageRootGestureLabel.byText("\(name):completed")
        } else if state == .cancelled || state == .failed {
            coverageActiveRootGestures.remove(name)
        }
    }
    #endif

    private enum FunctionMenuAction: CaseIterable {

        case search
        case demoFold
        case settings
    }
    // ================================== JobsSwiftTimer（新版）统一管理 ==================================
    private let timerMgr = JobsSwiftTimerMgr.shared
    private let suspendBtnTimerID = "RootListVC.suspendBtn.timer"
    private let suspendSpinBtnTimerID = "RootListVC.suspendSpinBtn.timer"
    private let progressIndicatorTimerID = "RootListVC.progressIndicator.timer"

    private var suspendBtnTimer: JobsSwiftTimerProtocol?
    private var suspendSpinBtnTimer: JobsSwiftTimerProtocol?
    private var progressIndicatorTimer: JobsSwiftTimerProtocol?
    private var suspendFuseTimer: JobsSwiftTimerProtocol?
    private var suspendFuseStartTS: CFTimeInterval = 0
    private var suspendFuseProgress: CGFloat = 0

    /// 长按后吞掉随后可能冒出来的一次 touchUpInside，避免长按结束后误触发短按音效
    private var suspendFuseLongPressConsumed = false

    /// 旧版 onTimerTick 给 elapsed；新版不再给，自己计数即可
    private var spinSeconds: Int = 0
    private var progressIndicatorPhase = 0

    deinit {
        suspendBtnTimer?.stop()
        suspendSpinBtnTimer?.stop()
        progressIndicatorTimer?.stop()
        suspendFuseTimer?.stop()
        for (gesture, enabled) in demoSearchDrawerGestures {
            gesture.byEnabled(enabled)
        }
        #if DEBUG
        if isDemoSearchPresented {
            Task { @MainActor in
                JobsDebugPanel.shared.byFloatingEntrySuppressed(false)
                VCDebugDeallocDebug.temporarilySuppressesDeinitTips = false
            }
        }
        #endif
        try? timerMgr.remove(identifier: suspendBtnTimerID)
        try? timerMgr.remove(identifier: suspendSpinBtnTimerID)
        try? timerMgr.remove(identifier: progressIndicatorTimerID)
        if let langToken {
            NotificationCenter.default.removeObserver(langToken)
        }
        if let themeToken {
            NotificationCenter.default.removeObserver(themeToken)
        }
    }

    private var langToken: NSObjectProtocol?
    private var themeToken: NSObjectProtocol?
    private var appliedCellTextDisplayStrategy = RootListPreferences.cellTextDisplayStrategy
    /// 展开状态（一级目录展开行）
    private var expandedGroups = Set<Int>()
    private var pinnedDemoItems: [DemoItem] = []
    /// 防抖标记（原逻辑不动）
    private var isPullRefreshing = false
    private var isLoadingMore    = false
    private var demoListHasAppeared = false
    private var didInstallTableRefreshControls = false
    private var pendingDemoListAppearanceUpdate = false

    // ================================== 数据源（唯一） ==================================
    private typealias DemoItem  = (title: String, vcType: UIViewController.Type)
    private typealias DemoGroup = (title: String, items: [DemoItem])
    private var demoSearchKeyword = ""
    private var isDemoSearchPresented = false
    private var demoSearchHomeOffset = CGPoint.zero
    private var demoSearchHomeExpandedGroups = Set<Int>()
    private var demoSearchFloatingVisibility: (time: Bool, spin: Bool, fuse: Bool)?
    private var demoSearchDrawerGestures: [(UIGestureRecognizer, Bool)] = []
    private var demoSearchHeaderWasHidden = false
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
            ("🗃️ ObjectBox", ObjectBoxDemoVC.self),
            ("🪵 PDF", PDFDemoVC.self),
            ("😝 PromiseKit", PromiseKitDemoVC.self),
            ("🧒 Lottie动画", LottieDemoVC.self),
            ("☠️ 骨架屏", SkeletonViewDemoVC.self),
            ("🌹 弹出方式", SwiftEntryKitDemoVC.self),
            ("💬 LiveChat", LiveChatDemoVC.self)
        ]
        #if canImport(FMDB) && !canImport(WCDB)
        temp.insert(("🛢️ FMDB@如需测试WCDB需要在Podfile屏蔽FMDB", FMDBDemoVC.self),
                    at: 1) // 或 append
        #endif
        #if !canImport(FMDB) && canImport(WCDB)
        temp.insert(("🐧 腾讯数据库@如需测试FMDB需要在Podfile屏蔽WCDB)", WCDBDemoVC.self),
                    at: 2) // 或 append
        #endif
        return temp
    }()

    private lazy var g1 : [DemoItem] = {
        var temp: [DemoItem] = [
            ("🐦 Swift ➤ Flutter", FlutterDemoVC.self),
        ]
        #if !targetEnvironment(simulator)
        temp.insert(("🚀 Unity", UnityDemoVC.self),
                    at: 0) // 或 append
        #endif
        return temp
    }()
    /// ✅ 懒加载，数组配置写在这里
    private var allDemo2D: [DemoGroup] = []
    private var demo2D: [DemoGroup] = []
    private var debugPanelDemoItems: [DemoItem] {
        #if DEBUG
        return [("🪲 JobsDebugPanel 调试面板与环境切换", JobsDebugPanelDemoVC.self)]
        #else
        return []
        #endif
    }

    private func makeDemo2D() -> [DemoGroup] {
        return [
            (title: "微应用与容器技术学习".tr, items: [
                    ("微应用 / 微程序：JS 与 Native 白名单桥接", JobsMicroApplicationDemoVC.self),
                    ("应用多开：宿主内独立账号会话", JobsMultiSessionDemoVC.self),
                    ("mPaaS：平台能力协议与本地适配器", JobsMPaaSDemoVC.self),
                    ("沙箱环境：命名空间文件与越界拒绝", JobsSandboxDemoVC.self),
                    ("PWA：原生离线包与 Service Worker", JobsPWADemoVC.self)
                ]),
            (title: "系统能力与硬件通信".tr, items: [
                    ("ARKit · 空间实验室", JobsARKitDemoVC.self),
                    ("设备越狱风险检测与业务门禁", JobsDeviceGuardDemoVC.self),
                    ("本地录音与音频管理", JobsAudioRecorderDemoVC.self),
                    ("📶 JobsBluetooth 全能力 Demo", JobsBluetoothDemoVC.self),
                    ("🧭 CoreMotion DSL Demo", JobsCoreMotionDemoVC.self),
                    ("🪟 SceneDelegate 多场景与窗口会话", JobsSceneDelegateDemoVC.self),
                    ("📳 动作切换 App 图标", JobsMotionAppIconDemoVC.self),
                    ("📸 截屏后 Tips 提示", JobsScreenshotTipsDemoVC.self),
                    ("🙈 禁止截屏：敏感内容保护", JobsScreenshotProtectionDemoVC.self),
                    ("📱 全局横竖屏切换", JobsLandscapeSwitchDemoVC.self),
                    ("📋 系统剪贴板及粘贴提示", JobsClipboardCueDemoVC.self),
                    ("📱 iOS Widget", JobsWidgetDemoVC.self)
                ]),
            (title: "JobsSwiftTimer系列衍生产品".tr, items: [
                    ("🐯 节流防抖", JobsWorkerDemoVC.self),
                    ("🧠 任务中枢@TaskCenter", TaskCenterComponentDemoVC.self),
                    ("⏰ JobsSwiftTimer", TimerDemoVC.self),
                    ("🛠️ Jobs时间管理大师", JobsTimerMgrDemoVC.self),
                    ("🎲 时时彩@单页面管理多个Timer", JobsMultiTimerTableDemoVC.self),
                    ("动态时钟图标｜顺/逆时针", JobsImageRotationDemoVC.self),
                    ("🏷️ 动效数字按钮", AnimatedButtonNumberDemoVC.self),
                    ("🐎 跑马灯 / 🛞 轮播图", JobsMarqueeDemoVC.self),
                    ("💥 倒计时按钮", JobsCountdownDemoVC.self),
                    ("时钟", ClockDemoVC.self),
                    ("🎲 抽奖轮盘@仿系统减速曲线", LuckyWheelDemoVC.self),
                    ("🧧 红包雨", RedPacketRainDemoVC.self),
                    ("💣 任意UIView.layer@导火索倒计时效果", JobsCountdownLayerDemoVC.self),
                    ("系统进度条", JobsSysProgressDemoVC.self),
                    ("自定义进度条（进度值+前进方向）", JobsProgressDemoVC.self)
                ]),
            (title: "Label".tr, items: [
                    ("🏷️ 动效数字标签", AnimationEffectLabelDemoVC.self),
                    ("🏷️ UILabel+Scrolling｜四种定尺寸文字策略", UILabelScrollingDemoVC.self),
                    ("🏷️ UILabel / UIButton.titleLabel 表现列表", JobsLabelBehaviorDemoVC.self),
                    ("🏷️ 可交互自定义 Label", JobsInteractiveLabelDemoVC.self),
                    ("• 带小圆点文本及对齐", JobsBulletTextDemoVC.self),
                    ("🔄 UILabel 文字旋转", JobsLabelRotationDemoVC.self)
                ]),
            (title: "阿里巴巴矢量图标库".tr, items: [
                    ("JobsIconfont｜图片、图标字体与文字字体", JobsIconfontDemoListVC.self)
                ]),
            (title: "Pods集成@其他外源框架使用示例".tr, items: g0),
            (title: "Pods集成@网络请求适用示例".tr, items: [
                    ("🌍 JobsNetworking 公共网络接口", JobsNetworkingListDemoVC.self),
                    ("🌍 JobsNetworking 本地模拟数据", JobsNetworkingDemoVC.self),
                    ("🐒 猿题库网络请求框架@Objc", YTKNetworkDemoVC.self),
                    ("↔️ WebSocket 双向通信", JobsWebSocketDemoVC.self),
                    ("🛜 Moya网络请求框架", MoyaDemoVC.self),
                    ("🛜 Alamofire网络请求框架", AFDemoVC.self),
                ]),
            (title: "3rd集成@区分设备条件编译".tr, items: g1),
            (title: "直播项目相关".tr, items: [
                    ("⏺️ 本地录制到系统相册", HKLocalRecordVC.self),
                    ("🌘 直播间@滚动留言", LiveCommentDemoVC.self),
                    ("📺 直播推流", HKLiveVC.self),
                    ("📹 播放器@BMPlayer(🛜 网络流量监控)", BMPlayerDemoVC.self),
                    ("📹 播放器@PNPlayer", PNPlayerDemoVC.self),
                ]),
            (title: "炫技特效".tr, items: [
                    ("🗜️ UITableViewCell的折叠效果", FoldTableDemoVC.self),
                    ("👛 钱包卡片效果", JobsWalletDemoVC.self),
                    ("☁️ 镂空特效", TransparentRegionVC.self),
                    ("🧩 打马赛克", MosaicDemoListVC.self),
                    ("👍 长按点赞冒泡", JobsLongPressLikeDemoVC.self),
                    ("🔴 抖音双球刷新动画", JobsDouyinRefreshDemoVC.self),
                    ("🌍 球形特效（可拖动点选）", SphereDemoVC.self),
                    ("🔘 不规则形状按钮", IrregularButtonDemoVC.self),
                    ("🃏 GXCard 式滑动卡片堆", JobsCardStackDemoVC.self),
                    ("↕️ 指定 Y 区间拖动并吸附", JobsDockingScrollDemoVC.self),
                    ("🧭 苹果滑动开锁@带骨架屏的呼吸效果", SlideToUnlockDemoVC.self),
                    ("🔒 手势解锁", GestureUnlockDemoVC.self),
                    ("⏱️ 仪表盘", FTDashboadDemoVC.self),
                ]),
            (title: "实用UI@Sys".tr, items: [
                    ("🔘 按钮的替代解决方案", JobsButtonDemoVC.self),
                    ("🔘 按钮", UIButtonDemoVC.self),
                    ("🔘 依据状态为按钮设置不同背景颜色", UIButtonBackgroundColorDemoVC.self),
                    ("🌞 BaseWebView", BaseWebViewDemoVC.self),
                    ("✍️ UITextField", UITextFieldDemoVC.self),
                    ("✍️ UITextView", UITextViewDemoVC.self),
                    ("✍️ 手写板｜本地保存与离开确认", JobsHandwritingDemoVC.self),
                    ("🗄️ UITableView", EmptyTableViewDemoVC.self),
                    ("🗄️ UITableView设置圆角和边距", UITableViewCellCornerDemoVC.self),
                    ("🗄️ UICollectionView", EmptyCollectionViewDemoVC.self),
                    ("💬 JobsSwiftComment", JobsSwiftCommentDemoVC.self),
                    ("🔍 JobsSwiftSearcher", JobsSwiftSearcherDemoVC.self),
                    ("👆 3D Touch / Context Menu", JobsContextMenuDemoVC.self),
                    ("😂 按钮完全覆盖在 Cell 上", JobsButtonCoverCellDemoListVC.self),
                    ("🧭 系统导航栏@富文本标题", JobsNavigationDemoVC.self),
                ]),
            (title: "实用工具集".tr, items: debugPanelDemoItems + [
                    ("📢 本地通知", LocalNotificationDemoVC.self),
                    ("🧹 JobsSwiftRefresher", JobsSwiftRefresherDemoVC.self),
                    ("🧹 JobsSwiftRefresher（非正式协议闭包化）", JobsSwiftRefresherBy非正式协议闭包化DemoVC.self),
                    ("⌨️ 键盘", KeyboardDemoVC.self),
                    ("📷 相机/相册/录像与照片滤镜", PhotoAlbumDemoVC.self),
                    ("🔐 图片加盐后转字符串存取", JobsSaltedImageStoreDemoVC.self),
                    ("🎲 随机数测试模块", JobsRandomNumberDemoVC.self),
                    ("🌍 JobsSwiftCountryCodeCtrl", JobsSwiftCountryCodeCtrlDemoVC.self),
                    ("📅 JobsSwiftCalendar", JobsSwiftCalendarDemoVC.self),
                    ("📊 JobsSwiftExcel｜任意冻结列与四种文字策略", JobsSwiftExcelDemoVC.self),
                    ("🔥 JobsSwiftPatch", JobsSwiftPatchDemoVC.self),
                    ("🕹️ ControlEvents", JobsControlEventsDemoVC.self),
                    ("➕ 数字步进输入", JobsSwiftNumberStepperDemoVC.self),
                    ("图形验证码", JobsSwiftGraphicCaptchaDemoVC.self),
                    ("🌍 JobsTabBarCtrl", TabBarDemoVC.self),
                    ("🏷️ Toast", ToastDemoVC.self),
                    ("⚠️ 系统的弹出框", UIAlertDemoVC.self),
                    ("🐎 二维码/条形码", QRCodeDemoVC.self),
                    ("👮 中国大陆公民身份证号码校验", CNIDDemoVC.self),
                    ("🧧 TraitChange", TraitChangeDemoVC.self),
                    ("🚀 JobsOpen", JobsOpenDemoVC.self),
                ]),
            (title: "一些常见功能模块页面".tr, items: [
                    ("📮 经典的消息页面", MessageListDemoVC.self),
                    ("📝 图文发帖编辑与草稿存取", JobsPostDraftDemoVC.self),
                    ("🔥 编辑个人资料", LGOEditProfileDemoVC.self),
                    ("🏠 首页联动", HomeLinkageDemoListVC.self),
                    ("🔑 JobsAppDoor｜双风格认证".tr, JobsAppDoorDemoVC.self),
                ]),
            (title: "富文本/普通文本处理".tr, items: [
                    ("📚 Markdown 文档浏览器".tr, JobsMarkdownDocumentsDemoVC.self),
                    ("🌋 富文本", RichTextDemoVC.self),
                    ("🌋 普通文本和富文本的融合数据类型", JobsTextDemoVC.self),
                    ("🗜️ 字符串压缩、解压", JobsStringCompressionDemoVC.self),
                ]),
            (title: "安全推页面（高度自定义）".tr, items: [
                    ("🧩 UIView支持上下左右Push和原路返回", JobsViewPushDemoVC.self),
                    ("🗂️ 侧滑抽屉：方向、比例与跟随模式", JobsSideDrawerDemoVC.self),
                    ("⛑️ 支持上下左右安全Push和原路返回", SafetyPushDemoVC.self),
                    ("⛑️ 安全Present", SafetyPresentDemoVC.self),
                ]),
            (title: "其他".tr, items: [
                    //                ("📌 自定义注解", 自定义注解DemoVC.self),
                    ("📦 本地 SPM 综合能力", SwiftPackageManagerDemoVC.self),
                    ("🛢️ 解码", SafeCodableDemoVC.self),
                    ("❄️ 雪花算法", SnowflakeDemoVC.self),
                ])
        ]
    }
    private lazy var suspendBtn: UIButton = {
        UIButton.sys()
            .byAccessibilityIdentifier("jobs.root.time")
            .tr_setTitle("当前时间".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 18,
                                             weight: .bold))
            .byTitleAdjustsFontSizeToFitWidth(true)
            .byTitleMinimumScaleFactor(0.7)
            .byTitleColor(JobsCor.white,
                          for: .normal)
            .byBackgroundColor(JobsCor.systemBlue,
                               for: .normal)
            .byCornerRadius(10)
            .byMasksToBounds(true)
            .onLongPress(minimumPressDuration: 0.8) { [weak self] _, gesture in
                guard gesture.state == .began else {
                    return
                }
                self?.showSuspendTimeButtonVisibilityAlert()
            }
            .onTap { [weak self] _ in
                guard let self else {
                    return
                }
                "点击了悬浮按钮".tr.toast
            }
            .bySuspend { [unowned self] cfg in
                cfg
                    .byContainer(view)
                    .byStart { [unowned self] container in
                        CGPoint(x: 15,
                                y: max(8, gk_navigationBar.frame.maxY - container.safeAreaInsets.top + 8))
                    }
                    .byFallbackSize(CGSize(width: 166, height: 66))
                    .byDocking(.nearestEdge)
                    .byConfineInContainer(true)
                    .byHapticOnDock(true)
            }
    }()

    private lazy var suspendSpinBtn: UIButton = {
        UIButton.sys()
            .byAccessibilityIdentifier("jobs.root.spin")
            .byTitle("0".tr,
                     for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 22,
                                             weight: .bold))
            .byTitleColor(JobsCor.white,
                          for: .normal)
            .byBackgroundColor(JobsCor.systemOrange,
                               for: .normal)
            .byCornerRadius(25)
            .byMasksToBounds(true)
            .onLongPress(minimumPressDuration: 0.8) { [weak self] _, gesture in
                #if DEBUG
                self?.recordCoverageRootGesture("spin", state: gesture.state)
                #endif
                "长按了悬浮按钮".tr.toast
            }
            .onTap { [weak self] btn in
                guard let self else {
                    return
                }
                if btn.jobs_isSpinning {
                    btn.bySpinPause()
                    self.suspendSpinBtnTimer?.pause()
                    "已暂停旋转 & 计时".tr.toast
                } else {
                    btn.bySpinStart()
                    self.suspendSpinBtnTimer?.resume()
                    "继续旋转 & 计时".tr.toast
                }
                btn.playTapBounce(haptic: .light)
            }
            .bySuspend { cfg in
                cfg
                    .byContainer(view)
                    .byStart(.point(CGPoint(x: view.bounds.width - 60,
                                            y: view.bounds.height - 100)))
                    .byFallbackSize(CGSize(width: 50, height: 50))
                    .byHapticOnDock(true)
            }
    }()

    private lazy var suspendFuseBtn: UIButton = {
        UIButton.sys()
            .tr_setTitle("按".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 10,
                                             weight: .bold))
            .byNumberOfLines(1)
            .byTitleAdjustsFontSizeToFitWidth(true)
            .byTitleMinimumScaleFactor(0.65)
            .byContentEdgeInsets(UIEdgeInsets(top: 6, left: 3, bottom: 6, right: 3))
            .byTitleColor(JobsCor.white,
                          for: .normal)
            .byBackgroundColor(JobsCor.systemPurple,
                               for: .normal)
            .byCornerRadius(25)
            .byMasksToBounds(true)
            .byPointerInteractionEnabled(false)
            .byAccessibilityIdentifier("RootListVC.suspendFuseBtn")
            .onTap { [weak self] sender in
                guard let self else {
                    return
                }
            // 短按：播放声音并在列表顶部、尾部之间切换；长按结束后可能冒出来的 tap 直接吞掉
                guard !self.suspendFuseLongPressConsumed else {
                    return
                }
                sender
                    .byFusePlaySound()
                    .byToggleSelected()
                let tableView = self.tableView
                let topOffsetY = -tableView.adjustedContentInset.top
                let bottomOffsetY = max(topOffsetY,
                                        tableView.contentSize.height
                                            - tableView.bounds.height
                                            + tableView.adjustedContentInset.bottom)
                tableView.byContentOffsetByAnimated(
                CGPoint(x: tableView.contentOffset.x,
                        y: sender.isSelected ? bottomOffsetY : topOffsetY)
            )
            }
            .onLongPress(minimumPressDuration: 0.8) { [weak self] btn, gr in
                guard let self else {
                    return
                }
                switch gr.state {
            /// 处理 .began 分支
                case .began:
                    self.suspendFuseLongPressConsumed = true
                    #if DEBUG
                    recordCoverageRootGesture("fuse", state: .began,
                                              condition: suspendFuseLongPressConsumed)
                    #endif
                    btn.byFusePressStart(ringConfig: JobsFuseOuterRingConfig(lineWidth: 4,
                                                                             strokeColor: JobsCor.white,
                                                                             trackColor: JobsCor.white.withAlphaComponent(0.22),
                                                                             fromOpacity: 1.0,
                                                                             toOpacity: 1.0,
                                                                             growDuration: 1.2,
                                                                             timerInterval: 1.0 / 60.0,
                                                                             repeatsWhileHolding: false,
                                                                             fadeOutDuration: 0.18,
                                                                             inset: 1,
                                                                             startsFromTop: true),
                                         scale: 1.18)
            /// 合并处理 .ended、.cancelled、.failed 分支
                case .ended, .cancelled, .failed:
                    btn.byFusePressStop()
                    #if DEBUG
                    let endedNormally = gr.state == .ended
                    #endif
                // 给 UIControl 的 touchUpInside 留一点时间，避免长按结束后被当成短按
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) { [weak self] in
                        self?.suspendFuseLongPressConsumed = false
                        #if DEBUG
                        self?.recordCoverageRootGesture("fuse",
                                                        state: endedNormally ? .ended : .cancelled,
                                                        condition: self?.suspendFuseLongPressConsumed == false)
                        #endif
                    }
            /// 未匹配已知分支时执行兜底处理
                default:
                    break
                }
            }
        // ✅ 悬浮：复用 RootListVC 这套 bySuspend 写法
        .bySuspend { cfg in
                cfg
                    .byContainer(view)
                    .byStart(.point(CGPoint(x: 15,
                                            y: view.bounds.height - 100)))
                    .byFallbackSize(CGSize(width: 50, height: 50))
                    .byDocking(.nearestEdge)
                    .byHapticOnDock(true)
            }
    }()
    // ================================== TableView（一级目录） ==================================
    private lazy var demoNavigationTitleLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .tr_setText("演武堂".tr)
            .byTextColor(RootListPreferences.primaryTextColor)
            .byFont(JobsFont.systemFont(ofSize: 17,
                                        weight: .medium))
            .byTextAlignment(.center)
            .byNumberOfLines(1)
    }()

    private lazy var demoNavigationProjectLabel: UILabel = {
        UILabel
            .jobsMake { _ in }
            .byText(Self.demoProjectTitle)
            .byTextColor(RootListPreferences.secondaryTextColor)
            .byFont(JobsFont.systemFont(ofSize: 10,
                                        weight: .regular))
            .byTextAlignment(.center)
            .byNumberOfLines(1)
            .byLineBreakMode(.byTruncatingMiddle)
            .byAdjustsFontSizeToFitWidth(YES)
            .byMinimumScaleFactor(0.75)
            .onTap { _ in
                "https://github.com/JobsKits/JobsSwiftBaseConfigDemo".open()
            }
    }()

    private lazy var demoNavigationTitleView: UIStackView = {
        UIStackView
            .jobsMake { _ in }
            .byAxis(.vertical)
            .byAlignment(.center)
            .byDistribution(.fill)
            .bySpacing(1)
            .byAddArrangedSubviews([
                demoNavigationTitleLabel,
                demoNavigationProjectLabel
            ])
    }()

    private lazy var functionMenuButton: UIButton = {
        UIButton.sys()
            .byAccessibilityIdentifier("jobs.root.functionMenu.open")
            .byFrame(CGRect(x: 0,
                            y: 0,
                            width: 32,
                            height: 32))
            .byImage("ellipsis.circle".sysImg,
                     for: .normal)
            .byImage("ellipsis.circle.fill".sysImg,
                     for: .selected)
            .byTintColor(RootListPreferences.primaryTextColor)
            .byShadowOpacity(0)
            .byClipsToBounds(YES)
            .onTap { [weak self] sender in
                guard let self else {
                    return
                }
                sender.byToggleSelected()
                toggleFunctionMenu(sender.isSelected)
            }
    }()

    private lazy var functionMenuDismissTapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(handleFunctionMenuDismissTap(_:)))
        gesture.cancelsTouchesInView = false
        return gesture
    }()

    private weak var loadedFunctionMenuTableView: UITableView?

    private lazy var functionMenuTableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .plain)
            .byAccessibilityIdentifier("jobs.root.functionMenu.panel")
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(UITableViewCell.self)
            .byBackgroundColor(RootListPreferences.foldCardBackgroundColor)
            .byRowHeight(44)
            .byEstimatedRowHeight(0)
            .byEstimatedSectionHeaderHeight(0)
            .byEstimatedSectionFooterHeight(0)
            .byScrollEnabled(false)
            .bySeparatorStyle(.singleLine)
            .byNoSectionHeaderTopPadding()
            .byContentInset(.zero)
            .byScrollIndicatorInsets(.zero)
            .byNoContentInsetAdjustment()
            .byCornerRadius(8)
            .byShadowOpacity(0)
            .byMasksToBounds(true)
            .byVisible(NO)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(6)
                make.right.equalToSuperview().inset(12)
                make.width.equalTo(210)
                make.height.equalTo(FunctionMenuAction.allCases.count * 44)
            }
        loadedFunctionMenuTableView = tableView
        return tableView
    }()

    private var demoSearchActionColor: UIColor {
        RootListPreferences.darkModeEnabled
            ? UIColor(r: 139, g: 196, b: 235, a: 1)
            : UIColor(r: 25, g: 94, b: 131, a: 1)
    }

    private lazy var demoSearcherView: JobsSwiftSearcherView = {
        JobsSwiftSearcherView(config: makeDemoSearchConfig())
            .byActionColor(demoSearchActionColor)
            .byVisible(false)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero,
                    style: .insetGrouped)
            .byAccessibilityIdentifier("jobs.root.demoTable")
        // ✅ 关键：禁用预估高度，避免首次布局“画错一遍”
        .byEstimatedRowHeight(0)
            .byEstimatedSectionHeaderHeight(0)
            .byEstimatedSectionFooterHeight(0)
            .byDataSource(self)
            .byDelegate(self)
            .byDragDelegate(self)
            .byDropDelegate(self)
        // iPhone 端显式开启，避免依赖系统默认值。
        .byDragInteractionEnabled(YES)
            .byRegisterCell(UITableViewCell.self)
            .byRegisterCell(RootFoldTableCell.self)
            .byBackgroundColor(JobsCor.clear)
            .byNoContentInsetAdjustment()
            .bySeparatorStyle(.none)
            .byNoSectionHeaderTopPadding()
            .byContentInset(UIEdgeInsets(top: 8,
                                         left: 0,
                                         bottom: 0,
                                         right: 0))
            .byAddTo(view) { [unowned self] make in
                make.left.bottom.right.equalToSuperview()
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        //        OCCls().string("q", image: "".img)
        reloadDemoDataFromSource()
        langToken = NotificationCenter.default.addObserver(forName: .JobsLanguageDidChange,
                                                           object: nil,
                                                           queue: .main) { [weak self] _ in
            guard let self else {
                return
            }
            self.reloadDemoDataFromSource()
            self.refreshLocalizedContent()
            self.applyDemoListThemeChrome()
            if self.demoSearchEnabled {
                self.refreshDemoSearchPresentation()
            }
            if self.tableView.window != nil {
                self.tableView.reloadData()
            }
            if let functionMenuTableView = self.loadedFunctionMenuTableView,
               functionMenuTableView.window != nil,
               !functionMenuTableView.isHidden {
                functionMenuTableView.reloadData()
            }
        }
        themeToken = NotificationCenter.default.addObserver(forName: .JobsThemeDidChange,
                                                            object: nil,
                                                            queue: .main) { [weak self] _ in
            guard let self else {
                return
            }
            self.applyDemoListThemeColors()
            if self.demoSearchEnabled {
                self.refreshDemoSearchPresentation()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(RootListPreferences.pageBackgroundColor)
        jobsSetupGKNav(title: "演武堂".tr,
                       leftButton: UIButton.sys()
                           .byAccessibilityIdentifier("jobs.root.navigationMenu")
                           .byFrame(CGRect(x: 0,
                                           y: 0,
                                           width: 32,
                                           height: 32))
                           .byImage("list.bullet".sysImg,
                                    for: .normal)
                           .byImage("list.bullet".sysImg,
                                    for: .selected)
                           .byShadowOpacity(0)
                           .byClipsToBounds(YES)
                           .onTap { [weak self] sender in
                guard let self else {
                    return
                }
                sender.byToggleSelected()
                self.jobsSideDrawer?.toggleDrawer()
                print("")
            }
                           .onTapAppend { _ in
                print("追加的点按事件")
            }
                           .onLongPress(minimumPressDuration: 0.8) { [weak self] btn, gr in
                if gr.state == .began {
                    btn.byAlpha(0.6)
                    #if DEBUG
                    self?.recordCoverageRootGesture("navigationMenu", state: .began,
                                                    condition: btn.alpha < 1)
                    #endif
                    print("长按开始 on \(btn)")
                } else if gr.state == .ended || gr.state == .cancelled {
                    btn.byAlpha(1.0)
                    #if DEBUG
                    self?.recordCoverageRootGesture("navigationMenu", state: gr.state,
                                                    condition: btn.alpha == 1)
                    #endif
                    print("长按结束")
                }
            }
                           .onLongPressAppend(minimumPressDuration: 0.8) { _, _ in
                print("追加的长按事件")
            },
                       rightButtons: [functionMenuButton])
        gk_navTitleView = demoNavigationTitleView
        demoSearcherView.byVisible(false)
        tableView.byVisible(YES)
        applyDemoListThemeChrome()
        view.addGestureRecognizer(functionMenuDismissTapGesture)
        updateFooterAvailability()
        suspendSpinBtn.bySpinStart()
        suspendFuseBtn.byVisible(YES)
        setupJobsTimers()
        refreshSuspendTimeButtonVisibility()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        byGKNavBarHidden(demoSearchEnabled)
        jobsForceHideSystemNavBar(true)
        refreshLocalizedContent()
        applyDemoListThemeChrome()
        refreshSuspendTimeButtonVisibility()
        refreshDemoSearchPresentation()
        let strategy = RootListPreferences.cellTextDisplayStrategy
        if strategy != appliedCellTextDisplayStrategy {
            appliedCellTextDisplayStrategy = strategy
            if !RootListPreferences.returnToTopAndRefreshEnabled {
                tableView.reloadData()
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        byGKNavBarHidden(demoSearchEnabled)
        jobsForceHideSystemNavBar(true)
        guard tableView.window != nil else {
            guard !pendingDemoListAppearanceUpdate else {
                return
            }
            pendingDemoListAppearanceUpdate = true
            DispatchQueue.main.async { [weak self] in
                guard let self else {
                    return
                }
                self.pendingDemoListAppearanceUpdate = false
                self.performDemoListAppearanceUpdate()
            }
            return
        }
        performDemoListAppearanceUpdate()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        progressIndicatorTimer?.pause()
    }
}

extension RootListVC {

    /// 侧滑容器首次装配时，子控制器可能先收到 viewDidAppear，再真正进入 Window。
    private func performDemoListAppearanceUpdate() {
        guard tableView.window != nil else {
            return
        }
        installTableRefreshControlsIfNeeded()
        tableView.beginUpdates()
        tableView.endUpdates()
        updateFooterAvailability()
        if !demoSearchEnabled && demoListHasAppeared && RootListPreferences.returnToTopAndRefreshEnabled {
            reloadDemoListToTopAndRefresh()
        }
        demoListHasAppeared = true
        refreshSuspendTimeButtonVisibility()
        if suspendSpinBtn.jobs_isSpinning {
            suspendSpinBtnTimer?.resume()
        }
        progressIndicatorTimer?.resume()
        updateVisibleProgressIndicators()
    }

    /// 刷新 Footer 会读取表格尺寸，必须等主表进入 Window 后再挂载。
    private func installTableRefreshControlsIfNeeded() {
        guard !didInstallTableRefreshControls,
              tableView.window != nil else {
            return
        }
        didInstallTableRefreshControls = true
        tableView
            .setHeaderRefreshFeedback(
            JobsRefreshFeedback(enablesHaptics: true,
                                soundFileName: "Sound.wav")
        )
            .byRefreshHeader(component: JobsDefaultHeader(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else {
                    return
                }
                Task { @MainActor in
                    self.tableView.byReloadData()
                    self.tableView.switchRefreshHeader(to: .normal)
                    self.tableView.switchRefreshFooter(to: .normal)
                }
            }
            .byRefreshFooter(component: JobsDefaultFooter(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else {
                    return
                }
                Task { @MainActor in
                    self.tableView.switchRefreshFooter(to: .noMoreData)
                }
            }
    }

    private func showSuspendTimeButtonVisibilityAlert() {
        UIAlertController
            .makeAlert("隐藏悬浮时间？".tr,
                       "隐藏后可在“设置”中重新开启。".tr)
            .byView { $0.byAccessibilityIdentifier("jobs.root.hideTime.alert") }
            .byAddCancel("取消".tr)
            .byAddDestructive("隐藏".tr) { [weak self] _ in
                guard let self else {
                    return
                }
                RootListPreferences.showsSuspendTimeButton = false
                refreshSuspendTimeButtonVisibility()
            }
            .byTintColor(RootListPreferences.selectedTintColor)
            .byPresent(self)
    }

    private func refreshSuspendTimeButtonVisibility() {
        var visible = RootListPreferences.showsSuspendTimeButton
        #if DEBUG
        if ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") {
            visible = true
        }
        #endif
        visible = visible && !demoSearchEnabled
        suspendBtn.byVisible(visible)
        if visible {
            suspendBtnTimer?.resume()
        } else {
            suspendBtnTimer?.pause()
        }
    }

    private func layoutDemoTable() {
        guard !demoSearchEnabled else {
            return
        }
        tableView.snp.remakeConstraints { [unowned self] make in
            make.left.bottom.right.equalToSuperview()
            if view.jobs_hasVisibleTopBar() {
                make.top.equalTo(gk_navigationBar.snp.bottom)
            } else {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            }
        }
    }

    // ================================== 运行时语言刷新 ==================================
    private func refreshLocalizedContent() {
        demoNavigationTitleLabel.byText("演武堂".tr)
        suspendBtn.tr_setTitle("当前时间".tr, for: .normal)
        suspendFuseBtn.tr_setTitle("按".tr, for: .normal)
        if let tabBarController = view.window?.rootViewController as? UITabBarController,
           let items = tabBarController.tabBar.items,
           items.count >= 3 {
            items[0].byTitle("Demo".tr)
            items[1].byTitle("消息".tr)
            items[2].byTitle("我的".tr)
        }
    }

    // ================================== Demo 列表主题刷新 ==================================
    private func applyDemoListThemeColors() {
        RootListPreferences.applyThemeColors(to: self,
                                             backgroundColor: RootListPreferences.pageBackgroundColor)
        tableView.byBackgroundColor(JobsCor.clear)
        demoNavigationTitleLabel.byTextColor(RootListPreferences.primaryTextColor)
        demoNavigationProjectLabel.byTextColor(RootListPreferences.secondaryTextColor)
        if let functionMenuTableView = loadedFunctionMenuTableView {
            functionMenuTableView.byBackgroundColor(RootListPreferences.foldCardBackgroundColor)
            if functionMenuTableView.window != nil,
               !functionMenuTableView.isHidden {
                functionMenuTableView.reloadData()
            }
        }
        demoSearcherView
            .byActionColor(demoSearchActionColor)
            .byBackgroundColor(RootListPreferences.pageBackgroundColor)
        if tableView.window != nil {
            tableView.reloadData()
        }
    }

    private func applyDemoListThemeChrome() {
        RootListPreferences.applyThemeChrome(to: self,
                                             backgroundColor: RootListPreferences.pageBackgroundColor)
        applyDemoListThemeColors()
        gk_navShadowColor = JobsCor.clear
        gk_navLineHidden = true
        gk_navigationBar
            .byShadowOpacity(0)
            .byAccessibilityIdentifier("jobs.root.navigationBar")
        tableView.bySeparatorColor(RootListPreferences.separatorColor)
        functionMenuButton.byTintColor(RootListPreferences.primaryTextColor)
        loadedFunctionMenuTableView?
            .bySeparatorColor(RootListPreferences.separatorColor)
    }

    // ================================== JobsSwiftTimer（新版）创建与绑定 UI ==================================
    private func setupJobsTimers() {
        // 1) suspendBtn：每秒刷新当前时间
        do {
            let cfg = JobsSwiftTimerConfig(interval: 1.0,
                                           repeats: true,
                                           tolerance: 0,
                                           queue: .main)
            suspendBtnTimer = try timerMgr.create(kind: .gcd,
                                                  identifier: suspendBtnTimerID,
                                                  config: cfg,
                                                  dedupPolicy: .replace) { [weak self] in
                onMainAsync(self) { vc in
                    let btn = vc.suspendBtn
                    if btn.title(for: .normal) != "当前时间" {
                        btn.tr_setTitle("当前时间".tr, for: .normal)
                    }
                    btn
                        .bySubTitle(nowClock(),
                                    for: .normal)
                        .bySetNeedsUpdateConfiguration()
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
            suspendSpinBtnTimer = try timerMgr.create(kind: .gcd,
                                                      identifier: suspendSpinBtnTimerID,
                                                      config: cfg,
                                                      dedupPolicy: .replace) { [weak self] in
                onMainAsync(self) { vc in
                    vc.spinSeconds += 1
                    let btn = vc.suspendSpinBtn
                    let sec = vc.spinSeconds
                    if btn.title(for: .normal) != "\(sec)" {
                        btn
                            .byTitle("\(sec)",
                                     for: .normal)
                            .bySetNeedsUpdateConfiguration()
                    }
                }
            }
            suspendSpinBtnTimer?.start()
        } catch {
            print("❌ create suspendSpinBtnTimer failed: \(error)")
        }
        // 3) 系统和自定义进度条入口：只更新当前可见图标，模拟三格电池循环充电
        do {
            progressIndicatorPhase = 0
            let cfg = JobsSwiftTimerConfig(interval: 0.45,
                                           repeats: true,
                                           tolerance: 0.03,
                                           queue: .main)
            progressIndicatorTimer = try timerMgr.create(kind: .gcd,
                                                         identifier: progressIndicatorTimerID,
                                                         config: cfg,
                                                         dedupPolicy: .replace) { [weak self] in
                onMainAsync(self) { vc in
                    vc.progressIndicatorPhase = (vc.progressIndicatorPhase + 1) % 3
                    vc.updateVisibleProgressIndicators()
                }
            }
            progressIndicatorTimer?.start()
        } catch {
            print("❌ create progressIndicatorTimer failed: \(error)")
        }
    }

    private func updateVisibleProgressIndicators() {
        let phase = UIAccessibility.isReduceMotionEnabled ? 2 : progressIndicatorPhase
        tableView.visibleCells
            .compactMap {
                $0 as? RootFoldTableCell
            }
            .forEach {
                $0.updateChargingProgress(phase: phase)
            }
    }

    private var hasPinnedDemoSection: Bool {
        !demoSearchEnabled && !pinnedDemoItems.isEmpty
    }

    private var demoGroupTableSection: Int {
        hasPinnedDemoSection ? 1 : 0
    }

    private var demoSearchEnabled: Bool {
        isDemoSearchPresented
    }

    private var demoSearchActive: Bool {
        !demoSearchKeyword.isEmpty
    }


    private func reloadDemoDataFromSource() {
        allDemo2D = makeDemo2D().map { group in
            (
                title: group.title.tr,
                items: group.items.map { item in
                (title: item.title.tr, vcType: item.vcType)
            }
            )
        }
        applySavedDemoSectionOrderIfNeeded()
        applySavedPinnedDemosIfNeeded()
        applySearchKeyword(demoSearchKeyword)
    }

    private func demoPersistentKey(for item: DemoItem) -> String {
        "cls:\(String(reflecting: item.vcType))"
    }

    private func isPinnedDemoItem(_ item: DemoItem) -> Bool {
        let key = demoPersistentKey(for: item)
        return pinnedDemoItems.contains {
            demoPersistentKey(for: $0) == key
        }
    }

    private func savedPinnedDemoKeys() -> [String] {
        guard let keys = UserDefaults.standard.array(forKey: Self.pinnedDemoUserDefaultsKey) as? [String] else {
            return []
        }
        var result: [String] = []
        for key in keys where !key.isEmpty && !result.contains(key) {
            result.append(key)
        }
        return result
    }

    private func applySavedPinnedDemosIfNeeded() {
        let savedKeys = savedPinnedDemoKeys()
        guard !savedKeys.isEmpty else {
            pinnedDemoItems.removeAll()
            return
        }
        let allItems = allDemo2D.flatMap {
            $0.items
        }
        pinnedDemoItems = savedKeys.compactMap { key in
            allItems.first {
                demoPersistentKey(for: $0) == key
            }
        }
        if pinnedDemoItems.count != savedKeys.count {
            savePinnedDemos()
        }
    }

    private func savePinnedDemos() {
        let keys = pinnedDemoItems.map {
            demoPersistentKey(for: $0)
        }
        if keys.isEmpty {
            UserDefaults.standard.removeObject(forKey: Self.pinnedDemoUserDefaultsKey)
        } else {
            UserDefaults.standard.set(keys,
                                      forKey: Self.pinnedDemoUserDefaultsKey)
        }
        UserDefaults.standard.synchronize()
    }

    private func pinDemoItem(_ item: DemoItem) {
        guard !isPinnedDemoItem(item) else {
            return
        }
        pinnedDemoItems.append(item)
        savePinnedDemos()
        applySearchKeyword(demoSearchKeyword)
        tableView.reloadData()
        tableView.layoutIfNeeded()
        tableView.setContentOffset(CGPoint(x: 0,
                                           y: -tableView.adjustedContentInset.top),
                                   animated: true)
    }

    private func unpinPinnedDemo(at index: Int) {
        guard pinnedDemoItems.indices.contains(index) else {
            return
        }
        let item = pinnedDemoItems.remove(at: index)
        let key = demoPersistentKey(for: item)
        savePinnedDemos()
        applySearchKeyword(demoSearchKeyword)
        if let row = demo2D.firstIndex(where: { group in
            group.items.contains {
                demoPersistentKey(for: $0) == key
            }
        }) {
            expandedGroups.insert(row)
        }
        tableView.reloadData()
    }

    private func savedDemoSectionOrder() -> [String] {
        guard let titles = UserDefaults.standard.array(forKey: Self.demoSectionOrderUserDefaultsKey) as? [String] else {
            return []
        }
        return titles.filter {
            !$0.isEmpty
        }
    }

    private func isOtherDemoGroup(_ group: DemoGroup) -> Bool {
        group.title == "其他".tr
    }

    private func demoGroupsKeepingOtherLast(_ groups: [DemoGroup]) -> [DemoGroup] {
        let regularGroups = groups.filter {
            !isOtherDemoGroup($0)
        }
        let otherGroups = groups.filter {
            isOtherDemoGroup($0)
        }
        return regularGroups + otherGroups
    }

    private func applySavedDemoSectionOrderIfNeeded() {
        let titles = savedDemoSectionOrder()
        if !titles.isEmpty, allDemo2D.count > 1 {
            var unorderedGroups = allDemo2D
            var orderedGroups: [DemoGroup] = []
            for title in titles {
                guard let index = unorderedGroups.firstIndex(where: {
                    $0.title == title
                }) else {
                    continue
                }
                orderedGroups.append(unorderedGroups.remove(at: index))
            }
            orderedGroups.append(contentsOf: unorderedGroups)
            if orderedGroups.count == allDemo2D.count {
                allDemo2D = orderedGroups
            }
        }
        allDemo2D = demoGroupsKeepingOtherLast(allDemo2D)
        #if DEBUG
        refreshCoverageRootOrder()
        #endif
    }

    private func saveDemoSectionOrder() {
        allDemo2D = demoGroupsKeepingOtherLast(allDemo2D)
        UserDefaults.standard.set(allDemo2D.map {
            $0.title
        },
                                  forKey: Self.demoSectionOrderUserDefaultsKey)
        UserDefaults.standard.synchronize()
        #if DEBUG
        refreshCoverageRootOrder()
        #endif
    }

    private func normalizedDemoSearchText(_ text: String?) -> String {
        (text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private func makeDemoSearchConfig() -> JobsSwiftSearcherConfig {
        JobsSwiftSearcherConfig.defaultConfig
            .byPlaceholder("输入关键词搜索 Demo")
            .byShowsSearchButton(false)
            .byShowsCancelButton(true)
            .byEmptyHistoryMessage("输入关键词，查找 Demo。")
            .byNoResultsTitle("没有匹配的 Demo")
            .byHistoryStorageKey(Self.demoSearchHistoryUserDefaultsKey)
            .byMaxHistoryCount(Self.maximumDemoSearchHistoryCount)
            .byAccessibilityIdentifierPrefix("jobs.root.search")
            .bySearchTextChangedBlock { [weak self] keyword in
                guard let self else {
                    return
                }
                self.applySearchKeyword(keyword)
                self.tableView.byReloadData()
                self.updateFooterAvailability()
            }
            .byCancelBlock { [weak self] in
                self?.setSearchEnabled(false)
            }
    }

    private func applySearchKeyword(_ keyword: String) {
        defer {
            if demoSearchEnabled {
                demoSearcherView.byResultCount(demoSearchActive ? demo2D.reduce(0) { $0 + $1.items.count } : 0)
            }
        }
        demoSearchKeyword = normalizedDemoSearchText(keyword)
        guard !demoSearchKeyword.isEmpty else {
            demo2D = allDemo2D.compactMap { group in
                let items = group.items.filter {
                    !isPinnedDemoItem($0)
                }
                return items.isEmpty ? nil : (title: group.title, items: items)
            }
            expandedGroups = demo2D.isEmpty ? [] : [0]
            #if DEBUG
            if ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") {
                expandedGroups = []
            }
            #endif
            return
        }
        demo2D = allDemo2D.compactMap { group in
            let matchedItems = group.items.filter {
                demoSearchKeyword.inStr($0.title)
                    || demoSearchKeyword.inStr(String(describing: $0.vcType))
            }
            if demoSearchKeyword.inStr(group.title) {
                return group.items.isEmpty ? nil : (title: group.title, items: group.items)
            }
            return matchedItems.isEmpty ? nil : (title: group.title, items: matchedItems)
        }
        expandedGroups = Set(demo2D.indices)
    }








    @objc private func handleFunctionMenuDismissTap(_ gesture: UITapGestureRecognizer) {
        let point = gesture.location(in: view)
        let searchBarFrame = demoSearcherView.convert(demoSearcherView.bounds,
                                                   to: view)
        let pointInSearchBar = !demoSearcherView.isHidden && searchBarFrame.contains(point)
        if !pointInSearchBar {
            jobsDismissKeyboard()
        }
        guard let functionMenuTableView = loadedFunctionMenuTableView,
              !functionMenuTableView.isHidden else {
            return
        }
        let buttonFrame = functionMenuButton.convert(functionMenuButton.bounds,
                                                     to: view)
        if functionMenuTableView.frame.contains(point) || buttonFrame.contains(point) {
            return
        }
        toggleFunctionMenu(false)
    }

    private func canDragDemoGroup(at indexPath: IndexPath) -> Bool {
        indexPath.section == demoGroupTableSection &&
            demo2D.indices.contains(indexPath.row) &&
            !isOtherDemoGroup(demo2D[indexPath.row]) &&
            demo2D.count > 1
    }

    private func moveDemoGroup(from sourceIndexPath: IndexPath,
                               to destinationIndexPath: IndexPath) {
        let sourceRow = sourceIndexPath.row
        let destinationRow = destinationIndexPath.row
        guard sourceRow != destinationRow,
              demo2D.indices.contains(sourceRow),
              demo2D.indices.contains(destinationRow) else {
            return
        }
        let sourceTitle = demo2D[sourceRow].title
        let destinationTitle = demo2D[destinationRow].title
        guard let sourceIndex = allDemo2D.firstIndex(where: {
            $0.title == sourceTitle
        }),
              let destinationIndex = allDemo2D.firstIndex(where: {
            $0.title == destinationTitle
        }) else {
            return
        }
        let visibleGroup = demo2D.remove(at: sourceRow)
        demo2D.insert(visibleGroup,
                      at: destinationRow)
        let group = allDemo2D.remove(at: sourceIndex)
        allDemo2D.insert(group,
                         at: min(destinationIndex,allDemo2D.count))
        demo2D = demoGroupsKeepingOtherLast(demo2D)
        allDemo2D = demoGroupsKeepingOtherLast(allDemo2D)
        moveExpandedDemoGroupState(from: sourceRow,
                                   to: destinationRow)
    }

    private func moveExpandedDemoGroupState(from sourceRow: Int,
                                            to destinationRow: Int) {
        guard sourceRow != destinationRow else {
            return
        }
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

    private func menuTitle(for action: FunctionMenuAction) -> String {
        switch action {
        /// 处理 .search 分支
        case .search:
            return "搜索 Demo".tr
        /// 处理 .demoFold 分支
        case .demoFold:
            return demoFoldSwitchTitle()
        /// 处理 .settings 分支
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
        tableView.setContentOffset(CGPoint(x: 0,
                                           y: -tableView.adjustedContentInset.top),
                                   animated: false)
        tableView.mj_header?.beginRefreshing()
    }

    private func toggleFunctionMenu(_ visible: Bool) {
        functionMenuButton.bySelected(visible)
        if visible {
            functionMenuTableView.byVisible(YES)
            applyDemoListThemeChrome()
            functionMenuTableView.reloadData()
            view.bringSubviewToFront(functionMenuTableView)
        } else {
            loadedFunctionMenuTableView?.byVisible(NO)
        }
    }

    private func handleMenuAction(_ action: FunctionMenuAction) {
        toggleFunctionMenu(false)
        switch action {
        /// 处理 .search 分支
        case .search:
            setSearchEnabled(true)
        /// 处理 .demoFold 分支
        case .demoFold:
            setAllDemoGroupsExpanded(!anyVisibleDemoGroupExpanded())
        /// 处理 .settings 分支
        case .settings:
            RootListSettingsVC()
                .byPush(self)
        }
    }

    private func setSearchEnabled(_ enabled: Bool) {
        guard enabled != demoSearchEnabled else {
            return
        }
        if enabled {
            demoSearchHomeOffset = tableView.contentOffset
            demoSearchHomeExpandedGroups = expandedGroups
            demoSearchFloatingVisibility = (!suspendBtn.isHidden, !suspendSpinBtn.isHidden, !suspendFuseBtn.isHidden)
            demoSearchHeaderWasHidden = tableView.mj_header?.isHidden ?? false
            demoSearchDrawerGestures = (jobsSideDrawer?.view.gestureRecognizers ?? [])
                .filter { $0 is UIScreenEdgePanGestureRecognizer }
                .map { ($0, $0.isEnabled) }
        }
        isDemoSearchPresented = enabled
        if enabled {
            demoSearcherView
                .byResultContentView(tableView)
                .byQuery("", recordHistory: false)
                .byVisible(true)
            applySearchKeyword("")
            tableView.byReloadData()
            tableView.byContentOffsetBy(CGPoint(x: 0, y: -tableView.adjustedContentInset.top))
            refreshDemoSearchPresentation()
            updateFooterAvailability()
            demoSearcherView.focus()
        } else {
            demoSearcherView
                .dismissKeyboard()
                .byQuery("", recordHistory: false)
                .byResultContentView(nil)
                .byVisible(false)
            applySearchKeyword("")
            expandedGroups = demoSearchHomeExpandedGroups
            tableView
                .byVisible(true)
                .byAddTo(view)
            view.bySendToBack(tableView)
            refreshDemoSearchPresentation()
            layoutDemoTable()
            tableView.byReloadData()
            if tableView.window != nil {
                tableView.layoutIfNeeded()
            }
            tableView.byContentOffsetBy(demoSearchHomeOffset)
            updateFooterAvailability()
            demoSearchFloatingVisibility = nil
            demoSearchDrawerGestures.removeAll()
        }
    }

    /// 搜索模式独占首页；键盘收起不代表退出，也不修改用户的悬浮入口偏好。
    private func refreshDemoSearchPresentation() {
        let searching = demoSearchEnabled
        byGKNavBarHidden(searching)
        gk_navigationBar.byHidden(searching)
        for (gesture, enabled) in demoSearchDrawerGestures {
            gesture.byEnabled(searching ? false : enabled)
        }
        tableView.mj_header?.byHidden(searching || demoSearchHeaderWasHidden)
        refreshSuspendTimeButtonVisibility()
        if searching {
            suspendSpinBtn.byVisible(false)
            suspendFuseBtn.byVisible(false)
        } else if let visibility = demoSearchFloatingVisibility {
            suspendBtn.byVisible(visibility.time && RootListPreferences.showsSuspendTimeButton)
            suspendSpinBtn.byVisible(visibility.spin)
            suspendFuseBtn.byVisible(visibility.fuse)
        }
        #if DEBUG
        JobsDebugPanel.shared.byFloatingEntrySuppressed(searching)
        VCDebugDeallocDebug.temporarilySuppressesDeinitTips = searching
        #endif
    }


    // MARK: - Footer 自动显隐逻辑
    private func updateFooterAvailability() {
        guard tableView.window != nil else {
            return
        }
        guard !demoSearchEnabled else {
            tableView.mj_footer?.byHidden(true)
            return
        }
        tableView.layoutIfNeeded()
        let contentH = tableView.contentSize.height
        let visibleH = tableView.bounds.height
            - tableView.adjustedContentInset.top
            - tableView.adjustedContentInset.bottom
        let enableLoadMore = contentH > visibleH + 20
        tableView.mj_footer?.byHidden(!enableLoadMore)
        if !enableLoadMore {
        /// TODO
        }
    }
}
// MARK: —— UITableViewDataSource & UITableViewDelegate
extension RootListVC: UITableViewDataSource,
                      UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView === loadedFunctionMenuTableView {
            return 1
        }
        return hasPinnedDemoSection ? 2 : 1
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if tableView === loadedFunctionMenuTableView {
            return FunctionMenuAction.allCases.count
        }
        if hasPinnedDemoSection && section == 0 {
            return 1
        }
        return section == demoGroupTableSection ? demo2D.count : 0
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView === loadedFunctionMenuTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self),
                                                     for: indexPath)
            let action = FunctionMenuAction.allCases[indexPath.row]
            return cell
                .byText(menuTitle(for: action))
                .byTitleFont(JobsFont.systemFont(ofSize: 15,
                                                 weight: .medium))
                .byTitleCor(RootListPreferences.primaryTextColor)
                .bySelectionStyle(.default)
                .bySelectedBackgroundView(
                UIView
                    .jobsMake { _ in }
                    .byBackgroundColor(JobsCor.tertiarySystemBackground)
            )
                .byTintColor(RootListPreferences.selectedTintColor)
                .byBackgroundColor(RootListPreferences.foldCardBackgroundColor)
                .byContentView {
                    $0.byBackgroundColor(RootListPreferences.foldCardBackgroundColor)
                }
                .byAccessoryType(.none)
        }
        if hasPinnedDemoSection && indexPath.section == 0 {
            return tableView
                .byDequeueReusableCell(withType: RootFoldTableCell.self,
                                       for: indexPath)
                .configurePinned(groupTitle: "置顶".tr,
                                 items: pinnedDemoItems) { [weak self] itemIndex in
                    guard let self,
                          self.pinnedDemoItems.indices.contains(itemIndex) else {
                        return
                    }
                    let item = self.pinnedDemoItems[itemIndex]
                    item.vcType.init()
                        .byTitle(item.title)
                        .byPush(self)
                } unpinItem: { [weak self] itemIndex in
                    self?.unpinPinnedDemo(at: itemIndex)
                }
        }
        guard indexPath.section == demoGroupTableSection,
              demo2D.indices.contains(indexPath.row) else {
            return UITableViewCell.jobsMake { _ in }
        }
        let row = indexPath.row
        let g = demo2D[row]
        let expanded = expandedGroups.contains(row)
        return tableView
            .byDequeueReusableCell(withType: RootFoldTableCell.self,
                                   for: indexPath)
            .configure(groupTitle: g.title,
                       items: g.items,
                       expanded: expanded) { [weak self] itemIndex in
                guard let self else {
                    return
                }
                if self.demoSearchActive {
                    self.demoSearcherView.saveHistory(by: self.demoSearchKeyword)
                }
                let item = g.items[itemIndex]
            /// 这里推入控制器
                item.vcType.init()
                    .byTitle(item.title)
                    .byPush(self)
            } pinItem: { [weak self] itemIndex in
                guard let self,
                      g.items.indices.contains(itemIndex) else {
                    return
                }
                self.pinDemoItem(g.items[itemIndex])
            }
    }
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView === loadedFunctionMenuTableView {
            return 44
        }
        if hasPinnedDemoSection && indexPath.section == 0 {
            return RootFoldTableCell.expandedHeight(itemCount: pinnedDemoItems.count,
                                                    groupTitle: "置顶".tr,
                                                    width: tableView.bounds.width - tableView.layoutMargins.left - tableView.layoutMargins.right)
        }
        guard indexPath.section == demoGroupTableSection,
              demo2D.indices.contains(indexPath.row) else {
            return .leastNonzeroMagnitude
        }
        let row = indexPath.row
        guard expandedGroups.contains(row) else {
            return RootFoldTableCell.collapsedHeight(groupTitle: demo2D[row].title,
                                                     itemCount: demo2D[row].items.count,
                                                     width: tableView.bounds.width - tableView.layoutMargins.left - tableView.layoutMargins.right)
        }
        return RootFoldTableCell.expandedHeight(itemCount: demo2D[row].items.count,
                                                groupTitle: demo2D[row].title,
                                                width: tableView.bounds.width - tableView.layoutMargins.left - tableView.layoutMargins.right)
    }
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath,
                              animated: true)
        if tableView === loadedFunctionMenuTableView {
            handleMenuAction(FunctionMenuAction.allCases[indexPath.row])
            return
        }
        if hasPinnedDemoSection && indexPath.section == 0 {
            return
        }
        guard indexPath.section == demoGroupTableSection,
              demo2D.indices.contains(indexPath.row) else {
            return
        }
        let row = indexPath.row
        if expandedGroups.contains(row) {
            expandedGroups.remove(row)
        } else {
            expandedGroups.insert(row)
        }
        if let cell = tableView.cellForRow(at: indexPath) as? RootFoldTableCell {
            cell.setExpanded(expandedGroups.contains(row),
                             animated: true)
        }
        tableView.performBatchUpdates(nil) { [weak self] _ in
            self?.updateFooterAvailability()
        }
    }

    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        .leastNonzeroMagnitude
    }

    func tableView(_ tableView: UITableView,
                   heightForFooterInSection section: Int) -> CGFloat {
        .leastNonzeroMagnitude
    }


}

// MARK: —— Demo 分组长按排序
extension RootListVC: UITableViewDragDelegate,
                      UITableViewDropDelegate {

    func tableView(_ tableView: UITableView,
                   itemsForBeginning session: UIDragSession,
                   at indexPath: IndexPath) -> [UIDragItem] {
        guard tableView === self.tableView,
              !demoSearchEnabled,
              canDragDemoGroup(at: indexPath) else {
            return []
        }
        #if DEBUG
        if ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") {
            coverageRootDragPreparedCount += 1
            coverageRootDragSourceRow = indexPath.row
            refreshCoverageRootDragState()
        }
        #endif
        let title = demo2D[indexPath.row].title
        let dragItem = UIDragItem(itemProvider: NSItemProvider(object: title as NSString))
        dragItem.localObject = title
        return [dragItem]
    }

    func tableView(_ tableView: UITableView,
                   dragSessionAllowsMoveOperation session: UIDragSession) -> Bool {
        tableView === self.tableView && !demoSearchEnabled
    }

    func tableView(_ tableView: UITableView,
                   dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool {
        true
    }

    func tableView(_ tableView: UITableView,
                   dragSessionWillBegin session: UIDragSession) {
        guard tableView === self.tableView else {
            return
        }
        session.localContext = tableView
        #if DEBUG
        if ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") {
            coverageRootDragBeganCount += 1
            refreshCoverageRootDragState()
        }
        #endif
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }

    func tableView(_ tableView: UITableView,
                   canHandle session: UIDropSession) -> Bool {
        guard let sourceTableView = session.localDragSession?.localContext as? UITableView else {
            return false
        }
        return tableView === self.tableView &&
            !demoSearchEnabled &&
            sourceTableView === self.tableView
    }

    func tableView(_ tableView: UITableView,
                   dropSessionDidUpdate session: UIDropSession,
                   withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        guard tableView === self.tableView,
              !demoSearchEnabled,
              let sourceTableView = session.localDragSession?.localContext as? UITableView,
              sourceTableView === self.tableView,
              demoGroupDropDestinationIndexPath(destinationIndexPath) != nil else {
            return UITableViewDropProposal(operation: .cancel)
        }
        return UITableViewDropProposal(operation: .move,
                                       intent: .insertAtDestinationIndexPath)
    }

    func tableView(_ tableView: UITableView,
                   performDropWith coordinator: UITableViewDropCoordinator) {
        guard tableView === self.tableView,
              let dropItem = coordinator.items.first,
              let sourceIndexPath = dropItem.sourceIndexPath,
              let destinationIndexPath = demoGroupDropDestinationIndexPath(coordinator.destinationIndexPath),
              canDragDemoGroup(at: sourceIndexPath) else {
            return
        }
        #if DEBUG
        if ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") {
            coverageRootDropCount += 1
            coverageRootDragSourceRow = sourceIndexPath.row
            coverageRootDropDestinationRow = destinationIndexPath.row
            refreshCoverageRootDragState()
        }
        #endif
        if sourceIndexPath != destinationIndexPath {
            moveDemoGroup(from: sourceIndexPath,
                          to: destinationIndexPath)
            tableView.moveRow(at: sourceIndexPath,
                              to: destinationIndexPath)
        }
        coordinator.drop(dropItem.dragItem,
                         toRowAt: destinationIndexPath)
        saveDemoSectionOrder()
    }

    private func demoGroupDropDestinationIndexPath(_ proposedIndexPath: IndexPath?) -> IndexPath? {
        guard demo2D.count > 1 else {
            return nil
        }
        let section = proposedIndexPath?.section ?? demoGroupTableSection
        guard section == demoGroupTableSection else {
            return nil
        }
        let proposedRow = proposedIndexPath?.row ?? (demo2D.count - 1)
        let lastRow = demo2D.count - 1
        let maximumRow = isOtherDemoGroup(demo2D[lastRow]) ? lastRow - 1 : lastRow
        guard maximumRow >= 0 else {
            return nil
        }
        return IndexPath(row: min(max(proposedRow,0),
                                  maximumRow),
                         section: section)
    }
}

#if DEBUG
/// 只有真正的目标页面已入窗才发布就绪标记；无效路由和门禁拦截页不会发布。
private final class JobsCoverageReadyLabel: UILabel {

    var routeID = ""
    weak var target: UIViewController?

    static func install(on target: UIViewController, routeID: String) {
        jobsMake { marker in
            marker.routeID = routeID
            marker.target = target
            marker
                .byFrame(CGRect(x: 8, y: 100, width: 1, height: 1))
                .byTextColor(JobsCor.clear)
                .byUserInteractionEnabled(false)
                .byAddTo(target.view)
        }
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard let window,
              target?.viewIfLoaded?.window === window else {
            byAccessibilityIdentifier(nil)
            return
        }
        byText("巡检页面已就绪")
            .byAccessibilityIdentifier("jobs.coverage.ready.\(routeID)")
    }
}
#endif

// MARK: —— UIScrollViewDelegate
extension RootListVC: UIScrollViewDelegate {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        guard scrollView === tableView else {
            return
        }
        toggleFunctionMenu(false)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView === tableView else {
            return
        }
        updateFooterAvailability()
    }
}
