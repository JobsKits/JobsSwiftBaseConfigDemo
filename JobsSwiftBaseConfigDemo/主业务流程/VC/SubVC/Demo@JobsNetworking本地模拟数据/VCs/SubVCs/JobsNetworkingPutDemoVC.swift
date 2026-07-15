//
//  JobsNetworkingPutDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import JobsNetworking
import JobsSwiftBaseDefines

final class JobsNetworkingPutDemoVC: JobsNetworkingMethodDemoVC {
    override func buildRequestPreview(triggerError: Bool) -> String {
        if triggerError {
            return "PUT /api/errors/put"
        };return """
        PUT /api/put/profile
        body:
        {
          "nickname": "Jobs",
          "city": "Bangkok",
          "email": "jobs@example.com"
        }
        """
    }

    override func performRequest(triggerError: Bool) async throws {
        let data = try await service.requestData(
            method: .put,
            path: triggerError ? "/api/errors/put" : "/api/put/profile",
            body: triggerError ? ["broken": .init(true)] : [
                "nickname": .init("Jobs"),
                "city": .init("Bangkok"),
                "email": .init("jobs@example.com")
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
        let response = service.decode(DioPUTResponse.self, from: data)
        let render = prettyPrint([
            "昵称：\(response?.data?.profile?.nickname ?? "--")",
            "城市：\(response?.data?.profile?.city ?? "--")",
            "邮箱：\(response?.data?.profile?.email ?? "--")"
        ])
        onMainSync { [weak self] in
            guard let self else { return }
            self.handleSuccess(render: render, raw: raw)
        }
    }
}
