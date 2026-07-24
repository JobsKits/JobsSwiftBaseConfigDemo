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
import JobsScreenCapture
import GKNavigationBarSwift
import SnapKit
import MJRefresh

final class RootListVC: BaseVC {
    private static let demoSectionOrderUserDefaultsKey = "com.BSports.JobsSwiftDemoListSectionOrderUserDefaultsKey"
    private static let demoSearchHistoryUserDefaultsKey = "com.BSports.JobsSwiftDemoSearchHistoryUserDefaultsKey"
    private static let pinnedDemoUserDefaultsKey = "com.BSports.JobsSwiftPinnedDemoUserDefaultsKey"
    private static let maximumDemoSearchHistoryCount = 20
    private static let demoProjectFolderInfoKey = "JobsProjectFolderName"
    private static let fallbackDemoProjectFolderName = "JobsBaseConfig@JobsSwiftBaseConfigDemo"
    private static let demoProjectFolderName: String = {
        let configuredName = Bundle.main.object(forInfoDictionaryKey: demoProjectFolderInfoKey) as? String
        let normalizedName = configuredName?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let shouldUseFallback = normalizedName.isEmpty || normalizedName.contains("$(")
        return shouldUseFallback ? fallbackDemoProjectFolderName : normalizedName
    }()

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
    private var demoExpandedHeightCache: [String: (tableWidth: CGFloat, height: CGFloat)] = [:]
    private var demoExpandedHeightRefreshScheduled = false
    /// 防抖标记（原逻辑不动）
    private var isPullRefreshing = false
    private var isLoadingMore    = false
    private var demoListHasAppeared = false

