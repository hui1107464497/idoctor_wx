//
//  IDSiginCell.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/8/2.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit

class IDSiginCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    lazy var timeIcon:UIImageView = {
        let icon:UIImageView = UIImageView.init(image: UIImage(named: ""))
        icon.frame = CGRect(x: 14, y: 10, width: 14, height: 14)
        return icon
    }()
    lazy var timeLab:UILabel = {
        let lab:UILabel = UILabel(frame: CGRect(x: self.timeIcon.Right, y: 14, width: 100, height: 13))
        lab.textColor = UIColorFromRGB(rgbValue: 0x999999)
        lab.font = Font(size: 11)
        lab.sizeToFit()
        return  lab
    }()
    lazy var split1:UIView = {
        let split:UIView = UIView(frame: CGRect(x: 0, y: 34, width: kScreenWidth, height: 0.5))
        split.backgroundColor = UIColorFromRGB(rgbValue: 0xdddddd)
        return  split
    }()
    lazy var headIcon:UIImageView = {
        let icon:UIImageView = UIImageView.init(frame: CGRect(x: 14, y:self.split1.Bottom + 13, width: 50, height: 50))
        icon.layer.cornerRadius = 25
        icon.layer.masksToBounds = true
        return icon
    }()
    lazy var nameLab:UILabel = {
        let lab:UILabel = UILabel(frame: CGRect(x: self.headIcon.Right + 10, y: self.split1.Bottom + 20, width: 100, height: 13))
        lab.textColor = UIColorFromRGB(rgbValue: 0x333333)
        lab.font = Font(size: 15)
        lab.sizeToFit()
        return  lab
    }()
    lazy var idCardLab:UILabel = {
        let lab:UILabel = UILabel(frame: CGRect(x: self.headIcon.Right + 10, y: self.nameLab.Bottom + 10, width: 100, height: 13))
        lab.textColor = UIColorFromRGB(rgbValue: 0x999999)
        lab.font = Font(size: 13)
        lab.sizeToFit()
        return  lab
    }()
    lazy var split2:UIView = {
        let split:UIView = UIView(frame: CGRect(x: self.headIcon.Right + 10, y: self.idCardLab.Bottom + 10, width: kScreenWidth, height: 0.5))
        split.backgroundColor = UIColorFromRGB(rgbValue: 0xdddddd)
        return  split
    }()
    
   
    lazy var tipLab:UILabel = {
        let lab:UILabel = UILabel(frame: CGRect(x: 0, y: 12, width: 100, height: 13))
        lab.textColor = UIColorFromRGB(rgbValue: 0x333333)
        lab.font = Font(size: 13)
        lab.text = "他的家人"
        lab.sizeToFit()
        return  lab
    }()
    
    lazy var  collection:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 58, height: 56)
        layout.scrollDirection = .horizontal
        
        let collection: UICollectionView = UICollectionView(frame: CGRect(x: 0, y: self.tipLab.Bottom + 10, width: self.bottomView.width, height: 56), collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection .register(familyCell.self, forCellWithReuseIdentifier: "familyCell")
        return collection
    }()
    lazy var bottomTip: UILabel = {
        let tip:UILabel = UILabel(frame: CGRect(x: 0, y: 13, width: self.bottomView.width, height: 12))
        tip.text = "暂未添加家人"
        tip.font = Font(size: 11)
        tip.textColor = UIColorFromRGB(rgbValue: 0x999999)
        tip.textAlignment = .center
        return tip
    }()
    
    lazy var bottomView:UIView = {
        let bottom: UIView = UIView(frame: CGRect(x: self.headIcon.Right + 10, y: self.split2.Bottom , width: kScreenWidth - self.headIcon.Right - 10 , height:105 ))
        bottom.addSubview(self.collection)
        bottom.addSubview(self.bottomTip)
        self.collection.isHidden = true
        self.bottomTip.isHidden = true

        return  bottom
    }()
    
    var layView:UIView = UIView()
    
    var model:IDSignModel?  {
        didSet{
            self.timeLab.text = model?.signDate
            self.headIcon.setImageWith(URL(string:(model?.patientPhoto)!)!, placeholderImage: UIImage(named: "默认头像"))
            self.nameLab.text = model?.patientName
            self.idCardLab.text = model?.patientIdCard
            if model?.familyList != nil && (model?.familyList?.count)!>0 {
                self.collection.isHidden = false
                self.bottomTip.isHidden = true
                self.layView.height = 207
                self.collection.reloadData()
            }else{
                self.bottomTip.isHidden = false
                self.collection.isHidden = true
                self.layView.height = 138
            }
        }
    }
    
    
    public func signCellWithTableView(tableView:UITableView) -> IDSiginCell{
        var cell = tableView.dequeueReusableCell(withIdentifier: "IDSiginCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "IDSiginCell")
        }
        return cell as! IDSiginCell
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    private func setUpUI() {
        self.layView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 138)//无家人时
        layView.addSubview(self.timeIcon)
        layView.addSubview(self.tipLab)
        layView.addSubview(self.headIcon)
        layView.addSubview(self.nameLab)
        layView.addSubview(self.idCardLab)
        layView.addSubview(self.bottomView)
        self.addSubview(self.layView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

extension IDSiginCell
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.model?.familyList?.count)!
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:familyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "familyCell", for: indexPath ) as! familyCell
        
        return cell
    }
    
}

class familyCell: UICollectionViewCell {
    
    var model:IDSignModel? {
        didSet {
            self.familyHeadIcon.setImageWith(URL(string: DugImageUrl+(model?.patientPhoto)!)!, placeholderImage: UIImage(named: "默认头像"))
            self.nameLab.text = model?.patientName
        }
        
       
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpUI()
    }
    private func setUpUI(){
        self.addSubview(self.familyHeadIcon)
        
        self.addSubview(self.nameLab)
    }
    
    
    lazy var familyHeadIcon:UIImageView = {
        let icon:UIImageView = UIImageView.init(frame: CGRect(x: 10, y:0, width: 38, height: 38))
        icon.layer.cornerRadius = 19
        icon.layer.masksToBounds = true
        return icon
    }()
    lazy var nameLab:UILabel = {
        let lab:UILabel = UILabel(frame: CGRect(x:0, y: self.familyHeadIcon.Bottom + 5, width: 58, height: 14))
        lab.textColor = UIColorFromRGB(rgbValue: 0x999999)
        lab.font = Font(size: 13)
        lab.textAlignment = .center
        return  lab
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
