//
//  AppDelegate+DeviceLaunchGate.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

import UIKit

#if canImport(Flutter)
import Flutter

extension AppDelegate {

    override func application(_ application: UIApplication,
                              open url: URL,
                              options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            return false
        }
        return super.application(application,
                                 open: url,
                                 options: options)
    }

    override func application(_ application: UIApplication,
                              continue userActivity: NSUserActivity,
                              restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            restorationHandler(nil)
            return false
        }
        return super.application(application,
                                 continue: userActivity,
                                 restorationHandler: restorationHandler)
    }

    override func application(_ application: UIApplication,
                              performActionFor shortcutItem: UIApplicationShortcutItem,
                              completionHandler: @escaping (Bool) -> Void) {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            completionHandler(false)
            return
        }
        super.application(application,
                          performActionFor: shortcutItem,
                          completionHandler: completionHandler)
    }

    override func application(_ application: UIApplication,
                              handleEventsForBackgroundURLSession identifier: String,
                              completionHandler: @escaping () -> Void) {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            completionHandler()
            return
        }
        super.application(application,
                          handleEventsForBackgroundURLSession: identifier,
                          completionHandler: completionHandler)
    }

    override func application(_ application: UIApplication,
                              didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                              fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            completionHandler(.noData)
            return
        }
        super.application(application,
                          didReceiveRemoteNotification: userInfo,
                          fetchCompletionHandler: completionHandler)
    }

    override func application(_ application: UIApplication,
                              performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            completionHandler(.noData)
            return
        }
        super.application(application,
                          performFetchWithCompletionHandler: completionHandler)
    }

    override func registrar(forPlugin pluginKey: String) -> FlutterPluginRegistrar? {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            return nil
        }
        return super.registrar(forPlugin: pluginKey)
    }

    override func hasPlugin(_ pluginKey: String) -> Bool {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            return false
        }
        return super.hasPlugin(pluginKey)
    }

    override func valuePublished(byPlugin pluginKey: String) -> NSObject? {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            return nil
        }
        return super.valuePublished(byPlugin: pluginKey)
    }

    override func application(_ application: UIApplication,
                              shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            return false
        }
        return super.application(application,
                                 shouldSaveSecureApplicationState: coder)
    }

    override func application(_ application: UIApplication,
                              shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            return false
        }
        return super.application(application,
                                 shouldRestoreSecureApplicationState: coder)
    }
}
#endif
