//
//  IDWaitDosuifangCell.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/6/5.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit



class IDWaitDosuifangCell: UITableViewCell {
    
    lazy var headIcon:UIImageView = {
        let icon = UIImageView(frame: CGRect.init(x: 15, y: 7, width: 50, height: 50))
        icon.layer.cornerRadius = 25
        icon.layer.masksToBounds = true
        return icon
    }()
    lazy var titleLab: UILabel = {
        let title = UILabel()
        title.textColor = UIColorFromRGB(rgbValue: 0x666666)
        title.font = UIFont.systemFont(ofSize: 16)
        return title
    }()
    lazy var tipLab: UILabel = {
        let tip = UILabel()
        tip.textColor = UIColorFromRGB(rgbValue: 0xFD7C7E)
        tip.font = UIFont.systemFont(ofSize: 15)
        return tip
    }()
    lazy var rightImageView:UIImageView = {
        let more = UIImageView(image: UIImage.init(named: "next"))
        return more
    }()
    lazy var split: UIView = {
        let split = UIView()
        split.backgroundColor = UIColorFromRGB(rgbValue: 0xDDDDDD)
        return split
    }()
    
    var model:IDMHFollowUpModel? {
        didSet{
            self.headIcon.setImageWith(NSURL.init(string: (DugImageUrl + (model?.patientPhoto)!))! as URL, placeholderImage: UIImage.init(named: "默认头像"))
            self.titleLab.text = model?.patientName;
            self.tipLab.text = model?.state;
            

        }
    }
    

    public  func waitSuifangCellWithTableView(tableView:UITableView)->IDWaitDosuifangCell{
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "IDWaitDosuifangCell")
        if cell==nil {
            cell = IDWaitDosuifangCell(style: .default, reuseIdentifier: "IDWaitDosuifangCell")
            
        }
        return cell as! IDWaitDosuifangCell
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI(){
        
        self.selectionStyle = .none;
        
        self.addSubview(self.headIcon)
        self.addSubview(self.titleLab)
        self.addSubview(self.tipLab)
        self.addSubview(self.rightImageView)
        self.addSubview(self.split)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLab.x = self.headIcon.frame.maxX + 10;
        self.titleLab.y = 24;
        self.titleLab.sizeToFit();
        
        self.tipLab.frame = CGRect.init(x: kScreenWidth - 30 - 45, y: self.titleLab.frame.maxY, width: 10, height: 10)
        self.tipLab.sizeToFit()
        
        self.rightImageView .frame = CGRect.init(x: kScreenWidth - 15 - 7, y: self.tipLab.frame.maxY + 4, width: 7, height: 10)
        
        self.split.frame = CGRect.init(x: 75, y: self.height - 0.5, width: kScreenWidth - 75, height: 0.5)
    }

}
