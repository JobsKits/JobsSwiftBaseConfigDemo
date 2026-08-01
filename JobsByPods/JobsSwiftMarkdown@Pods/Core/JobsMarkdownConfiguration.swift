//
//  JobsMarkdownConfiguration.swift
//  JobsSwiftMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

public enum JobsMarkdownAppearance: String, CaseIterable {
    case automatic
    case light
    case dark
}

public struct JobsMarkdownConfiguration {
    public var appearance: JobsMarkdownAppearance
    public var fontScale: Double
    public var showsTableOfContents: Bool
    public var showsCodeCopyButton: Bool
    public var rendersMermaid: Bool
    public var rendersMath: Bool
    public var sanitizesHTML: Bool
    public var allowsRemoteContent: Bool
    public var customCSS: String

    public init(
        appearance: JobsMarkdownAppearance = .automatic,
        fontScale: Double = 1,
        showsTableOfContents: Bool = true,
        showsCodeCopyButton: Bool = true,
        rendersMermaid: Bool = true,
        rendersMath: Bool = true,
        sanitizesHTML: Bool = true,
        allowsRemoteContent: Bool = true,
        customCSS: String = ""
    ) {
        self.appearance = appearance
        self.fontScale = min(max(fontScale, 0.75), 2)
        self.showsTableOfContents = showsTableOfContents
        self.showsCodeCopyButton = showsCodeCopyButton
        self.rendersMermaid = rendersMermaid
        self.rendersMath = rendersMath
        self.sanitizesHTML = sanitizesHTML
        self.allowsRemoteContent = allowsRemoteContent
        self.customCSS = customCSS
    }
}
