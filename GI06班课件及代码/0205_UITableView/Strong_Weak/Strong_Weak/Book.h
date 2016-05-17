//
//  Book.h
//  Strong_Weak
//
//  Created by jianfeng on 15/2/5.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Student;
@interface Book : NSObject

@property (nonatomic, weak) Student *owner;

@end
