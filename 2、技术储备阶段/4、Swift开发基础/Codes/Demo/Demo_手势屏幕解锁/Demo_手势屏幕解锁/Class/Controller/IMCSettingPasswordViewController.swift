//
//  IMCSettingPasswordViewController.swift
//  Demo_手势屏幕解锁
//
//  Created by xiangluzhang on 15/11/12.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

import UIKit

class IMCSettingPasswordViewController: UIViewController, IMCPasswordPadsPanelViewDelegate {

    weak var titleLabel: UILabel?
    weak var passwordThumbnailView: UIImageView?
    weak var statusLabel: UILabel?
    weak var passwordPadsPanelView: IMCPasswordPadsPanelView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTitleLabel()
        
        initPasswordThumbnailView()
        
        initStatusLabel()
        
        initPasswordPanelView()
    }
    
    /*
    *   初始化标题
    **/
    func initTitleLabel() {
        let titleLabel = UILabel()
        titleLabel.text = "设置密码"
        titleLabel.textColor = UIColor.greenColor()
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.font = UIFont.systemFontOfSize(25.0)
        //titleLabel.backgroundColor = UIColor.redColor()
        
        //加入父视图
        self.view.addSubview(titleLabel)
        //连线
        self.titleLabel = titleLabel
        
        //自动布局
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint_titleLabel_w = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(constraint_titleLabel_w)
        
        let constraint_titleLabel_h = NSLayoutConstraint(item: titleLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 44.0)
        titleLabel.addConstraint(constraint_titleLabel_h)
        
        let constraint_titleLable_top = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 44.0)
        self.view.addConstraint(constraint_titleLable_top)
    }
    
    /*
    *   初始化提示图片
    **/
    func initPasswordThumbnailView() {
        let passwordThumbnailView = UIImageView(image: UIImage(named: "secret"))
        self.view.addSubview(passwordThumbnailView)
        
        self.passwordThumbnailView = passwordThumbnailView;
        
        passwordThumbnailView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint_passwordThumbnailView_w = NSLayoutConstraint(item: passwordThumbnailView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 70.0)
        passwordThumbnailView.addConstraint(constraint_passwordThumbnailView_w)
        
        let constraint_passwordThumbnailView_h = NSLayoutConstraint(item: passwordThumbnailView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 60.0)
        passwordThumbnailView.addConstraint(constraint_passwordThumbnailView_h)
        
        let constraint_passwordThumbnailView_top = NSLayoutConstraint(item: passwordThumbnailView, attribute: .Top, relatedBy: .Equal, toItem: self.titleLabel, attribute: .Bottom, multiplier: 1.0, constant: 10.0)
        self.view.addConstraint(constraint_passwordThumbnailView_top)
        
        let constraint_passwordThumnailView_centerX = NSLayoutConstraint(item: passwordThumbnailView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(constraint_passwordThumnailView_centerX)
    }
    
    /*
    *   初始化状态标签
    **/
    func initStatusLabel() {
        let statusLabel = UILabel()
        statusLabel.textColor = UIColor.orangeColor()
        statusLabel.text = "请设置新密码"
        //statusLabel.textColor = UIColor.redColor()
        statusLabel.textAlignment = NSTextAlignment.Center
        statusLabel.font = UIFont.systemFontOfSize(18.0)
        
        self.view.addSubview(statusLabel)
        
        self.statusLabel = statusLabel
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint_statusLabel_w = NSLayoutConstraint(item: statusLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(constraint_statusLabel_w)
        
        let constraint_statusLabel_top = NSLayoutConstraint(item: statusLabel, attribute: .Top, relatedBy: .Equal, toItem: self.passwordThumbnailView, attribute: .Bottom, multiplier: 1.0, constant: 15.0)
        self.view.addConstraint(constraint_statusLabel_top)
        
        let constraint_statusLabel_centerX = NSLayoutConstraint(item: statusLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(constraint_statusLabel_centerX)
    }
    
    /*
    *   初始化密码面板
    **/
    func initPasswordPanelView() {
        let passwordPadsPanelView = IMCPasswordPadsPanelView()
        passwordPadsPanelView.delegate = self
        
        //passwordPanelView.backgroundColor = UIColor.purpleColor()
        self.view.addSubview(passwordPadsPanelView)
        
        self.passwordPadsPanelView = passwordPadsPanelView
        
        passwordPadsPanelView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint_passwordPadsPanelView_top = NSLayoutConstraint(item: passwordPadsPanelView, attribute: .Top, relatedBy: .Equal, toItem: self.statusLabel, attribute: .Bottom, multiplier: 1.0, constant: 50.0)
        self.view.addConstraint(constraint_passwordPadsPanelView_top)
        
        let constraint_passwordPadsPanelView_bottom = NSLayoutConstraint(item: passwordPadsPanelView, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -50.0)
        self.view.addConstraint(constraint_passwordPadsPanelView_bottom)
        
        let constraint_passwordPadsPanelView_leading = NSLayoutConstraint(item: passwordPadsPanelView, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1.0, constant: 30.0)
        self.view.addConstraint(constraint_passwordPadsPanelView_leading)
        
        let constraint_passwordPadsPanelView_trailing = NSLayoutConstraint(item: passwordPadsPanelView, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Trailing, multiplier: 1.0, constant: -30.0)
        self.view.addConstraint(constraint_passwordPadsPanelView_trailing)
        
        
    }
    
    // MARK: - IMCPasswordPadsPanelView Delegate Methods
    func passwordPadsPanelView(passwordPadsPanelView: IMCPasswordPadsPanelView, didFinishInputPassword password: IMCPasswordModel) {
        if password.fourthBit == nil {
            statusLabel!.textColor = UIColor.redColor()
            statusLabel!.text = "请至少连接4个点!"
            
            return
        }
        
        let cachePath = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).last!
        let archiverFilePath = cachePath.stringByAppendingString("/data.achiver")
        
        let passwordModel = NSKeyedUnarchiver.unarchiveObjectWithFile(archiverFilePath) as? IMCPasswordModel
        if passwordModel == nil {
            NSKeyedArchiver.archiveRootObject(password, toFile: archiverFilePath)
            
            statusLabel!.textColor = UIColor.orangeColor()
            statusLabel!.text = "请重复输入以确认!"
            
            return
        }
        
        var checkResult = true
        if let firstBit = password.firstBit {
            if firstBit != passwordModel!.firstBit! {
                checkResult = false
            }
        }
        
        if !checkResult {
            statusLabel!.textColor = UIColor.orangeColor()
            statusLabel!.text = "两次输入不一致，请重新输入!"
            
            let fileManager = NSFileManager.defaultManager()
            if fileManager.isDeletableFileAtPath(archiverFilePath) {
                do {
                    try fileManager.removeItemAtPath(archiverFilePath)
                }catch {
                    print("归档文件删除时，抛出异常")
                }
            }
            
            return
        }
        
        if let secondBit = password.secondBit {
            if secondBit != passwordModel!.secondBit! {
                checkResult = false
            }
        }
        
        if !checkResult {
            statusLabel!.textColor = UIColor.orangeColor()
            statusLabel!.text = "两次输入不一致，请重新输入!"
            
            let fileManager = NSFileManager.defaultManager()
            if fileManager.isDeletableFileAtPath(archiverFilePath) {
                do {
                    try fileManager.removeItemAtPath(archiverFilePath)
                }catch {
                    print("归档文件删除时，抛出异常")
                }
            }
            
            return
        }

        
        if let thirdBit = password.thirdBit {
            if thirdBit != passwordModel!.thirdBit! {
                checkResult = false
            }
        }
        
        if !checkResult {
            statusLabel!.textColor = UIColor.orangeColor()
            statusLabel!.text = "两次输入不一致，请重新输入!"
            
            let fileManager = NSFileManager.defaultManager()
            if fileManager.isDeletableFileAtPath(archiverFilePath) {
                do {
                    try fileManager.removeItemAtPath(archiverFilePath)
                }catch {
                    print("归档文件删除时，抛出异常")
                }
            }
            
            return
        }

        
        if let fourthBit = password.fourthBit {
            if fourthBit != passwordModel!.fourthBit! {
                checkResult = false
            }
        }
        
        if !checkResult {
            statusLabel!.textColor = UIColor.orangeColor()
            statusLabel!.text = "两次输入不一致，请重新输入!"
            
            let fileManager = NSFileManager.defaultManager()
            if fileManager.isDeletableFileAtPath(archiverFilePath) {
                do {
                    try fileManager.removeItemAtPath(archiverFilePath)
                }catch {
                    print("归档文件删除时，抛出异常")
                }
            }
            
            return
        }

        
        if let lastFifthBit = passwordModel!.fifthBit {
            if let fifthBit = password.fifthBit {
                checkResult = fifthBit == lastFifthBit
            } else {
                checkResult = false
            }
        } else {
            if password.fifthBit != nil  {
                checkResult = false
            }
        }
        
        if !checkResult {
            statusLabel!.textColor = UIColor.orangeColor()
            statusLabel!.text = "两次输入不一致，请重新输入!"
            
            let fileManager = NSFileManager.defaultManager()
            if fileManager.isDeletableFileAtPath(archiverFilePath) {
                do {
                    try fileManager.removeItemAtPath(archiverFilePath)
                }catch {
                    print("归档文件删除时，抛出异常")
                }
            }
            
            return
        }

        
        if let lastSixthBit = passwordModel!.sixthBit {
            if let sixthBit = password.sixthBit {
                checkResult = lastSixthBit == sixthBit
            } else {
                checkResult = false
            }
        } else {
            if password.sixthBit != nil {
                checkResult = false
            }
        }
        
        if !checkResult {
            statusLabel!.textColor = UIColor.orangeColor()
            statusLabel!.text = "两次输入不一致，请重新输入!"
            
            let fileManager = NSFileManager.defaultManager()
            if fileManager.isDeletableFileAtPath(archiverFilePath) {
                do {
                    try fileManager.removeItemAtPath(archiverFilePath)
                }catch {
                    print("归档文件删除时，抛出异常")
                }
            }
            
            return
        }

        
        if let lastSeventhBit = passwordModel!.seventhBit {
            if let seventhBit = password.seventhBit {
                checkResult = lastSeventhBit == seventhBit
            } else {
                checkResult = false
            }
        } else {
            if password.seventhBit != nil {
                checkResult = false
            }
        }
        
        if !checkResult {
            statusLabel!.textColor = UIColor.orangeColor()
            statusLabel!.text = "两次输入不一致，请重新输入!"
            
            let fileManager = NSFileManager.defaultManager()
            if fileManager.isDeletableFileAtPath(archiverFilePath) {
                do {
                    try fileManager.removeItemAtPath(archiverFilePath)
                }catch {
                    print("归档文件删除时，抛出异常")
                }
            }
            
            return
        }

        
        if let lastEighthBit = passwordModel!.eighthBit {
            if let eighthBit = password.eighthBit {
                checkResult = lastEighthBit == eighthBit
            } else {
                checkResult = false
            }
        } else {
            if password.eighthBit != nil {
                checkResult = false
            }
        }
        if !checkResult {
            statusLabel!.textColor = UIColor.orangeColor()
            statusLabel!.text = "两次输入不一致，请重新输入!"
            
            let fileManager = NSFileManager.defaultManager()
            if fileManager.isDeletableFileAtPath(archiverFilePath) {
                do {
                    try fileManager.removeItemAtPath(archiverFilePath)
                }catch {
                    print("归档文件删除时，抛出异常")
                }
            }
            
            return
        }

        
        if let lastNinthBit = passwordModel!.ninthBit {
            if let ninthBit = password.ninthBit {
                checkResult = lastNinthBit == ninthBit
            } else {
                checkResult = false
            }
        } else {
            if password.ninthBit != nil {
                checkResult = false
            }
        }
        
        if !checkResult {
            statusLabel!.textColor = UIColor.orangeColor()
            statusLabel!.text = "两次输入不一致，请重新输入!"
            
            let fileManager = NSFileManager.defaultManager()
            if fileManager.isDeletableFileAtPath(archiverFilePath) {
                do {
                    try fileManager.removeItemAtPath(archiverFilePath)
                }catch {
                    print("归档文件删除时，抛出异常")
                }
            }
            
            return
        }

        //都验证成功时，提示用户成功
        statusLabel!.textColor = UIColor.greenColor()
        statusLabel!.text = "恭喜您！密码设置成功!"
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

}







