//
//  MHTabView.swift
//  Doctor8_swift
//
//  Created by ihaoyisheng on 2017/6/8.
//  Copyright © 2017年 Rabbij. All rights reserved.
//

import UIKit

class MHTabView: UIView ,UIScrollViewDelegate{
    static let kButtonWidth = UIScreen.main.bounds.size.width/3.0
    private var headScrollview:UIScrollView!
    public var contentScrollview :UIScrollView!
    private var buttonArr = NSMutableArray()
    private var lastButton:UIButton?
    private var moveView:UIView!
    private var allVC = NSArray()
//    public var titleArr:NSArray?
    public var headHeight:CGFloat = 40
    public var buttonFontSize:CGFloat = 14.0
    public var moveViewHeight:CGFloat = 2
    public var selectedColor:UIColor = UIColorFromRGB(rgbValue: 0x00CFA5)
    public var addChildBlock : ((Int)->())? //添加自控制器
    private var childVCStr:NSString?
    
    
    
    public func createView(_ frame:CGRect, titleArr:NSArray, childVC:NSString) {
        if titleArr.count>0 {
            headScrollview = UIScrollView(frame:CGRect.init(x: 0, y: 0, width: kScreenWidth, height: headHeight))
            headScrollview.contentSize = CGSize.init(width: MHTabView.kButtonWidth * CGFloat(titleArr.count), height: 40)
            headScrollview.showsHorizontalScrollIndicator = false;
            
            headScrollview.backgroundColor = UIColorFromRGB(rgbValue: 0xf0f1f5)
            
            
            for i in 0 ..< titleArr.count  {
                let button = UIButton()
                button.frame =  CGRect.init(x: CGFloat(i) * MHTabView.kButtonWidth, y: 0, width: MHTabView.kButtonWidth, height: headHeight-4)
//                button.backgroundColor = UIColor.orange
                button.setTitle(titleArr[i] as? String, for: .normal)
                button.setTitleColor(UIColorFromRGB(rgbValue: 0x999999), for: .normal)
                button.setTitleColor(selectedColor, for: .selected)
                button.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
                button.tag = i;
                button.addTarget(self, action: #selector(clickButton(sender:)), for: .touchUpInside)
                if (i==0) {
                    button.isSelected = true;
                    lastButton = button;
                }
                headScrollview.addSubview(button)
                self.buttonArr.add(button)
            }
            
            moveView = UIView(frame: CGRect.init(x: lastButton!.x + 10, y: headHeight - moveViewHeight-0.5, width: lastButton!.width - 20, height: moveViewHeight))
            moveView.centerX = lastButton!.centerX;
            moveView.backgroundColor = selectedColor;
            headScrollview.addSubview(moveView)
            
            let split = UIView(frame: CGRect.init(x: 0, y: headHeight-0.5, width: kScreenWidth, height: 0.5))
            split.backgroundColor = UIColorFromRGB(rgbValue: 0xdddddd);
            headScrollview.addSubview(split)
            self.addSubview(headScrollview)

            contentScrollview = UIScrollView(frame: CGRect.init(x: 0, y: 40, width: kScreenWidth, height: frame.height - 40))
            contentScrollview.backgroundColor = UIColorFromRGB(rgbValue: 0xf0f1f5);
            contentScrollview.tag = 102;
            contentScrollview.contentSize = CGSize.init(width: kScreenWidth * CGFloat(titleArr.count), height: contentScrollview.height)
            contentScrollview.showsHorizontalScrollIndicator = false;
            contentScrollview.showsVerticalScrollIndicator = false;
            contentScrollview.isPagingEnabled = true;
            contentScrollview.delegate = self;
            self.addSubview(contentScrollview)
        }
        
    }
   
    init(frame: CGRect ,titleArr: NSArray, childVCStr:NSString) {
        super.init(frame: frame)
        self.createView(frame, titleArr: titleArr, childVC: childVCStr)
        self.childVCStr = childVCStr
    }
    
//    private func addChildVC(){
//        if let addchild = addChildBlock {
//          self.allVC = addchild()
//        }
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//
    
    //MARK: - 按钮点击
    @objc private func clickButton(sender: UIButton){
        lastButton?.isSelected = false
        sender.isSelected = true;
        lastButton = sender;
        for  btn in self.buttonArr {
            let child =  btn as!UIButton
            if child == sender {
                child.isSelected = true
            }
        }
        
        //上方小的滑动视图的滚动
        let xx:CGFloat = kScreenWidth * CGFloat(sender.tag - 1) * (MHTabView.kButtonWidth / kScreenWidth) - MHTabView.kButtonWidth;
        headScrollview.scrollRectToVisible(CGRect.init(x: xx, y: 0, width: kScreenWidth, height: headScrollview.height), animated: true)
        
        //下方大的滑动视图的滚动
        let offsetX = CGFloat(sender.tag) * self.contentScrollview.frame.size.width;
        let offsetY = contentScrollview.contentOffset.y;
        let offset = CGPoint.init(x: offsetX, y: offsetY)
        contentScrollview.setContentOffset(offset, animated: true)
    }
    
    //MARK: - delegate
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if (scrollView.tag == 102) {
            let index = scrollView.contentOffset.x / self.contentScrollview.frame.size.width
            lastButton?.isSelected = false
            let button:UIButton = (headScrollview.subviews as NSArray)[Int(index)] as! UIButton
            button.isSelected = true;
            lastButton = button;
            moveView.centerX = button.centerX;
            //当前控制器
//            let newsVC = self.allVC[Int(index)] as! UIViewController
////            newsVC.tableView.mj_header.beginRefreshing()
////            if (newsVC.view.superview) return;
////            newsVC.view.frame = scrollView.bounds;
//            contentScrollview.addSubview(newsVC.view)
            if (self.addChildBlock != nil) {
                self.addChildBlock!(Int(index))
            }
        }else{
            
        }

    }
    
    
    /** 滚动结束（手势导致） */
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (scrollView.tag == 102) {
            self.scrollViewDidEndScrollingAnimation(scrollView)
            let xx = scrollView.contentOffset.x * (MHTabView.kButtonWidth / kScreenWidth) - MHTabView.kButtonWidth;
            headScrollview.scrollRectToVisible(CGRect.init(x: xx, y: 0, width: kScreenWidth, height: headScrollview.height), animated: true)
        }
        else{
            
        }
    }


}
