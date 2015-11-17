//
//  BDBGetRealTimeStatisticsResponseModel.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/29.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBGetRealTimeStatisticsResponseModel.h"
#import "BDBStatisticsModel.h"

@implementation BDBGetRealTimeStatisticsResponseModel

+ (NSString *)requestURL {
    return [kGlobal_HostAddress stringByAppendingPathComponent:@"GetRealTimeStatistics"];
}

- (id)domainModel {
    BDBStatisticsModel *statisticsModel = [BDBStatisticsModel new];
    statisticsModel.Date = _Date;
    statisticsModel.PlatformName = _PlatformName;
    statisticsModel.EarningsMax = _EarningsMax;
    
    float amountRemain = [_AmountRemain floatValue] / 10000.0;
    statisticsModel.AmountRemain = [NSString stringWithFormat:@"%.1f",amountRemain];
    
    statisticsModel.BidNum = _BidNum;
    statisticsModel.BidAmount = _BidAmount;
    statisticsModel.InvestorNum = _InvestorNum;
    
    return statisticsModel;
}

@end