    // ================================== 数据源（唯一） ==================================
    private typealias DemoItem  = (title: String, vcType: UIViewController.Type)
    private typealias DemoGroup = (title: String, items: [DemoItem])
    private var demoSearchKeyword = ""
    private lazy var demoSearchHistory: [String] = {
        let savedHistory = UserDefaults.standard.stringArray(forKey: Self.demoSearchHistoryUserDefaultsKey) ?? []
        var history: [String] = []
        for value in savedHistory {
            let text = value.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !text.isEmpty,
                  !history.contains(text),
                  history.count < Self.maximumDemoSearchHistoryCount else { continue }
            history.append(text)
        };return history
    }()
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
            (title: "系统能力与硬件通信".tr, items: [
                ("本地录音与音频管理", JobsAudioRecorderDemoVC.self),
                ("📶 JobsBluetooth 全能力 Demo", JobsBluetoothDemoVC.self),
                ("🧭 CoreMotion DSL Demo", JobsCoreMotionDemoVC.self),
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
                ("🔄 JobsImageRotation｜图片定时旋转", JobsImageRotationDemoVC.self),
                ("🏷️ 动效数字按钮", AnimatedButtonNumberDemoVC.self),
                ("🐎 跑马灯 / 🛞 轮播图", JobsMarqueeDemoVC.self),
                ("💥 倒计时按钮", JobsCountdownDemoVC.self),
                ("🕖 时钟", ClockDemoVC.self),
                ("🎲 抽奖轮盘@仿系统减速曲线", LuckyWheelDemoVC.self),
                ("🧧 红包雨", RedPacketRainDemoVC.self),
                ("💣 任意UIView.layer@导火索倒计时效果", JobsCountdownLayerDemoVC.self),
                ("系统进度条", JobsSysProgressDemoVC.self),
                ("自定义进度条（进度值+前进方向）", JobsProgressDemoVC.self)
            ]),
            (title: "Label".tr, items: [
                ("🏷️ 动效数字标签", AnimationEffectLabelDemoVC.self),
                ("🏷️ UILabel+Scrolling｜四种定尺寸文字策略", UILabelScrollingDemoVC.self),
                ("• 带小圆点文本及对齐", JobsBulletTextDemoVC.self),
                ("🔄 UILabel 文字旋转", JobsLabelRotationDemoVC.self)
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
            (title: "实用工具集".tr, items: [
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
    // ================================== 悬浮控件（原逻辑不动） ==================================
    private lazy var suspendBtn: UIButton = {
        UIButton.sys()
            .byTitle("当前时间".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 18, weight: .bold))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemBlue, for: .normal)
            .byCornerRadius(10)
            .byMasksToBounds(true)
            .onLongPress(minimumPressDuration: 0.8) { [weak self] _, gesture in
                guard gesture.state == .began else { return }
                self?.showSuspendTimeButtonVisibilityAlert()
            }
            .onTap { [weak self] _ in
                guard let self else { return }
                "点击了悬浮按钮".tr.toast
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
        UIButton.sys()
            .byTitle("0", for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 22, weight: .bold))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemOrange, for: .normal)
            .byCornerRadius(25)
            .byMasksToBounds(true)
            .onLongPress(minimumPressDuration: 0.8) { _, _ in
                "长按了悬浮按钮".tr.toast
            }
            .onTap { [weak self] btn in
                guard let self else { return }
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
                    .byStart(.point(CGPoint(x: Screen.width - 60, y: Screen.height - 100)))
                    .byFallbackSize(CGSize(width: 50, height: 50))
                    .byHapticOnDock(true)
            }
    }()

    private lazy var suspendFuseBtn: UIButton = {
        UIButton.sys()
            .byTitle("按".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 10, weight: .bold))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemPurple, for: .normal)
            .byCornerRadius(25)
            .byMasksToBounds(true)
            .byPointerInteractionEnabled(false)
            .byAccessibilityIdentifier("RootListVC.suspendFuseBtn")
            .onTap { [weak self] sender in
                guard let self else { return }
                // 短按：只播放声音；长按结束后可能冒出来的 tap 直接吞掉
                guard !self.suspendFuseLongPressConsumed else { return }
                sender.byFusePlaySound()
            }
            .onLongPress(minimumPressDuration: 0.8) { [weak self] btn, gr in
                guard let self else { return }
                switch gr.state {
                /// 处理 .began 分支
                case .began:
                    self.suspendFuseLongPressConsumed = true
                    btn.byFusePressStart(
                        ringConfig: JobsFuseOuterRingConfig(
                            lineWidth: 4,
                            strokeColor: JobsCor.white,
                            trackColor: JobsCor.white.withAlphaComponent(0.22),
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
                /// 合并处理 .ended、.cancelled、.failed 分支
                case .ended, .cancelled, .failed:
                    btn.byFusePressStop()
                    // 给 UIControl 的 touchUpInside 留一点时间，避免长按结束后被当成短按
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) { [weak self] in
                        self?.suspendFuseLongPressConsumed = false
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
                    .byStart(.point(CGPoint(x: 15, y: Screen.height - 100)))
                    .byFallbackSize(CGSize(width: 50, height: 50))
                    .byDocking(.nearestEdge)
                    .byHapticOnDock(true)
            }
    }()
    // ================================== TableView（一级目录） ==================================
    private lazy var demoNavigationTitleLabel: UILabel = {
        UILabel()
            .tr_setText("演武堂".tr)
            .byTextColor(RootListPreferences.primaryTextColor)
            .byFont(JobsFont.systemFont(ofSize: 17, weight: .medium))
            .byTextAlignment(.center)
            .byNumberOfLines(1)
    }()

    private lazy var demoNavigationProjectLabel: UILabel = {
        UILabel()
            .byText(Self.demoProjectFolderName)
            .byTextColor(RootListPreferences.secondaryTextColor)
            .byFont(JobsFont.systemFont(ofSize: 10, weight: .regular))
            .byTextAlignment(.center)
            .byNumberOfLines(1)
            .byLineBreakMode(.byTruncatingMiddle)
            .byAdjustsFontSizeToFitWidth(YES)
            .byMinimumScaleFactor(0.75)
    }()

    private lazy var demoNavigationTitleView: UIStackView = {
        UIStackView()
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
            .byFrame(CGRect(x: 0, y: 0, width: 32, height: 32))
            .byImage("ellipsis.circle".sysImg, for: .normal)
            .byImage("ellipsis.circle.fill".sysImg, for: .selected)
            .byTintColor(RootListPreferences.primaryTextColor)
            .byShadowOpacity(0)
            .byClipsToBounds(YES)
            .onTap { [weak self] sender in
                guard let self else { return }
                sender.byToggleSelected()
                toggleFunctionMenu(sender.isSelected)
            }
    }()

    private lazy var functionMenuDismissTapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleFunctionMenuDismissTap(_:)))
        gesture.cancelsTouchesInView = false
        return gesture
    }()

    private lazy var functionMenuTableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(UITableViewCell.self)
            .byBackgroundColor(RootListPreferences.cardBackgroundColor)
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
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(6)
                make.right.equalToSuperview().inset(12)
                make.width.equalTo(210)
                make.height.equalTo(FunctionMenuAction.allCases.count * 44)
            }
    }()

    private lazy var demoSearchCancelButton: UIButton = {
        UIButton.sys()
            .byTitle("取消".tr, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleColor(JobsCor.white.withAlphaComponent(0.78), for: .highlighted)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byNumberOfLines(1)
            .byLineBreakMode(.byClipping)
            .byTitleAdjustsFontSizeToFitWidth(true)
            .byTitleMinimumScaleFactor(0.8)
            .byContentHorizontalAlignment(.center)
            .byContentEdgeInsets(UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
            .byBackgroundColor(RootListPreferences.selectedTintColor, for: .normal)
            .byBackgroundColor(RootListPreferences.selectedTintColor.withAlphaComponent(0.72), for: .highlighted)
            .byCornerRadius(10)
            .onTap { [weak self] _ in
                self?.setSearchEnabled(false)
            }
            .byAddTo(view) { [unowned self] make in
                make.right.equalToSuperview().inset(12)
                make.width.greaterThanOrEqualTo(64)
                make.height.equalTo(36)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(18)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(14)
                }
            }
    }()

    private lazy var demoSearchBar: UISearchBar = {
        UISearchBar()
            .byPlaceholder("输入关键词搜索 Demo".tr)
            .byDelegate(self)
            .byShowsCancelButton(false)
            .bySearchBarStyle(.minimal)
            .byTranslucent(true)
            .byBackgroundImage(UIImage.make())
            .byBarTintColor(RootListPreferences.pageBackgroundColor)
            .byBackgroundColor(JobsCor.clear)
            .byAddTo(view) { [unowned self] make in
                make.left.equalToSuperview().inset(8)
                make.right.equalTo(demoSearchCancelButton.snp.left).offset(-4)
                make.height.equalTo(56)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(8)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(4)
                }
            }
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
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
            .byContentInset(UIEdgeInsets(
                top: 8,left: 0, bottom: 0, right: 0
            ))
            .setHeaderRefreshFeedback(
                JobsRefreshFeedback(
                    enablesHaptics: true,
                    soundFileName: "Sound.wav"
                )
            )
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
            self.refreshLocalizedContent()
            self.applyDemoListThemeChrome()
            self.tableView.reloadData()
            self.functionMenuTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(RootListPreferences.pageBackgroundColor)
        RootListPreferences.applyPreferredInterfaceStyle()
        jobsSetupGKNav(
            title: "演武堂".tr,
            leftButton: UIButton.sys()
                .byFrame(CGRect(x: 0, y: 0, width: 32, height: 32))
                .byImage("list.bullet".sysImg, for: .normal)
                .byImage("list.bullet".sysImg, for: .selected)
                .byShadowOpacity(0)
                .byClipsToBounds(YES)
                .onTap { [weak self] sender in
                    guard let self else { return }
                    sender.byToggleSelected()
                    self.jobsSideDrawer?.toggleDrawer()
                    print("")
                }
                .onTapAppend { _ in
                    print("追加的点按事件")
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
                .onLongPressAppend(minimumPressDuration: 0.8) { _, _ in
                    print("追加的长按事件")
                },
            rightButtons: [functionMenuButton]
        )
        gk_navTitleView = demoNavigationTitleView
        demoSearchBar.byVisible(NO)
        demoSearchCancelButton.byVisible(NO)
        tableView.byVisible(YES)
        functionMenuTableView.byVisible(NO)
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
        refreshLocalizedContent()
        applyDemoListThemeChrome()
        refreshSuspendTimeButtonVisibility()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.beginUpdates()
        tableView.endUpdates()
        if demoListHasAppeared && RootListPreferences.returnToTopAndRefreshEnabled {
            reloadDemoListToTopAndRefresh()
        }
        demoListHasAppeared = true
        refreshSuspendTimeButtonVisibility()
        suspendSpinBtnTimer?.resume()
    }
}

