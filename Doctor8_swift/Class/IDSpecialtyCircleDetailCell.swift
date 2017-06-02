//
//  IDSpecialtyCircleDetailCell.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/5/31.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit

class IDSpecialtyCircleDetailCell: UITableViewCell {
}

class IDActivityCell: UITableViewCell {
    
    var split1:UIView!
    var avatar:UIImageView!
    var nameLab:UILabel!
    var sizeLab:UILabel!
    var spaceLab:UILabel!
    var ctimeLab:UILabel!
    var tagLab1:UILabel!
    var tagLab2:UILabel!
    var speakLab:UILabel!
    var speakerNameLab:UILabel!
    var titleAndDept:UILabel!
    var hospLab:UILabel!
    var startTimeLab:UILabel!
    var noDataView:UIView!
    var dataView:UIView!
    var tipLab:UILabel!
    var sendBtn:UIButton!
    
    var isFromHome:Bool = false
    
    public  func activityCellWithTableView(tableView:UITableView)->IDActivityCell{
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "IDActivityCell")
        if cell==nil {
            cell = IDActivityCell(style: .default, reuseIdentifier: "IDActivityCell")
            
        }
        return cell as! IDActivityCell
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI(){
        self.backgroundColor = UIColorFromRGB(rgbValue: 0xf0f1f5);
    
        self.noDataView = UIView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 118))
        self.noDataView.backgroundColor = UIColor.white
        self .addSubview(self.noDataView)
        
        let iconV = UIImageView(frame: CGRect.init(x: kScreenWidth*0.5-58*0.5, y: 10, width: 58, height: 58))
        iconV.image = UIImage(named: "zkqwzt_activity")
        self.noDataView .addSubview(iconV)
        
        let sendBtn = UIButton(frame: CGRect.init(x: kScreenWidth*0.5-74*0.5, y: iconV.frame.origin.y + iconV.bounds.size.height + 12, width: 74, height: 25))
        sendBtn.setTitle("发起活动", for: .normal)
        sendBtn.setTitleColor(IDRGBColor(r: 0, g: 207, b: 165), for: .normal)
        sendBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13);
        sendBtn.layer.borderColor = IDRGBColor(r: 0, g: 207, b: 165).cgColor;
        sendBtn.layer.borderWidth = 0.5;
        sendBtn.layer.cornerRadius = 13;
        sendBtn.layer.masksToBounds = true;
        sendBtn.addTarget(self, action: Selector(("didToSend:")), for: .touchUpInside)
        self.noDataView .addSubview(sendBtn)
        self.sendBtn = sendBtn;
        
        let tipLab = UILabel(frame: CGRect.init(x: kScreenWidth*0.5-74*0.5, y: iconV.frame.origin.y + iconV.bounds.size.height + 12, width: 74, height: 25))
        tipLab.text = "暂无专科活动";
        tipLab.textColor = UIColorFromRGB(rgbValue: 0x999999);
        tipLab.font = UIFont.systemFont(ofSize: 12)
        self.noDataView .addSubview(tipLab)
        self.tipLab = tipLab;
        
        let  lay  = UIView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 210))
        lay.backgroundColor = UIColor.white
        self .addSubview(lay)
        self.dataView = lay;
        
        self.ctimeLab = UILabel()
        self.ctimeLab.font = UIFont.systemFont(ofSize: 11);
        self.ctimeLab.textColor = UIColorFromRGB(rgbValue:  0xcccccc);
        self.ctimeLab.textAlignment = .right;
        lay.addSubview(self.ctimeLab);
        
        self.split1 = UIView()
        self.split1.backgroundColor = UIColorFromRGB(rgbValue:  0xefefef);
        lay.addSubview(self.split1);
        
        self.avatar = UIImageView()
        self.avatar.image = UIImage(named: "默认头像")
        self.avatar.layer.cornerRadius = 50*0.5;
        self.avatar.layer.masksToBounds = true;
        lay.addSubview(self.avatar);
        
        self.nameLab = UILabel()
        self.nameLab.font = UIFont.systemFont(ofSize: 16);
        self.nameLab.textColor = UIColorFromRGB(rgbValue:  0x333333);
        lay.addSubview(self.nameLab);
        
        self.tagLab1 = UILabel()
        self.tagLab1.font = UIFont.systemFont(ofSize: 10);
        self.tagLab1.textColor = UIColor.white
        self.tagLab1.backgroundColor = UIColorFromRGB(rgbValue:  0xFA716A);
        self.tagLab1.layer.cornerRadius = 2;
        self.tagLab1.layer.masksToBounds = true;
        lay .addSubview(self.tagLab1);
        
        self.tagLab2 = UILabel()
        self.tagLab2.font = UIFont.systemFont(ofSize: 10)
        self.tagLab2.textColor = UIColor.white
        self.tagLab2.backgroundColor = UIColorFromRGB(rgbValue:  0xFABD65);
        self.tagLab2.layer.cornerRadius = 2;
        self.tagLab2.layer.masksToBounds = true;
        lay.addSubview(self.tagLab2);
        
        self.speakLab = UILabel()
        self.speakLab.font = UIFont.systemFont(ofSize: 13)
        self.speakLab.textColor = UIColorFromRGB(rgbValue:  0x666666);
        self.speakLab.text = "主讲人:";
        self.speakLab.sizeToFit()
        lay.addSubview(self.speakLab);
        
        self.speakerNameLab = UILabel()
        self.speakerNameLab.textColor = UIColorFromRGB(rgbValue:  0x333333);
        self.speakerNameLab.font = UIFont.systemFont(ofSize: 15)
        lay.addSubview(self.speakerNameLab);
        
        self.titleAndDept = UILabel()
        self.titleAndDept.textColor = UIColorFromRGB(rgbValue:  0x777777);
        self.titleAndDept.font = UIFont.systemFont(ofSize: 13)
        lay.addSubview(self.titleAndDept);
        
        self.hospLab = UILabel();
        self.hospLab.textColor = UIColorFromRGB(rgbValue:  0x777777);
        self.hospLab.font = UIFont.systemFont(ofSize: 13);
        lay.addSubview(self.hospLab);
        
        self.sizeLab = UILabel()
        self.sizeLab.font = UIFont.systemFont(ofSize: 13);
        self.sizeLab.textColor = UIColorFromRGB(rgbValue:  0x666666);
        self.sizeLab.sizeToFit()
        lay.addSubview(self.sizeLab)
        
        
        self.spaceLab = UILabel()
        self.spaceLab.font = UIFont.systemFont(ofSize: 13)
        self.spaceLab.textColor = UIColorFromRGB(rgbValue:  0x666666);
        self.spaceLab.sizeToFit();
        lay.addSubview(self.spaceLab)
        
        self.startTimeLab = UILabel()
        self.startTimeLab.font = UIFont.systemFont(ofSize: 12)
        self.startTimeLab.textColor = UIColorFromRGB(rgbValue:  0x999999);
        self.startTimeLab.sizeToFit();
        lay.addSubview(self.startTimeLab)
    }
    
    
    var model:IDActivityModel? {
        didSet {
            if model==nil || (model?.id?.isEmpty)! {
                self.noDataView.isHidden = false;
                self.dataView.isHidden = true;
                if (self.isFromHome) {//首页不可以发起活动
                    self.tipLab.isHidden = false;
                    self.sendBtn.isHidden = true;
                }else{
                    self.tipLab.isHidden = true;
                    self.sendBtn.isHidden = false;
                }
            }else{
                self.noDataView.isHidden = true;
                self.dataView.isHidden = false;
                self.avatar.setImageWith(URL.init(string: (model!.photoUrl)!)! , placeholderImage: UIImage.init(named: "默认头像"))
                
                self.nameLab.text = model!.eventName!;
               // let range  = model!.createDate?.index(after: " ")
                //self.ctimeLab.text = model!.createDate!.substring(to:range.index)
                    
                self.tagLab1.text = " \(String(describing: model!.doctorPay!)) "
                self.tagLab2.text = " \(model?.doctorPayType! ?? "")"
                self.sizeLab.text = "规模：\(model?.allCount! ?? "")人"
                self.speakerNameLab.text = model?.speakerName;
                self.titleAndDept.text = "\(model?.speakerTitle! ?? "") | \(model?.speakerDept! ?? "")"
                self.hospLab.text = model?.speakerHosp;
                self.spaceLab.text = "地点：\(model?.address! ?? "")"
               /* let startStr = model!.startTime.stringByReplacingOccurrencesOfString("-",".").substringToIndex(16)
                let endStr = model!.endTime.stringByReplacingOccurrencesOfString("-",".").substringToIndex(16)
                self.startTimeLab.text = "时间：\(startStr)-\(endStr)"*/
                    
            }
        }
    }
    
   @objc private func didToSend(btn:UIButton){
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatar.frame = CGRect.init(x: 10, y: 15, width: 50, height: 50)
        self.nameLab.frame = CGRect.init(x:self.avatar.frame.maxX + 15, y:15, width: 100, height:13);
        self.nameLab.sizeToFit()
        
        self.tagLab1.frame = CGRect.init(x:self.nameLab.x, y:self.nameLab.frame.maxY+10, width:100, height:13);
        self.tagLab1.sizeToFit();
        
        self.tagLab2.frame = CGRect.init(x:self.tagLab1.frame.maxX+3, y:self.tagLab1.y, width:100, height:13);
        self.tagLab2.sizeToFit();
        
        self.speakLab.frame = CGRect.init(x:self.nameLab.x, y:self.tagLab1.frame.maxY + 15, width:100,height: 13);
        self.speakLab.sizeToFit();
        
        self.speakerNameLab.frame = CGRect.init(x:self.speakLab.frame.maxX,y: self.tagLab1.frame.maxY + 14,width: 100, height:13);
        self.speakerNameLab.sizeToFit();
        
        self.titleAndDept.frame = CGRect.init(x:self.speakerNameLab.frame.maxX+8, y:self.speakLab.y, width:100,height: 13);
        self.titleAndDept.sizeToFit();
        
        self.hospLab.frame = CGRect.init(x:self.speakerNameLab.x, y:self.titleAndDept.frame.maxY + 10, width:100, height:13);
        self.hospLab.sizeToFit();
        
        self.split1.frame = CGRect.init(x:self.nameLab.x, y:self.hospLab.frame.maxY + 10, width: kScreenWidth - self.nameLab.x, height:0.5);
        
        self.sizeLab.frame = CGRect.init(x:self.nameLab.x,y: self.split1.frame.maxY + 8, width:100, height:13);
        self.sizeLab.sizeToFit();
        
        self.spaceLab.frame = CGRect.init(x:self.nameLab.x, y:self.sizeLab.frame.maxY + 10, width: 100, height:13);
        self.spaceLab.sizeToFit();
        
        self.startTimeLab.frame = CGRect.init(x:self.nameLab.x, y:self.spaceLab.frame.maxY + 10, width:kScreenWidth - self.nameLab.x - 5 , height: 13);
        //    [self.startTimeLab sizeToFit];
        
        self.ctimeLab.frame = CGRect.init(x:kScreenWidth - 15 - 80,y: 19, width:80,height: 12);
    }
    
}
