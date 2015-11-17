//
//  BDBGetNoticeResponseModel.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBGetNoticeResponseModel.h"
#import "BDBNoticeModel.h"

@implementation BDBGetNoticeResponseModel

+ (NSDictionary *)objectClassInArray {
    return @{@"NoticeList": [BDBNoticeModel class]};
}

- (id)domainModel {
    return _NoticeList;
}

+ (NSString *)requestURL {
    return [kGlobal_HostAddress stringByAppendingPathComponent:@"GetNotice"];
}

@end
