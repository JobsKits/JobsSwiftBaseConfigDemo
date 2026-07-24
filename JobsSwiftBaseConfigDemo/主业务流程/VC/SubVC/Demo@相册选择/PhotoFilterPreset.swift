//
//  PhotoFilterPreset.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月22日，星期三.
//

enum PhotoFilterPreset: Int, CaseIterable, Sendable {
    case original
    case noir
    case chrome
    case sepia
    case vivid
    case comic

    var title: String {
        switch self {
        /// 处理 .original 分支
        case .original: return "原图"
        /// 处理 .noir 分支
        case .noir: return "黑白"
        /// 处理 .chrome 分支
        case .chrome: return "铬黄"
        /// 处理 .sepia 分支
        case .sepia: return "怀旧"
        /// 处理 .vivid 分支
        case .vivid: return "鲜艳"
        /// 处理 .comic 分支
        case .comic: return "漫画"
        }
    }
}
