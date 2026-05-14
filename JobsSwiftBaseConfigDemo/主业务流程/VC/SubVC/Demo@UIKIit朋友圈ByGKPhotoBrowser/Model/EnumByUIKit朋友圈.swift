//
//  EnumByUIKit朋友圈.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

enum TextKitMeasure {
    static func fits(_ attr: NSAttributedString, width: CGFloat, maxLines: Int) -> Bool {
        guard width > 0, maxLines > 0 else { return true }

        let storage = NSTextStorage(attributedString: attr)
        let layout = NSLayoutManager()
        let container = NSTextContainer(size: CGSize(width: width, height: .greatestFiniteMagnitude))
        container.lineFragmentPadding = 0
        container.maximumNumberOfLines = maxLines
        container.lineBreakMode = .byWordWrapping

        layout.addTextContainer(container)
        storage.addLayoutManager(layout)

        layout.ensureLayout(for: container)

        let glyphRange = layout.glyphRange(for: container)
        return glyphRange.length == layout.numberOfGlyphs
    }
}

enum TimelineLayoutMode {
    /// ✅ 不开 estimated：走“手动高度 + 缓存”
    case noEstimated_manualHeight
    /// ✅ 开 estimated：走“自动高度 + 更准的 estimatedHeightForRowAt”
    case estimated_autoDimension
}
