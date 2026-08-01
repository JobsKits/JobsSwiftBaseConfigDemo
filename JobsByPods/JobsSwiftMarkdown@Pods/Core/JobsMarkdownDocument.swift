//
//  JobsMarkdownDocument.swift
//  JobsSwiftMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

public struct JobsMarkdownDocument: Hashable, Identifiable {
    public let id: String
    public let title: String
    public let relativePath: String
    public let fileURL: URL
    public let contentRootURL: URL

    public init(
        id: String,
        title: String,
        relativePath: String,
        fileURL: URL,
        contentRootURL: URL
    ) {
        self.id = id
        self.title = title
        self.relativePath = relativePath
        self.fileURL = fileURL
        self.contentRootURL = contentRootURL
    }
}
