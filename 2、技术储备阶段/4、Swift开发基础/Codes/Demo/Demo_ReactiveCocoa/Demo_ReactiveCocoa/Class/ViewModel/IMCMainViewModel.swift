//
//  IMCMainViewModel.swift
//  Demo_ReactiveCocoa
//
//  Created by xiangluzhang on 16/2/5.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

import UIKit

class IMCMainViewModel: NSObject {

    var username: String!
    var password: String!
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
}
