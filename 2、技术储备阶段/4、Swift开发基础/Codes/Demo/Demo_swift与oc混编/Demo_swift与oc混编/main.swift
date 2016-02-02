//
//  main.swift
//  Demo_swift与oc混编
//
//  Created by xiangluzhang on 16/1/28.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

import Foundation

// MARK: - 实例化引擎
let engine = Engine()

// MARK: - 轮胎
var tyres: Array<Tyre> = Array<Tyre>()
for _ in 0...3 {
    let tyre = Tyre()
    tyres.append(tyre)
}


let vehicle = Vehicle(engine: engine, tyres: tyres)
vehicle.start()

