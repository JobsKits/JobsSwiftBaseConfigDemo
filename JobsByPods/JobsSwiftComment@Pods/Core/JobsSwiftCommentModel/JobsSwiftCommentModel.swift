//
//  JobsSwiftCommentModel.swift
//  JobsSwiftComment
//
//  Created by Jobs on 2026年7月7日，星期二.
//

import Foundation

public struct JobsSwiftCommentModel: Equatable {
    public var messageID: String
    public var userAvatar: String
    public var nickname: String
    public var replyID: String
    public var replyUserName: String?
    public var publishTime: String
    public var content: String
    public var device: String
    public var location: String
    public var children: [JobsSwiftCommentModel]

    public init(messageID: String,
                userAvatar: String = "",
                nickname: String,
                replyID: String,
                replyUserName: String? = nil,
                publishTime: String,
                content: String,
                device: String = "",
                location: String = "",
                children: [JobsSwiftCommentModel] = []) {
        self.messageID = Self.normalized(messageID)
        self.userAvatar = Self.normalized(userAvatar)
        self.nickname = Self.normalized(nickname)
        self.replyID = Self.normalized(replyID)
        self.replyUserName = Self.normalizedOptional(replyUserName)
        self.publishTime = Self.normalized(publishTime)
        self.content = Self.normalized(content)
        self.device = Self.normalized(device)
        self.location = Self.normalized(location)
        self.children = children
    }

    public static func comment(messageID: String,
                               userAvatar: String = "",
                               nickname: String,
                               replyID: String,
                               replyUserName: String? = nil,
                               publishTime: String,
                               content: String,
                               device: String = "",
                               location: String = "",
                               children: [JobsSwiftCommentModel] = []) -> JobsSwiftCommentModel {
        JobsSwiftCommentModel(
            messageID: messageID,
            userAvatar: userAvatar,
            nickname: nickname,
            replyID: replyID,
            replyUserName: replyUserName,
            publishTime: publishTime,
            content: content,
            device: device,
            location: location,
            children: children
        )
    }
}

private extension JobsSwiftCommentModel {

    static func normalized(_ value: String) -> String {
        value.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    static func normalizedOptional(_ value: String?) -> String? {
        guard let text = value?.trimmingCharacters(in: .whitespacesAndNewlines),
              !text.isEmpty else { return nil };return text
    }
}

