//
//  Vehicle.swift
//  Demo_swift与oc混编
//
//  Created by xiangluzhang on 16/1/28.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

import Foundation

class Vehicle: NSObject {
    
    let engine: Engine;
    
    var tyres: Array<Tyre>;
    
    init(engine: Engine, tyres: Array<Tyre>) {
        self.engine = engine
        self.tyres = tyres
    }
    
    func start() {
        engine.run()
        
        for tyre in tyres {
            tyre.rolling()
        }
    }
}
