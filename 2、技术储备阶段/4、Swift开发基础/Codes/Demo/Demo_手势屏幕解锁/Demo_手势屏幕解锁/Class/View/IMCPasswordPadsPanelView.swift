//
//  IMCPasswordPanelView.swift
//  Demo_手势屏幕解锁
//
//  Created by xiangluzhang on 15/11/12.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

import UIKit

@objc protocol IMCPasswordPadsPanelViewDelegate : NSObjectProtocol {
    /*
    *   用户完成输入后通知代理
    **/
    optional func passwordPadsPanelView(passwordPadsPanelView: IMCPasswordPadsPanelView, didFinishInputPassword password: IMCPasswordModel);
}


class IMCPasswordPadsPanelView: UIView {
    
    lazy var passwordPads: NSMutableArray = []
    lazy var touchedPasswordPads: NSMutableArray = []
    
    var delegate: IMCPasswordPadsPanelViewDelegate?
    
    let passwordModel = IMCPasswordModel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0))
        
        backgroundColor = UIColor.clearColor()
        
        for _ in 0..<9 {
            let passwordPad = UIButton(type: .Custom)
            passwordPad.userInteractionEnabled = false
            
            passwordPad.setImage(UIImage(named: "gesture_node_normal"), forState: .Normal)
            passwordPad.setImage(UIImage(named: "gesture_node_highlighted"), forState: .Selected)
            
            passwordPads.addObject(passwordPad)
            
            self.addSubview(passwordPad)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let passwordPadsVerticalSpace = (self.bounds.height - 74.0 * 3) / 2.0
        let passwordPadsHorizontalSpace = (self.bounds.width - 74.0 * 3) / 2.0
        
        var passwordPadIndex = 0
        for i in 0...2 {
            //计算行centerY
            let passwordPadsRowCenterY = (74.0  + passwordPadsVerticalSpace) * CGFloat(i) + 74.0 * 0.5
            
            for j in 0...2 {
                let passwordPad = passwordPads[passwordPadIndex] as! UIButton
                
                //设置按钮尺寸
                passwordPad.bounds = CGRect(x: 0.0, y: 0.0, width: 74.0, height: 74.0)
                
                //设置按钮位置
                let passwordPadCenterX = (74.0 + passwordPadsHorizontalSpace) * CGFloat(j) + 74.0 * 0.5
                passwordPad.center = CGPoint(x: passwordPadCenterX, y: passwordPadsRowCenterY)
                
                passwordPadIndex++
            }
            
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touchPoint = (touches as NSSet).anyObject()?.locationInView(self)
        
        //如果不是nil则自动拆包，自动绑定
        if let touchedPasswordPad = passwordPadInTouchPoint(touchPoint!) {
            touchedPasswordPad.selected = true
            touchedPasswordPads.addObject(touchedPasswordPad)
        }
        
        //需要重新绘制
        setNeedsDisplay()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touchPoint = (touches as NSSet).anyObject()?.locationInView(self)
        
        if let touchedPasswordPad = passwordPadInTouchPoint(touchPoint!) {
            if !touchedPasswordPad.selected {
                touchedPasswordPad.selected = true
                touchedPasswordPads.addObject(touchedPasswordPad)
            }
            
        }
        
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //将按钮恢复之前的状态
        for touchedPasswordPadIndex in 0..<touchedPasswordPads.count {
            let touchedPasswordPad = touchedPasswordPads[touchedPasswordPadIndex] as! UIButton
            touchedPasswordPad.selected = false
            
            switch touchedPasswordPadIndex {
            case 0:
                passwordModel.firstBit = touchedPasswordPadIndex
            case 1:
                passwordModel.secondBit = touchedPasswordPadIndex
            case 2:
                passwordModel.thirdBit = touchedPasswordPadIndex
            case 3:
                passwordModel.fourthBit = touchedPasswordPadIndex
            case 4:
                passwordModel.fifthBit = touchedPasswordPadIndex
            case 5:
                passwordModel.sixthBit = touchedPasswordPadIndex
            case 6:
                passwordModel.seventhBit = touchedPasswordPadIndex
            case 7:
                passwordModel.eighthBit = touchedPasswordPadIndex
            case 8:
                passwordModel.ninthBit = touchedPasswordPadIndex
            default:
                break
            }
        }
        
        if let selfDelegate = delegate {
            if selfDelegate.respondsToSelector("passwordPadsPanelView") {
                selfDelegate.passwordPadsPanelView!(self, didFinishInputPassword: passwordModel)
            }
        }
        
        touchedPasswordPads.removeAllObjects()
        setNeedsDisplay()
    }
    
    func passwordPadInTouchPoint(touchePoint: CGPoint) -> UIButton? {
        var passwordPadInTouchPoint: UIButton? = nil;
        for passwordPad in passwordPads {
            if CGRectContainsPoint(passwordPad.frame, touchePoint) {
                passwordPadInTouchPoint = passwordPad as? UIButton
                break
            }
        }
        return passwordPadInTouchPoint
    }

    
    override func drawRect(rect: CGRect) {
        let touchedPasswordPadsCount = touchedPasswordPads.count
        
        if touchedPasswordPadsCount <= 0 {
            return
        }
        
        //有按钮，则绘制
        let touchedMovePath: UIBezierPath = UIBezierPath() //创建路径
        touchedMovePath.lineWidth = 8 //线宽
        UIColor.blueColor().set() //颜色
        
        for touchedPasswordPadIndex in 0..<touchedPasswordPadsCount {
            let touchedPasswordPad: UIButton = touchedPasswordPads.objectAtIndex(touchedPasswordPadIndex) as! UIButton
            
            //第一个按钮（每次绘制的起点）
            if touchedPasswordPadIndex == 0 {
                touchedMovePath.moveToPoint(touchedPasswordPad.center)
            }
            else {
                touchedMovePath.addLineToPoint(touchedPasswordPad.center)
            }
        }
        
        touchedMovePath.stroke() //绘制
    }


}
