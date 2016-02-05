//
//  IMCLoginInfoViewModel.swift
//  Demo_ReactiveCocoa
//
//  Created by xiangluzhang on 16/2/2.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

import Foundation

import ReactiveCocoa

/*
*   1、一个特殊类型的model,反映app的UI状态
*   2、包括每个UI的详细状态，比如textField的内容，button的enable状态
*   3、Reactive Cocoa主要用于同步视图和它关联的ViewModel
**/
class IMCLoginInfoViewModel: NSObject {
    
    
    //Inputs
    let username = MutableProperty<String>("")
    let password = MutableProperty<String>("")
    
    /*
    *   Action输入类型，输出类型
    **/
    var action: Action<(String, String), Bool, NoError>!
    
    
//    let usernameIsValid = MutableProperty<Bool>(false)
//    let passwordIsValid = MutableProperty<Bool>(false)
    
    //Outputs
    let usernameIsValid = MutableProperty<Bool>(false)
    let passwordIsValid = MutableProperty<Bool>(false)
    
//    let loginResponsedSignal: Signal<Bool,NoError>
//    let loginResponsedObserver: Observer<Bool,NoError>
    
    //构建信号
    let (loginResponsedSignal, loginResponsedObserver) = Signal<Bool,NoError>.pipe()
    
    //数据模型
    lazy var loginInfoModel: IMCLoginInfoModel = IMCLoginInfoModel()
    
    //Service层
    lazy var loginService = IMCLoginService()
    
    override init() {
        super.init()
        
        
        //每个事件都有一个这样的过程
        let usernameSignalProducer = username.producer.on(
            //一个信号开始传送
            started: {
                print("started")
            },
            //一个信号的事件
            event: {event in
                print("event: \(event)")
            },
            //一个信号传送失败
            failed: {error in
                print("error: \(error)")
            },
            //传送完成
            completed: {
                print("completed")
            },
            //传送打断
            interrupted: {
                print("interrupted")
            },
            terminated: {
                print("terminated")
            },
            disposed: {
                print("disposed")
            },
            //传值事件
            next: {next in
                print("next: \(next)")
        })
        
//        usernameIsValid <~ username.producer.map{ text in
//            return text.characters.count >= 3
//        }
        
        usernameIsValid <~ username.producer.map{ text in
            return text.characters.count >= 3
        }
        
        
        passwordIsValid <~ password.producer.map{ text in
            return text.characters.count >= 3
        }
        
        
        //混合信号后，在处理型号中的值数据
//        let combineSignalProducer = combineLatest(usernameSignalProducer.map { text in
//                return text.characters.count >= 3
//            }, passwordSignalProducer.map {text in
//                return text.characters.count >= 3
//            })
//            .map { (usernameIsValid, passwordIsValid) in
//                return usernameIsValid && passwordIsValid
//            }
//
//        inputIsValid <~ combineSignalProducer
        
        action = Action<(String, String), Bool, NoError> {[unowned self] username, password in
            return SignalProducer<Bool,NoError> {observer, _ in
                //在这里执行点击按钮后执行的动作
                self.loginService.login(username, password: password, completion: { loginResult in
                    //loginResult ? print("用户名和密码校验成功") : print("用户名和密码校验失败")
                    
                    //向Controller层发送事件
                    self.loginResponsedObserver.sendNext(loginResult)
                    
                    //事件源(发送什么事件)
                    observer.sendCompleted()
                })
            }
        }
        
    }

}
