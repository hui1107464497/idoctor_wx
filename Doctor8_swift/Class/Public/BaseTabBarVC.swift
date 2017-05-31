//
//  BaseTabBarVC.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/5/15.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit
class BaseTabBarVC: UITabBarController {

    var count:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.creatChildVc()
        
    }
    
    
   private func creatChildVc()  {
    //首页
    let index = IndexVC()
    self.setChildVc(vc: index, title: "首页", imageName: "shouye", selectedImageName: "shouye1")

    let book = BookVC()
    self.setChildVc(vc: book, title: "通讯录", imageName: "friend", selectedImageName: "friend1")
    
    let me = MeViewController()
    self.setChildVc(vc: me, title: "我", imageName: "wode", selectedImageName: "wode1")
    
        
    }
    
    private func setChildVc(vc:UIViewController,title:NSString,imageName:NSString,selectedImageName:NSString)  {
        
        vc.title = title as String
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:Font(size: 10),NSForegroundColorAttributeName:UIColorFromRGB(rgbValue: 0x606060)], for: UIControlState.normal)
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:Font(size: 10),NSForegroundColorAttributeName:UIColorFromRGB(rgbValue: 0x00CFA5)], for: UIControlState.selected)
        
        vc.tabBarItem.selectedImage = UIImage(named: imageName as String)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc.tabBarItem.image = UIImage(named: selectedImageName as String)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let nav = BaseNavigationVC(rootViewController: vc)

        self.addChildViewController(nav)
    }
    
}
