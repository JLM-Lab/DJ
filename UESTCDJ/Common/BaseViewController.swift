//
//  BaseViewController.swift
//  xyyd
//
//  Created by JLM on 2020/2/3.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
//        view.backgroundColor = .kViewBackgroudColor
        navigationController?.navigationBar.isHidden = false
        configurePopNavigationItem(popNavigationItem)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func popViewController() {
        guard let nc = navigationController, nc.viewControllers.count > 1 else {
            return
        }
        nc.popViewController(animated: true)
    }
}

extension BaseViewController {
    var popNavigationItem: UIBarButtonItem {
        let image = UIImage(named: "activation_previous_disabled")
        let backButton = UIButton(type: .custom)
        backButton.setImage(image, for: UIControl.State())
        backButton.addTarget(self, action: #selector(self.pop), for: .touchUpInside)
        return UIBarButtonItem(customView: backButton)
    }
    
    /// 配置导航item
    ///
    /// - Parameter item: item description
    open func configurePopNavigationItem(_ item : UIBarButtonItem) {
        navigationItem.leftBarButtonItem = item
    }
    
    var popNavigationWhiteItem: UIBarButtonItem {
        let image = UIImage(named: "icon_return_white")
        let backButton = UIButton(type: .custom)
        backButton.setImage(image, for: UIControl.State())
        backButton.addTarget(self, action: #selector(self.pop), for: .touchUpInside)
        return UIBarButtonItem(customView: backButton)
    }
    
    /// POP 出栈方法
    @objc open func pop() {
        popViewController()
    }
    
    open func hiddenLeftNavigationItem() {
        navigationItem.leftBarButtonItem = nil
    }
}


extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
