//
//  JobsDownload.swift
//  JobsNetworking
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

public protocol JobsDownloadCapable: JobsAgent {
    @discardableResult
    func download(
        _ request: JobsDownloadRequest,
        completion: @escaping (Result<URL, JobsError>) -> Void
    ) -> JobsRequestToken
}
