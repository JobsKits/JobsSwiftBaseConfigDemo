//
//  JobsDeviceGuard.swift
//  JobsSwiftDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

import Foundation
import Darwin
import MachO

/// 只提供本地运行时风险信号；不能介入 iOS 安装流程，也不保证识别所有越狱。
public enum JobsDeviceGuard {

    public static func inspect(configuration: JobsDeviceGuardConfiguration = .init()) -> JobsDeviceGuardReport {
        let platform = platformSupport()
        guard platform.supported else {
            let checks = JobsDeviceGuardCategory.allCases.map { category in
                JobsDeviceGuardCheck(category: category,
                                     state: .skipped,
                                     diagnostics: ["当前环境不适用真机越狱检测。"])
            }
            return JobsDeviceGuardReport(platform: platform.name,
                                         supported: false,
                                         checks: checks,
                                         minimumDetectedCategories: configuration.minimumDetectedCategories)
        }
        return JobsDeviceGuardReport(platform: platform.name,
                                     supported: true,
                                     checks: [checkFeaturePaths(configuration.featurePaths),
                checkLoadedImages(configuration.suspiciousImageNames),
                configuration.enablesSandboxWriteProbe
                    ? checkSandboxWrites(["/private", "/private/var/lib"])
                    : JobsDeviceGuardCheck(category: .sandbox,
                                           state: .skipped)],
                                     minimumDetectedCategories: configuration.minimumDetectedCategories)
    }

    /// 每次执行新检测，后台探测完成后在主线程回调。
    public static func inspectAsync(configuration: JobsDeviceGuardConfiguration = .init(),
                                    completion: @escaping @MainActor @Sendable (JobsDeviceGuardReport) -> Void) {
        DispatchQueue.global(qos: .utility).async {
            let report = inspect(configuration: configuration)
            DispatchQueue.main.async {
                completion(report)
            }
        }
    }

    public static func isJailbroken(configuration: JobsDeviceGuardConfiguration = .init()) -> Bool {
        inspect(configuration: configuration).isJailbroken
    }

    private static func platformSupport() -> (name: String, supported: Bool) {
        #if targetEnvironment(simulator)
        return ("iOS Simulator", false)
        #elseif targetEnvironment(macCatalyst)
        return ("Mac Catalyst", false)
        #elseif os(iOS)
        if #available(iOS 14.0, *), ProcessInfo.processInfo.isiOSAppOnMac {
            return ("iOS App on Mac", false)
        }
        return ("iOS device", true)
        #else
        return ("Non-iOS platform", false)
        #endif
    }

    static func checkFeaturePaths(_ paths: [String]) -> JobsDeviceGuardCheck {
        var evidence: [String] = []
        var diagnostics: [String] = []
        for path in Set(paths).sorted() {
            guard validAbsolutePath(path) else {
                diagnostics.append("无效特征路径：\(path)")
                continue
            }
            if access(path,
                      F_OK) == 0 {
                evidence.append(path)
            } else {
                let code = errno
                if code != ENOENT && code != ENOTDIR {
                    diagnostics.append("access \(path)：errno=\(code)")
                }
            }
        }
        return makeCheck(category: .fileSystem,
                         values: paths,
                         evidence: evidence,
                         diagnostics: diagnostics)
    }

    static func checkLoadedImages(_ names: [String],
                                  images: [String]? = nil) -> JobsDeviceGuardCheck {
        guard !names.isEmpty else {
            return JobsDeviceGuardCheck(category: .runtime,
                                        state: .skipped)
        }
        var diagnostics: [String] = []
        let normalizedNames = Set(names.compactMap { name -> String? in
            guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
                  !name.contains("/"), !name.contains("\\"),
                  !name.utf8.contains(0), name != ".", name != ".." else {
                diagnostics.append("无效镜像文件名：\(name)")
                return nil
            }
            return name.lowercased()
        })
        let imagePaths: [String]
        if let images {
            imagePaths = images
        } else {
            let count = _dyld_image_count()
            imagePaths = (0 ..< count).compactMap { index in
                guard let imageName = _dyld_get_image_name(index) else {
                    diagnostics.append("无法读取已加载镜像：index=\(index)")
                    return nil
                }
                return String(cString: imageName)
            }
            if count == 0 {
                diagnostics.append("未能取得当前进程镜像。")
            }
        }
        let evidence = Set(imagePaths.filter { path in
            normalizedNames.contains((path as NSString).lastPathComponent.lowercased())
        }).sorted()
        return makeCheck(category: .runtime,
                         values: names,
                         evidence: evidence,
                         diagnostics: diagnostics)
    }

    static func checkSandboxWrites(_ directories: [String],
                                   operations: JobsDeviceGuardFileOperations = .live) -> JobsDeviceGuardCheck {
        var evidence: [String] = []
        var diagnostics: [String] = []
        for directory in Set(directories).sorted() {
            guard validAbsolutePath(directory) else {
                diagnostics.append("无效探测目录：\(directory)")
                continue
            }
            let path = directory + "/.jobs-device-guard-" + UUID().uuidString
            let descriptor = operations.openExclusive(path)
            guard descriptor >= 0 else {
                let code = operations.errorCode()
                if code != EACCES && code != EPERM && code != EROFS {
                    diagnostics.append("open \(directory)：errno=\(code)")
                }
                continue
            }
            evidence.append(directory)
            if operations.closeDescriptor(descriptor) != 0 {
                let code = operations.errorCode()
                diagnostics.append("close \(path)：errno=\(code)")
            }
            // 只有 O_EXCL 创建成功后才清理，绝不删除预先存在的文件。
            if operations.removePath(path) != 0 {
                let code = operations.errorCode()
                diagnostics.append("unlink \(path)：errno=\(code)，请检查残留探测文件。")
            }
        }
        return makeCheck(category: .sandbox,
                         values: directories,
                         evidence: evidence,
                         diagnostics: diagnostics)
    }

    private static func validAbsolutePath(_ path: String) -> Bool {
        path.hasPrefix("/") && !path.utf8.contains(0)
    }

    private static func makeCheck(category: JobsDeviceGuardCategory,
                                  values: [String],
                                  evidence: [String],
                                  diagnostics: [String]) -> JobsDeviceGuardCheck {
        let state: JobsDeviceGuardCheck.State
        if !evidence.isEmpty {
            state = .detected
        } else if !diagnostics.isEmpty {
            state = .unavailable
        } else {
            state = values.isEmpty ? .skipped : .passed
        }
        return JobsDeviceGuardCheck(category: category,
                                    state: state,
                                    evidence: evidence,
                                    diagnostics: diagnostics)
    }
}
