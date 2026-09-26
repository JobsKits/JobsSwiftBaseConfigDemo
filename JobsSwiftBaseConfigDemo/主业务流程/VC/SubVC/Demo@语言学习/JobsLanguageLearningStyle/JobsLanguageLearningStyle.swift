//
//  JobsLanguageLearningStyle.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年9月25日，星期五.
//

import UIKit
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines

@MainActor
enum JobsLanguageLearningStyle {
    static func button(_ title: String, size: CGFloat = 16) -> UIButton {
        let button = UIButton.sys()
            .byConfiguration(UIButton.Configuration.plain())
            .byTitle(title)
            .byTitleFont(JobsFont.systemFont(ofSize: size, weight: .semibold))
        paint(button, selected: false)
        return button
    }

    static func bindText(_ label: UILabel, key: JobsThemeColorKey) {
        JobsThemeCenter.shared.bind(label, slot: "JobsLanguageLearningStyle.text") { object, center in
            guard let label = object as? UILabel else { return }
            label.byTextColor(concreteColor(center.resolvedColor(key)))
        }
    }

    private static func concreteColor(_ color: UIColor) -> UIColor {
        var red: CGFloat = 1, green: CGFloat = 1, blue: CGFloat = 1, alpha: CGFloat = 1
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return UIColor(r: red * 255, g: green * 255, b: blue * 255, a: alpha)
    }

    static func paint(_ button: UIButton, selected: Bool, uncommon: Bool = false) {
        // Configuration 保存具体颜色；同一绑定槽随点读状态更新，切换主题时重新取色。
        JobsThemeCenter.shared.bind(button, slot: "JobsLanguageLearningStyle.appearance") { object, center in
            guard let button = object as? UIButton else { return }
            let resolvedForeground = selected ? JobsCor.white : center.resolvedColor(.textPrimary)
            // 使用具体色值，避免共享 UIColor 的主题标记覆盖当前状态。
            let foreground = concreteColor(resolvedForeground)
            let background = selected ? JobsCor.systemBlue : center.resolvedColor(
                uncommon ? .backgroundGroupedTertiary : .backgroundGroupedSecondary)
            button
                .byConfiguration((button.configuration ?? .plain())
                    .byBackground(UIBackgroundConfiguration.clear()
                        .byBackgroundColor(background)
                        .byCornerRadius(12)))
                .byTitleColor(foreground)
        }
    }
}
