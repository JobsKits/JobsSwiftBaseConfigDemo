//
//  AppDelegate.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2025/6/4.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import UserNotifications
import GKNavigationBarSwift
import LiveChat
import IQKeyboardManagerSwift
import IQKeyboardToolbarManager
import CocoaLumberjack
import BRPickerViewSwift
import JobsSwiftBaseDefines
import JobsByUIKit
import JobsSwiftTimer
import JobsSwiftFoundation_extensions
import JobsScale
import Jobsl10n
import JobsSwiftBaseTools
import JobsSwiftTools
import JobsSwiftAppTools
import JobsBy3rdTools
/// https://github.com/apple/swift-collections#
#if canImport(Collections)
import Collections          // ✅ Pod 或 SPM 直接接 apple/swift-collections
#elseif canImport(OrderedCollections)
import OrderedCollections   // ✅ SPM 只接 OrderedCollections product 的情况
#endif

#if canImport(Flutter)
import Flutter
import FlutterPluginRegistrant
@main
class AppDelegate: FlutterAppDelegate {
    /// ✅ 持有 timer，避免被释放
    private var appTickerTimer: JobsSwiftTimerProtocol?

    lazy var flutterEngine: FlutterEngine = {
        let e = FlutterEngine(name: "jobs_flutter_engine")
        e.run()
        GeneratedPluginRegistrant.register(with: e)
        FlutterBridge.shared.setup(engine: e)
        return e
    }()

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        SA()
        print("INFO PLIST PATH =", Bundle.main.path(forResource: "Info", ofType: "plist") ?? "nil")
        print("SceneManifest? =", Bundle.main.object(forInfoDictionaryKey: "UIApplicationSceneManifest") != nil)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    // ================================== CrashLog: Safe Exit Marker ==================================
    override func applicationDidBecomeActive(_ application: UIApplication) {
        super.applicationDidBecomeActive(application)
        // 回到前台，重新标记“正在运行中”
        CrashLogCenter.shared.markAppLaunched()
    }

    override func applicationDidEnterBackground(_ application: UIApplication) {
        super.applicationDidEnterBackground(application)
        // 进入后台算到达安全点（避免误判“上次崩溃”）
        CrashLogCenter.shared.markSafeExitPoint()
    }

    override func applicationWillTerminate(_ application: UIApplication) {
        // terminate 不是每次都会走到，但能走到就写安全点
        CrashLogCenter.shared.markSafeExitPoint()
        super.applicationWillTerminate(application)
    }
    // MARK: UISceneSession Lifecycle
    override func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let config = UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
        config.delegateClass = SceneDelegate.self
        return config
    }
}

#else
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    /// ✅ 持有 timer，避免被释放
    private var appTickerTimer: JobsSwiftTimerProtocol?

    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        SA()
        return true
    }
    // MARK: UISceneSession Lifecycle
    override func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    // ================================== CrashLog: Safe Exit Marker ==================================
    override func applicationDidBecomeActive(_ application: UIApplication) {
        super.applicationDidBecomeActive(application)
        // 回到前台，重新标记“正在运行中”
        CrashLogCenter.shared.markAppLaunched()
    }

    override func applicationDidEnterBackground(_ application: UIApplication) {
        super.applicationDidEnterBackground(application)
        // 进入后台算到达安全点（避免误判“上次崩溃”）
        CrashLogCenter.shared.markSafeExitPoint()
    }

    override func applicationWillTerminate(_ application: UIApplication) {
        // terminate 不是每次都会走到，但能走到就写安全点
        CrashLogCenter.shared.markSafeExitPoint()
        super.applicationWillTerminate(application)
    }
}
#endif
// MARK: - Local Notifications
extension AppDelegate {
    func setupLocalNotificationsIfNeeded() {
        let center = UNUserNotificationCenter.current()

        // delegate
        #if canImport(Flutter)
        center.delegate = self
        #else
        center.delegate = self
        #endif

        var options: UNAuthorizationOptions = [.alert, .badge]
        #if !os(tvOS)
        options.insert(.sound)
        #endif

        center.requestAuthorization(options: options) { granted, error in
            if let error {
                log("requestAuthorization error: \(error)")
                return
            }
            log(granted ? "Notification permission granted." : "Notification permission denied.")
        }
    }
}
#if canImport(Flutter)
// FlutterAppDelegate 已经遵循 UNUserNotificationCenterDelegate，所以这里只 override
extension AppDelegate {
    override func userNotificationCenter(_ center: UNUserNotificationCenter,
                                         willPresent notification: UNNotification,
                                         withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        #if os(tvOS)
        completionHandler([.banner, .badge])
        #else
        if #available(iOS 14.0, *) {
            completionHandler([.banner, .sound, .badge])
        } else {
            completionHandler([.alert, .sound, .badge])
        }
        #endif
    }

    override func userNotificationCenter(_ center: UNUserNotificationCenter,
                                         didReceive response: UNNotificationResponse,
                                         withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}
