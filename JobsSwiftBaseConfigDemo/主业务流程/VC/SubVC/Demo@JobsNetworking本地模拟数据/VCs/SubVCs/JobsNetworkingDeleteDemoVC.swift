//
//  JobsNetworkingDeleteDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import JobsNetworking
import JobsSwiftBaseDefines

final class JobsNetworkingDeleteDemoVC: JobsNetworkingMethodDemoVC {

    override func buildRequestPreview(triggerError: Bool) -> String {
        triggerError
        ? "DELETE /api/errors/delete"
        : "DELETE /api/delete/order/ORD-20260324-0001"
    }

    override func performRequest(triggerError: Bool) async throws {
        let data = try await service.requestData(
            method: .delete,
            path: triggerError ? "/api/errors/delete" : "/api/delete/order/ORD-20260324-0001",
            encoding: .urlQuery
        )

        let raw = service.prettyJSONString(from: data)
        if triggerError, let error = service.decode(DioErrorResponse.self, from: data) {
            let render = prettyPrint([
                "状态码：\(error.status ?? 0)",
                "错误码：\(error.errorCode ?? "--")",
                "消息：\(error.message ?? "--")"
            ])
            await MainActor.run { self.handleFailure(render + "\n\n" + raw) }
            return
        }

        let response = service.decode(DioDELETEResponse.self, from: data)
        let render = prettyPrint([
            "已删除订单：\(response?.data?.deletedOrderId ?? "--")",
            "删除结果：\((response?.data?.deleted ?? false) ? "true" : "false")"
        ])
        
        onMainSync { [weak self] in
            guard let self else { return }
            self.handleSuccess(render: render, raw: raw)
        }
    }
}
