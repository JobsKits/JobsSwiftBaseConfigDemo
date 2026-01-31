//
//  JobsDownload.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

public protocol JobsDownloadCapable: JobsAgent {
    /// 下载到本地文件（iOS12 主路径：closure API）
    @discardableResult
    func download(
        _ request: JobsDownloadRequest,
        completion: @escaping (Swift.Result<URL, JobsError>) -> Void
    ) -> JobsRequestToken
}
