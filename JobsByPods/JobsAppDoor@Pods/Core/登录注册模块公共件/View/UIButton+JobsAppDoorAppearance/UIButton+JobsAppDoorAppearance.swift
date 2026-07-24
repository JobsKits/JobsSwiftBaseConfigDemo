//
//  UIButton+JobsAppDoorAppearance.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import UIKit
import JobsSwiftDSL

extension UIButton {
    /// JobsAppDoor 对外可复用的按钮配置入口。
    @discardableResult
    public func byJobsAppDoorAppearance(
        title: String? = nil,
        titleColor: UIColor? = nil,
        font: UIFont? = nil,
        backgroundColor: UIColor,
        cornerRadius: CGFloat,
        borderColor: UIColor? = nil,
        borderWidth: CGFloat = 0
    ) -> Self {
        jobsAppDoorAppearance(
            title: title,
            titleColor: titleColor,
            font: font,
            backgroundColor: backgroundColor,
            cornerRadius: cornerRadius,
            borderColor: borderColor,
            borderWidth: borderWidth
        )
    }

    /// 统一收口新旧 UIButton 背景、圆角与字体管线。
    @discardableResult
    func jobsAppDoorAppearance(
        title: String? = nil,
        titleColor: UIColor? = nil,
        font: UIFont? = nil,
        backgroundColor: UIColor,
        cornerRadius: CGFloat,
        borderColor: UIColor? = nil,
        borderWidth: CGFloat = 0
    ) -> Self {
        if let title {
            byTitle(title, for: .normal)
        }
        if let titleColor {
            byTitleColor(titleColor, for: .normal)
        }
        if let font {
            byTitleFont(font)
        }
        if #available(iOS 15.0, *) {
            var buttonConfiguration = configuration ?? .plain()
            var backgroundConfiguration = buttonConfiguration.background
            backgroundConfiguration.backgroundColor = backgroundColor
            backgroundConfiguration.cornerRadius = cornerRadius
            backgroundConfiguration.strokeColor = borderColor
            backgroundConfiguration.strokeWidth = borderWidth
            buttonConfiguration.background = backgroundConfiguration
            buttonConfiguration.title = title ?? buttonConfiguration.title
            buttonConfiguration.baseForegroundColor = titleColor ?? buttonConfiguration.baseForegroundColor
            byConfiguration(buttonConfiguration)
        } else {
            byBackgroundColor(backgroundColor, for: .normal)
            byCornerRadius(cornerRadius)
            if let borderColor {
                byBorderColor(borderColor)
            }
            byBorderWidth(borderWidth)
            byClipsToBounds(cornerRadius > 0)
        };return self
    }

    /// 登录辅助操作保持单行，配置式按钮与旧标题管线同步处理。
    @discardableResult
    func jobsAppDoorSingleLineTitle(minimumScaleFactor: CGFloat = 0.65) -> Self {
        titleLabel?
            .byNumberOfLines(1)
            .byLineBreakMode(.byClipping)
            .byAdjustsFontSizeToFitWidth(true)
            .byMinimumScaleFactor(minimumScaleFactor)
        if #available(iOS 15.0, *) {
            var buttonConfiguration = configuration ?? .plain()
            buttonConfiguration.titleLineBreakMode = .byClipping
            byConfiguration(buttonConfiguration)
        };return self
    }
}
