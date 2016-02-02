//
//  main.swift
//  Demo_自定义操作符
//
//  Created by xiangluzhang on 16/2/2.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

import Foundation

//运算符的定义 ^^一个数的多少次方
infix operator ^^ {
    //运算顺序：左到右
    associativity left
    precedence 255
}

func ^^(left: Double, right: Double) -> Double {
    return pow(left, right)
}

let result = 2 ^^ 3
print(result)

