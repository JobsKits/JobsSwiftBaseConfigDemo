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
import JobsRefresher
import JobsTextTools
import JobsSwiftTimer
import JobsBy3rdTools
import JobsInheritance
import JobsSwiftAppTools
import JobsSwiftBaseDefines
import GKNavigationBarSwift
import SnapKit
import MJRefresh

final class RootListVC: BaseVC {
    // ================================== JobsSwiftTimer（新版）统一管理 ==================================
    private let timerMgr = JobsSwiftTimerManager.shared
    private let suspendBtnTimerID = "RootListVC.suspendBtn.timer"
    private let suspendSpinBtnTimerID = "RootListVC.suspendSpinBtn.timer"

    private var suspendBtnTimer: JobsSwiftTimerProtocol?
    private var suspendSpinBtnTimer: JobsSwiftTimerProtocol?

    /// 旧版 onTimerTick 给 elapsed；新版不再给，自己计数即可
    private var spinSeconds: Int = 0

    deinit {
        suspendBtnTimer?.stop()
        suspendSpinBtnTimer?.stop()
        try? timerMgr.remove(identifier: suspendBtnTimerID)
        try? timerMgr.remove(identifier: suspendSpinBtnTimerID)

        if let langToken {
            NotificationCenter.default.removeObserver(langToken)
        }
    }

    private var langToken: NSObjectProtocol?
    /// 展开状态（一级目录展开行）
    private var expandedGroups = Set<Int>()
    /// 防抖标记（原逻辑不动）
    private var isPullRefreshing = false
    private var isLoadingMore    = false

    // ================================== 数据源（唯一） ==================================
    private typealias DemoItem  = (title: String, vcType: UIViewController.Type)
    private typealias DemoGroup = (title: String, items: [DemoItem])
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
//        temp.insert(("🚀 Unity", UnityDemoVC.self), at: 0) // 或 append
        #endif
        return temp
    }()
    /// ✅ 懒加载，数组配置写在这里
    private var demo2D: [DemoGroup] = []
    private func makeDemo2D() -> [DemoGroup] {
        return [
            (title: "JobsSwiftTimer系列衍生产品", items: [
                ("🐯 节流防抖", JobsWorkerDemoVC.self),
                ("🧠 任务中枢@TaskCenter", TaskCenterComponentDemoVC.self),
                ("⏰ JobsSwiftTimer", TimerDemoVC.self),
                ("🛠️ Jobs时间管理大师", JobsTimerManagerDemoVC.self),
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
                ("😂 按钮完全覆盖在UICollectionViewCell上", BtnFullOnCVCellDemoVC.self),
                ("😂 按钮完全覆盖在UITableViewCell上", BtnFullOnTBVCellDemoVC.self),
                ("🧭 系统导航栏@富文本标题", JobsNavigationDemoVC.self),
            ]),
            (title: "实用工具集", items: [
                ("📢 本地通知", LocalNotificationDemoVC.self),
                ("🧹 支持左右上下刷新", JobsRefresherDemoVC.self),
                ("🧹 支持左右上下刷新（非正式协议闭包化）", JobsRefresherBy非正式协议闭包化DemoVC.self),
                ("⌨️ 键盘", KeyboardDemoVC.self),
                ("📷 鉴权后调用相机/相册", PhotoAlbumDemoVC.self),
                ("🕹️ ControlEvents", JobsControlEventsDemoVC.self),
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
                ("🏠 首页联动", CashbackRootVC.self),
                ("🔑 注册登录".tr + " (TODO)", JobsAppDoorDemoVC.self),
            ]),
            (title: "富文本/普通文本处理", items: [
                ("🌋 富文本", RichTextDemoVC.self),
                ("🌋 普通文本和富文本的融合数据类型", JobsTextDemoVC.self),
            ]),
            (title: "安全推页面（高度自定义）", items: [
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
            // ✅ 长按不松手：外圈一直增长（正计时）——计时用 JobsSwiftTimer
            .jobs_enablePressFuseCountUp(
                tickInterval: 1.0 / 60.0,
                durationToFull: 2.0,          // 2s 走满一圈（想更快/更慢就改这里）
                loopWhenFull: true,           // 满了继续从 0 再增长
                config: JobsFuseConfig(
                    lineWidth: 2,
                    color: .white,
                    inset: 0,
                    removeOnFinish: false,
                    direction: .clockwise
                ),
                onTick: { btn, elapsed, _ in
                    // 想展示“正计时”就更新标题（可删）
                    btn.byTitle(String(format: "%.1f", elapsed), for: .normal)
                },
                onEnd: { btn, _, _ in
                    btn.byTitle("按", for: .normal)
                }
            )
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
    }()
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
//        OCCls().string("q", image: "".img)
        demo2D = makeDemo2D()
        langToken = NotificationCenter.default.addObserver(
            forName: .JobsLanguageDidChange, object: nil, queue: .main
        ) { [weak self] _ in
            guard let self else { return }
            self.demo2D = self.makeDemo2D()
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
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
            rightButtons: [
                UIButton.sys()
                    .byImage("bell".svg(size: CGSize(width: 38, height: 38))?.filled(by: UIColor.red), for: .normal)
                    .byImage("moon.circle.fill".sysImg, for: .selected)
                    .onTap { sender in
                        sender.isSelected.toggle()
                        guard let ws = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                              let win = ws.windows.first else { return }
                        win.overrideUserInterfaceStyle =
                            (win.overrideUserInterfaceStyle == .dark) ? .light : .dark
                        print("🌓 主题已切换 -> \(win.overrideUserInterfaceStyle == .dark ? "Dark" : "Light")")
                    },
                UIButton.sys()
                    .byImage("globe".sysImg, for: .normal)
                    .byImage("globe".sysImg, for: .selected)
                    .onTap { [weak self] sender in
                        guard let self else { return }
                        sender.isSelected.toggle()
                        let to = (LanguageManager.shared.currentLanguageCode == "zh-Hans") ? "en" : "zh-Hans"
                        LanguageManager.shared.switchTo(to)// zh-Hans、en
                        print("🌐 切换语言 tapped（占位）")
                    },
                UIButton.sys()
                    .byImage("stop.circle.fill".sysImg, for: .normal)
                    .byImage("stop.circle.fill".sysImg, for: .selected)
                    .onTap { [weak self] sender in
                        guard let self else { return }
                        sender.isSelected.toggle()
                        print("🛑 手动停止刷新")
                        isPullRefreshing = false
                        isLoadingMore    = false
                    }
            ]
        )
        tableView.byVisible(YES)
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
// MARK: —— UITableViewDataSource & UITableViewDelegate
extension RootListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        demo2D.count
    }
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RootFoldTableCell = tableView.byDequeueReusableCell(withType: RootFoldTableCell.self,for: indexPath)
        let row = indexPath.row
        let g = demo2D[row]
        let expanded = expandedGroups.contains(row)
        cell.configure(groupTitle: g.title,
                       items: g.items,
                       expanded: expanded) { [weak self] itemIndex in
            guard let self else { return }
            let vcType = self.demo2D[row].items[itemIndex].vcType
            /// 这里推入控制器
            vcType.init().byPush(self)
        };return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        return expandedGroups.contains(row)
        ? RootFoldTableCell.expandedHeight(itemCount: demo2D[row].items.count)
        : RootFoldTableCell.collapsedHeight()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateFooterAvailability()
    }
}
