//
//  JobsSwiftCommentMode.swift
//  JobsSwiftComment
//
//  Created by Jobs on 2026年7月7日，星期二.
//

import Foundation

public enum JobsSwiftCommentMode: Int, CaseIterable {
    case netEase
    case toutiao
    case custom

    public var title: String {
        switch self {
        /// 处理 .netEase 分支
        case .netEase: return "网易评论模式"
        /// 处理 .toutiao 分支
        case .toutiao: return "今日头条评论模式"
        /// 处理 .custom 分支
        case .custom: return "自定义回复模式"
        }
    }

    public var subtitle: String {
        switch self {
        /// 处理 .netEase 分支
        case .netEase: return "评论和回复在同一列表内展示，支持展开更多回复"
        /// 处理 .toutiao 分支
        case .toutiao: return "一级评论展示回复入口，点击后进入独立回复页"
        /// 处理 .custom 分支
        case .custom: return "二级缩进，三级以后显示回复对象并保持列表紧凑"
        }
    }
}

