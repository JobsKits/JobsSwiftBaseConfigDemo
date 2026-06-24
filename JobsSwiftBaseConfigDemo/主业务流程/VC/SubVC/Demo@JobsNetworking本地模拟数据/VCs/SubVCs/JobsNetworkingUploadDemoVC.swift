//
//  JobsNetworkingUploadDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import JobsSwiftBaseDefines

final class JobsNetworkingUploadDemoVC: JobsNetworkingMethodDemoVC {

    override func buildRequestPreview(triggerError: Bool) -> String {
        triggerError
        ? "POST /api/upload/file\nform-data: {description: \"触发错误\"}"
        : "POST /api/upload/file\nform-data: {file: swift_upload_demo.txt, description: \"Swift 上传示例文件\", category: \"demo\"}"
    }

    override func performRequest(triggerError: Bool) async throws {
        let data = try await service.uploadDemo(triggerError: triggerError)
        let raw = service.prettyJSONString(from: data)

        if triggerError, let error = service.decode(DioErrorResponse.self, from: data) {
            let render = prettyPrint([
                "状态码：\(error.status ?? 0)",
                "错误码：\(error.errorCode ?? "--")",
                "消息：\(error.message ?? "--")"
            ])
            await MainActor.run { self.handleFailure(render + "\n\n" + raw) };return
        }

        let response = service.decode(DioUPLOADResponse.self, from: data)
        let render = prettyPrint([
            "文件名：\(response?.data?.fileName ?? "--")",
            "大小：\(response?.data?.size ?? 0) bytes",
            "类型：\(response?.data?.contentType ?? "--")",
            "说明：\(response?.data?.description ?? "--")",
            "分类：\(response?.data?.category ?? "--")",
            "预览：\(response?.data?.preview ?? "--")"
        ])

        onMainSync { [weak self] in
            guard let self else { return }
            self.handleSuccess(render: render, raw: raw) 
        }
    }
}
