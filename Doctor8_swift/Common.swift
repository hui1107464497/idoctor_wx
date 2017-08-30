//
//  Common.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/5/15.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit
import MJRefresh

let userId = "ba183c41869d4a0bac222ec29203deb5"
let doctorId = "2de07b99802e4565b63101a1d1eb3413"
let token = "ZDY5ODcyNmY1YTg3NDc1ZGIyOGJlZmIzY2M5ZmM3MzIsYTFiMzg5OTgzZmUyNDRkNTk3ZDhkMWMwYjZjOTBlM2Y="
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height
let IDDefaultColor = UIColorFromRGB(rgbValue: 0x00CFA5)

func UIColorFromRGB(rgbValue:NSInteger)->(UIColor){
//    return UIColor.init(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)/255.0)), green: ((CGFloat)((rgbValue & 0xFF00) >> 8)/255.0)), blue: ((float)((rgbValue & 0xFF))/255.0, alpha: 1.0))
    return UIColor.init(red: (CGFloat)((rgbValue & 0xFF0000) >> 16)/255.0, green: (CGFloat)((rgbValue & 0xFF00) >> 8)/255.0, blue: (CGFloat)(rgbValue & 0xFF)/255.0, alpha: 1.0)
}
func IDRGBColor(r:CGFloat , g:CGFloat , b:CGFloat) -> (UIColor) {
   return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

func Font(size:Int)->(UIFont){
    return UIFont.systemFont(ofSize: CGFloat(size))
}
