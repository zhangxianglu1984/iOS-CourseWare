//
//  IMCGetP2PListResponseModel.m
//  Demo_数据存储(SQLite3)
//
//  Created by zhang xianglu on 15/7/7.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCGetP2PListResponseModel.h"
#import "MJExtension.h"
#import "IMCPlatformModel.h"
#import "ZXLNetService.h"

@interface IMCGetP2PListResponseModel () <ZXLNetServiceJSONResponseModel>

@end

@implementation IMCGetP2PListResponseModel

+ (NSDictionary *)objectClassInArray {
	return @{@"P2PList":[IMCPlatformModel class]};
} 

#pragma mark - ZXLNetServiceJSONResponseModel Methods
+ (NSString *)netInterface {
	return @"GetP2PList";
}

+ (id)JSONResponseModelTransformedByResponseObject:(id)responseObject {
	return [self objectWithKeyValues:responseObject];
}



@end
