//
//  Student.m
//  passValueViaObj
//
//  Created by jianfeng on 15/1/30.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithName:(NSString *)name num:(NSString *)num andScore:(NSInteger) score
{
    self = [super init];
    if (self) {
        self.name = name;
        self.num = num;
        self.score = score;
    }
    return self;
}

+ (instancetype)studenWithName:(NSString *)name num:(NSString *)num andScore:(NSInteger) score
{
//    Student *stu = [[Student alloc]init];
//    stu.num = name;
//    stu.num = num;
//    stu.score = score;
//    return stu;
    return [[Student alloc]initWithName:name num:num andScore:score];
}



@end
