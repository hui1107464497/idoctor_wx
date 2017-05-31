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
        
        self.view .addSubview(self.tableView)
        self.loadBinner()
        
    }
    
    //Mark: 代理方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "dd")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        
    }
    
    //Mark: 网络请求
    private func loadBinner(){
        let param = ["imgType":"doctor"]
        MHService .sharedService().request(url: getBannerUrl, params:param as AnyObject) { (dict:NSDictionary?, error:Error?) in
            print(dict)
            
        }
    }
    
    private func setTableHeader() {
        let sdScrollview = SDCycleScrollView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth , height: 150))
        sdScrollview.showPageControl = true
        sdScrollview.imageURLStringsGroup = self.scrollviewImages!
        sdScrollview.delegate = self
        sdScrollview.placeholderImage = UIImage(named: "默认轮播图")
        sdScrollview.bannerImageViewContentMode = .scaleAspectFill
        sdScrollview.pageControlStyle = SDCycleScrollViewPageContolStyleClassic
        sdScrollview.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
        sdScrollview.pageControlDotSize = CGSize.init(width: 18, height: 18)
        sdScrollview.currentPageDotColor = UIColor.white
        sdScrollview.pageDotColor =  IDRGBColor(r: 255.0, g: 255.0, b: 0.5)
        self.tableView.tableHeaderView!.addSubview(sdScrollview)
        
    }
    
    //Mark: 懒加载
    private lazy var tableView: UITableView={
        var tableview = UITableView()
        tableview.dataSource = self
        tableview.delegate = self
        tableview.separatorStyle = UITableViewCellSeparatorStyle.none
        return tableview
    }()



}
