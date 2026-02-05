//
//  sss.swift
//  Pods
//
//  Created by Jobs on 5/2/26.
//

//
//  UIButton+StateBackgroundColor.swift
//
//  Purpose:
//  - Set UIButton background color per UIControl.State in a reliable way.
//  - Works on iOS 12/13/14 (via setBackgroundImage with solid-color image)
//  - Works on iOS 15+ even when UIButton.Configuration is used
//    (via configurationUpdateHandler -> baseBackgroundColor)
//
//  Usage:
//    let btn = UIButton(type: .system)
//      .byBackgroundColor(.red, for: .normal)
//      .byBackgroundColor(.black, for: .disabled)
//      .byBackgroundColor(.gray, for: .highlighted)
//
//    btn.isEnabled = false
//

import UIKit
import ObjectiveC.runtime

// MARK: - Public DSL

public extension UIButton {

    /// DSL: set per-state background color
    @discardableResult
    func byBackgroundColor2(_ color: UIColor?,
                           for state: UIControl.State = .normal) -> Self {
        jobs_setBackgroundColor(color, for: state)
        return self
    }

    /// Core API: set per-state background color
    func jobs_setBackgroundColor(_ color: UIColor?,
                                 for state: UIControl.State = .normal) {
        let c = color ?? .clear

        // Store mapping for iOS15+ config update handler usage
        jobs_stateBackgroundColors[state.rawValue] = c

        if #available(iOS 15.0, *) {
            jobs_installStateBgConfigHandlerIfNeeded()
            // Trigger refresh for current state
            setNeedsUpdateConfiguration()
            updateConfiguration()
            automaticallyUpdatesConfiguration = true
        } else {
            // iOS14- : backgroundColor does NOT support per-state
            // Use background image (solid color) to simulate per-state bg color.
            setBackgroundImage(.jobs_solidColor(c), for: state)
        }
    }

    /// Optional: force refresh (useful after you change isEnabled/isSelected/isHighlighted manually)
    func jobs_refreshBackgroundForCurrentState() {
        if #available(iOS 15.0, *) {
            setNeedsUpdateConfiguration()
            updateConfiguration()
        } else {
            // iOS14- uses stateful background images automatically; no-op.
        }
    }
}

// MARK: - iOS15+ configuration support

private extension UIButton {

    // Associated storage: state -> UIColor
    var jobs_stateBackgroundColors: [UInt: UIColor] {
        get {
            (objc_getAssociatedObject(self, &JobsStateBgAssocKeys.colors) as? [UInt: UIColor]) ?? [:]
        }
        set {
            objc_setAssociatedObject(self, &JobsStateBgAssocKeys.colors, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    // Associated flag: did wrap handler
    var jobs_hasInstalledStateBgHandler: Bool {
        get { (objc_getAssociatedObject(self, &JobsStateBgAssocKeys.installed) as? Bool) ?? false }
        set { objc_setAssociatedObject(self, &JobsStateBgAssocKeys.installed, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    func jobs_resolveBgColor(for state: UIControl.State) -> UIColor? {
        let d = jobs_stateBackgroundColors

        // Priority (adjust if your project needs different behavior):
        // disabled > highlighted > selected > normal
        if state.contains(.disabled), let c = d[UIControl.State.disabled.rawValue] { return c }
        if state.contains(.highlighted), let c = d[UIControl.State.highlighted.rawValue] { return c }
        if state.contains(.selected), let c = d[UIControl.State.selected.rawValue] { return c }
        return d[UIControl.State.normal.rawValue]
    }

    @available(iOS 15.0, *)
    func jobs_installStateBgConfigHandlerIfNeeded() {
        // Avoid double wrapping
        if jobs_hasInstalledStateBgHandler { return }
        jobs_hasInstalledStateBgHandler = true

        let previous = self.configurationUpdateHandler

        // Wrap existing handler (if any) to avoid breaking other config logic.
        // We call previous first, then apply our baseBackgroundColor last (wins).
        self.configurationUpdateHandler = { [weak self] btn in
            previous?(btn)
            guard let self else { return }

            var cfg = btn.configuration ?? .plain()

            if let bg = self.jobs_resolveBgColor(for: btn.state) {
                cfg.baseBackgroundColor = bg
            }

            btn.configuration = cfg
        }

        // Ensure config exists so baseBackgroundColor can take effect
        if self.configuration == nil {
            self.configuration = .plain()
        }
    }
}

private struct JobsStateBgAssocKeys {
    static var colors: UInt8 = 0
    static var installed: UInt8 = 0
}

// MARK: - Solid color image helper (iOS14- fallback)

private extension UIImage {
    static func jobs_solidColor(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { ctx in
            color.setFill()
            ctx.fill(CGRect(origin: .zero, size: size))
        }
    }
}
