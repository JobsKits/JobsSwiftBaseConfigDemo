//
//  JobsMotionAppIconOption.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import Foundation

enum JobsMotionAppIconOption: Int, CaseIterable {
    case primary
    case shake
    case gyroscope
    case rocket
    case planet

    var title: String {
        switch self {
        /// 工程主图标
        case .primary:
            return "主图标"
        /// iconfont 摇一摇图标
        case .shake:
            return "摇一摇"
        /// iconfont 陀螺仪图标
        case .gyroscope:
            return "陀螺仪"
        /// iconfont 火箭图标
        case .rocket:
            return "火箭"
        /// iconfont 星球图标
        case .planet:
            return "星球"
        }
    }

    var alternateIconName: String? {
        switch self {
        /// 主图标通过 nil 恢复
        case .primary:
            return nil
        /// 摇一摇备用 AppIcon
        case .shake:
            return "JobsAlternateComposerIcon-Shake"
        /// 陀螺仪备用 AppIcon
        case .gyroscope:
            return "JobsAlternateComposerIcon-Gyroscope"
        /// 火箭备用 AppIcon
        case .rocket:
            return "JobsAlternateComposerIcon-Rocket"
        /// 星球备用 AppIcon
        case .planet:
            return "JobsAlternateComposerIcon-Planet"
        }
    }

    var previewAssetName: String {
        switch self {
        /// 主图标预览资源
        case .primary:
            return "JobsMotionAppIconPrimaryPreview"
        /// 摇一摇预览资源
        case .shake:
            return "JobsMotionAppIconShakePreview"
        /// 陀螺仪预览资源
        case .gyroscope:
            return "JobsMotionAppIconGyroscopePreview"
        /// 火箭预览资源
        case .rocket:
            return "JobsMotionAppIconRocketPreview"
        /// 星球预览资源
        case .planet:
            return "JobsMotionAppIconPlanetPreview"
        }
    }

    var sourceDescription: String {
        switch self {
        /// 用户现有主图标
        case .primary:
            return "工程主图标"
        /// iconfont 素材编号
        case .shake:
            return "iconfont #15346614"
        /// iconfont 素材编号
        case .gyroscope:
            return "iconfont #3786924"
        /// iconfont 素材编号
        case .rocket:
            return "iconfont #3877902"
        /// iconfont 素材编号
        case .planet:
            return "iconfont #8680662"
        }
    }

    static func option(matching alternateIconName: String?) -> JobsMotionAppIconOption {
        guard let alternateIconName else { return .primary };return allCases.first {
            $0.alternateIconName == alternateIconName
        } ?? .primary
    }

    func next() -> JobsMotionAppIconOption {
        let options = Self.allCases
        let nextIndex = (rawValue + 1) % options.count
        return options[nextIndex]
    }
}
