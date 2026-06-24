//
//  JobsNetworkingPostDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import JobsNetworking
import JobsSwiftBaseDefines

final class JobsNetworkingPostDemoVC: JobsNetworkingMethodDemoVC {

    private var requestBody: [String: AnySendable] {
        [
            "pageNo": .init(1),
            "pageSize": .init(10),
            "filters": .init([
                "status": ["paid", "shipped"],
                "keyword": "demo",
                "priceRange": ["min": 100, "max": 5000]
            ]),
            "clientInfo": .init([
                "platform": "swift",
                "version": "1.0.0"
            ])
        ]
    }

    override func buildRequestPreview(triggerError: Bool) -> String {
        if triggerError {
            return "POST /api/errors/post\nbody: {\"demo\": true}"
        }

        return """
        POST /api/post/orders
        body:
        {
          "pageNo": 1,
          "pageSize": 10,
          "filters": {
            "status": ["paid", "shipped"],
            "keyword": "demo",
            "priceRange": {"min": 100, "max": 5000}
          },
          "clientInfo": {
            "platform": "swift",
            "version": "1.0.0"
          }
        }
        """
    }

    override func performRequest(triggerError: Bool) async throws {
        let data = try await service.requestData(
            method: .post,
            path: triggerError ? "/api/errors/post" : "/api/post/orders",
            body: triggerError ? ["demo": .init(true)] : requestBody,
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

        let response = service.decode(DioPOSTResponse.self, from: data)
        let records = response?.data?.records ?? []
        let render = records.enumerated().map { index, item in
            let address = "\(item.user?.address?.province ?? "")\(item.user?.address?.city ?? "")\(item.user?.address?.detail ?? "")"
            let products = (item.products ?? []).map {
                "- \($0.name ?? "--") x\($0.count ?? 0) / SKU: \($0.sku ?? "--") / ¥\($0.price ?? 0)"
            }.joined(separator: "\n")
            let tags = (item.tags ?? []).joined(separator: "、")
            return """
            [订单 \(index + 1)]
            订单号：\(item.orderNo ?? "--")
            用户：\(item.user?.name ?? "--")（\(item.user?.phone ?? "--")）
            地址：\(address)
            状态：\(item.summary?.statusText ?? "--")
            总价：¥\(item.summary?.finalAmount ?? 0)
            标签：\(tags)
            商品列表：
            \(products)
            """
        }.joined(separator: "\n\n")
        
        onMainSync { [weak self] in
            guard let self else { return }
            self.handleSuccess(render: render, raw: raw)
        }
    }
}
