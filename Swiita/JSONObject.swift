//
//  JSONObject.swift
//  Swiita
//
//  Created by EnchantCode on 2020/07/17.
//  Copyright © 2020 EnchantCode. All rights reserved.
//

import Foundation

public enum JSONObject: Equatable {
    // JSONObjectが受け取る型
    case string(String)
    case number(Double)
    case bool(Bool)
    case url(URL)
    case array(Array<JSONObject>)
    case object(Dictionary<String, JSONObject>)
    case invalid
    case null
    
    // 各型の中身を取り出す
    public var string: String? {
        guard case .string(let string) = self else { return nil }
        return string
    }
    public var url: URL? {
        guard case .url(let url) = self else { return nil }
        return url
    }
    public var int: Int? {
        guard case .number(let number) = self else { return nil }
        return Int(number)
    }
    public var double: Double? {
        guard case .number(let number) = self else { return nil }
        return number
    }
    public var bool: Bool? {
        guard case .bool(let bool) = self else { return nil }
        return bool
    }
    public var array: [JSONObject]? {
        guard case .array(let array) = self else { return nil }
        return array
    }
    public var object: [String: JSONObject]? {
        guard case .object(let object) = self else { return nil }
        return object
    }
    
    // 配列としてJSONObjectが呼び出された場合
    subscript(_ index: Int) -> JSONObject {
        guard case .array(let array) = self else { return .null }
        return array[index]
    }
    
    // キーバリューとしてJSONObjectが呼び出された場合
    subscript(_ key: String) -> JSONObject {
        guard case .object(let object) = self else { return .null }
        return object[key] ?? .null
    }
    
    // 適切な列挙型の値にキャストして返すイニシャライザ
    init(_ value: Any){
        switch value {
        //  jsonが扱うデータ型
        case let string as String:
            // URLとして扱える場合は自動変換
            guard let url = URL(string: string) else {
                self = .string(string)
                return
            }
            self = .url(url)
            
        // 可能なら型キャスト
        case let number as Double:
            self = .number(number)
            
        case let bool as Bool:
            self = .bool(bool)
            
        case let nsarray as NSArray:
            self = .array(nsarray.map( {JSONObject($0)} ))
            
        case let array as [Any]:
            self = .array(array.map( {JSONObject($0)} ))
            
        case let dictionary as [String: Any]:
            self = .object(dictionary.mapValues { JSONObject($0) })
            
        // パースされていないJSON文字列のData
        case let rawJsonData as Data:
            guard let decoded = try? JSONSerialization.jsonObject(with: rawJsonData, options: []) as? [String: Any] else {
                print("JSON Parse failed.")
                self = .invalid
                return
            }
            self = JSONObject(decoded)
            
        case _ as Optional<Any>:
            self = .null
            
        default:
            self = .invalid
            
        }
    }
    
    // JSON文字列から変換できるように
    init?(json: String, encoding: String.Encoding = .utf8) {
        self.init(json.data(using: encoding))
        if self == .invalid{
            return nil
        }
    }
    
    // JSONEncoderでエンコードした構造体も入力できるように
    init?<T: Encodable>(json: T, encoding: String.Encoding = .utf8){
        guard let encodedObject = try? JSONEncoder().encode(json) else {return nil}
        self.init(String(data: encodedObject, encoding: encoding))
    }
    
}
