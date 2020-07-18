//
//  SwiitaTag.swift
//  Swiita
//
//  Created by EnchantCode on 2020/07/18.
//  Copyright © 2020 EnchantCode. All rights reserved.
//

import Foundation

public extension Swiita {
    public struct ArticleTag: Codable {
        let name: String
        let versions: [String]
        
        /*
         example:
         
         "tags": [
           {
             "name": "Ruby",
             "versions": [
               "0.0.1"
             ]
           }
         ]
         */
    }
}