#else
// 非 Flutter 分支需要自己声明协议
extension AppDelegate: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        #if os(tvOS)
        completionHandler([.banner, .badge])
        #else
        if #available(iOS 14.0, *) {
            completionHandler([.banner, .sound, .badge])
        } else {
            completionHandler([.alert, .sound, .badge])
        }
        #endif
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}
#endif
extension AppDelegate {
    func SA() {
        setupLocalNotificationsIfNeeded()
        _ = flutterEngine

        if let (minV, maxV) = [3, 1, 9, 7].minMax() {
            print(minV, maxV)   // 1 9
        }

        // ✅ 新版 JobsSwiftTimer：不再用 JobsTimerFactory.make
        do {
            let cfg = JobsSwiftTimerConfig(
                interval: 1,
                repeats: true,
                tolerance: 0.002,
                queue: .main,
                runLoop: .main,
                runLoopMode: .common,
                pauseInBackground: true,
                autoManageAppState: true
            )

            let t = JobsSwiftTimer(kind: .displayLink, config: cfg) {
                /// 日期打印（这里只是打印，不触碰 UI，不需要 MainActor）
                print(Date().formatted(date: .numeric, time: .standard))
            }

            appTickerTimer = t
            t.start()
        }

        setupLogging()
        udSave()
        udRead()
        udSaveAge()
        udReadAge()

        Subscript_Character()
        Subscript_Array()
        Subscript_Dictionary()
        /// 没写 CodingKeys 时：用 keyDecodingStrategy 的规则。
        /// 写了 CodingKeys：以 CodingKeys 为准（手动指定是什么就是什么）。
        JSONDecoder_CodingKeys()
        JSONDecoder_keyDecodingStrategy()
        JSONDecoder解析字段处理时间()
        JSONDecoder嵌套JSON数组解析()
        JSONDecoder嵌套对象()

        OrderedDictionary测试()

        GK配置()
        删除键监听()
        全局比例尺()
        安全Push和Present()
        启动检测()
        日志打印()
        LiveChat配置()
        智能键盘配置()
        多语言化()
    }
}

extension AppDelegate {
    struct UserInfoModel: Codable {
        let id: Int
        let name: String
        let isVIP: Bool
    }
    /// 日志框架接入
    func setupLogging() {
        dynamicLogLevel = .verbose   // Debug 包：全开
        // dynamicLogLevel = .warning // Release 包：只保留 warn/error

        /// iOS 10+ 推荐
        DDLog.add(DDOSLogger.sharedInstance)
        /// Xcode Console
        DDLog.add(DDTTYLogger.sharedInstance!)
        /// 写入文件日志（线上排查神器）
//        let fileLogger = DDFileLogger()                 // 文件 logger
//        fileLogger.rollingFrequency = 60 * 60 * 24      // 每 24h 滚动一个新文件
//        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
//        DDLog.add(fileLogger)
    }
    /// 存对象
    func udSave() {
        UD.save(UserInfoModel(id: 1001, name: "Jobs", isVIP: true), forKey: "kUserInfo")
    }
    /// 取对象
    func udRead() {
        // 读取时指定类型
        if let loadedUser = UD.load(UserInfoModel.self, forKey: "kUserInfo") {
            print(loadedUser.id)     // 1001
            print(loadedUser.name)   // Jobs
            print(loadedUser.isVIP)  // true
        } else {
            print("还没有存过用户信息")
        }
    }
    /// 存 Int
    func udSaveAge() {
        let age = 18
        UD.save(age, forKey: "kUserAge")   // T = Int（Int: Codable）
    }
    /// 取 Int
    func udReadAge() {
        let age: Int? = UD.load(Int.self, forKey: "kUserAge")
        if let age {
            print("当前年龄：\(age)")
        } else {
            print("还没有存过年龄")
        }
    }
}

