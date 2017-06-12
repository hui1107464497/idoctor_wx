//
//  IDSignContentVC.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/6/8.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit

enum selectIndexEnum {
    case WaitDo
    case Done
    case outTime
}
class IDSignContentVC: UIViewController {

    var selectIndex: selectIndexEnum?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
//        self.title = "\(selectIndex?.hashValue)"

        // Do any additional setup after loading the view.
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
