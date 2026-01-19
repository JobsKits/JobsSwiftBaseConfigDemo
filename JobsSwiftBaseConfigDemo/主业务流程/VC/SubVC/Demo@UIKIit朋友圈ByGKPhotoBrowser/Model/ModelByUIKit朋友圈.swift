//
//  ModelByUIKit朋友圈.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/20/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit

struct MomentMedia {
    var coverURL: String
    var isVideo: Bool
    var videoURL: String?
}

struct MomentComment {
    var user: String
    var text: String
}

struct MomentPost {
    var name: String
    var avatarURL: String?
    var text: String
    var richText: NSAttributedString? = nil

    var isExpanded: Bool = false
    var media: [MomentMedia] = []

    var timeText: String = "刚刚".tr
    var isLiked: Bool = false
    var likeCount: Int = 0
    var comments: [MomentComment] = []

    static func makeSample(rows: Int) -> [MomentPost] {
        var arr: [MomentPost] = []

        func avatar(_ seed: String) -> String {
            // ✅ 头像统一 picsum
            "https://picsum.photos/seed/\(seed)/80/80"
        }

        arr.append(MomentPost(
            name: "User 1",
            avatarURL: avatar("avatar_1"),
            text: "单视频动态：更像朋友圈的视频预览。",
            richText: nil,
            isExpanded: false,
            media: [
                MomentMedia(
                    coverURL: "https://picsum.photos/1200/800?random=601",
                    isVideo: true,
                    videoURL: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
                )
            ],
            timeText: "2分钟前",
            isLiked: true,
            likeCount: 12,
            comments: [
                .init(user: "Alice", text: "拍得真不错"),
                .init(user: "Bob", text: "这个色调我喜欢")
            ]
        ))

        arr.append(MomentPost(
            name: "User 2",
            avatarURL: avatar("avatar_2"),
            text: "普通图文动态 #2：这里是文字内容，支持展开/收起。这是一段更长的文本，用于触发“全文”。这是一段更长的文本，用于触发“全文”。这是一段更长的文本，用于触发“全文”。",
            richText: nil,
            isExpanded: false,
            media: (1...9).map {
                MomentMedia(coverURL: "https://picsum.photos/800/800?random=\(100 + $0)", isVideo: false, videoURL: nil)
            },
            timeText: "10分钟前",
            isLiked: false,
            likeCount: 3,
            comments: [.init(user: "Cindy", text: "哈哈哈")]
        ))

        arr.append(MomentPost(
            name: "User 3",
            avatarURL: avatar("avatar_3"),
            text: "我这里夹带一个视频，还混了两张图。",
            richText: nil,
            isExpanded: false,
            media: [
                MomentMedia(
                    coverURL: "https://picsum.photos/800/800?random=501",
                    isVideo: true,
                    videoURL: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
                ),
                MomentMedia(coverURL: "https://picsum.photos/800/800?random=502", isVideo: false, videoURL: nil),
                MomentMedia(coverURL: "https://picsum.photos/800/800?random=503", isVideo: false, videoURL: nil)
            ],
            timeText: "1小时前",
            isLiked: false,
            likeCount: 0,
            comments: []
        ))

        if rows <= arr.count { return Array(arr.prefix(rows)) }

        for i in (arr.count + 1)...rows {
            arr.append(MomentPost(
                name: "User \(i)",
                avatarURL: avatar("avatar_\(i)"),
                text: "普通图文动态 #\(i)：这里是文字内容，支持展开/收起。\(i % 2 == 0 ? " 这是一段更长的文本，用于触发“全文”。这是一段更长的文本，用于触发“全文”。这是一段更长的文本，用于触发“全文”。" : "")",
                richText: nil,
                isExpanded: false,
                media: (1...min(6, (i % 9) + 1)).map { j in
                    MomentMedia(coverURL: "https://picsum.photos/800/800?random=\(700 + i * 10 + j)", isVideo: false, videoURL: nil)
                },
                timeText: "\(i)小时前",
                isLiked: i % 3 == 0,
                likeCount: i % 5,
                comments: i % 4 == 0 ? [.init(user: "Tom", text: "顶一下")] : []
            ))
        };return arr
    }
}
