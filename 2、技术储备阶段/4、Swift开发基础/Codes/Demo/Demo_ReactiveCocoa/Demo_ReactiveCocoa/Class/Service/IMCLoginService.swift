//
//  IMCLoginService.swift
//  Demo_ReactiveCocoa
//
//  Created by xiangluzhang on 16/2/5.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

import Foundation

class IMCLoginService: NSObject {
    
    typealias IMCLoginResponse = (Bool) -> Void
    
    func login(username: String, password: String, completion: IMCLoginResponse) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            var result = false
            
            if !username.isEmpty && username == "admin" && !password.isEmpty && password == "1234" {
                result = true
            }
    
            completion(result)
        })
    }
    

}
