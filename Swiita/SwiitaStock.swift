//
//  SwiitaStock.swift
//  Swiita
//
//  Created by EnchantCode on 2020/07/18.
//  Copyright © 2020 EnchantCode. All rights reserved.
//

import Foundation

public extension Swiita {
    
    /// stock article.
    /// - Parameters:
    ///     - itemID: target article ID.
    func addStock (
        itemID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil){
        
        apiRequest(apiPath: "/api/v2/items/\(itemID)/stock", method: .GET, success: { success?($0, $1)}) {failure?($0)}
    }
    
    /// remove stocked article.
    /// - Parameters:
    ///     - itemID: target article ID.
    func removeStock (
        itemID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil){
        
        apiRequest(apiPath: "/api/v2/items/\(itemID)/stock", method: .DELETE, success: { success?($0, $1)}) {failure?($0)}
    }
    
    /// check if the article is stocked.
    /// - Parameters:
    ///     - itemID: target article ID.
    func isStocked (
        itemID: String,
        success: SuccessCallback? = nil,
        failure: FailCallback? = nil){
        
        apiRequest(apiPath: "/api/v2/items/\(itemID)/stock", method: .GET, success: { success?($0, $1)}) {failure?($0)}
    }
}
