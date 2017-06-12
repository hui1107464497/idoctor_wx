//
//  IndexVC.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/5/15.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit
import SDCycleScrollView
class IndexVC: BaseViewController,UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate  {
    var dataSource: NSMutableArray?
    var scrollviewImages :[String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.view .addSubview(self.tableView)
        self.setTableHeader()
        self.loadBinner()
        self.loadRicheng()
        self.loadActivity()
        self.loadSignCout()
    }
    
    //Mark: 代理方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3 //功能按钮，日程，专科活动
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return self.scheduleDatas.count>2 ? 2 : self.scheduleDatas.count
        }
        return 1 //专科活动，功能按钮
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 2 {
            let cell = IDActivityCell().activityCellWithTableView(tableView: tableView)
            cell.isFromHome = true
            if self.activityDatas.count == 0 {
                cell.model = nil
            }else{
            cell.model = self.activityDatas[indexPath.row] as? IDActivityModel
            }
            return cell
        }else if indexPath.section == 0 {
           let cell =  UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "funcCell")
            cell .addSubview(self.setFuncView())
            return cell
        }else{
            let model:IDMHFollowUpModel = self.scheduleDatas[indexPath.row] as! IDMHFollowUpModel
            if model.state == "待随访" {
                let cell = IDWaitDosuifangCell().waitSuifangCellWithTableView(tableView:tableView)
                cell.model = model
                return cell
            }else{
                let  cell = IDWaitDoReferralOrAcceptCell().cellWithTableView(tableView:tableView)
                cell.model = model
                return cell
            }
        }

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 180
        }
        else if indexPath.section == 1 {
            return 60
        }
        else{
            if self.activityDatas.count == 0 {
                return 118
            }
            return 210
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let header = HeaderSectionView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 44))
            header.titleLab.text = "今日日程"
            header.imageView.image = UIImage(named: "richeng")
            if (self.scheduleDatas.count == 0){
                header.subTitleLab.text =  "无今日事项"
            }else{
                header.subTitleLab.text = ""
            }
            return header
        } else if(section == 2){
            let header = HeaderSectionView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 44))
            header.titleLab.text = "专科活动"
            header.imageView.image = UIImage(named: "zkq_activity")
            return header
        }
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 || section == 2 {
            return 44 + 10
        }
        return 0
    }
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        
    }
    
    //Mark: 网络请求
    private func loadBinner(){
       
        let param = ["imgType":"doctor"]
        MHService .sharedService().request(url: getBannerUrl, params:param ) { (dict:[String:AnyObject]?,code:String,message:String) in
            if (code == "200"){
                print(dict!)
                let data:NSArray = dict!["data"] as! NSArray
                self.scrollviewImages = ["默认轮播图"]
                for v in data {
                    let binner = v as! [String:AnyObject]
                self.scrollviewImages!.append(binner["app_img"]! as! String)
                    
                }
                self.sdScrollview.imageURLStringsGroup = self.scrollviewImages
            }else{
            //SVProgressHUD.showError(withStatus: "网络好像出问题了，请稍后再试")

            }
         
        }
    }
    
    private func loadRicheng(){
        let param:[String:String] = ["doctorId":doctorId]
        MHService.sharedService().request(url: getRichengUrl, params: param) { (dict:[String:AnyObject]?, code:String,message:String) in
            if (code == "200"){
                print(dict!)
                let data:NSArray = dict!["data"] as! NSArray

                for v in data {
                    let model : IDMHFollowUpModel = IDMHFollowUpModel.init(dict: v as! [String : AnyObject])
                    self.scheduleDatas .add(model)
                }
                self.tableView.reloadData()
                //scheduleDatas
            }
        }
    }
    private func loadActivity(){
        let param = ["userId":userId,"id":doctorId]
        MHService.sharedService().request(url: getActivutyUrl, params: param) { (dict:[String:AnyObject]?, code:String,message:String) in
            if (code == "200"){
                print(dict!)
                let data:NSArray = dict!["data"] as! NSArray
                
                for v in data {
                    let model : IDActivityModel = IDActivityModel.init(dict: v as! [String : AnyObject])
                    self.activityDatas .add(model)
                }
                self.tableView.reloadData()
            }
        }
    }
    private func loadSignCout(){
        let param = ["userId":userId]
        MHService.sharedService().request(url: getSignCountUrl, params: param) { (dict:[String:AnyObject]?, code:String,message:String) in
            if (code == "200"){
                print(dict!)
            }
        }
    }
    private func setTableHeader() {
        
        self.tableView.tableHeaderView = self.sdScrollview
        
    }
    
    private func setFuncView() -> UIView{
        let lay = UIView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 180))
        var x = 0
        var y = 0
        let w = Int(kScreenWidth / 4)
        let titles = ["分诊","转诊","接诊","签约","医共专科圈","医患圈","我的文章","待办"]
        let images = ["fenzhen","zhuanzhen","jiezhen","qianyue","yigongquan","yihuanquan","xuanjiao","daiban"]
        for i in 0 ..< titles.count  {
            if i <= 3 {
                y = 0
                x = i * w
            }else{
                y = 85
                x = (i-4) * w
            }
            
            
           let btn =  FuncButton(frame: CGRect.init(x: x, y: y, width: w, height: 85))
            btn.setTitle(titles[i], for: .normal)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.setImage(UIImage(named: images[i]), for: .normal)
            
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.tag = 1000 + i
            //btn.addTarget(self, action: Selector(("didFuncOnClick:")), for: .touchUpInside)
           btn.addTarget(self, action: #selector(didFuncOnClick(btn:)), for: .touchUpInside)
            lay .addSubview(btn)
            
        }
        
        return lay
    }
    
     @objc private func didFuncOnClick(btn: FuncButton){
        if btn.tag == 1003 {
            let vc = IDSignList()
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    //Mark: 懒加载
    private lazy var tableView: UITableView={
        var tableview = UITableView(frame: CGRect.init(x: 0, y: 64, width: kScreenWidth, height: kScreenHeight - 64-49))
        tableview.backgroundColor = UIColorFromRGB(rgbValue: 0xf0f1f5)
        tableview.dataSource = self
        tableview.delegate = self
        tableview.separatorStyle = UITableViewCellSeparatorStyle.none
        return tableview
    }()

    private lazy var  sdScrollview:SDCycleScrollView = {
        let sdScrollview = SDCycleScrollView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth , height: 150))
        sdScrollview.showPageControl = true
        sdScrollview.imageURLStringsGroup = self.scrollviewImages
        sdScrollview.delegate = self
        sdScrollview.placeholderImage = UIImage(named: "默认轮播图")
        sdScrollview.bannerImageViewContentMode = .scaleAspectFill
        sdScrollview.pageControlStyle = SDCycleScrollViewPageContolStyleClassic
        sdScrollview.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
        sdScrollview.pageControlDotSize = CGSize.init(width: 18, height: 18)
        sdScrollview.currentPageDotColor = UIColor.white
        sdScrollview.pageDotColor =  IDRGBColor(r: 255.0, g: 255.0, b: 0.5)
        return sdScrollview
    }()
    
    private lazy var scheduleDatas:NSMutableArray = {
        let datas = NSMutableArray.init(array: [])
        return datas
    }()
    
    private lazy var activityDatas:NSMutableArray = {
        let datas = NSMutableArray.init(array: [])
        return datas
    }()


}
