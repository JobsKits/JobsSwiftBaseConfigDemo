//
//  SceneDelegate.swift
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

import AVFoundation
import ImageIO
import JobsByUIKit
import JobsSwiftDSL
import JobsBy3rdTools
import JobsSwiftTools
import JobsSwiftSplash
import JobsSwiftOpen
import LiveChat
import JobsViewPush

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        print("✅ SceneDelegate willConnect")
        guard let windowScene = (scene as? UIWindowScene) else { return }
        LiveChat.windowScene = windowScene
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let homeViewController = RootListPreferences.makeAppRootViewController(in: window.bounds)
        window
            .byRootViewController(homeViewController)
            .byMakeKeyAndVisible()
        JobsSplashMediaCache.shared.resumePendingVideoPreloads()
        guard JobsSplashPreferences.isEnabledForNextLaunch else { return }
        let openConfiguration = JobsOpenConfiguration()
            .byURL(URL(string: "http://www.baidu.com")!)
            .byMode(.inApp)
            .byTitle("开屏详情".tr)
            .byAnimated(true)
            .byCompletion { success in
                print("开屏链接打开结果：\(success)")
            }
        JobsSplashPresenter.show(
            over: homeViewController,
            configuration: JobsSplashConfiguration(
                content: splashContentForNextLaunch()
            )
                .byCountdownSeconds(5)
                .byLanguage(.system)
    //            .byLanguage(.code("zh-Hans"))
                .bySkipButtonVisible(true)
    //            .bySkipButtonFrame(CGRect(x: 20, y: 60, width: 80, height: 36))
                .bySkipButtonInsets(UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16))
                .byContentMode(.scaleAspectFill)
                .byVideoGravity(.resizeAspectFill)
                .byTapAction(.open(openConfiguration))
    //            .byTapAction(.custom { splashVC in
    //                print("点击开屏：\(splashVC)")
    //            })
                .byShakeAction(.open(openConfiguration))
    //            .byShakeAction(.none)
                .bySkip { splashVC in
                    print("开屏已结束：\(splashVC)")
                }
        )
    }

    private func splashContentForNextLaunch() -> JobsSplashContent {
        switch JobsSplashPreferences.contentTypeForNextLaunch {
        /// 使用本地静态图片开屏
        case .localImage:
            return .localImage(name: "米老鼠")
        /// 使用现有图片资源生成本地 GIF 开屏
        case .localGIF:
            guard let fileURL = generatedLocalSplashGIFURL() else {
                print("⚠️ 本地 GIF 生成失败，开屏回退到本地图片")
                return .localImage(name: "米老鼠")
            };return .localGIF(fileURL: fileURL)
        /// 使用远程图片开屏
        case .remoteImage:
            guard let url = URL(string: "https://picsum.photos/1242/2688.jpg") else {
                return .localImage(name: "米老鼠")
            };return .remoteImage(url)
        /// 使用 App Bundle 内的视频开屏
        case .localVideo:
            return .localVideo(name: "welcome_video", fileExtension: "mp4")
        /// 使用远程视频开屏
        case .remoteVideo:
            guard let url = URL(string: "https://media.w3.org/2010/05/sintel/trailer.mp4") else {
                return .localVideo(name: "welcome_video", fileExtension: "mp4")
            };return .remoteVideo(
                url,
                fallbackName: "welcome_video",
                fallbackFileExtension: "mp4"
            )
        }
    }

    private func generatedLocalSplashGIFURL() -> URL? {
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent("JobsSplashLocalGIF.gif")
        if FileManager.default.fileExists(atPath: fileURL.path) { return fileURL }
        let frames = ["米老鼠".img, "唐老鸭".img, "迪斯尼".img].compactMap(\.cgImage)
        guard frames.count > 1,
              let destination = CGImageDestinationCreateWithURL(
                fileURL as CFURL,
                "com.compuserve.gif" as CFString,
                frames.count,
                nil
              ) else { return nil }
        let gifProperties = [
            kCGImagePropertyGIFDictionary: [
                kCGImagePropertyGIFLoopCount: 0
            ]
        ] as CFDictionary
        let frameProperties = [
            kCGImagePropertyGIFDictionary: [
                kCGImagePropertyGIFDelayTime: 0.8
            ]
        ] as CFDictionary
        CGImageDestinationSetProperties(destination, gifProperties)
        frames.forEach {
            CGImageDestinationAddImage(destination, $0, frameProperties)
        }
        guard CGImageDestinationFinalize(destination) else {
            try? FileManager.default.removeItem(at: fileURL)
            return nil
        };return fileURL
    }
    // ================================== CrashLog: Safe Exit Marker ==================================
    func sceneDidBecomeActive(_ scene: UIScene) {
        // 回到前台，标记“正在运行中”
        CrashLogCenter.shared.markAppLaunched()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // 进入后台算安全点
        CrashLogCenter.shared.markSafeExitPoint()
    }
}
