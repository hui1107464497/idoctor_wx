//
//  FuncButton.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/6/1.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit

class FuncButton: UIButton {

    override func layoutSubviews() {
       super.layoutSubviews()
        
        let w = kScreenWidth / 4.0
        self.imageView?.centerX = w*0.5
        self.imageView?.y = 10
        self.imageView?.sizeToFit()
        
        self.titleLabel?.x = 0
        self.titleLabel?.y = (self.imageView?.frame.maxY)! + 10
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.width = w
        self.titleLabel?.height = 13
    }

}
