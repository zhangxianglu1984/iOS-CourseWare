//
//  main.swift
//  Demo_泛型(Generics)
//
//  Created by xiangluzhang on 16/2/4.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

import Foundation

// MARK: - 泛型实例

/**
*  交换两个整型值
*/
func swapTwoInts(inout a: Int, inout _ b: Int) -> Void {
    let temp = a
    a = b
    b = temp
}


var a = 20
var b = 30
swapTwoInts(&a, &b)

print("a=\(a),b=\(b)")


/**
*  交换两个字符串值
*/
func swapTwoStrings(inout a: String, inout _ b: String) -> Void {
    let temp = a
    a = b
    b = temp
}

var s1 = "Hello"
var s2 = "World"
swapTwoStrings(&s1, &s2)

print(s1 + " " + s2)


/**
*  以上两个操作只有类型不同，其他的都一样
*  定义一个泛型操作，用于交换两个值
*/
func swapTwoValues<T>(inout a: T, inout _ b: T) {
    let temp = a
    a = b
    b = temp
}

swapTwoValues(&s1, &s2)
print(s1 + " " + s2)

swapTwoValues(&a, &b)
print("a=\(a),b=\(b)")

/**
*  系统中包含了一个swap()函数，就实现了以上功能
*/




