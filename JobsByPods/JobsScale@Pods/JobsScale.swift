//
//  JobsScale.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 9/22/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(JobsGetWindow)
import JobsGetWindow
#endif

@inline(__always)
public func ScreenWidth(_ rate:CGFloat = 1) -> CGFloat {
    Screen.width * rate
}

@inline(__always)
public func ScreenHeight(_ rate:CGFloat = 1) -> CGFloat {
    Screen.height * rate
}
// MARK: - 核心比例器
public enum JobsScale {
    private static var designW: CGFloat = 390
    private static var designH: CGFloat = 843
    /// 注意：Safe Area 是“布局概念”，不适合作为全局比例尺的输入。
    /// 这里保留开关仅做兼容；当无法可靠获取主 window 时会自动回退到 Screen.size。
    private static var useSafeArea: Bool = false

    public static func setup(designWidth: CGFloat,
                             designHeight: CGFloat,
                             useSafeArea: Bool = false) {
        self.designW = designWidth
        self.designH = designHeight
        self.useSafeArea = useSafeArea
    }
    /// 用于计算缩放比例的“屏幕尺寸”：
    /// - 默认使用 UIScreen（稳定，不会被 overlay/keyWindow 切换污染）
    /// - 若启用 useSafeArea，则尝试从“主界面 normal window”扣除 safeAreaInsets；失败则回退 UIScreen
    public static var screenSize: CGSize {
        let base = Screen.size
        guard useSafeArea else { return base }
        // 尽量取到“主界面 window”，避免 toast/HUD/调试浮层 window 抢 keyWindow 导致比例跳变
        if let window = UIApplication.jobsKeyWindow(preferMainScreen: true),
           window.windowLevel == .normal,
           !window.isHidden,
           window.alpha > 0.01,
           window.bounds.size != .zero {

            let insets = window.safeAreaInsets
            let w = max(0, window.bounds.width - (insets.left + insets.right))
            let h = max(0, window.bounds.height - (insets.top + insets.bottom))

            // 极端情况（比如 safeArea 扣完变 0）直接回退
            if w > 0, h > 0 {
                return CGSize(width: w, height: h)
            }
        }

        return base
    }

    public static var x: CGFloat { screenSize.width / designW }
    public static var y: CGFloat { screenSize.height / designH }
}

public extension BinaryInteger {
    var w: CGFloat { CGFloat(self) * JobsScale.x }
    var h: CGFloat { CGFloat(self) * JobsScale.y }
    var fz: CGFloat { CGFloat(self) * JobsScale.x }   // 字体缩放，默认跟随 X
}

public extension BinaryFloatingPoint {
    var w: CGFloat { CGFloat(self) * JobsScale.x }
    var h: CGFloat { CGFloat(self) * JobsScale.y }
    var fz: CGFloat { CGFloat(self) * JobsScale.x }
}
// MARK: - 屏幕宽高（兼容设备横竖屏）
public enum Screen {
    /// 当前界面方向（兼容 iOS 12-）
    private static var orientation: UIInterfaceOrientation {
        if #available(iOS 13.0, *) {
            return (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
                .interfaceOrientation ?? .unknown
        } else {
            // iOS 12-：虽然 deprecated，但用于兼容是最稳的兜底
            return UIApplication.shared.statusBarOrientation
        }
    }
    /// 屏幕尺寸（以点为单位，已按当前横竖屏纠正宽高）
    public static var size: CGSize {
        let s = UIScreen.main.bounds.size   // iOS 8+ 始终是竖屏坐标
        let w = s.width, h = s.height
        switch orientation {
        case .landscapeLeft, .landscapeRight:
            return CGSize(width: max(w, h), height: min(w, h))
        case .portrait, .portraitUpsideDown:
            return CGSize(width: min(w, h), height: max(w, h))
        default:
            return s
        }
    }

    public static var width: CGFloat  { size.width }
    public static var height: CGFloat { size.height }
}
