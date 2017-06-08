//
//  HeaderSectionView.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/6/1.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit

class HeaderSectionView: UIView {

    var title:String?
    var imageName:String?
    var subTitle :String?
    
    
    lazy var titleLab:UILabel = {
        let titlelab = UILabel(frame: CGRect.init(x: 39, y: 0, width: 100, height: 44))
        titlelab.font = UIFont.systemFont(ofSize: 15)
        titlelab.textColor = UIColorFromRGB(rgbValue: 0x333333)
        titlelab.textAlignment = .left
        return titlelab
    }()
    
    lazy var subTitleLab:UILabel = {
        let titlelab = UILabel(frame: CGRect.init(x: kScreenWidth - 30 - 150, y: 15, width: 150, height: 15))
        titlelab.font = UIFont.systemFont(ofSize: 15)
        titlelab.textColor = UIColorFromRGB(rgbValue: 0x999999)
        titlelab.textAlignment = .right
        return titlelab
    }()
    
    lazy var imageView:UIImageView = {
        let imageV = UIImageView(frame: CGRect.init(x: 17, y: 14, width: 15, height: 17))
        return imageV
    }()
    lazy var split:UIView = {
        let split = UIView(frame: CGRect.init(x: 0, y: 43.5, width: kScreenWidth, height: 0.5))
        split.backgroundColor = UIColorFromRGB(rgbValue: 0xdddddd)
        return split
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func setUI()  {
        self.backgroundColor = UIColorFromRGB(rgbValue:  0xf0f1f5);
        let layView = UIView(frame:CGRect.init(x: 0, y: 10, width: kScreenWidth, height: 44))
        layView.backgroundColor = UIColor.white
        self.addSubview(layView);
        
        let more = UIImageView(frame:CGRect.init(x: kScreenWidth-15-7, y: 18, width: 7, height: 12))
        //more.image = UIImage(named: (self.imageName?)!)
        layView.addSubview(more)
        
        layView.addSubview(self.imageView)
        layView.addSubview(self.titleLab)
        layView.addSubview(self.subTitleLab)
        layView.addSubview(self.split)
    }
    
}
