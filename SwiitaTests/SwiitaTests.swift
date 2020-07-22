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
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // QiitaAPIの各エンドポイントをテストする
    func testQiitaAPIs() throws {
        // Swiitaインスタンス初期化に必要な情報が渡されているか?
        let clientID = self.environment["QIITA_CLIENT_ID"] ?? ""
        let clientSecret = self.environment["QIITA_CLIENT_SECRET"] ?? ""
        let token = self.environment["QIITA_ACCESS_TOKEN"] ?? ""
        print("##########################################")
        print("\(clientID)\n\(clientSecret)\n\(token)\n")
        print("##########################################")
        
        if clientID == "" || clientSecret == "" || token == "" {
            XCTFail("[SwiitaRunnerTest] Invalid parameter")
        }
        
        let swiita = Swiita(clientid: clientID, clientsecret: clientSecret, token: token)
        
        //  APIリクエスト
        let exp = expectation(description: "Get authenticated user")
        
        getAuthenticatedUser(swiita: swiita, exp: exp)
        
        wait(for: [exp], timeout: 10.0)
    }
    
    // 認証済ユーザ取得
    func getAuthenticatedUser(swiita: Swiita, exp: XCTestExpectation) {
        swiita.getAuthenticatedUser(success: { (status, _) in
            XCTAssert(status == .Successful, "[SwiitaTests] http status error: \(status)")
            
            exp.fulfill()
        }) { (error) in
            XCTFail("[SwiitaTests] getAuthenticatedUser: \(error)")
            
            exp.fulfill()
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
