//
//  JobsMarkdownResourceLocator.swift
//  JobsSwiftMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

final class JobsMarkdownResourceToken {}

enum JobsMarkdownResourceLocator {
    static func runtimeBundle() -> Bundle? {
        let bundleName = "JobsSwiftMarkdownResources"
        let candidates = [
            Bundle.main,
            Bundle(for: JobsMarkdownResourceToken.self)
        ]
        for candidate in candidates {
            guard let url = candidate.url(forResource: bundleName, withExtension: "bundle"),
                  let bundle = Bundle(url: url) else { continue }
            return bundle
        };return nil
    }

    static func templateURL() -> URL? {
        runtimeBundle()?.url(forResource: "index", withExtension: "html")
    }
}
