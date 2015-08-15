//
//  IMCPerson.h
//  Demo_单实例(饿汉式)
//
//  Created by zhang xianglu on 15/6/2.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMCPerson : NSObject

+ (instancetype)sharedInstance;

@end
