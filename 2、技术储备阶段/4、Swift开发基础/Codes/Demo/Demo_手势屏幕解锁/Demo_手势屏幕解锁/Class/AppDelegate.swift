//
//  AppDelegate.swift
//  Demo_手势屏幕解锁
//
//  Created by xiangluzhang on 15/11/12.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow()
        
        window?.frame = UIScreen.mainScreen().bounds
        window?.backgroundColor = UIColor.whiteColor()
        window?.makeKeyAndVisible()
        
        let mainViewController = IMCMainViewController(nibName: "IMCMainViewController", bundle: NSBundle.mainBundle())
        
        window?.rootViewController = mainViewController
        
        return true
    }

    


}

