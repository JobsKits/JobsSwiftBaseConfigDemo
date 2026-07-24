//
//  JobsAppDoorResource.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import UIKit

private final class JobsAppDoorBundleToken: NSObject { }

public enum JobsAppDoorResource {
    public static var bundle: Bundle {
        let sourceBundle = Bundle(for: JobsAppDoorBundleToken.self)
        guard let bundleURL = sourceBundle.url(forResource: "JobsAppDoorResources", withExtension: "bundle"),
              let resourceBundle = Bundle(url: bundleURL) else { return sourceBundle };return resourceBundle
    }

    public static func image(named name: String) -> UIImage? {
        UIImage(named: name, in: bundle, compatibleWith: nil)
            ?? UIImage(named: name)
    }

    static func customerServiceIconImage() -> UIImage? {
        let image = image(named: "service_meiqia") ?? image(named: "用户名称")
        return image?.preparingThumbnail(of: CGSize(width: 18, height: 18)) ?? image
    }

    public static func videoURL(named resourceName: String) -> URL? {
        let resource = resourceName as NSString
        let ext = resource.pathExtension
        let name = resource.deletingPathExtension
        return bundle.url(
            forResource: name,
            withExtension: ext.isEmpty ? nil : ext
        )
    }

    public static func text(_ key: String) -> String {
        NSLocalizedString(
            key,
            tableName: "JobsAppDoor",
            bundle: bundle,
            value: key,
            comment: ""
        )
    }

    public static func countdownText(seconds: Int) -> String {
        String(format: text("还剩 %ld 秒"), locale: Locale.current, seconds)
    }
}
