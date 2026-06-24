//
//  JobsNetworkingPatchDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import JobsNetworking
import JobsSwiftBaseDefines

final class JobsNetworkingPatchDemoVC: JobsNetworkingMethodDemoVC {

    override func buildRequestPreview(triggerError: Bool) -> String {
        if triggerError {
            return "PATCH /api/errors/patch"
        }

        return """
        PATCH /api/patch/settings
        body:
        {
          "theme": "dark",
          "notifications": true,
          "fontScale": 1.1
        }
        """
    }

    override func performRequest(triggerError: Bool) async throws {
        let data = try await service.requestData(
            method: .patch,
            path: triggerError ? "/api/errors/patch" : "/api/patch/settings",
            body: triggerError ? ["broken": .init(true)] : [
                "theme": .init("dark"),
                "notifications": .init(true),
                "fontScale": .init(1.1)
            ],
            encoding: .jsonBody
        )

        let raw = service.prettyJSONString(from: data)
        if triggerError, let error = service.decode(DioErrorResponse.self, from: data) {
            let render = prettyPrint([
                "状态码：\(error.status ?? 0)",
                "错误码：\(error.errorCode ?? "--")",
                "消息：\(error.message ?? "--")"
            ])
            await MainActor.run { self.handleFailure(render + "\n\n" + raw) };return
        }

        let response = service.decode(DioPATCHResponse.self, from: data)
        let render = prettyPrint([
            "主题：\(response?.data?.settings?.theme ?? "--")",
            "通知开关：\((response?.data?.settings?.notifications ?? false) ? "true" : "false")",
            "字体缩放：\(response?.data?.settings?.fontScale ?? 0)"
        ])
        
        onMainSync { [weak self] in
            guard let self else { return }
            self.handleSuccess(render: render, raw: raw)
        }
    }
}
