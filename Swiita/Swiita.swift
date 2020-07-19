//
//  Swiita.swift
//  Swiita
//
//  Created by EnchantCode on 2020/07/17.
//  Copyright © 2020 EnchantCode. All rights reserved.
//

import Foundation
import SafariServices

public class Swiita {
    public typealias SuccessCallback = (_ statusCode: HTTPStatusType, _ response: JSONObject) -> Void
    public typealias FailCallback = (_ error: Error) -> Void
    
    internal let clientid: String
    internal let clientsecret: String
    internal let apihost: URL
    internal let token: String?
    
    internal var state: String?
    internal var safariViewController: SFSafariViewController!
    internal var notifyProtocol: NSObjectProtocol?
    
    /// Generate Instance.
    /// - Parameters:
    ///     - clientid: Qiita API client ID
    ///     - clientsecret: Qiita API client secret
    ///     - apihost: Qiita API hostname.
    ///     - token: Access token string
    public init(clientid: String, clientsecret: String, apihost: URL? = nil, token: String? = nil) {
        self.clientid = clientid
        self.clientsecret = clientsecret
        self.apihost = apihost ?? URL(string: "https://qiita.com")!
        self.token = token
    }
    
    deinit {
        // 認証コールバック用のオブザーバを消す
        if let notifyProtocol = self.notifyProtocol {
            NotificationCenter.default.removeObserver(notifyProtocol)
        }
    }
}
