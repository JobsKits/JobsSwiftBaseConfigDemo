//
//  MethodDemoItem.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

struct MethodDemoItem: Codable {
    let title: String
    let subTitle: String
    let methodType: MethodType
    let path: String
}

struct DioCatalogData: Codable {
    let title: String?
    let baseUrl: String?
    let items: [MethodDemoItem]
}

struct DioCatalogResponse: Codable {
    let code: Int?
    let message: String?
    let data: DioCatalogData?
}

struct DioErrorResponse: Codable {
    let status: Int?
    let errorCode: String?
    let message: String?
    let method: String?
    let path: String?
    let timestamp: String?
}

struct DioGETResponse: Codable {
    let code: Int?
    let message: String?
    let data: DioGETData?
}

struct DioGETData: Codable {
    let pageTitle: String?
    let welcomeText: String?
    let profile: DioProfile?
    let stats: DioDashboardStats?
    let quickActions: [String]?
}

struct DioProfile: Codable {
    let nickname: String?
    let city: String?
    let email: String?
    let membership: DioMembership?
}

struct DioMembership: Codable {
    let level: String?
}

struct DioDashboardStats: Codable {
    let orderCount: Int?
    let pendingCount: Int?
    let totalAmount: Int?
}

struct DioPOSTResponse: Codable {
    let code: Int?
    let message: String?
    let data: DioOrdersData?
}

struct DioOrdersData: Codable {
    let pageNo: Int?
    let pageSize: Int?
    let records: [DioOrderRecord]?
}

struct DioOrderRecord: Codable {
    let orderNo: String?
    let user: DioOrderUser?
    let summary: DioOrderSummary?
    let products: [DioOrderProduct]?
    let tags: [String]?
}

struct DioOrderUser: Codable {
    let name: String?
    let phone: String?
    let address: DioOrderAddress?
}

struct DioOrderAddress: Codable {
    let province: String?
    let city: String?
    let detail: String?
}

struct DioOrderSummary: Codable {
    let statusText: String?
    let finalAmount: Int?
}

struct DioOrderProduct: Codable {
    let name: String?
    let count: Int?
    let sku: String?
    let price: Int?
}

struct DioPUTResponse: Codable {
    let code: Int?
    let message: String?
    let data: DioPUTData?
}

struct DioPUTData: Codable {
    let profile: DioProfile?
}

struct DioPATCHResponse: Codable {
    let code: Int?
    let message: String?
    let data: DioPATCHData?
}

struct DioPATCHData: Codable {
    let settings: DioSettings?
}

struct DioSettings: Codable {
    let theme: String?
    let notifications: Bool?
    let fontScale: Double?
}

struct DioDELETEResponse: Codable {
    let code: Int?
    let message: String?
    let data: DioDeleteData?
}

struct DioDeleteData: Codable {
    let deletedOrderId: String?
    let deleted: Bool?
}

struct DioUPLOADResponse: Codable {
    let code: Int?
    let message: String?
    let data: DioUploadData?
}

struct DioUploadData: Codable {
    let fileName: String?
    let size: Int?
    let description: String?
    let category: String?
    let contentType: String?
    let preview: String?
}

struct DioDownloadRenderData {
    let fileURL: URL
    let content: String
    let fileSize: Int
    let mimeType: String?
    let contentDisposition: String?
}
