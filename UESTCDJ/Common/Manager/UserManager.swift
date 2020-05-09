//
//  UserManager.swift
//  xyyd
//
//  Created by JLM on 2020/2/6.
//  Copyright © 2020 ccw. All rights reserved.
//

import Foundation
import DefaultsKit

struct UserModel: Codable {
    let username: String?
    let mobile: String?
    let password: Bool?
    var isVip: Int?
    let vipTime: Int?
    let loanLimit: Int?
    let auth: Bool?
    let avatar: String?
    let realName: String?
    let cardNo: String?
}

struct TokenModel: Codable {
    let token: String?
    let expire: Int?
}

class UserManager {
    
    private let defaults = Defaults()
    private let userKey = Key<UserModel>("user")
    private let tokenKey = Key<String>("token")
    private let expireKey = Key<Int>("expire")
    
    static let shared = UserManager()
    
    var userisVip = 1
    
    var isLogin: Bool = false
    
    var user: UserModel? {
        set {
            if let user = newValue {
                isLogin = true
                defaults.set(user, for: userKey)
            } else {
                isLogin = false
            }
        }
        get {
            if defaults.has(userKey) {
                return defaults.get(for: userKey)
            }
            return nil
        }
    }
    
    public func save(tokenModel: TokenModel) {
        defaults.set(tokenModel.token ?? "", for: tokenKey)
        defaults.set(tokenModel.expire ?? 0, for: expireKey)
    }
    
    public func getExpire() -> Int {
        if defaults.has(expireKey) {
            return defaults.get(for: expireKey) ?? 0
        }
        return 0
    }
    
    public func getToken() -> String {
        if defaults.has(tokenKey) {
            return defaults.get(for: tokenKey) ?? ""
        }
        return ""
    }
    
    public func clear() {
        defaults.clear(userKey)
        defaults.clear(tokenKey)
        defaults.clear(expireKey)
    }
    
    private init() {
        
    }
}
