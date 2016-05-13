//
//  Student.m
//  NSCoding
//
//  Created by jianfeng on 15/3/16.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "Student.h"

@interface Student()<NSCoding>

@end

@implementation Student

// 对象被归档的时候会调用这个方法
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    // 要存储哪些属性
    // 怎样存储这些属性
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        // 要解档哪些属性
        // 怎样解档这些属性
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [aDecoder decodeIntegerForKey:@"age"];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@,age:%ld",self.name, self.age];
}


@end
