//
//  JobsNetworkingGetDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import JobsNetworking
import JobsSwiftBaseDefines

final class JobsNetworkingGetDemoVC: JobsNetworkingMethodDemoVC {
    override func buildRequestPreview(triggerError: Bool) -> String {
        triggerError
        ? "GET /api/errors/get"
        : "GET /api/get/dashboard?tab=overview&client=swift-demo"
    }

    override func performRequest(triggerError: Bool) async throws {
        let data = try await service.requestData(
            method: .get,
            path: triggerError ? "/api/errors/get" : "/api/get/dashboard",
            query: triggerError ? nil : [
                "tab": .init("overview"),
                "client": .init("swift-demo")
            ],
            encoding: .urlQuery
        )
        let raw = service.prettyJSONString(from: data)
        if triggerError, let error = service.decode(DioErrorResponse.self, from: data) {
            let render = prettyPrint([
                "状态码：\(error.status ?? 0)",
                "错误码：\(error.errorCode ?? "--")",
                "消息：\(error.message ?? "--")",
                "方法：\(error.method ?? "--")",
                "路径：\(error.path ?? "--")"
            ])
            await MainActor.run { self.handleFailure(render + "\n\n" + raw) };return
        }
        let resp = service.decode(DioGETResponse.self, from: data)
        let render = prettyPrint([
            "页面标题：\(resp?.data?.pageTitle ?? "--")",
            "欢迎语：\(resp?.data?.welcomeText ?? "--")",
            "昵称：\(resp?.data?.profile?.nickname ?? "--")",
            "城市：\(resp?.data?.profile?.city ?? "--")",
            "会员等级：\(resp?.data?.profile?.membership?.level ?? "--")",
            "统计：订单 \(resp?.data?.stats?.orderCount ?? 0)，待支付 \(resp?.data?.stats?.pendingCount ?? 0)，总金额 \(resp?.data?.stats?.totalAmount ?? 0)",
            "快捷入口：\((resp?.data?.quickActions ?? []).joined(separator: "、"))"
        ])
        onMainSync { [weak self] in
            guard let self else { return }
            self.handleSuccess(render: render, raw: raw)
        }
    }
}
