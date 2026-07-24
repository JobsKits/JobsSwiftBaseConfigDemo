//
//  PermissionCenter.swift
//  JobsSwiftTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import Photos
import AVFoundation
import CoreLocation
import JobsSwiftBlock
import JobsSwiftBaseDefines
import JobsToast
import AVFAudio
import CoreBluetooth

// ================================== 权限中心：声明 ==================================
public enum SystemPermission {
    case camera
    case photoLibraryReadWrite
    case microphone
    case locationWhenInUse
    case bluetooth
}

public enum PermissionState {
    case authorized
    case denied
    case notDetermined
    case restricted
    case limited                     // 仅对相册有意义
}
// ================================== 权限中心：实现 ==================================
public final class PermissionCenter: NSObject {
    /// 统一对外入口
    public static func ensure(_ permission: SystemPermission,
                              from presenter: UIViewController?,
                              onAuthorized: @escaping jobsByVoidBlock) {
        switch permission {
        /// 处理 .camera 分支
        case .camera:               ensureCamera(from: presenter, onAuthorized: onAuthorized)
        /// 处理 .photoLibraryReadWrite 分支
        case .photoLibraryReadWrite:ensurePhotoLibrary(from: presenter, onAuthorized: onAuthorized)
        /// 处理 .microphone 分支
        case .microphone:           ensureMicrophone(from: presenter, onAuthorized: onAuthorized)
        /// 处理 .locationWhenInUse 分支
        case .locationWhenInUse:    ensureLocationWhenInUse(from: presenter, onAuthorized: onAuthorized)
        /// 处理 .bluetooth 分支
        case .bluetooth:            ensureBluetooth(from: presenter, onAuthorized: onAuthorized)
        }
    }
    // MARK: Camera
    private static func ensureCamera(from presenter: UIViewController?, onAuthorized: @escaping jobsByVoidBlock) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        /// 处理 .authorized 分支
        case .authorized:
            onMainAsync { onAuthorized() }
        /// 处理 .notDetermined 分支
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                granted ? onMainAsync { onAuthorized() } : showNoPermissionToast(in: presenter)
            }
        /// 合并处理 .denied、.restricted 分支
        case .denied, .restricted:
            showNoPermissionToast(in: presenter)
        /// 处理系统后续新增的未知枚举值
        @unknown default:
            showNoPermissionToast(in: presenter)
        }
    }
    // MARK: Photo Library (readWrite)
    private static func ensurePhotoLibrary(from presenter: UIViewController?, onAuthorized: @escaping jobsByVoidBlock) {
        if #available(iOS 14, *) {
            let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
            switch status {
            /// 合并处理 .authorized、.limited 分支
            case .authorized, .limited:
                onMainAsync { onAuthorized() }   // limited 也放行
            /// 处理 .notDetermined 分支
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization(for: .readWrite) { newStatus in
                    switch newStatus {
                    /// 合并处理 .authorized、.limited 分支
                    case .authorized, .limited: onMainAsync { onAuthorized() }
                    /// 未匹配已知分支时执行兜底处理
                    default: showNoPermissionToast(in: presenter)
                    }
                }
            /// 合并处理 .denied、.restricted 分支
            case .denied, .restricted:
                showNoPermissionToast(in: presenter)
            /// 处理系统后续新增的未知枚举值
            @unknown default:
                showNoPermissionToast(in: presenter)
            }
        } else {
            let status = PHPhotoLibrary.authorizationStatus()
            switch status {
            /// 处理 .authorized 分支
            case .authorized:
                onMainAsync { onAuthorized() }
            /// 处理 .notDetermined 分支
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization { newStatus in
                    newStatus == .authorized ? onMainAsync { onAuthorized() } : showNoPermissionToast(in: presenter)
                }
            /// 未匹配已知分支时执行兜底处理
            default:
                showNoPermissionToast(in: presenter)
            }
        }
    }
    // MARK: Microphone  ✅ iOS 17+
    private static func ensureMicrophone(from presenter: UIViewController?, onAuthorized: @escaping jobsByVoidBlock) {
        if #available(iOS 17.0, *) {
            let p = AVAudioApplication.shared.recordPermission
            switch p {
            /// 处理 .granted 分支
            case .granted:
                onMainAsync { onAuthorized() }
            /// 处理 .undetermined 分支
            case .undetermined:
                AVAudioApplication.requestRecordPermission { granted in
                    granted ? onMainAsync {onAuthorized()} : showNoPermissionToast(in: presenter)
                }
            /// 处理 .denied 分支
            case .denied:
                showNoPermissionToast(in: presenter)
            /// 处理系统后续新增的未知枚举值
            @unknown default:
                showNoPermissionToast(in: presenter)
            }
        } else {
            let p = AVAudioSession.sharedInstance().recordPermission
            switch p {
            /// 处理 .granted 分支
            case .granted:
                onMainAsync { onAuthorized() }
            /// 处理 .undetermined 分支
            case .undetermined:
                AVAudioSession.sharedInstance().requestRecordPermission { granted in
                    granted ? onMainAsync { onAuthorized() } : showNoPermissionToast(in: presenter)
                }
            /// 处理 .denied 分支
            case .denied:
                showNoPermissionToast(in: presenter)
            /// 处理系统后续新增的未知枚举值
            @unknown default:
                showNoPermissionToast(in: presenter)
            }
        }
    }
    // MARK: Location (WhenInUse)  ✅ iOS 14+
    private static var locProxy = LocationProxy()
    private static func ensureLocationWhenInUse(from presenter: UIViewController?, onAuthorized: @escaping jobsByVoidBlock) {
        let status: CLAuthorizationStatus
        if #available(iOS 14.0, *) {
            status = CLLocationManager().authorizationStatus
        } else {
            status = CLLocationManager.authorizationStatus()
        }
        switch status {
        /// 合并处理 .authorizedWhenInUse、.authorizedAlways 分支
        case .authorizedWhenInUse, .authorizedAlways:
            onMainAsync { onAuthorized() }
        /// 处理 .notDetermined 分支
        case .notDetermined:
            locProxy.requestWhenInUse { granted in
                granted ? onMainAsync { onAuthorized() } : showNoPermissionToast(in: presenter)
            }
        /// 合并处理 .denied、.restricted 分支
        case .denied, .restricted:
            showNoPermissionToast(in: presenter)
        /// 处理系统后续新增的未知枚举值
        @unknown default:
            showNoPermissionToast(in: presenter)
        }
    }
    // MARK: Bluetooth
    private static var btProxy = BluetoothProxy()
    private static func ensureBluetooth(from presenter: UIViewController?, onAuthorized: @escaping jobsByVoidBlock) {
        if #available(iOS 13.1, *) {
            let auth = CBCentralManager.authorization
            switch auth {
            /// 处理 .allowedAlways 分支
            case .allowedAlways:
                onMainAsync { onAuthorized() }
            /// 处理 .notDetermined 分支
            case .notDetermined:
                btProxy.request { granted in
                    granted ? onMainAsync { onAuthorized() } : showNoPermissionToast(in: presenter)
                }
            /// 合并处理 .denied、.restricted 分支
            case .denied, .restricted:
                showNoPermissionToast(in: presenter)
            /// 处理系统后续新增的未知枚举值
            @unknown default:
                showNoPermissionToast(in: presenter)
            }
        } else {
            btProxy.request { granted in
                granted ? onMainAsync { onAuthorized() } : showNoPermissionToast(in: presenter)
            }
        }
    }
    // MARK: Toast
    private static func showNoPermissionToast(in presenter: UIViewController?) {
        onMainAsync {
            "请获取相关权限".toast
        }
    }
}
// ================================== 私有代理：定位 & 蓝牙 ==================================
private final class LocationProxy: NSObject, CLLocationManagerDelegate {
    private var manager: CLLocationManager?
    private var jobsByVoidBlock: ((Bool) -> Void)?

