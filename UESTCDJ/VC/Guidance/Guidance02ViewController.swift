//
//  Guidance02ViewController.swift
//  UESTCDJ
//
//  Created by JLM on 2020/4/17.
//  Copyright © 2020 ccw. All rights reserved.
//

import UIKit

class Guidance02ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fd_prefersNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func nextAction(_ sender: Any) {
        if let tabbar = AppDelegate.shared().tabBarVc {
            AppDelegate.shared().window?.rootViewController = tabbar
        } else {
            fatalError("tabbar not found...")
        }
    }
    
}
