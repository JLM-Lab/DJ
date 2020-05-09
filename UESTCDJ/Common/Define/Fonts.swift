//
//  Fonts.swift
//  ccwpa
//
//  Created by monstar on 2018/10/17.
//  Copyright © 2018 MarcoLi. All rights reserved.
//

import UIKit

extension UIFont {
    class func NumberFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "SFUDINMitAlt", size: size)!
    }
    
    class func NormalFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Regular", size: size)!
    }
    class func MediumFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Medium", size: size)!
    }
    class func BoldFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Semibold", size: size)!
    }
    
    class func DINBold(size: CGFloat) -> UIFont {
        return UIFont.init(name: "DIN Alternate", size: size)!
    }
}