    func requestWhenInUse(_ jobsByVoidBlock: @escaping (Bool)->Void) {
        self.jobsByVoidBlock = jobsByVoidBlock
        let m = CLLocationManager()
        self.manager = m
        m.delegate = self
        m.requestWhenInUseAuthorization()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if #available(iOS 14.0, *) {
            handle(manager.authorizationStatus)
        } else {
            handle(CLLocationManager.authorizationStatus())
        }
    }

    @available(iOS, introduced: 4.2, deprecated: 14.0)
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        handle(status)
    }

    private func handle(_ status: CLAuthorizationStatus) {
        switch status {
        /// 合并处理 .authorizedAlways、.authorizedWhenInUse 分支
        case .authorizedAlways, .authorizedWhenInUse: jobsByVoidBlock?(true)
        /// 合并处理 .denied、.restricted 分支
        case .denied, .restricted:                   jobsByVoidBlock?(false)
        /// 处理 .notDetermined 分支
        case .notDetermined:                          return
        /// 处理系统后续新增的未知枚举值
        @unknown default:                             jobsByVoidBlock?(false)
        }
        jobsByVoidBlock = nil
        manager?.delegate = nil
        manager = nil
    }
}

private final class BluetoothProxy: NSObject, CBCentralManagerDelegate {
    private var central: CBCentralManager?
    private var jobsByVoidBlock: ((Bool)->Void)?

    func request(_ jobsByVoidBlock: @escaping (Bool)->Void) {
        self.jobsByVoidBlock = jobsByVoidBlock
        self.central = CBCentralManager(delegate: self, queue: nil,
                                        options: [CBCentralManagerOptionShowPowerAlertKey: false])
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        let granted: Bool
        if #available(iOS 13.1, *) {
            granted = (CBCentralManager.authorization == .allowedAlways)
        } else {
            granted = (central.state != .unauthorized && central.state != .unsupported)
        }
        jobsByVoidBlock?(granted)
        jobsByVoidBlock = nil
        self.central?.delegate = nil
        self.central = nil
    }
}
