//
//  IMCLoginViewController.swift
//  Demo_ReactiveCocoa
//
//  Created by xiangluzhang on 16/2/2.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

import UIKit

import ReactiveCocoa

class IMCLoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var inputCheckFailedLabel: UILabel!
    
    let loginInfoViewModel: IMCLoginInfoViewModel = IMCLoginInfoViewModel()
    
    var loginRequestAction: CocoaAction!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //设置导航栏标题
        self.title = "登录界面"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    func bindViewModel() {
        //viewModel绑定textField
        let usernameTextFieldSignalProducer = usernameTextField.rac_textSignal().toSignalProducer()
            .flatMapError { _ in
                return SignalProducer<AnyObject?,NoError>.empty
            }.map {
                $0 as! String
        }
        loginInfoViewModel.username <~ usernameTextFieldSignalProducer
        
        //viewModel绑定textField
        let passwordTextFieldSignalProducer = passwordTextField.rac_textSignal().toSignalProducer()
            .flatMapError { _ in
                return SignalProducer<AnyObject?, NoError>.empty
            }
            .map {
                $0 as! String
        }
        loginInfoViewModel.password <~ passwordTextFieldSignalProducer
        
        //Button绑定viewModel
        loginInfoViewModel.usernameIsValid.producer
            .observeOn(UIScheduler())
            .map{usernameIsValid in
                return usernameIsValid ? UIColor.clearColor() : UIColor.yellowColor()
            }
            .startWithNext{[weak self] color in
                self?.usernameTextField.backgroundColor = color
            }
        
        loginInfoViewModel.passwordIsValid.producer
            .observeOn(UIScheduler())
            .map {passwordIsValid in
                return passwordIsValid ? UIColor.clearColor() : UIColor.yellowColor()
            }
            .startWithNext{[weak self] color in
                self?.passwordTextField.backgroundColor = color
            }
        
        //合并两个信号
        let combineInputValidSignalProducer = combineLatest(loginInfoViewModel.usernameIsValid.producer, loginInfoViewModel.passwordIsValid.producer)
        
        combineInputValidSignalProducer.map {(usernameIsValid,passwordIsValid) in
                return usernameIsValid && passwordIsValid
            }
            .startWithNext{[weak self] next in
                self?.loginButton.enabled = next
            }
        
        
//        loginInfoViewModel.inputIsValid.producer
//            .observeOn(UIScheduler())
//            .startWithNext{ [weak self] inputIsValid in
//                self?.loginButton.enabled = inputIsValid
//            }
        
        loginRequestAction = CocoaAction(loginInfoViewModel.action,{[unowned self] _ in
            return (self.usernameTextField.text!,self.passwordTextField.text!)
            })

        //处理点击事件(提交到ViewModel进行校验)
        loginButton .addTarget(loginRequestAction, action: CocoaAction.selector, forControlEvents: .TouchUpInside)
        
        loginInfoViewModel.loginResponsedSignal
            .observeOn(UIScheduler())
            .observeNext {[unowned self] next in
                if next {
                    self.performSegueWithIdentifier("IMCMainViewController", sender: self)
                }
                // 用户名和密码校验失败，显示一句话提示
                else {
                    
                    // TODO: 要从这里开始控制相关控件
                    self.inputCheckFailedLabel.hidden = false;
                }
            }
        
    }

    
//    func loginButtonClickedAction(button: UIButton) {
//        print("button->\(button)")
//    }
    
    /**
    *  转场，准备参数
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "IMCMainViewController" {
            let mainViewController = segue.destinationViewController as! IMCMainViewController
            
            //将值设置给viewmodel
            mainViewController.mainViewModel = IMCMainViewModel(username: self.usernameTextField.text!, password: self.passwordTextField.text!)
        }
    }


}
