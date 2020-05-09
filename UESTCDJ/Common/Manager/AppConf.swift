//
//  AppConf.swift
//  xyyd
//
//  Created by JLM on 2020/2/13.
//  Copyright © 2020 ccw. All rights reserved.
//

import Foundation

class AppConf {
    
    static let shared = AppConf()
    
    // MARK: App Host
    let hostPro = "http://api.yyzy.online"
    let hostDev = "http://rd.ccwcar.com:8840"
    
    let privacy = "http://share.yyzy.online/p/privacy.html"
    let register = "http://share.yyzy.online/p/registration.html"
    
    // MARK: App 全局配置
    let limit = 30
    
    let key = ""
    
    let todoMsg = "功能升级中..."
    
    
    // MARK: 客服相关
    let service = "https://ykf-webchat.7moor.com/wapchat.html?accessId=6426de00-514a-11ea-8ce3-d9ff28b6a1c0&fromUrl=appUser&urlTitle=app"
    
    // MARK: 支付宝相关
    let AlipayScheme            = "ccwcar.xyyd.alipay"
    
    // MARK: 会员相关
    let goodId = "1"
    
    
    // MARK: 密码相关
    let passwordFormatError = "6～16位密码，不能为纯数字或纯字母"
    
    func validatePassword( _ str: String ) -> Bool {
        let Regex = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$"
        let Test = NSPredicate(format: "SELF MATCHES %@", Regex)
        return Test.evaluate(with: str)
    }
    
    // MARK: 图片相关
    let pictureHost = "http://share.yyzy.online/file/"
    func jointPicture(_ str: String?) -> String {
        return "\(pictureHost)\(str ?? "")"
    }
    
    private init() {
        
    }
    
    func getDoubleString(_ num: Double, precision: Int? = 2) -> String {
        let testNumber = String(format: "%.2f", num)
        var outNumber = testNumber
        var i = 1
        
        if testNumber.contains(".") {
            while i < testNumber.count {
                if outNumber.hasSuffix("0") {
                    outNumber.removeLast()
                    i = i + 1
                } else {
                    break
                }
            }
            if outNumber.hasSuffix(".") {
                outNumber.removeLast()
            }
            return outNumber
        } else {
            return testNumber
        }
    }
}
