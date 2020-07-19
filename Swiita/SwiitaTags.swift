//
//  SwiitaTags.swift
//  Swiita
//
//  Created by EnchantCode on 2020/07/18.
//  Copyright © 2020 EnchantCode. All rights reserved.
//

import Foundation

public extension Swiita {
    /// get tagged article.
    /// - Parameters:
    ///     - page: page(**1 origin**)
    ///     - perpage: contents count each page.
    ///     - tagID: target tag ID.
    func getTaggedArticle (
        tagID: String,
        page: Int = 1,
        perpage: Int = 20,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        let requestParams = ["page": "\(page)", "per_page": "\(perpage)"]
        
        apiRequest(apiPath: "/api/v2/tags/\(tagID)/items", requestParams: requestParams, method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// get all tags.
    /// - Parameters:
    ///     - page: page(**1 origin**)
    ///     - perpage: contents count each page.
    func getAllTags (
        page: Int = 1,
        perpage: Int = 20,
        sort: String = "count",
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        let requestParams = ["page": "\(page)", "per_page": "\(perpage)", "sort": sort]
        
        apiRequest(apiPath: "/api/v2/tags", requestParams: requestParams, method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// get tag by id.
    /// - Parameters:
    ///     - tagID: target tag id.
    func getTag (
        tagID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        
        apiRequest(apiPath: "/api/v2/tags/\(tagID)", method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// get following tags.
    /// - Parameters:
    ///     - page: page(**1 origin**)
    ///     - perpage: contents count each page.
    ///     - userID: target user id.
    func getFollowingTags (
        userID: String,
        page: Int = 1,
        perpage: Int = 20,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        let requestParams = ["page": "\(page)", "per_page": "\(perpage)"]
        
        apiRequest(apiPath: "/api/v2/users/\(userID)/following_tags", requestParams: requestParams, method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// unfollow tag.
    /// - Parameters:
    ///     - tagID: target tag ID.
    func unFollowTag (
        tagID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        
        apiRequest(apiPath: "/api/v2/tags/\(tagID)/following", method: .DELETE, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// follow tag.
    /// - Parameters:
    ///     - tagID: target tag ID.
    func followTag (
        tagID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        
        apiRequest(apiPath: "/api/v2/tags/\(tagID)/following", method: .PUT, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// check if the tag is followed.
    /// - Parameters:
    ///     - tagID: target tag ID.
    func isTagFollowed (
        tagID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        
        apiRequest(apiPath: "/api/v2/tags/\(tagID)/following", method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
}
