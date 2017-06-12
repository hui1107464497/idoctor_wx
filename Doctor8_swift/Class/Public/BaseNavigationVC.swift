//
//  BaseNavigationVC.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/5/15.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit

class BaseNavigationVC: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().barTintColor = IDDefaultColor
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count != 0 {
            let root = self.childViewControllers[0]
            if root != viewController {
                viewController.hidesBottomBarWhenPushed = true
                viewController.navigationItem.hidesBackButton = true
                let backBtn = UIBarButtonItem(image: UIImage.init(named: "topbar_back"), style: .plain, target: self, action: #selector(popViewController))
                backBtn.tintColor = UIColor.white
                viewController.navigationItem.leftBarButtonItem = backBtn
            }
            
        }
        super.pushViewController(viewController, animated: animated)
    }

}
