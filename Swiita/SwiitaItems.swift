//
//  SwiitaItems.swift
//  Swiita
//
//  Created by EnchantCode on 2020/07/18.
//  Copyright © 2020 EnchantCode. All rights reserved.
//

import Foundation

public extension Swiita {

    /// get my articles.
    /// - Parameters:
    ///     - page: page(**1 origin**)
    ///     - perpage: contents count each page.
    func getMyArticles (
        page: Int = 1,
        perpage: Int = 20,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        let requestParams = ["page": "\(page)", "per_page": "\(perpage)"]

        apiRequest(apiPath: "/api/v2/authenticated_user/items", requestParams: requestParams, method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }

    /// search articles by query.
    /// - Parameters:
    ///     - page: page(**1 origin**)
    ///     - perpage: contents count each page.
    ///     - query: search query
    func searchArticle (
        query: String,
        page: Int = 1,
        perpage: Int = 20,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        let requestParams = ["page": "\(page)", "per_page": "\(perpage)", "query": "\(query)"]

        apiRequest(apiPath: "/api/v2/items", requestParams: requestParams, method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }

    /// create and post article.
    /// - Parameters:
    ///     - article: QiitaArticle struct.
    func createArticle (
        article: QiitaArticle,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {

        apiRequest(apiPath: "/api/v2/items", requestBodyStruct: article, method: .POST, success: { success?($0, $1) }) { failure?($0) }
    }

    /// get article.
    /// - Parameters:
    ///     - itemID: target article ID.
    func getArticle (
        itemID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {

        apiRequest(apiPath: "/api/v2/items/\(itemID)", method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }

    /// remove article.
    /// - Parameters:
    ///     - itemID: target article ID.
    func removeArticle (
        itemID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {

        apiRequest(apiPath: "/api/v2/items/\(itemID)", method: .DELETE, success: { success?($0, $1) }) { failure?($0) }
    }

    /// update article.
    /// - Parameters:
    ///     - itemID: target artocle ID.
    ///     - newArticle: updated QiitaArticle.
    func updateArticle (
        itemID: String,
        newArticle: QiitaArticle,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {

        apiRequest(apiPath: "/api/v2/items/\(itemID)", method: .PATCH, success: { success?($0, $1) }) { failure?($0) }
    }

    /// get the user-posted articles.
    /// - Parameters:
    ///     - page: page(**1 origin**)
    ///     - perpage: contents count each page.
    ///     - userID: target user id.
    func getUserArticles (
        userID: String,
        page: Int = 1,
        perpage: Int = 20,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        let requestParams = ["page": "\(page)", "per_page": "\(perpage)"]

        apiRequest(apiPath: "/api/v2/users/\(userID)/items", requestParams: requestParams, method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }

    /// get user-stocked articles.
    /// - Parameters:
    ///     - userID: target user ID.
    func getUserStockedArticles (
        userID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {

        apiRequest(apiPath: "/api/v2/users/\(userID)/stocks", method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
}
