//
//  AppDelegate.swift
//  UESTCDJ
//
//  Created by JLM on 2020/4/17.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit
import CYLTabBarController
//import XHLaunchAd
//let window = UIApplication.shared.keyWindow
let Z_SCREEN_WIDTH = UIScreen.main.bounds.size.width
let Z_SCREEN_HEIGHT = UIScreen.main.bounds.size.height

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var allowRotation = false
    var rightRotation = false
    var navigation: BaseNavigationViewController?
    var tabBarVc: BaseTabBarController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        navigation = BaseNavigationViewController(rootViewController: Guidance01ViewController())
        tabBarVc = BaseTabBarController(viewControllers: self.viewControllers(), tabBarItemsAttributes: self.tabBarItemsAttributesForController())
//        window?.rootViewController = navigation
        window?.rootViewController = tabBarVc
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        confVideoLaunch()
        configSocket()
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if rightRotation {
            return .landscapeRight
        }
        if allowRotation {
            return .all
        }
        return .portrait
    }
    
    class func shared() -> AppDelegate {
        return (UIApplication.shared.delegate as? AppDelegate) ?? AppDelegate()
    }


}

// MARK: 配置 socket
extension AppDelegate {
    private func configSocket() {
        SocketManager.shared.initialSocket()
    }
}

// MARK: 配置 TabBar
extension AppDelegate {
    func viewControllers() -> [UINavigationController]{
        let equipment = BaseNavigationViewController(rootViewController: EquipmentViewController())
        let interaction = BaseNavigationViewController(rootViewController: InteractionViewController())
        let share = BaseNavigationViewController(rootViewController: VideoListViewController())
        let me =   BaseNavigationViewController(rootViewController: MeViewController())
        let viewControllers = [equipment, share, me]
        
        return viewControllers
        
    }
    

    func tabBarItemsAttributesForController() ->  [[String : String]] {
        
        let tabBarItemOne = [CYLTabBarItemTitle:"设备",
                             CYLTabBarItemImage:"icon_home_normal",
                             CYLTabBarItemSelectedImage:"icon_home_highlight"]
        
        let tabBarItemTwo = [CYLTabBarItemTitle:"交互",
                             CYLTabBarItemImage:"icon_loans_normal",
                             CYLTabBarItemSelectedImage:"icon_loans_highlight"]
        
        let tabBarItemThree = [CYLTabBarItemTitle:"分享",
                               CYLTabBarItemImage:"icon_credit_normal",
                               CYLTabBarItemSelectedImage:"icon_credit_highlight"]
        
        let tabBarItemFour = [CYLTabBarItemTitle:"我",
                              CYLTabBarItemImage:"activation_new_profile_disable",
                              CYLTabBarItemSelectedImage:"activation_new_profile_enable"]
        let tabBarItemsAttributes = [tabBarItemOne,tabBarItemThree,tabBarItemFour]
        return tabBarItemsAttributes
    }
}

// MARK: - App 启动页
extension AppDelegate: XHLaunchAdDelegate {
    private func confLaunch() {
        XHLaunchAd.setLaunch(.launchScreen)
        XHLaunchAd.setWaitDataDuration(3)
        let imageAdconfiguration = XHLaunchImageAdConfiguration()
        imageAdconfiguration.duration = 5
        imageAdconfiguration.frame = CGRect(x: 0, y: 0, width: Z_SCREEN_WIDTH, height: Z_SCREEN_HEIGHT)
        // http://qn.ccwcar.com/upload/2/seven/car/TDTru9Ps.gif
        // http://qn.ccwcar.com/upload/2/seven/car/WHCnfNqo.mp4
        imageAdconfiguration.imageNameOrURLString = "http://qn.ccwcar.com/upload/2/seven/car/TDTru9Ps.gif"
        imageAdconfiguration.gifImageCycleOnce = false
        imageAdconfiguration.imageOption = .default
        imageAdconfiguration.contentMode = .scaleAspectFill
        imageAdconfiguration.openModel = "https://mp.weixin.qq.com/s/keKWOFtW5DyaGsKtu01WSQ"
        imageAdconfiguration.showFinishAnimate = .lite
        imageAdconfiguration.showFinishAnimateTime = 0.8
        imageAdconfiguration.skipButtonType = .timeText
        imageAdconfiguration.showEnterForeground = false
        if let url = URL(string: "http://qn.ccwcar.com/upload/2/seven/car/1kHMnCQi.jpeg") {
            if XHLaunchAd.checkImageInCache(with: url) {
//                imageAdconfiguration.subViews =
            }
        }
        XHLaunchAd.imageAd(with: imageAdconfiguration, delegate: self)
    }
    
    private func confVideoLaunch() {
        let videoAdconfiguration = XHLaunchVideoAdConfiguration()
        videoAdconfiguration.duration = 60
        videoAdconfiguration.frame = CGRect(x: 0, y: 0, width: Z_SCREEN_WIDTH, height: Z_SCREEN_HEIGHT)
        videoAdconfiguration.skipButtonType = .none
        videoAdconfiguration.videoNameOrURLString = "http://qn.ccwcar.com/upload/2/seven/car/WHCnfNqo.mp4"
        videoAdconfiguration.muted = false
        videoAdconfiguration.videoGravity = .resizeAspectFill
        videoAdconfiguration.videoCycleOnce = false
        videoAdconfiguration.videoNameOrURLString = "start_video.mp4"
//        videoAdconfiguration.openModel = "https://mp.weixin.qq.com/s/keKWOFtW5DyaGsKtu01WSQ"
        videoAdconfiguration.showFinishAnimate = .fadein
        videoAdconfiguration.showFinishAnimateTime = 0.8
        videoAdconfiguration.showEnterForeground = false
        videoAdconfiguration.skipButtonType = .timeText
        videoAdconfiguration.customSkipView = customSkipView()
        XHLaunchAd .videoAd(with: videoAdconfiguration, delegate: self)
    }
    
    private func customSkipView() -> UIView {
        let btn = UIButton()
        btn.backgroundColor = UIColor.ccw.hex(0x6084FF)
        btn.setTitle("开始", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 70.0, width: UIScreen.main.bounds.width, height: 70.0)
        btn.addTarget(self, action: #selector(skipAction), for: .touchUpInside)
        return btn
    }
    
    @objc private func skipAction() {
        print("开始啦")
    }
    
    func xhLaunchAd(_ launchAd: XHLaunchAd, clickAndOpenModel openModel: Any, click clickPoint: CGPoint) {
//        navigationController?.pushViewController(ADWebViewController(), animated: true)
    }
    
    func xhLaunchAdShowFinish(_ launchAd: XHLaunchAd) {
        print("广告加载完成")
    }
}
