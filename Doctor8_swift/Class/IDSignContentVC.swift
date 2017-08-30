//
//  IDSignContentVC.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/6/8.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit
import MJRefresh
import SVProgressHUD
enum selectIndexEnum: Int {
    case WaitDo = 0
    case Done = 1
    case outTime = 3
}
class IDSignContentVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var selectIndex: selectIndexEnum?
    var page:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
//        self.title = "\(selectIndex?.hashValue)"

        self.view.addSubview(tableview)
        self.setRefresh()
    }
//    MARK: 网络请求
    func setRefresh(){
        let header = MJRefreshNormalHeader { 
            self.loadData()
        }
        
        self.tableview.mj_header = header
        
        let footer = MJRefreshAutoFooter{
            self.loadData()
        }
        self.tableview.mj_footer = footer
        self.tableview.mj_header.beginRefreshing()
    }
    
    func loadData() {
        var pull:Bool = true
        if self.tableview.mj_header.state == .refreshing {
            self.page = 1
            self.dataSource.removeAllObjects()
        }else if(self.tableview.mj_footer.state == .refreshing){
            self.page += 1
            pull = false
        }
        MHService.sharedService().request(url: IDTestUrl+"hys-mgp/app/api/signDoctor/doctor/query", params: ["pageNo":self.page,"pageSize":10,"doctorId":doctorId,"state":self.selectIndex?.rawValue ?? 0]) { (dict:[String:AnyObject]?,code:String,message:String)  in
            if (code == "200"){
                print(dict!)
                let data:NSArray = dict!["data"]!["list"] as! NSArray
                for dict in data {
                    let model: IDSignModel  = IDSignModel(dict: dict as! [String : Any])
                    self.dataSource.add(model)
                }
                self.tableview.reloadData()
                if pull {
                    self.tableview.mj_header.endRefreshing()
                }else{
                    self.tableview.mj_footer.endRefreshing()
                }
            }else if(code == "-1000"){
                SVProgressHUD.showInfo(withStatus: message)
                if !pull  {
                    self.page -= 1
                    self.tableview.mj_footer.endRefreshing()
                }else{
                    self.tableview.mj_header.endRefreshing()
                    
                }
            }
            
            else{
                SVProgressHUD.showError(withStatus: message)
                if !pull  {
                    self.page -= 1
                    self.tableview.mj_footer.endRefreshing()
                }else{
                    self.tableview.mj_header.endRefreshing()

                }
            }
        }
    }
    
//    MARK: tableViewDatasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = IDSiginCell().signCellWithTableView(tableView: tableView)
        cell.model = self.dataSource[indexPath.row] as? IDSignModel
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model:IDSignModel =  (self.dataSource[indexPath.row] as? IDSignModel)!
        if (model.familyList != nil && (model.familyList?.count)!>0) {
            return 217
        }
        return 148
    }
//    MARK: 懒加载
    lazy var tableview: UITableView = {
        let tb:UITableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: self.view.height ))
        tb.separatorStyle = .none
        
        return tb
    }()
    lazy var dataSource: NSMutableArray = {
        let datas = NSMutableArray()
        return datas
    }()
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
