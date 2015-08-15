//
//  IMCPerson.h
//  Demo_对象归档
//
//  Created by zhang xianglu on 15/7/2.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMCPerson : NSObject <NSCoding>

@property(nonatomic,copy) NSString *name;

@property(nonatomic,assign) NSUInteger age;

@end
