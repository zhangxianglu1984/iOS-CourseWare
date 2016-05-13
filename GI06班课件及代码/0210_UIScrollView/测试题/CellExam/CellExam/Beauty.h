//
//  Beauty.h
//  CellExam
//
//  Created by Apple on 15/2/7.
//  Copyright (c) 2015年 Summer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Beauty : NSObject

/**
 *  名字
 */
@property (nonatomic, copy) NSString *name;

/**
 *  头像名称
 */
@property (nonatomic, copy) NSString *avartar;

/**
 *  是否点赞
 */
@property (nonatomic, assign) BOOL isLike;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)beautyWithDic:(NSDictionary *)dic;

@end
