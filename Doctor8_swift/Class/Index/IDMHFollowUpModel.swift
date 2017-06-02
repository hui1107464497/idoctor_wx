//
//  IDMHFollowUpModel.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/5/31.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit

class IDMHFollowUpModel: NSObject {
    
    var referralId:String?
    var sex:String?
    var patientName:String?
    var patientPhoto:String?
    var triageId:String?
    var referralType:String?
    var referralDiagName:String?
    var patientAge:Int = 0
    var state :String?
    
    init(dict:[String:AnyObject]){
        super.init()
        self.setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
