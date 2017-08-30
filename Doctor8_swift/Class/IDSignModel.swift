//
//  IDSignModel.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/8/2.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit

class IDSignModel: NSObject {
    var teamId:String?
    var signId:String?
    var patientId:String?
    var patientPhoto:String?
    var patientName:String?
    var patientIdCard:String?
    var signDate:String?
    var actionDate:String?
    var  invalidDate:String?
    var status:String?
    var familyList:NSMutableArray?
    var servicePacketList:NSArray?


    init(dict:[String:Any] ) {
        super.init()
        setValuesForKeys(dict)
        let temp:NSMutableArray = NSMutableArray()
        
        if let familyList = dict["familyList"] {
            for  dt in familyList as! NSArray  {
                let model:IDSignModel = IDSignModel(dict: dt as! [String : Any])
                temp.add(model)
            }
        }
        self.familyList = temp;
    }
    
//    func initWithDict(dict:[String:Any]) -> IDSignModel {
////        super.init()
//        let model = IDSignModel()
//        model.setValuesForKeys(dict)
//       
//
//        return model
//    }
//    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
