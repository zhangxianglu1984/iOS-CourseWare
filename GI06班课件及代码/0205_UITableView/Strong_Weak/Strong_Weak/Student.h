//
//  Student.h
//  StrongAndWeak
//
//  Created by jianfeng on 15/2/5.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface Student : NSObject

@property (nonatomic, strong) Book *book;

@end
