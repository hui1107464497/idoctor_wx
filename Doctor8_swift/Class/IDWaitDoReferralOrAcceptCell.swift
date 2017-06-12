//
//  IDWaitDoReferralOrAcceptCell.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/6/5.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit

class IDWaitDoReferralOrAcceptCell: UITableViewCell {
    lazy var headIcon :UIImageView = {
        let icon = UIImageView(frame:CGRect.init(x: 15, y: 7, width: 50, height: 50))
        icon.layer.cornerRadius = 25
        icon.layer.masksToBounds = true
        return icon
    }()
    lazy var titleLab:UILabel = {
        let title = UILabel()
        title.textColor = UIColorFromRGB(rgbValue: 0x666666)
        title.font = UIFont.systemFont(ofSize: 16)
        return title
    }()
    lazy var sexIcon:UIImageView = {
        return UIImageView()
    }()
    lazy var ageLab:UILabel = {
        let age = UILabel()
        age.textColor = UIColorFromRGB(rgbValue: 0x999999)
        age.font = UIFont.systemFont(ofSize: 12)
        return age

    }()
    lazy var diseaseLab:UILabel = {
        let disease = UILabel()
        disease.textColor = IDRGBColor(r: 0, g: 207, b: 165)
        disease.font = UIFont.systemFont(ofSize: 10)
        disease.layer.cornerRadius = 2
        disease.layer.masksToBounds = true
        disease.layer.borderColor = IDRGBColor(r: 0, g: 207, b: 165).cgColor
        return disease
    }()
    lazy var tipLab:UILabel = {
        let tip = UILabel()
        tip.textColor = UIColorFromRGB(rgbValue: 0xFD7C7E)
        tip.font = UIFont.systemFont(ofSize: 15)
        return tip
    }()
    lazy var rightImageView:UIImageView = {
        return UIImageView.init(image: UIImage.init(named: "next"))
    }()
    lazy var split:UIView = {
        let split = UIView()
        split.backgroundColor = UIColorFromRGB(rgbValue: 0xdddddd)
        return split
    }()
    
    var model:IDMHFollowUpModel?{
        didSet{
            self.headIcon.setImageWith(URL.init(string: (DugImageUrl + (model?.patientPhoto)!))!, placeholderImage: UIImage.init(named: "默认头像"))
            self.titleLab.text = model?.patientName;
            self.sexIcon.image = model?.sex == "男" ? UIImage.init(named:"man") :  UIImage.init(named:"women")
                
            self.ageLab.text = ("\(model?.patientAge ?? 0)"+"岁") ;
            self.tipLab.text = model?.state;
            if (model?.state == "待随访接") {
                self.tipLab.text = "待确认";
            }
            self.diseaseLab.text = model?.referralDiagName ?? "暂未填写"

        }
    }
    
    public  func cellWithTableView(tableView:UITableView)->IDWaitDoReferralOrAcceptCell{
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "IDWaitDoReferralOrAcceptCell")
        if cell==nil {
            cell = IDWaitDoReferralOrAcceptCell(style: .default, reuseIdentifier: "IDWaitDoReferralOrAcceptCell")
            
        }
        return cell as! IDWaitDoReferralOrAcceptCell
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpUI(){
        self.selectionStyle = .none
        self.addSubview(self.headIcon)
        self.addSubview(self.titleLab)
        self.addSubview(self.sexIcon)
        self.addSubview(self.ageLab)
        self.addSubview(self.diseaseLab)
        self.addSubview(self.tipLab)
        self.addSubview(self.rightImageView)
        self.addSubview(self.split)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLab.x = self.headIcon.frame.maxX + 10;
        self.titleLab.y = 15;
        self.titleLab.sizeToFit()
        
        self.sexIcon.frame = CGRect.init(x: self.titleLab.frame.maxX + 9, y: self.titleLab.y + 3, width: 15, height: 15)
        
        self.ageLab.frame = CGRect.init(x: self.sexIcon.frame.maxX + 5, y: self.titleLab.y + 3, width: 10, height: 10)
        self.ageLab.sizeToFit()
        
        self.diseaseLab.frame = CGRect.init(x: self.titleLab.x, y: self.titleLab.frame.maxY + 8, width: 10, height: 10)
        self.diseaseLab.sizeToFit()
        
        self.tipLab.frame = CGRect.init(x: kScreenWidth - 30 - 45, y: 25, width: 10, height: 10)
        self.tipLab.sizeToFit()
        
        self.rightImageView .frame = CGRect.init(x: kScreenWidth - 15 - 7, y: self.tipLab.y + 4, width: 7, height: 10)
        
        self.split.frame = CGRect.init(x: 75, y: self.height - 0.5, width: kScreenWidth - 75, height: 0.5)
    }
    
    
    
}
