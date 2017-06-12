//
//  IDSignList.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/6/8.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit

class IDSignList: UIViewController {

    var tabView:MHTabView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "签约"
        let titleArr:NSArray = ["待处理","已生效","已过期"]

        tabView = MHTabView.init(frame: CGRect.init(x: 0, y: 64, width: kScreenWidth, height: self.view.height), titleArr: titleArr )
        for i in 0 ..< titleArr.count {
            let newsVC = IDSignContentVC()
            switch (i) {
            case 0:
                newsVC.selectIndex = selectIndexEnum.WaitDo;
                break;
            case 1:
                newsVC.selectIndex = selectIndexEnum.Done;
                break;
            case 2:
                newsVC.selectIndex = selectIndexEnum.outTime;
                break;
            default:
                break;
            }
            
            newsVC.view.backgroundColor = UIColorFromRGB(rgbValue: 0xf0f1f5);
            self.addChildViewController(newsVC)
        }
        
        // 添加默认控制器
        let vc:IDSignContentVC = self.childViewControllers.first as! IDSignContentVC
        vc.selectIndex = selectIndexEnum.WaitDo;
        vc.view.frame = self.view.bounds;
        vc.view.backgroundColor = UIColorFromRGB(rgbValue:  0xf0f1f5);
        self.tabView?.contentScrollview.addSubview(vc.view)
        view.addSubview((tabView)!)
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
