//
//  JobsSwiftSearcherConfig.swift
//  JobsSwiftSearcher
//
//  Created by Jobs on 2026年7月7日，星期二.
//

import Foundation

public typealias JobsSwiftSearcherTextBlock = (String) -> Void
public typealias JobsSwiftSearcherHistoryBlock = ([String]) -> Void
public typealias JobsSwiftSearcherVoidBlock = () -> Void

public final class JobsSwiftSearcherConfig {
    public var placeholder = "请输入搜索内容"
    public var searchButtonTitle = "搜索"
    public var recommendTitle = "搜索推荐"
    public var historyTitle = "搜索历史"
    public var historyStorageKey = "JobsSwiftSearcherHistoryData"
    /// nil 保持历史全局键；传稳定账号ID后独立存储，退出登录时调用clearHistory。
    public var historyScope: String?
    public var persistsHistory = true
    public var effectiveHistoryStorageKey: String {
        guard let scope = historyScope, !scope.isEmpty else { return historyStorageKey }
        let encoded = Data(scope.utf8).base64EncodedString()
        return "\(historyStorageKey).account.\(encoded)"
    }
    public var maxHistoryCount = 20
    public var dismissKeyboardWhenCancel = true
    public var searchTextChangedBlock: JobsSwiftSearcherTextBlock?
    public var searchSubmittedBlock: JobsSwiftSearcherTextBlock?
    public var recommendSelectedBlock: JobsSwiftSearcherTextBlock?
    public var historyChangedBlock: JobsSwiftSearcherHistoryBlock?
    public var historyDeleteBlock: JobsSwiftSearcherTextBlock?
    public var clearHistoryBlock: JobsSwiftSearcherVoidBlock?

    public init() {}

    public static var defaultConfig: JobsSwiftSearcherConfig {
        JobsSwiftSearcherConfig()
    }
}

