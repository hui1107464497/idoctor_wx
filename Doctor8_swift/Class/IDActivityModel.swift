//
//  IDActivityModel.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/5/31.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit

class IDActivityModel: NSObject {
    var id:String?
    
    var eventName:String?
    var medicalCircleId:String?
    var startTime:String?
    var createDate:String?
    var endTime:String?
    var holdState:String? // 活动举办状态 1已结束
    var holdStateName:String?
    //String userId;		// 创建用户id
    var userId:String?
    //String isPublic;		// 是否公开
    var isPublic:String?
    //String address;		// 活动地点
    var address:String?
    //Date dieTime;		// 报名截止时间
    var dieTime:String?
    //String doctorPay;		// 医生付费情况 : 0免费1付费
    var doctorPay:String?
    //String doctorPayType;		// 医生付费类型：1：有I类学分，2：有II类学分  3:无学分
    var doctorPayType:String?
    
    //String patientPay;		// 居民付费情况 : 0：免费1：付费
    var patientPay:String?
    //String patientPayType;		// 居民付费类型
    var patientPayType:String?
    //String doctorCount;		// 医生限制人数
    var doctorCount:String?
    //String patientCount;		// 居民限制人数
    var patientCount:String?
    //String telphone;		// 联系人电话
    var telphone:String?
    
    //"speakerName": "花儿",
    var speakerName:String?
    //"speakerTitle": "住院医师",
    var speakerTitle:String?
    //"speakerHosp": "北京东城区好医院测试导入",
    var speakerHosp:String?
    //"speakerDept": "医务科",
    var speakerDept:String?
    //"circleEventMembers":
    var circleEventMembers:NSArray?
    
    var content:String?
    
    var allCount:String?
    
    var signSate:String? ;//报名状态 0 未报名 1已报名
    
    var photoUrl:String?;//发起或动的人的头像
    
    init(dict:[String:AnyObject]){
        super.init()
        setValuesForKeys(dict)
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }}
