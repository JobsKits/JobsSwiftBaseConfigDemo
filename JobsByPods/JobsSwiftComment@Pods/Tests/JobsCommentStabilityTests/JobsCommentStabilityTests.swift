//
//  JobsCommentStabilityTests.swift
//  JobsSwiftComment
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsSwiftComment

final class JobsCommentStabilityTests: XCTestCase {

    func testModelNormalizesWhitespaceAndEmptyReplyName() {
        let model = JobsSwiftCommentModel(messageID: " id \n",
                                          nickname: " Jobs ",
                                          replyID: " ",
                                          replyUserName: "\n ",
                                          publishTime: " now ",
                                          content: " 汉字评论 \n")
        XCTAssertEqual(model.messageID, "id")
        XCTAssertEqual(model.nickname, "Jobs")
        XCTAssertEqual(model.replyID, "")
        XCTAssertNil(model.replyUserName)
        XCTAssertEqual(model.content, "汉字评论")
    }

    func testChildCommentEditsKeepValueIsolation() {
        let child = JobsSwiftCommentModel(messageID: "child",
                                          nickname: "作者",
                                          replyID: "root",
                                          publishTime: "",
                                          content: "回复")
        let original = JobsSwiftCommentModel(messageID: "root",
                                             nickname: "作者",
                                             replyID: "",
                                             publishTime: "",
                                             content: "正文",
                                             children: [child])
        var copy = original
        copy.children[0].content = "修改后的回复"
        XCTAssertEqual(original.children[0].content, "回复")
        XCTAssertNotEqual(original, copy)
    }
}
