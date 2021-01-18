//
//  SwiitaTests.swift
//  SwiitaTests
//
//  Created by EnchantCode on 2020/07/17.
//  Copyright © 2020 EnchantCode. All rights reserved.
//

import XCTest
@testable import Swiita

class SwiitaTests: XCTestCase {

    // 実行引数
    let environment = ProcessInfo.processInfo.environment

    var swiita: Swiita?

    // 初期設定
    override func setUpWithError() throws {
        try super.setUpWithError()

        // 必要な情報が渡されているかチェック
        let clientID = self.environment["QIITA_CLIENT_ID"]
        let clientSecret = self.environment["QIITA_CLIENT_SECRET"]
        let token = self.environment["QIITA_ACCESS_TOKEN"]

        guard (clientID != nil), (clientSecret != nil), (token != nil) else {
            fatalError("No environmental variables has been passed!")
        }

        guard (clientID != ""), (clientSecret != ""), (token != "") else {
            fatalError("Environmental variables had been passed, but it's empty")
        }

        // Swiitaインスタンスを生成
        print("Swiita instance prepared.")
        self.swiita = Swiita(clientid: clientID!, clientsecret: clientSecret!, apihost: nil, token: token!)
    }

    // テスト後の処理
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    /* -- APIエンドポイントの動作テスト -- */

    /// 認証済みユーザオブジェクト取得
    func testGetAuthenticatedUser() throws {
        let exp = expectation(description: "Get authenticated user")

        self.swiita?.getAuthenticatedUser(success: { (status, json) in
            // HTTPステータスコードを確認
            XCTAssert(status == .Successful, "[SwiitaTests] http status error: \(status)")

            // ユーザ名が取得できれば表示
            guard
                let userName = json["name"].string,
                let userID = json["id"].string
            else {
                XCTFail("Invalid json")
                return
            }
            print("Logged in with: \(userName) (\(userID))")

            exp.fulfill()
        }, failure: { (error) in
            XCTFail(error.localizedDescription)
            exp.fulfill()
        })

        wait(for: [exp], timeout: 5)
    }

}
