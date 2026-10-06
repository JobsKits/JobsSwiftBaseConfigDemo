//
//  JobsLocalNotificationError.swift
//  JobsLocalNotification
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

public enum JobsLocalNotificationError: Error, LocalizedError {
    case emptyIdentifier
    case invalidInterval

    public var errorDescription: String? {
        switch self {
        case .emptyIdentifier:
            return "通知标识不能为空。"
        case .invalidInterval:
            return "通知间隔必须为有限正数；重复通知至少间隔 60 秒。"
        }
    }
}
