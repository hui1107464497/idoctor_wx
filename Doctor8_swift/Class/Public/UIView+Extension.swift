//
//  UIView+Extension.swift
//  drwd
//
//  Created by dengrui on 15/10/9.
//  Copyright © 2015年 dengrui. All rights reserved.
//

import UIKit

extension UIView {
    
    var width: CGFloat {
        get{
            return self.frame.width
        }
        set{
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var height: CGFloat {
        get{
            return self.frame.height
        }
        set{
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    var x: CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    var y: CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var centerX: CGFloat {
        get{
            return self.center.x
        }
        set{
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    
    var centerY: CGFloat {
        get{
            return self.center.y
        }
        set{
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    var size: CGSize {
        
        get{
            return self.frame.size
        }
        set{
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    var origin: CGPoint {
        get{
            return self.frame.origin
        }
        set{
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    
    
    var bottomRight: CGPoint {
        get{
            let x = self.frame.origin.x + self.frame.size.width
            let y = self.frame.origin.y + self.frame.size.height
            return CGPoint(x: x, y: y)
        }
    }
    
    var bottomLeft: CGPoint {
        get{
            let x = self.frame.origin.x
            let y = self.frame.origin.y + self.frame.size.height
            return CGPoint(x: x, y: y)
        }
    }
    
    var topRight: CGPoint{
        get{
            let x = self.frame.origin.x + self.frame.size.width
            let y = self.frame.origin.y
            return CGPoint(x: x, y: y)
        }
    }
    
    var topLeft: CGPoint{
        get{
            let x = self.frame.origin.x
            let y = self.frame.origin.y
            return CGPoint(x: x, y: y)
        }
    }
    
    
    var Top :CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            var newframe = self.frame;
            newframe.origin.y = newValue;
            self.frame = newframe;
        }
    }
    
    var Left: CGFloat {
        get {return self.frame.origin.x}
        set{
            var newframe = self.frame;
            newframe.origin.x = newValue;
            self.frame = newframe;
        }
    }
    var Bottom:CGFloat {
        get{
            return self.frame.origin.y + self.frame.size.height
        }
        set{
            var newframe = self.frame;
            newframe.origin.y = newValue - self.frame.size.height;
            self.frame = newframe;
        }
    }
    
    var Right: CGFloat {
        get{
           return self.frame.origin.x + self.frame.size.width
        }
        set{
            let delta = newValue - (self.frame.origin.x + self.frame.size.width);
            var newframe = self.frame;
            newframe.origin.x += delta ;
            self.frame = newframe;
        }
    }
    
}

