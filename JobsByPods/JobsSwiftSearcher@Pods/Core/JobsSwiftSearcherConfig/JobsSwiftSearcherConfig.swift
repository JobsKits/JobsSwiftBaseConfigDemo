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
    public var showsSearchButton = true
    public var showsCancelButton = false
    public var inputOnly = false
    public var cancelButtonTitle = "取消"
    public var emptyHistoryTitle = "暂无搜索历史"
    public var emptyHistoryMessage = "输入关键词开始搜索。"
    public var noResultsTitle = "没有匹配结果"
    public var noResultsMessage = "试试其他关键词，或清空后查看搜索历史。"
    public var clearQueryTitle = "清空关键词"
    public var accessibilityIdentifierPrefix = "jobs.searcher"
    public var recommendTitle = "搜索推荐"
    public var historyTitle = "搜索历史"
    public var historyStorageKey = "JobsSwiftSearcherHistoryData"
    /// nil 保持历史全局键；传稳定账号ID后独立存储，退出登录时调用clearHistory。
    public var historyScope: String?
    public var persistsHistory = true
    /// 可注入独立 suite；默认继续使用原标准存储，不改已有历史键。
    public var historyUserDefaults: UserDefaults = .standard
    public var effectiveHistoryStorageKey: String {
        guard let scope = historyScope, !scope.isEmpty else {
            return historyStorageKey
        }
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
    public var cancelBlock: JobsSwiftSearcherVoidBlock?
    public var itemSelectedBlock: JobsSwiftSearcherTextBlock?


    @discardableResult
    public func byPlaceholder(_ value: String) -> Self {
        placeholder = value
        return self
    }

    @discardableResult
    public func bySearchButtonTitle(_ value: String) -> Self {
        searchButtonTitle = value
        return self
    }

    @discardableResult
    public func byShowsSearchButton(_ value: Bool) -> Self {
        showsSearchButton = value
        return self
    }

    @discardableResult
    public func byShowsCancelButton(_ value: Bool) -> Self {
        showsCancelButton = value
        return self
    }

    @discardableResult
    public func byInputOnly(_ value: Bool) -> Self {
        inputOnly = value
        return self
    }

    @discardableResult
    public func byCancelButtonTitle(_ value: String) -> Self {
        cancelButtonTitle = value
        return self
    }

    @discardableResult
    public func byEmptyHistoryTitle(_ value: String) -> Self {
        emptyHistoryTitle = value
        return self
    }

    @discardableResult
    public func byEmptyHistoryMessage(_ value: String) -> Self {
        emptyHistoryMessage = value
        return self
    }

    @discardableResult
    public func byNoResultsTitle(_ value: String) -> Self {
        noResultsTitle = value
        return self
    }

    @discardableResult
    public func byNoResultsMessage(_ value: String) -> Self {
        noResultsMessage = value
        return self
    }

    @discardableResult
    public func byClearQueryTitle(_ value: String) -> Self {
        clearQueryTitle = value
        return self
    }

    @discardableResult
    public func byAccessibilityIdentifierPrefix(_ value: String) -> Self {
        accessibilityIdentifierPrefix = value
        return self
    }

    @discardableResult
    public func byRecommendTitle(_ value: String) -> Self {
        recommendTitle = value
        return self
    }

    @discardableResult
    public func byHistoryTitle(_ value: String) -> Self {
        historyTitle = value
        return self
    }

    @discardableResult
    public func byHistoryStorageKey(_ value: String) -> Self {
        historyStorageKey = value
        return self
    }

    @discardableResult
    public func byHistoryScope(_ value: String?) -> Self {
        historyScope = value
        return self
    }

    @discardableResult
    public func byPersistsHistory(_ value: Bool) -> Self {
        persistsHistory = value
        return self
    }

    @discardableResult
    public func byHistoryUserDefaults(_ value: UserDefaults) -> Self {
        historyUserDefaults = value
        return self
    }

    @discardableResult
    public func byMaxHistoryCount(_ value: Int) -> Self {
        maxHistoryCount = max(1, min(value, 1_000))
        return self
    }

    @discardableResult
    public func byDismissKeyboardWhenCancel(_ value: Bool) -> Self {
        dismissKeyboardWhenCancel = value
        return self
    }

    @discardableResult
    public func bySearchTextChangedBlock(_ value: JobsSwiftSearcherTextBlock?) -> Self {
        searchTextChangedBlock = value
        return self
    }

    @discardableResult
    public func bySearchSubmittedBlock(_ value: JobsSwiftSearcherTextBlock?) -> Self {
        searchSubmittedBlock = value
        return self
    }

    @discardableResult
    public func byRecommendSelectedBlock(_ value: JobsSwiftSearcherTextBlock?) -> Self {
        recommendSelectedBlock = value
        return self
    }

    @discardableResult
    public func byItemSelectedBlock(_ value: JobsSwiftSearcherTextBlock?) -> Self {
        itemSelectedBlock = value
        return self
    }

    @discardableResult
    public func byHistoryChangedBlock(_ value: JobsSwiftSearcherHistoryBlock?) -> Self {
        historyChangedBlock = value
        return self
    }

    @discardableResult
    public func byHistoryDeleteBlock(_ value: JobsSwiftSearcherTextBlock?) -> Self {
        historyDeleteBlock = value
        return self
    }

    @discardableResult
    public func byClearHistoryBlock(_ value: JobsSwiftSearcherVoidBlock?) -> Self {
        clearHistoryBlock = value
        return self
    }

    @discardableResult
    public func byCancelBlock(_ value: JobsSwiftSearcherVoidBlock?) -> Self {
        cancelBlock = value
        return self
    }

    public init() {}

    public static var defaultConfig: JobsSwiftSearcherConfig {
        JobsSwiftSearcherConfig()
    }
}

