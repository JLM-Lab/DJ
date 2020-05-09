//
//  Constants.swift
//  ccwpa
//
//  Created by monstar on 2018/10/16.
//  Copyright © 2018 MarcoLi. All rights reserved.
//

import UIKit

class Constants {
    enum CPFontSizeEnum {
        /// 8.0
        case xxxs
        /// 10.0
        case xxs
        /// 12.0
        case xs
        /// 14.0
        case s
        /// 16.0
        case m
        /// 20.0
        case l
        /// 25.0
        case xl
        /// 28.0
        case xxl
        /// 30.0
        case xxxl
    }
    
    class func CPFontSize(_ font: CPFontSizeEnum) -> CGFloat {
        switch font {
        case .xxxs:
            return 8.0
        case .xxs:
            return 10.0
        case .xs:
            return 12.0
        case .s:
            return 14.0
        case .m:
            return 16.0
        case .l:
            return 20.0
        case .xl:
            return 25.0
        case .xxl:
            return 28.0
        case .xxxl:
            return 30.0
        }
    }
}

struct ScreenUtil {
    
    static let kScreenWidth          = UIScreen.main.bounds.size.width
    static let kScreenHeight         = UIScreen.main.bounds.size.height
    
    //设计标准
    static let designWidth: CGFloat  = 375
    static let desingHeight: CGFloat = 812
    
    //缩放比例
    static let widthRatio: CGFloat   = ScreenUtil.kScreenWidth / ScreenUtil.designWidth
    static let heightRatio: CGFloat  = ScreenUtil.kScreenHeight / ScreenUtil.desingHeight
    
    static func getRelativeWidth(_ designSize: CGFloat) -> CGFloat! {
        return designSize * ScreenUtil.widthRatio
    }
    
    static func getRelativeHeight(_ designSize: CGFloat) -> CGFloat! {
        return designSize * ScreenUtil.heightRatio
    }
}
