//
//  BaseTabBarController.swift
//  xyyd
//
//  Created by JLM on 2020/2/3.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit
import MBProgressHUD
import CYLTabBarController

class BaseTabBarController: CYLTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        view.backgroundColor = .white
        let bgview = UIView()
        bgview.backgroundColor = .white
        bgview.frame = tabBar.bounds
        UITabBar.appearance().insertSubview(bgview, at: 0)
        hideTabBarShadowImageView()
        UITabBar.appearance().backgroundImage = imageWithColor(.white)
        tabBar.layer.shadowColor = UIColor.KThreeGray.cgColor //UIColor.ccw.hex(0xE8E8E8, alpha: 0.5).cgColor
        tabBar.layer.shadowRadius = 6.0
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 3)
        tabBar.layer.masksToBounds = false
        tabBar.clipsToBounds = false
        tabBar.unselectedItemTintColor = UIColor.ccw.hex(0xAAAAAA)
        tabBar.tintColor = UIColor.ccw.hex(0x0457FD)
    }
    
    func imageWithColor(_ color : UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return image
        }
        UIGraphicsEndImageContext()
        return UIImage()
    }
    
//    override func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if viewController == self.viewControllers[1] || viewController == self.viewControllers[3] {
//            if UserManager.shared.user != nil {
//                if !(UserManager.shared.user?.auth ?? false) {
//                    let controller = AuthViewController()
//                    controller.hidesBottomBarWhenPushed = true
//                    if let nav = viewControllers[selectedIndex] as? BaseNavigationViewController {
//                        nav.pushViewController(controller, animated: true)
//                    }
//                    return false
//                }
//            } else {
//                let controller = InputPhoneViewController()
//                controller.hidesBottomBarWhenPushed = true
//                if let nav = viewControllers[selectedIndex] as? BaseNavigationViewController {
//                    nav.pushViewController(controller, animated: true)
//                }
//                return false
//            }
//        } else if viewController == self.viewControllers[2] {
//            if UserManager.shared.user != nil {
//                MBProgressHUD.show(text: AppConf.shared.todoMsg, onView: AppDelegate.shared().window)
//                return false
//            } else {
//                let controller = InputPhoneViewController()
//                controller.hidesBottomBarWhenPushed = true
//                if let nav = viewControllers[selectedIndex] as? BaseNavigationViewController {
//                    nav.pushViewController(controller, animated: true)
//                }
//                return false
//            }
//        }
//        self.updateSelectionStatusIfNeeded(for: tabBarController, shouldSelect: viewController)
//        return true
//    }        
}
