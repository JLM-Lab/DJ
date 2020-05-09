//
//  MBProgressHUD+Extensions.swift
//  ccwpa
//
//  Created by monstar on 2018/10/17.
//  Copyright © 2018 MarcoLi. All rights reserved.
//
import MBProgressHUD

public extension MBProgressHUD {
    
    class func dismissHUD(view: UIView?) {
        guard let view = view else { return }
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    class func showIndicator(text: String, onView: UIView?) {
        guard let onView = onView else {return }
        MBProgressHUD.hide(for: onView, animated: false)
        let hud = MBProgressHUD.showAdded(to: onView, animated: true)
        hud.mode = .indeterminate
        hud.label.text = text
    }
    class func show(text: String, onView: UIView?, delay:Float = 1.0, handler: (() -> Void)? = nil) {
        guard let onView = onView else {return }
        
        MBProgressHUD.hide(for: onView, animated: false)
        let hud = MBProgressHUD.showAdded(to: onView, animated: true)
        hud.mode = .text
        hud.label.text = text
        hud.label.numberOfLines = 0
        hud.hide(animated: true, afterDelay: TimeInterval.init(delay))
        if let h = handler {
            DispatchQueue.main
                .asyncAfter(deadline: DispatchTime.now() + TimeInterval.init(delay),
                            execute: h)
        }
    }
    
//    class func show(CPError: Error, onView: UIView?) {
//        guard let onView = onView else {return}
//
//        guard let err = CPError as? CPError, err.errorMessage != "" else {
//            return
//
//        }
//        self.show(text: err.errorMessage, onView: onView, delay: 1.0, handler: nil)
//    }
    
    class func showSuccess(info: String, onView: UIView?) {
        guard let onView = onView else { return }
        let hud = MBProgressHUD.showAdded(to: onView, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        hud.bezelView.backgroundColor = UIColor.black
        hud.customView = UIImageView(image: UIImage(named: "icon_succeed_white")!)
        hud.label.text = info
        hud.label.textColor = .white
//        hud.label.font = .CPNormalFont(size: Constants.CPFontSize(.s))
        hud.hide(animated: true, afterDelay: TimeInterval.init(1.0))
    }
}
