//
//  DataTool.m
//  zh
//
//  Created by jianfeng on 15/3/24.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "DataTool.h"
#import "ConnTool.h"
#import "Defines.h"
#import "DataBaseTool.h"

@implementation DataTool

+ (void)getStoriesWithSuccess:(SuccessBlock) success andFailure:(FailBlock) failure
{
    // 1.先向数据库里面取数据
//    NSDictionary *dic = [DataBaseTool getStories];
//    success(dic);
//    if (!dic) {
        // 2.如果没有取到数据,就进行网络连接
        [ConnTool connWithURL:kGetStories successBlock:^(NSDictionary *dic) {
            success(dic);
            [DataBaseTool saveStories:dic];
        } andFailBlock:^(NSError *error) {
            failure(error);
        }];
//    }
}

@end
