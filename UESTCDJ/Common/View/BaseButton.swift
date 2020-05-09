//
//  BaseButton.swift
//  xyyd
//
//  Created by JLM on 2020/2/5.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit

class BaseButton: UIButton {

    override func draw(_ rect: CGRect) {
        titleLabel?.font = .boldSystemFont(ofSize: 17.0)
        
    }

//    func imageWithColor(_ color : UIColor) -> UIImage {
//        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
//        UIGraphicsBeginImageContext(rect.size)
//        let context = UIGraphicsGetCurrentContext()
//        context?.setFillColor(color.cgColor)
//        context?.fill(rect)
//        if let image = UIGraphicsGetImageFromCurrentImageContext() {
//            UIGraphicsEndImageContext()
//            return image
//        }
//        UIGraphicsEndImageContext()
//        return UIImage()
//    }

}

extension UIView {
    //左右渐变
        public class func setGradualLeftToRightColor(view:UIView,fromColor:UIColor,toCololr:UIColor,loactions:[NSNumber]=[0.0,1.0]) -> CAGradientLayer {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = view.bounds
            //  创建渐变色数组，需要转换为CGColor颜色
            gradientLayer.colors = [fromColor.cgColor,toCololr.cgColor]
            //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint =  CGPoint(x: 1, y: 0)
            //  设置颜色变化点，取值范围 0.0~1.0
            gradientLayer.locations = loactions
            return gradientLayer
        }

    public class func setGradualChangingColor(view:UIView,fromColor:UIColor,toCololr:UIColor,loactions:[NSNumber]=[0,0.5]) -> CAGradientLayer {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = view.bounds
            //  创建渐变色数组，需要转换为CGColor颜色
            gradientLayer.colors = [fromColor.cgColor,toCololr.cgColor]
            //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint =  CGPoint(x: 0, y: 1)
            //  设置颜色变化点，取值范围 0.0~1.0
            gradientLayer.locations = loactions
            return gradientLayer
        }
}