extension AppDelegate {
    func Subscript_Character() {
        let s = "Jobs"
        print(s[1] as Any)   // Optional("o")
        print(s[10] as Any)  // nil
    }

    func Subscript_Array() {
        let arr = [10, 20, 30]

        let a = arr[safe: 1]              // Optional(20)
        let b = arr[safe: 99]             // nil
        print(a as Any)   // Optional(20)
        print(b as Any)  // nil
    }

    func Subscript_Dictionary() {
        let dict = ["a": 1, "b": 2]

        let x = dict[safe: "a"]                 // Optional(1)
        let y = dict[safe: "zzz"]               // nil

        print(x as Any)   // Optional("o")
        print(y as Any)   // nil
    }
}

extension AppDelegate {
    /// JSONDecoder解析字段@用CodingKeys处理Json字段名和模型名不一致以及忽略字段（age）
    func JSONDecoder_CodingKeys() {

        let json = """
        {
          "user_id": 1,
          "user_name": "Jobs"
        }
        """.data(using: .utf8)!

        struct User: Codable {
            let userId: Int
            let userName: String
            let age: Int? = nil  // 👈 想忽略:在下面的 `enum CodingKeys: String, CodingKey` 里面不做映射,并且给予默认值（否则语法错误）
            /// 模型名 = 服务器字段名
            /// 如果属性不写在 `CodingKeys` 里，就不会被编解码
            /// 结论：最好写 CodingKeys。keyDecodingStrategy不是万能的
            enum CodingKeys: String, CodingKey {
                case userId   = "user_id"
                case userName = "user_name"
            }
        }

        do {
            let user = try JSONDecoder().decode(User.self, from: json)
            print(user.userId, user.userName) // 1 Jobs true
        } catch {
            print("❌ 解析失败：\(error)")
        }
    }
    /// JSONDecoder解析字段@用keyDecodingStrategy处理Json字段名和模型名不一致
    func JSONDecoder_keyDecodingStrategy() {

        let json = """
        {
          "user_id": 1,
          "user_name": "Jobs"
        }
        """.data(using: .utf8)!

        struct User: Codable {
            let userId: Int
            let userName: String
        }

        do {
            let user = try JSONDecoder()
                .bykeyDecodingStrategy(.convertFromSnakeCase) // 👈 关键
                .decode(User.self, from: json)
            print(user.userId, user.userName) // 1 Jobs true
        } catch {
            print("❌ 解析失败：\(error)")
        }
    }

    func JSONDecoder解析字段处理时间() {

        let json = """
        {
          "id": 1,
          "created_at": "2025-11-18 16:39:00"
        }
        """.data(using: .utf8)!

        struct Post: Codable {
            let id: Int
            let createdAt: Date
        }

        let decoder = JSONDecoder()
            .bykeyDecodingStrategy(.convertFromSnakeCase)
            .byDateDecodingStrategy(
                .formatted(DateFormatter()
                    .byDateFormat("yyyy-MM-dd HH:mm:ss")
                    .byLocale(Locale(identifier: "en_US_POSIX"))))
        do {
            let post = try decoder.decode(Post.self, from: json)
            print(post.createdAt)
        } catch {
            print("❌ 解析失败：\(error)")
        }
    }

    func JSONDecoder嵌套JSON数组解析() {

        let json = """
        [
          { "id": 1, "name": "A" },
          { "id": 2, "name": "B" }
        ]
        """.data(using: .utf8)!

        struct User: Codable {
            let id: Int
            let name: String
        }

        do {
            let users = try JSONDecoder().decode([User].self, from: json)
            print(users.count) // 2
        } catch {
            print("❌ 解析失败：\(error)")
        }
    }

