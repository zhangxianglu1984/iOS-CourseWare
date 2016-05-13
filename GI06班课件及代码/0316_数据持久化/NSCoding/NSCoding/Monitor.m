//
//  Monitor.m
//  NSCoding
//
//  Created by jianfeng on 15/3/16.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "Monitor.h"

@interface Monitor()<NSCoding>

@end

@implementation Monitor

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.position forKey:@"position"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _position = [aDecoder decodeObjectForKey:@"position"];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@, age:%ld, position:%@",self.name, self.age, self.position];
}

@end
