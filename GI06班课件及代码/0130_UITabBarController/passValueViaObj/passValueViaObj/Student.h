//
//  Student.h
//  passValueViaObj
//
//  Created by jianfeng on 15/1/30.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *num;
@property (nonatomic, assign) NSInteger score;

- (instancetype)initWithName:(NSString *)name num:(NSString *)num andScore:(NSInteger) score;

+ (instancetype)studenWithName:(NSString *)name num:(NSString *)num andScore:(NSInteger) score;

@end
