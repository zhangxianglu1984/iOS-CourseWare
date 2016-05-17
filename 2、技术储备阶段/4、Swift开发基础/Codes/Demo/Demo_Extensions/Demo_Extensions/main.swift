//
//  main.swift
//  Demo_Extensions
//
//  Created by xiangluzhang on 16/1/29.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

import Foundation

struct IMCSize {
    var width = 0.0
    var height = 0.0
}

struct IMCPoint {
    var x = 0.0
    var y = 0.0
}

struct IMCRect {
    var size = IMCSize()
    var origin = IMCPoint()
}

let defaultRect = IMCRect()

let memberWiseRect = IMCRect(size: IMCSize(width: <#T##Double#>, height: <#T##Double#>), origin: <#T##IMCPoint#>)

