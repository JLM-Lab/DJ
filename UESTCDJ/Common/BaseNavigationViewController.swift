//
//  BaseNavigationViewController.swift
//  xyyd
//
//  Created by JLM on 2020/2/4.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isHidden = true
        view.backgroundColor = .kViewBackgroudColor
        navigationBar.backgroundColor = .white
        navigationBar.barTintColor = .white
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0), NSAttributedString.Key.foregroundColor: UIColor.kNormalBlack]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}
