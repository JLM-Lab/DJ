//
//  Notification.swift
//  ccwpa
//
//  Created by monstar on 2018/10/17.
//  Copyright © 2018 MarcoLi. All rights reserved.
//

import Foundation

/// 通知拓展
public extension NSNotification.Name {
    static let kUserInfoUpdate = NSNotification.Name(rawValue: "UserInfoUpdate")
    static let kPayFinish = NSNotification.Name(rawValue: "PayFinish")
    static let kloginsuccess = NSNotification.Name(rawValue: "kloginsuccess")
    static let kHomeUserInfoUpdate = NSNotification.Name(rawValue: "HomeUserInfoUpdate")
}
