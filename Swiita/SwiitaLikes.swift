//
//  SwiitaLikes.swift
//  Swiita
//
//  Created by EnchantCode on 2020/07/18.
//  Copyright © 2020 EnchantCode. All rights reserved.
//

import Foundation

public extension Swiita {
    /// add "LGTM!" to the article.
    /// - Parameters:
    ///     - itemID: target item ID.
    func likeArticle (
        itemID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        
        apiRequest(apiPath: "/api/v2/items/\(itemID)/like", method: .PUT, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// remove "LGTM!" to the article.
    /// - Parameters:
    ///     - itemID: target item ID.
    func unlikeArticle (
        itemID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        
        apiRequest(apiPath: "/api/v2/items/\(itemID)/like", method: .DELETE, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// check if the article is liked.
    /// - Parameters:
    ///     - itemID: target item ID.
    func isLiked (
        itemID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        
        apiRequest(apiPath: "/api/v2/items/\(itemID)/like", method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
    
    /// get likes each article.
    /// - Parameters:
    ///     - itemID: target item ID.
    func getLikes (
        itemID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil) {
        
        apiRequest(apiPath: "/api/v2/items/\(itemID)/likes", method: .GET, success: { success?($0, $1) }) { failure?($0) }
    }
}
