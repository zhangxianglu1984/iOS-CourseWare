//
//  ConnTool.m
//  Weather
//
//  Created by jianfeng on 15/3/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ConnTool.h"
#import "Defines.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"


@implementation ConnTool

+ (void)connWithURL:(NSString *)urlString successBlock:(SuccessBlock)success andFailBlock:(FailBlock)fail
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];

    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [[AFNetworkActivityIndicatorManager sharedManager]incrementActivityCount];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"数据获取成功:%@",responseObject);
        success(responseObject);
        [[AFNetworkActivityIndicatorManager sharedManager]decrementActivityCount];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
        [[AFNetworkActivityIndicatorManager sharedManager]decrementActivityCount];
    }];
}



@end
