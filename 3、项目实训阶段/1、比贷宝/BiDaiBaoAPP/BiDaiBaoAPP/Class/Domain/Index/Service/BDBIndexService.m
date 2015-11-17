//
//  BDBIndexService.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBIndexService.h"
#import "BDBGetNoticeResponseModel.h"
#import "BDBGetWorthyBidsResponseModel.h"
#import "BDBGetRealTimeStatisticsResponseModel.h"

@implementation BDBIndexService

+ (void)requestNoticeWithPageIndex:(NSInteger)pageIndex success:(ResponseSuccessBlock)success failure:(ResponseFailureBlock)failure {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"Machine_id"] = IPHONE_DEVICE_UUID;
    parameters[@"Device"] = @"0";
    parameters[@"PageIndex"] = [NSString stringWithFormat:@"%ld",pageIndex];
    parameters[@"PageSize"] = [NSString stringWithFormat:@"%ld",kGlobal_PageSize];
    
    [BDBNetwork sendPOSTRequestWithParameters:parameters JSONResponseModel:[BDBGetNoticeResponseModel class] success:^(id obj) {
        success(obj);
    } failure:^(id obj) {
        failure(obj);
    }];
}

+ (void)requestWorthyBidsAtPageIndex:(NSInteger)pageIndex minAnnualEarnings:(NSString *)minAnnualEarnings maxAnnualEarnings:(NSString *)maxAnnualEarnings
                             success:(ResponseSuccessBlock)success
                             failure:(ResponseFailureBlock)failure {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"Machine_id"] = IPHONE_DEVICE_UUID;
    parameters[@"Device"] = @"0";
    parameters[@"PageIndex"] = [NSString stringWithFormat:@"%ld",pageIndex];
    parameters[@"PageSize"] = [NSString stringWithFormat:@"%ld",kGlobal_PageSize];
    
    parameters[@"Count"] = @0;
    parameters[@"AnnualEarnings"] = [NSString stringWithFormat:@"%@|%@",minAnnualEarnings,maxAnnualEarnings];
    parameters[@"EarningsDesc"] = @1;
    
    [BDBNetwork sendPOSTRequestWithParameters:parameters JSONResponseModel:[BDBGetWorthyBidsResponseModel class] success:^(id obj) {
        success(obj);
    } failure:^(id obj) {
        failure(obj);
    }];
    
}

+ (void)requestStatisticsWithSuccess:(ResponseSuccessBlock)success failure:(ResponseFailureBlock)failure {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"Machine_id"] = IPHONE_DEVICE_UUID;
    parameters[@"Device"] = @"0";
    parameters[@"PlatFormID"] = @"-1";
    
    [BDBNetwork sendPOSTRequestWithParameters:parameters JSONResponseModel:[BDBGetRealTimeStatisticsResponseModel class] success:^(BDBStatisticsModel *statisticsModel) {
        success(statisticsModel);
    } failure:^(id obj) {
        failure(obj);
    }];
}

@end
