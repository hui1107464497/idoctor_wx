//
//  MHService.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/5/25.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import Foundation
import AFNetworking
import SVProgressHUD
enum HTTPMethod: String{
    case GET = "GET"
    case POST = "POST"
}

class MHService: AFHTTPSessionManager {
    

    class func sharedService() -> MHService {
        let url = NSURL(string:IDTestUrl)
        let config = URLSessionConfiguration.default
        
        let currentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        config.httpAdditionalHeaders = ["token":token,"platform":"IOS","Version": currentVersion]
        
        let tool = MHService(baseURL: url! as URL, sessionConfiguration: config)
        
        tool.requestSerializer = AFJSONRequestSerializer()
        //tool.requestSerializer.timeoutInterval = 25
        tool.requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
        
        tool.responseSerializer.acceptableContentTypes = NSSet(objects: ["text/plain","application/json","text/json","text/javascript","text/html"]) as? Set<String>
    
        return tool
    }
    
    //@escaping  逃逸闭包，函数执行完毕后才调用的闭包   ，@noescaping在函数内执行的闭包
    func request(method:HTTPMethod = .POST,url:String,params: [String:String]? ,completion: @escaping (_ dic:[String:AnyObject]?,_ code:String,_ message:String) ->()) {
        
        let successBlock = {(task:URLSessionDataTask,result:Any?) ->() in
          
            let info = result as? [String : AnyObject]
            
            if  (info != nil) {
                
               if info!["code"] as! String == "200"{
                    completion(info! ,"200",info!["message"] as! String)
               }else{
                
                completion(nil,info!["code"] as! String,info!["message"] as! String)
                  
                }
            }else{
               
                completion(nil, "-1000" ,"没有东西耶")

            }
        }
        
        let failureBlock = {(task:URLSessionDataTask?,error:Error) -> () in
            SVProgressHUD.showError(withStatus: "网络好像出问题了，请稍后再试")
            completion(nil,"-1001","请求失败")

        }
        
        
        if method == .GET {
    
            get(url, parameters: params, progress: nil, success: successBlock,failure:failureBlock)
        }else{
            post(url, parameters: params, progress: nil, success: successBlock, failure: failureBlock)
        }
        
    }
    
    //上传图片
    func requestUpload(method:HTTPMethod = .POST,url:String,params: AnyObject? ,imageArr:[UIImage],completion: @escaping (_ dic:NSDictionary?,_ error:Error?) ->()) {
        
        let successBlock = {(task:URLSessionDataTask,result:Any?) ->() in
            
            if let info = result as? [String : AnyObject] {
                
                if info["code"] as! String == "200"{
                    completion(info as NSDictionary,nil)
                }else{
                    completion(nil,NSError(domain: "noData", code: info["code"] as! Int, userInfo: ["error":info["message"] as! String]))
                    
                }
            }else{
                completion(nil, NSError(domain: "dataerror", code: -10001, userInfo: ["error":"数据不合法"]))
            }
        }
        
        let failureBlock = {(task:URLSessionDataTask?,error:Error) -> () in
            completion(nil,error)
            
        }
        
        
        post(url, parameters: params, constructingBodyWith: { (formData) -> Void in
            for i in 0..<imageArr.count {
                let img = imageArr[i]
                let eachImgData = UIImageJPEGRepresentation(img, 0.9)
                //                let eachImgData = UIImagePNGRepresentation(img)
                formData.appendPart(withForm: eachImgData!, name: "myfile")
            }
        },progress: nil, success: successBlock, failure: failureBlock)
        
    }
    
}