extension RootListVC{
    private func showSuspendTimeButtonVisibilityAlert() {
        UIAlertController
            .makeAlert("隐藏悬浮时间？".tr,
                       "隐藏后可在“设置”中重新开启。".tr)
            .byAddCancel("取消".tr)
            .byAddDestructive("隐藏".tr) { [weak self] _ in
                guard let self else { return }
                RootListPreferences.showsSuspendTimeButton = false
                refreshSuspendTimeButtonVisibility()
            }
            .byTintColor(RootListPreferences.selectedTintColor)
            .byPresent(self)
    }

    private func refreshSuspendTimeButtonVisibility() {
        let visible = RootListPreferences.showsSuspendTimeButton
        suspendBtn.byVisible(visible)
        if visible {
            suspendBtnTimer?.resume()
        } else {
            suspendBtnTimer?.pause()
        }
    }

    // ================================== 运行时语言刷新 ==================================
    private func refreshLocalizedContent() {
        demoNavigationTitleLabel.byText("演武堂".tr)
        demoSearchBar.byPlaceholder("输入关键词搜索 Demo".tr)
        demoSearchCancelButton.byTitle("取消".tr, for: .normal)
        suspendBtn.byTitle("当前时间".tr, for: .normal)
        suspendFuseBtn.byTitle("按".tr, for: .normal)
        if let tabBarController = view.window?.rootViewController as? UITabBarController,
           let items = tabBarController.tabBar.items,
           items.count >= 3 {
            items[0].byTitle("Demo".tr)
            items[1].byTitle("消息".tr)
            items[2].byTitle("我的".tr)
        }
    }

