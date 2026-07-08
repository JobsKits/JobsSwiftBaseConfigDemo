//
//  JobsSwiftCommentConfig.swift
//  JobsSwiftComment
//
//  Created by Jobs on 2026年7月7日，星期二.
//

import Foundation

public typealias JobsSwiftCommentSelectionBlock = (JobsSwiftCommentModel) -> Void
public typealias JobsSwiftCommentRefreshActionBlock = (JobsSwiftCommentView) -> Void

public final class JobsSwiftCommentConfig {
    public var mode: JobsSwiftCommentMode = .netEase
    public var title: String = ""
    public var showsDevice = true
    public var showsLocation = true
    public var showsReplyEntrance = true
    public var maxVisibleChildReplyCount = 3
    public var enablesPullRefresh = true
    public var enablesLoadMore = true
    public var commentSelectedBlock: JobsSwiftCommentSelectionBlock?
    public var replySelectedBlock: JobsSwiftCommentSelectionBlock?
    public var pullRefreshBlock: JobsSwiftCommentRefreshActionBlock?
    public var loadMoreBlock: JobsSwiftCommentRefreshActionBlock?

    public init() {}

    public static var defaultConfig: JobsSwiftCommentConfig {
        let config = JobsSwiftCommentConfig()
        config.mode = .netEase
        config.title = JobsSwiftCommentMode.netEase.title
        return config
    }

    public static func title(by mode: JobsSwiftCommentMode) -> String {
        mode.title
    }

    public static func subtitle(by mode: JobsSwiftCommentMode) -> String {
        mode.subtitle
    }
}

