//
//  IMCMainViewController.swift
//  Demo_手势屏幕解锁
//
//  Created by xiangluzhang on 15/11/12.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

import UIKit

class IMCMainViewController: UIViewController {

    @IBAction func settingPasswordButtonClickedAction(sender: UIButton) {
        let settingPasswordViewController = IMCSettingPasswordViewController(nibName: "IMCSettingPasswordViewController",bundle: NSBundle.mainBundle())
        self.presentViewController(settingPasswordViewController, animated: true, completion: nil)
    }
    
    @IBAction func checkingPasswordButtonClickedAction(sender: UIButton) {
        let checkingPasswordViewController = IMCCheckingPasswordViewController(nibName: "IMCCheckingPasswordViewController",bundle: nil)
        self.presentViewController(checkingPasswordViewController, animated: true, completion: nil)
    }
   
    @IBAction func resettingPasswordButtonClickedAction(sender: UIButton) {
        let resettingPasswordViewController = IMCResettingPasswordViewController(nibName: "IMCResettingPasswordViewController",bundle: nil)
        self.presentViewController(resettingPasswordViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
