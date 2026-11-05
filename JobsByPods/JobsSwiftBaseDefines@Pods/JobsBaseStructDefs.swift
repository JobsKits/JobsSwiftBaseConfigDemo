//
//  JobsBaseStructDefs.swift
//  JobsSwiftBaseDefines
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

/// 优先使用调用方屏幕；无调用方的兼容入口选择前台 Scene，未连接时返回零尺寸。
public enum JobsDisplay {

    public static func bounds(in view: UIView? = nil) -> CGRect {
        if #available(iOS 13.0, tvOS 13.0, *) {
            if let view {
                return view.window?.windowScene?.screen.bounds ?? view.bounds
            }
            let scenes = UIApplication.shared.connectedScenes.compactMap {
                $0 as? UIWindowScene
            }
            let scene = scenes.first {
                $0.activationState == .foregroundActive
            } ?? scenes.first {
                $0.activationState == .foregroundInactive
            } ?? scenes.first
            if let scene {
                return scene.screen.bounds
            }
        }
        if #available(iOS 26.0, tvOS 26.0, *) {
            return view?.bounds ?? .zero
        } else {
            return legacyScreenBounds
        }
    }

    @available(iOS, introduced: 2.0, deprecated: 26.0)
    @available(tvOS, introduced: 9.0, deprecated: 26.0)
    private static var legacyScreenBounds: CGRect {
        return UIScreen.main.bounds
    }
}

/// 统一离屏绘制，保留旧系统的 CGContext 管线及调用方指定的像素比例。
public enum JobsGraphics {

    public static func image(size: CGSize,
                             opaque: Bool = false,
                             scale: CGFloat = 0,
                             drawing: (CGContext) -> Void) -> UIImage? {
        guard size.width.isFinite, size.height.isFinite,
              size.width > 0, size.height > 0 else {
            return nil
        }
        if #available(iOS 17.0, tvOS 17.0, *) {
            let format = UIGraphicsImageRendererFormat.default()
            format.opaque = opaque
            if scale > 0 {
                format.scale = scale
            }
            format.preferredRange = .standard
            return UIGraphicsImageRenderer(size: size,
                                            format: format).image { context in
                drawing(context.cgContext)
            }
        } else {
            return legacyImage(size: size,
                                opaque: opaque,
                                scale: scale,
                                drawing: drawing)
        }
    }

    @available(iOS, introduced: 2.0, deprecated: 17.0)
    @available(tvOS, introduced: 9.0, deprecated: 17.0)
    private static func legacyImage(size: CGSize,
                                     opaque: Bool,
                                     scale: CGFloat,
                                     drawing: (CGContext) -> Void) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size,
                                               opaque,
                                               scale)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        drawing(context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

public struct FramePatch {

    public var x: CGFloat?
    public var y: CGFloat?
    public var width: CGFloat?
    public var height: CGFloat?

    public init(x: CGFloat? = nil,
                y: CGFloat? = nil,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
}
// MARK: - ShadowDirection
public struct ShadowDirection: OptionSet {

    public let rawValue: UInt
    public static let top        = ShadowDirection([])
    public static let down       = ShadowDirection(rawValue: 1 << 0)
    public static let left       = ShadowDirection(rawValue: 1 << 1)
    public static let right      = ShadowDirection(rawValue: 1 << 2)
    public static let leftTop    = ShadowDirection(rawValue: 1 << 3)
    public static let leftDown   = ShadowDirection(rawValue: 1 << 4)
    public static let rightTop   = ShadowDirection(rawValue: 1 << 5)
    public static let rightDown  = ShadowDirection(rawValue: 1 << 6)
    public static let all: ShadowDirection = [.top, .down, .left, .right, .leftTop, .leftDown, .rightTop, .rightDown]

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
}
// MARK: - UIBorderSideType
public struct UIBorderSideType: OptionSet {

    public let rawValue: UInt
    public static let all    = UIBorderSideType([])
    public static let top    = UIBorderSideType(rawValue: 1 << 0)
    public static let bottom = UIBorderSideType(rawValue: 1 << 1)
    public static let left   = UIBorderSideType(rawValue: 1 << 2)
    public static let right  = UIBorderSideType(rawValue: 1 << 3)

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
}
// MARK: - 这样写的话，外面可以JobsIndexPath.section 进行调用
public struct JobsIndexPath {

    public var section: Int
    public var rowOrItem: Int
}
// MARK: - 无数据占位图的类型
public struct JobsEmptyViewType: OptionSet {

    public let rawValue: UInt
    public static let none       = JobsEmptyViewType([])
    public static let label      = JobsEmptyViewType(rawValue: 1 << 0)
    public static let button     = JobsEmptyViewType(rawValue: 1 << 1)
    public static let customView = JobsEmptyViewType(rawValue: 1 << 2)

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
}
