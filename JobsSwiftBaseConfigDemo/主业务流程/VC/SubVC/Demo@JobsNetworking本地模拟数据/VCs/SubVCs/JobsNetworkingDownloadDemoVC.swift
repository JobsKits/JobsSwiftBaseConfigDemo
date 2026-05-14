//
//  JobsNetworkingDownloadDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import JobsSwiftBaseDefines

final class JobsNetworkingDownloadDemoVC: JobsNetworkingMethodDemoVC {

    override func buildRequestPreview(triggerError: Bool) -> String {
        triggerError
        ? "GET /api/download/file?fileName=not-found.txt\nresponseType: file"
        : "GET /api/download/file?fileName=download-demo.txt\nresponseType: file"
    }

    override func performRequest(triggerError: Bool) async throws {
        do {
            let renderData = try await service.downloadDemo(fileName: triggerError ? "not-found.txt" : "download-demo.txt")
            let render = prettyPrint([
                "文件路径：\(renderData.fileURL.path)",
                "文件大小：\(renderData.fileSize) bytes",
                "content-type：\(renderData.mimeType ?? "--")",
                "content-disposition：\(renderData.contentDisposition ?? "--")",
                "内容预览：",
                renderData.content
            ])
            onMainSync { [weak self] in
                guard let self else { return }
                self.handleSuccess(render: render, raw: render)
            }
        } catch {
            onMainSync { [weak self] in
                guard let self else { return }
                self.handleFailure("DOWNLOAD 请求失败：\(error.localizedDescription)")
            }
        }
    }
}
