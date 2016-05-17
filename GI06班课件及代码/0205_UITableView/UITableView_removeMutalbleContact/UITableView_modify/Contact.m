//
//  Contact.m
//  UITableView_modify
//
//  Created by jianfeng on 15/2/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "Contact.h"

@implementation Contact

// 重写打印输出内容
- (NSString *)description
{
    return [NSString stringWithFormat:@"name: %@, phone:%@",self.name, self.phone];
}

@end