    // ================================== Demo 列表主题刷新 ==================================
    private func applyDemoListThemeChrome() {
        RootListPreferences.applyThemeChrome(to: self,
                                             backgroundColor: RootListPreferences.pageBackgroundColor)
        gk_navShadowColor = JobsCor.clear
        gk_navLineHidden = true
        gk_navigationBar.byShadowOpacity(0)
        tableView.byBackgroundColor(JobsCor.clear)
        tableView.separatorColor = RootListPreferences.separatorColor
        demoNavigationTitleLabel.byTextColor(RootListPreferences.primaryTextColor)
        demoNavigationProjectLabel.byTextColor(RootListPreferences.secondaryTextColor)
        functionMenuButton.byTintColor(RootListPreferences.primaryTextColor)
        functionMenuTableView.byBackgroundColor(RootListPreferences.cardBackgroundColor)
        functionMenuTableView.bySeparatorColor(RootListPreferences.separatorColor)
        demoSearchBar.byBarTintColor(RootListPreferences.pageBackgroundColor)
        demoSearchBar.byTintColor(RootListPreferences.selectedTintColor)
        demoSearchBar.byBackgroundColor(JobsCor.clear)
        demoSearchCancelButton
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleColor(JobsCor.white.withAlphaComponent(0.78), for: .highlighted)
            .byBackgroundColor(RootListPreferences.selectedTintColor, for: .normal)
            .byBackgroundColor(RootListPreferences.selectedTintColor.withAlphaComponent(0.72), for: .highlighted)
            .byCornerRadius(10)
        #if os(iOS)
        if #available(iOS 13.0, *) {
            demoSearchBar.searchTextField
                .byBackgroundColor(RootListPreferences.foldCardBackgroundColor)
                .byTextColor(RootListPreferences.primaryTextColor)
                .byTintColor(RootListPreferences.selectedTintColor)
                .byFont(JobsFont.systemFont(ofSize: 15, weight: .regular))
                .byCornerRadius(18)
                .byBorderWidth(1)
                .byBorderColor(RootListPreferences.separatorColor)
                .byClipsToBounds(YES)
                .byAttributedPlaceholder(
                    NSAttributedString(
                        string: "输入关键词搜索 Demo".tr,
                        attributes: [
                            .foregroundColor: RootListPreferences.secondaryTextColor,
                            .font: JobsFont.systemFont(ofSize: 15, weight: .regular)
                        ]
                    )
                )
            demoSearchBar.searchTextField.leftView?.byTintColor(RootListPreferences.secondaryTextColor)
        }
        #endif
        if view.window != nil {
            functionMenuTableView.reloadData()
            tableView.reloadData()
        }
    }

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
                        btn.byTitle("当前时间".tr, for: .normal)
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

    private var demoSearchActive: Bool {
        !demoSearchKeyword.isEmpty
    }

    private var demoSearchLandingActive: Bool {
        demoSearchEnabled && !demoSearchActive && !demoSearchHistory.isEmpty
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

    private func demoExpandedHeightCacheKey(groupTitle: String,
                                            items: [DemoItem]) -> String {
        let itemKeys = items.map {
            "\($0.title)#\(demoPersistentKey(for: $0))"
        }.joined(separator: "|")
        return "\(groupTitle)|\(itemKeys)"
    }

    private func cachedDemoExpandedHeight(groupTitle: String,
                                          items: [DemoItem],
                                          tableView: UITableView) -> CGFloat? {
        let key = demoExpandedHeightCacheKey(groupTitle: groupTitle, items: items)
        guard let cached = demoExpandedHeightCache[key],
              abs(cached.tableWidth - tableView.bounds.width) <= 0.5 else { return nil };return cached.height
    }

    private func cacheDemoExpandedHeight(_ height: CGFloat,
                                         for key: String) {
        guard height > 0 else { return }
        let tableWidth = tableView.bounds.width
        if let cached = demoExpandedHeightCache[key],
           abs(cached.tableWidth - tableWidth) <= 0.5,
           abs(cached.height - height) <= 0.5 {
            return
        }
        demoExpandedHeightCache[key] = (tableWidth: tableWidth, height: height)
        scheduleDemoExpandedHeightRefresh()
    }

    private func scheduleDemoExpandedHeightRefresh() {
        guard tableView.window != nil,
              !demoExpandedHeightRefreshScheduled else { return }
        demoExpandedHeightRefreshScheduled = true
        onMainAsync(self) { vc in
            guard vc.tableView.window != nil else {
                vc.demoExpandedHeightRefreshScheduled = false
                return
            }
            guard !vc.tableView.hasUncommittedUpdates else {
                vc.demoExpandedHeightRefreshScheduled = false
                vc.scheduleDemoExpandedHeightRefresh()
                return
            }
            UIView.jobsPerformWithoutAnimation {
                vc.tableView.beginUpdates()
                vc.tableView.endUpdates()
            }
            vc.demoExpandedHeightRefreshScheduled = false
            vc.updateFooterAvailability()
        }
    }

    private func fallbackDemoFoldCellWidth(in tableView: UITableView) -> CGFloat {
        let layoutWidth = tableView.layoutMarginsGuide.layoutFrame.width
        guard layoutWidth > 0 else { return max(tableView.bounds.width, 0) };return layoutWidth
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

    private func normalizedDemoSearchText(_ text: String?) -> String {
        (text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private func applySearchKeyword(_ keyword: String) {
        demoSearchKeyword = normalizedDemoSearchText(keyword)
        guard !demoSearchKeyword.isEmpty else {
            demo2D = allDemo2D.compactMap { group in
                let items = group.items.filter { !isPinnedDemoItem($0) };return items.isEmpty ? nil : (title: group.title, items: items)
            }
            expandedGroups = demo2D.isEmpty ? [] : [0]
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

    private func applySearchHistory(_ historyText: String) {
        let text = normalizedDemoSearchText(historyText)
        guard !text.isEmpty else { return }
        demoSearchBar.byText(text)
        applySearchKeyword(text)
        tableView.reloadData()
        updateFooterAvailability()
    }

    private func saveDemoSearchHistory(_ searchText: String?) {
        let text = normalizedDemoSearchText(searchText)
        guard !text.isEmpty else { return }
        if let index = demoSearchHistory.firstIndex(of: text) {
            demoSearchHistory.remove(at: index)
        }
        demoSearchHistory.insert(text, at: 0)
        if demoSearchHistory.count > Self.maximumDemoSearchHistoryCount {
            demoSearchHistory.removeLast(demoSearchHistory.count - Self.maximumDemoSearchHistoryCount)
        }
        persistDemoSearchHistory()
        tableView.reloadData()
    }

    private func deleteDemoSearchHistory(at index: Int) {
        guard demoSearchHistory.indices.contains(index) else { return }
        demoSearchHistory.remove(at: index)
        persistDemoSearchHistory()
        tableView.reloadData()
        updateFooterAvailability()
    }

    private func clearDemoSearchHistory() {
        demoSearchHistory.removeAll()
        persistDemoSearchHistory()
        tableView.reloadData()
        updateFooterAvailability()
    }

    private func persistDemoSearchHistory() {
        if demoSearchHistory.isEmpty {
            UserDefaults.standard.removeObject(forKey: Self.demoSearchHistoryUserDefaultsKey)
        } else {
            UserDefaults.standard.set(demoSearchHistory, forKey: Self.demoSearchHistoryUserDefaultsKey)
        }
    }

    private func demoSearchHistoryHeaderView() -> UIView {
        let headerView = UIView()
            .byBackgroundColor(JobsCor.clear)
        UILabel()
            .byText("搜索历史".tr)
            .byTextColor(RootListPreferences.primaryTextColor)
            .byFont(JobsFont.systemFont(ofSize: 17, weight: .semibold))
            .byAddTo(headerView) { make in
                make.left.equalToSuperview().offset(16)
                make.centerY.equalToSuperview()
            }
        UIButton.sys()
            .byTitle("清空".tr)
            .byTitleColor(RootListPreferences.secondaryTextColor)
            .byTitleColor(RootListPreferences.selectedTintColor, for: .highlighted)
            .byTitleFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
            .byNumberOfLines(1)
            .byLineBreakMode(.byClipping)
            .byTitleAdjustsFontSizeToFitWidth(true)
            .byTitleMinimumScaleFactor(0.6)
            .byContentEdgeInsets(.zero)
            .byBackgroundColor(JobsCor.clear)
            .onTap { [weak self] _ in
                self?.clearDemoSearchHistory()
            }
            .byAddTo(headerView) { make in
                make.right.equalToSuperview().inset(16)
                make.centerY.equalToSuperview()
                make.width.equalTo(52)
                make.height.equalTo(32)
            };return headerView
    }

    @objc private func handleFunctionMenuDismissTap(_ gesture: UITapGestureRecognizer) {
        let point = gesture.location(in: view)
        let searchBarFrame = demoSearchBar.convert(demoSearchBar.bounds, to: view)
        let pointInSearchBar = !demoSearchBar.isHidden && searchBarFrame.contains(point)
        if !pointInSearchBar {
            jobsDismissKeyboard()
        }
        guard !functionMenuTableView.isHidden else { return }
        let buttonFrame = functionMenuButton.convert(functionMenuButton.bounds, to: view)
        if functionMenuTableView.frame.contains(point) || buttonFrame.contains(point) {
            return
        }
        toggleFunctionMenu(false)
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
        tableView.setContentOffset(CGPoint(x: 0, y: -tableView.adjustedContentInset.top), animated: false)
        tableView.mj_header?.beginRefreshing()
    }

    private func toggleFunctionMenu(_ visible: Bool) {
        functionMenuButton.bySelected(visible)
        functionMenuTableView.byVisible(visible)
        if visible {
            applyDemoListThemeChrome()
            functionMenuTableView.reloadData()
            view.bringSubviewToFront(functionMenuTableView)
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
            RootListSettingsVC().byPush(self)
        }
    }

    private func setSearchEnabled(_ enabled: Bool) {
        demoSearchBar.byVisible(enabled)
        demoSearchCancelButton.byVisible(enabled)
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
            tableView.reloadData()
            updateFooterAvailability()
            demoSearchBar.becomeFirstResponder()
        } else {
            demoSearchBar.byText("")
            applySearchKeyword("")
            demoSearchBar.resignFirstResponder()
            tableView.reloadData()
            updateFooterAvailability()
        }
    }

    // MARK: - Footer 自动显隐逻辑
    private func updateFooterAvailability() {
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
// MARK: —— UISearchBarDelegate
extension RootListVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        applySearchKeyword(searchText)
        tableView.reloadData()
        updateFooterAvailability()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        saveDemoSearchHistory(searchBar.text)
        searchBar.resignFirstResponder()
    }

}
// MARK: —— UITableViewDataSource & UITableViewDelegate
extension RootListVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView === functionMenuTableView { return 1 }
        if demoSearchLandingActive { return 1 };return hasPinnedDemoSection ? 2 : 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView === functionMenuTableView {
            return FunctionMenuAction.allCases.count
        }
        if demoSearchLandingActive {
            return demoSearchHistory.count
        }
        if hasPinnedDemoSection && section == 0 {
            return 1
        };return section == demoGroupTableSection ? demo2D.count : 0
    }
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView === functionMenuTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
            let action = FunctionMenuAction.allCases[indexPath.row]
            cell.textLabel?.byText(menuTitle(for: action))
            cell.textLabel?.byFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            cell.textLabel?.byTextColor(RootListPreferences.primaryTextColor)
            cell.byBackgroundColor(RootListPreferences.cardBackgroundColor)
            cell.contentView.byBackgroundColor(RootListPreferences.cardBackgroundColor)
            cell.byTintColor(RootListPreferences.selectedTintColor)
            cell.accessoryType = .none
            cell.selectionStyle = .default
            return cell
        }
        if demoSearchLandingActive {
            let cell: UITableViewCell = tableView.byDequeueReusableCell(withType: UITableViewCell.self, for: indexPath)
            let historyText = demoSearchHistory.indices.contains(indexPath.row) ? demoSearchHistory[indexPath.row] : ""
            let deleteButton = UIButton.sys()
                .byImage("xmark.circle.fill".sysImg.withRenderingMode(.alwaysTemplate))
                .byTintColor(RootListPreferences.secondaryTextColor)
                .byFrame(CGRect(x: 0, y: 0, width: 38, height: 38))
                .byImageEdgeInsets(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
                .onTap { [weak self] _ in
                    self?.deleteDemoSearchHistory(at: indexPath.row)
                }
            cell.contentView.byBackgroundColor(RootListPreferences.cardBackgroundColor)
            cell.imageView?
                .byTintColor(RootListPreferences.secondaryTextColor)
                .byContentMode(.scaleAspectFit)
            return cell
                .byText(historyText)
                .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .regular))
                .byTitleCor(RootListPreferences.primaryTextColor)
                .byImage("clock".sysImg.withRenderingMode(.alwaysTemplate))
                .byAccessoryType(.none)
                .byAccessoryView(deleteButton)
                .bySelectionStyle(.default)
                .byBackgroundColor(RootListPreferences.cardBackgroundColor)
                .byTintColor(RootListPreferences.secondaryTextColor)
        }
        if hasPinnedDemoSection && indexPath.section == 0 {
            let cell: RootFoldTableCell = tableView.byDequeueReusableCell(withType: RootFoldTableCell.self,for: indexPath)
            let heightCacheKey = demoExpandedHeightCacheKey(groupTitle: "置顶".tr,
                                                            items: pinnedDemoItems)
            cell.configurePinned(groupTitle: "置顶".tr,
                                 items: pinnedDemoItems,
                                 expandedHeightDidChange: { [weak self] height in
                self?.cacheDemoExpandedHeight(height, for: heightCacheKey)
            }) { [weak self] itemIndex in
                guard let self,
                      self.pinnedDemoItems.indices.contains(itemIndex) else { return }
                let item = self.pinnedDemoItems[itemIndex]
                item.vcType.init()
                    .byTitle(item.title)
                    .byPush(self)
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
        let heightCacheKey = demoExpandedHeightCacheKey(groupTitle: g.title,
                                                        items: g.items)
        cell.configure(groupTitle: g.title,
                       items: g.items,
                       expanded: expanded,
                       expandedHeightDidChange: { [weak self] height in
            self?.cacheDemoExpandedHeight(height, for: heightCacheKey)
        }) { [weak self] itemIndex in
            guard let self else { return }
            if self.demoSearchActive {
                self.saveDemoSearchHistory(self.demoSearchKeyword)
            }
            let item = g.items[itemIndex]
            /// 这里推入控制器
            item.vcType.init()
                .byTitle(item.title)
                .byPush(self)
        } pinItem: { [weak self] itemIndex in
            guard let self,
                  g.items.indices.contains(itemIndex) else { return }
            self.pinDemoItem(g.items[itemIndex])
        };return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView === functionMenuTableView { return 44 }
        if demoSearchLandingActive { return 54 }
        if hasPinnedDemoSection && indexPath.section == 0 {
            if let cachedHeight = cachedDemoExpandedHeight(groupTitle: "置顶".tr,
                                                           items: pinnedDemoItems,
                                                           tableView: tableView) {
                return cachedHeight
            };return RootFoldTableCell.expandedHeight(
                items: pinnedDemoItems,
                tableWidth: fallbackDemoFoldCellWidth(in: tableView)
            )
        }
        guard indexPath.section == demoGroupTableSection,
              demo2D.indices.contains(indexPath.row) else { return .leastNonzeroMagnitude }
        let row = indexPath.row
        guard expandedGroups.contains(row) else { return RootFoldTableCell.collapsedHeight() }
        let group = demo2D[row]
        if let cachedHeight = cachedDemoExpandedHeight(groupTitle: group.title,
                                                       items: group.items,
                                                       tableView: tableView) {
            return cachedHeight
        };return RootFoldTableCell.expandedHeight(
            items: group.items,
            tableWidth: fallbackDemoFoldCellWidth(in: tableView)
        )
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView === functionMenuTableView {
            handleMenuAction(FunctionMenuAction.allCases[indexPath.row])
            return
        }
        if demoSearchLandingActive {
            guard demoSearchHistory.indices.contains(indexPath.row) else { return }
            applySearchHistory(demoSearchHistory[indexPath.row])
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

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard tableView !== functionMenuTableView,
              demoSearchLandingActive else { return .leastNonzeroMagnitude };return 48
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard tableView !== functionMenuTableView,
              demoSearchLandingActive else { return nil };return demoSearchHistoryHeaderView()
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .leastNonzeroMagnitude
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        tableView !== functionMenuTableView &&
        demoSearchLandingActive &&
        demoSearchHistory.indices.contains(indexPath.row)
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        guard tableView !== functionMenuTableView,
              editingStyle == .delete,
              demoSearchLandingActive else { return }
        deleteDemoSearchHistory(at: indexPath.row)
    }
}

// MARK: —— Demo 分组长按排序
extension RootListVC: UITableViewDragDelegate, UITableViewDropDelegate {
    func tableView(_ tableView: UITableView,
                   itemsForBeginning session: UIDragSession,
                   at indexPath: IndexPath) -> [UIDragItem] {
        guard tableView === self.tableView,
              !demoSearchEnabled,
              canDragDemoGroup(at: indexPath) else { return [] }
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
        guard tableView === self.tableView else { return }
        session.localContext = tableView
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }

    func tableView(_ tableView: UITableView,
                   canHandle session: UIDropSession) -> Bool {
        guard let sourceTableView = session.localDragSession?.localContext as? UITableView else { return false };return tableView === self.tableView &&
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
        };return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }

    func tableView(_ tableView: UITableView,
                   performDropWith coordinator: UITableViewDropCoordinator) {
        guard tableView === self.tableView,
              let dropItem = coordinator.items.first,
              let sourceIndexPath = dropItem.sourceIndexPath,
              let destinationIndexPath = demoGroupDropDestinationIndexPath(coordinator.destinationIndexPath),
              canDragDemoGroup(at: sourceIndexPath) else { return }
        if sourceIndexPath != destinationIndexPath {
            moveDemoGroup(from: sourceIndexPath, to: destinationIndexPath)
            tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
        }
        coordinator.drop(dropItem.dragItem, toRowAt: destinationIndexPath)
        saveDemoSectionOrder()
    }

    private func demoGroupDropDestinationIndexPath(_ proposedIndexPath: IndexPath?) -> IndexPath? {
        guard demo2D.count > 1 else { return nil }
        let section = proposedIndexPath?.section ?? demoGroupTableSection
        guard section == demoGroupTableSection else { return nil }
        let proposedRow = proposedIndexPath?.row ?? (demo2D.count - 1)
        return IndexPath(row: min(max(proposedRow, 0), demo2D.count - 1), section: section)
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
