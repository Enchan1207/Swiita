//
//  SwiitaUser.swift - ユーザ
//  Swiita
//
//  Created by EnchantCode on 2020/07/18.
//  Copyright © 2020 EnchantCode. All rights reserved.
//

import Foundation

public extension Swiita {
    /// get users who stocked the article.
    /// - Parameters:
    ///     - itemID: target article ID
    func getStockedUser (
        itemID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        
        apiRequest(apiPath: "/api/v2/items/\(itemID)/stockers", method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// Get all users.
    /// - Parameters:
    ///     - page: page(**1 origin**)
    ///     - perpage: contents count each page.
    func getAllUsers (
        page: Int = 1,
        perpage: Int = 20,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        let requestParams = ["page": "\(page)", "per_page": "\(perpage)"]
        
        apiRequest(apiPath: "/api/v2/users", requestParams: requestParams, method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// Get user.
    /// - Parameters:
    ///     - userID: user ID.
    func getUser (
        userID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        
        apiRequest(apiPath: "/api/v2/users/\(userID)", method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// get following users.
    /// - Parameters:
    ///     - userID: target user id.
    func getFollowees (
        userID: String,
        page: Int = 1,
        perpage: Int = 20,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        let requestParams = ["page": "\(page)", "per_page": "\(perpage)"]
        
        apiRequest(apiPath: "/api/v2/users/\(userID)/followees", requestParams: requestParams, method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// get follower users.
    /// - Parameters:
    ///     - userID: target user id.
    func getFollowers (
        userID: String,
        page: Int = 1,
        perpage: Int = 20,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        let requestParams = ["page": "\(page)", "per_page": "\(perpage)"]
        
        apiRequest(apiPath: "/api/v2/users/\(userID)/followers", requestParams: requestParams, method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// unfollow user.
    /// - Parameters:
    ///     - userID: target user id.
    func unFollowUser (
        userID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        
        apiRequest(apiPath: "/api/v2/users/\(userID)/following", method: .DELETE, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// check if the user follow me.
    /// - Parameters:
    ///     - userID: target user id.
    func isFollowed (
        userID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        
        apiRequest(apiPath: "/api/v2/users/\(userID)/following", method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// follow user.
    /// - Parameters:
    ///     - userID: target user id.
    func followUser (
        userID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        
        apiRequest(apiPath: "/api/v2/users/\(userID)/following", method: .PUT, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// get authenticated user(myself).
    func getAuthenticatedUser (
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        
        apiRequest(apiPath: "/api/v2/authenticated_user", method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
}
