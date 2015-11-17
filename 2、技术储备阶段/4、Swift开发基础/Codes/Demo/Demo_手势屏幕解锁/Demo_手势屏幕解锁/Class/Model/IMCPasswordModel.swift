//
//  IMCPasswordModel.swift
//  Demo_手势屏幕解锁
//
//  Created by xiangluzhang on 15/11/13.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

import UIKit

class IMCPasswordModel: NSObject, NSCoding {
    
    var firstBit: Int?
    
    var secondBit: Int?
    
    var thirdBit: Int?
    
    var fourthBit: Int?
    
    var fifthBit: Int?
    
    var sixthBit: Int?
    
    var seventhBit: Int?
    
    var eighthBit: Int?
    
    var ninthBit: Int?
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        firstBit = aDecoder.decodeObjectForKey("firstBit") as? Int
        secondBit = aDecoder.decodeObjectForKey("secondBit") as? Int
        thirdBit = aDecoder.decodeObjectForKey("thirdBit") as? Int
        fourthBit = aDecoder.decodeObjectForKey("fourthBit") as? Int
        fifthBit = aDecoder.decodeObjectForKey("fifthBit") as? Int
        sixthBit = aDecoder.decodeObjectForKey("sixthBit") as? Int
        seventhBit = aDecoder.decodeObjectForKey("seventhBit") as? Int
        eighthBit = aDecoder.decodeObjectForKey("eighthBit") as? Int
        ninthBit = aDecoder.decodeObjectForKey("ninthBit") as? Int
    }
    
    override init() {
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(firstBit, forKey: "firstBit")
        aCoder.encodeObject(secondBit, forKey: "secondBit")
        aCoder.encodeObject(thirdBit, forKey: "thirdBit")
        aCoder.encodeObject(fourthBit, forKey: "fourthBit")
        aCoder.encodeObject(fifthBit, forKey: "fifthBit")
        aCoder.encodeObject(sixthBit, forKey: "sixthBit")
        aCoder.encodeObject(seventhBit, forKey: "seventhBit")
        aCoder.encodeObject(eighthBit, forKey: "eighthBit")
        aCoder.encodeObject(ninthBit, forKey: "ninthBit")
    }

}
