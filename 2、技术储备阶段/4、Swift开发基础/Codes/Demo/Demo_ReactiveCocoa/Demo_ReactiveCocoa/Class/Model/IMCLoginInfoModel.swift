//
//  IMCLoginInfoModel.swift
//  Demo_ReactiveCocoa
//
//  Created by xiangluzhang on 16/2/2.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

import Foundation

class IMCLoginInfoModel: NSObject {
    
    var username: String?
    var password: String?
    
    override init() {}
    
    init(username: String,password: String) {
        self.username = username
        self.password = password
    }

}
