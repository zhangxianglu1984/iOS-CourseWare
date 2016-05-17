//
//  DataTool.h
//  zh
//
//  Created by jianfeng on 15/3/24.
//  Copyright (c) 2015年 test. All rights reserved.
//  用来向控制器提供数据(从数据库里面取还是从网络取,数据都来自这个类)

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(NSDictionary *dic);
typedef void(^FailBlock)(NSError *error);

@interface DataTool : NSObject

+ (void)getStoriesWithSuccess:(SuccessBlock) success andFailure:(FailBlock) failure;

+ (void)getStoriesDetailWithSuccess:(SuccessBlock)success andFailure:(FailBlock)failure;

@end
