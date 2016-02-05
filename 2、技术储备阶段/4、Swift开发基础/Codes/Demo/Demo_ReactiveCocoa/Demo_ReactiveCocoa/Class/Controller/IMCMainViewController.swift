//
//  IMCMainViewController.swift
//  Demo_ReactiveCocoa
//
//  Created by xiangluzhang on 16/2/2.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

import UIKit

class IMCMainViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    var mainViewModel: IMCMainViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
    }

    func bindViewModel() {
        usernameLabel.text = mainViewModel.username
        passwordLabel.text = mainViewModel.password
    }

}
