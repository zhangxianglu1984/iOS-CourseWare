//
//  BDBGetWorthyBidsResponseModel.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/27.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBGetWorthyBidsResponseModel.h"
#import "BDBSubjectModel.h"

@implementation BDBGetWorthyBidsResponseModel

+ (NSDictionary *)objectClassInArray {
    return @{@"BidList": [BDBSubjectModel class]};
}

+ (NSString *)requestURL {
    return [kGlobal_HostAddress stringByAppendingPathComponent:@"GetWorthyBids_Filter_Ex"];
}

- (id)domainModel {
    return _BidList;
}

@end
