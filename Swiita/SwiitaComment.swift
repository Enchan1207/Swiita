//
//  SwiitaComment.swift - コメント
//  Swiita
//
//  Created by EnchantCode on 2020/07/17.
//  Copyright © 2020 EnchantCode. All rights reserved.
//

import Foundation

public extension Swiita {

    /// get comment.
    /// - Parameters:
    ///     - commentID: target comment ID.
    func getComment (
        commentID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {

        apiRequest(apiPath: "/api/v2/comments/\(commentID)", method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }

    /// delete comment.
    /// - Parameters:
    ///     - commentID: target comment ID.
    func removeComment (
        commentID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {

        apiRequest(apiPath: "/api/v2/comments/\(commentID)", method: .DELETE, success: { success?($0, $1) }) { failure?($0) }
    }

    /// update comment.
    /// - Parameters:
    ///     - commentID: target comment ID.
    ///     - content: updated comment content.
    func updateComment (
        commentID: String,
        content: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        let commentBody = "{ \"body\": \"\(content)\"}"
        apiRequest(apiPath: "/api/v2/comments/\(commentID)", requestBody: commentBody, method: .PATCH, success: { success?($0, $1) }) { failure?($0) }
    }

    /// get comment posted the article.
    /// - Parameters:
    ///     - itemID: target article ID.
    func getPostedComment (
        itemID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {

        apiRequest(apiPath: "/api/v2/items/\(itemID)/comments", method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }

    /// post comment to the article.
    /// - Parameters:
    ///     - itemID: target article ID.
    ///     - content: post comment content.
    func postComment (
        itemID: String,
        content: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        let commentBody = "{ \"body\": \"\(content)\"}"
        apiRequest(apiPath: "/api/v2/items/\(itemID)/comments", requestBody: commentBody, method: .POST, success: { success?($0, $1) }) { failure?($0) }
    }
}