    func JSONDecoder嵌套对象() {

        let json = """
        {
          "code": 0,
          "message": "ok",
          "data": {
            "id": 1,
            "name": "Jobs"
          }
        }
        """.data(using: .utf8)!

        struct APIResponse<T: Codable>: Codable {
            let code: Int
            let message: String
            let data: T
        }

        struct User: Codable {
            let id: Int
            let name: String
        }

        do {
            let resp = try JSONDecoder().decode(APIResponse<User>.self, from: json)
            let user = resp.data
            print(user) // 2
        } catch {
            print("❌ 解析失败：\(error)")
        }
    }

    func OrderedDictionary测试() {
        let d1: [String: JSONValue] = [
            "sd": .int(1),
            "fg": .string("2"),
            "pi": .double(3.14159),
            "flag": .bool(true),
            "list": .array([.int(1), .int(2)]),
            "config": .object([
                "debug": .bool(false),
                "threshold": .double(0.75)
            ]),
            "nothing": .null
        ]

        let d2 = [1, 2, 3, 4]
        let d3 = [
            "sd": "1",
            "ff": "2",
            "fff": "3",
            "fdf": "4"
        ]
        let d4: OrderedDictionary<String, String> = [
            "hi":  "1",
            "mo":  "2",
            "do": "3",
            "gg": "4"
        ]

        for (k, v) in d4 {
            // ✅ 一定是 sd, ff, fff, fdf
            print(k, v)
        }

        log(d1)
        log(d2)
        log(d3)

        for key in d3.keys.sorted() {
            print(key, d3[key] as Any)
        }

        print(type(of: d3))
        dump(d3)

        for (k, v) in d3 {
            print(k, v)
        }
    }
}

extension AppDelegate {
    func GK配置() {
        GKNavigationBarConfigure
            .bySetupDefault()
            .byAwake()
            .byBackground(.systemBackground)
            .byTitleCor(.label)
            .byTitleFont(.systemFont(ofSize: 18, weight: .semibold))
    }

    func 删除键监听() {
        // ✅ 启用 UITextField 的 deleteBackward 广播（与 UITextView 互不影响）
        UITextField.enableDeleteBackwardBroadcast()
        // ✅ 启用 UITextView 的 deleteBackward 广播（与 UITextField 互不影响）
        UITextView.enableDeleteBackwardBroadcast()
    }

    func 全局比例尺() {
        JobsScale.setup(designWidth: 375, designHeight: 812, useSafeArea: false)
    }

    func 安全Push和Present() {
        JobsSafePushSwizzler.enable()      // 只拦 push
        JobsSafePresentSwizzler.enable()   // 只拦 present
    }

    func 启动检测() {
        AppLaunchManager.handleLaunch(
            firstInstall: {
                log("🚀 新用户引导 / 初始化配置")
            },
            firstToday: {
                log("☀️ 每日签到弹窗 / 刷新缓存")
            },
            normal: {
                log("➡️ 正常启动 / 常规逻辑")
            }
        )
    }

    func 日志打印() {
        #if DEBUG
        JobsLog.enabled = true
        #else
        JobsLog.enabled = false    // Release 关闭日志
        #endif
        JobsLog.showThread = true
    }

    func LiveChat配置() {
        // LiveChat 许可证 ID（到 LiveChat 后台可查看）
        LiveChat.licenseId = AppKeys.liveChatKey      // 必填
        // 可选：减少预聊天表单输入
        LiveChat.name  = "Jobs"
        LiveChat.email = "jobs@example.com"
        // 可选：把用户归到指定客服分组（注意：groupId 必须有效，否则可能加载不出来）
        LiveChat.groupId = "77"
        // 可选：自定义变量（用于上下文）
        LiveChat.setVariable(withKey: "userId", value: "123456")
    }

    func 智能键盘配置() {
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
        IQKeyboardManager.shared.keyboardDistance = 0

        IQKeyboardToolbarManager.shared.isEnabled = false
    }

    func 多语言化() {
        TRLang.bundleProvider = { LanguageManager.shared.localizedBundle }
        TRLang.localeCodeProvider = { LanguageManager.shared.currentLanguageCode }
    }
}
