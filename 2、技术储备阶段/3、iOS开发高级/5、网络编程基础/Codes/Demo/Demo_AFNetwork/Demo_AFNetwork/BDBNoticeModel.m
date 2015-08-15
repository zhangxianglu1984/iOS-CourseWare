//
//  BDBNoticeModel.m
//  Demo_AFNetwork
//
//  Created by zhang xianglu on 15/6/23.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "BDBNoticeModel.h"
#import "MJExtension.h"

@implementation BDBNoticeModel

+ (NSDictionary *)replacedKeyFromPropertyName {
	return @{@"NewsId": @"NewsID"};
}

//+ (BDBNoticeModel *)modelWithDict:(NSDictionary *)dict {
//	BDBNoticeModel *noticeModel = [[BDBNoticeModel alloc] init];
//	
//	noticeModel.NewsID = dict[@"NewsID"];
//	noticeModel.Publisher = dict[@"Publisher"];
//	noticeModel.DT = dict[@"DT"];
//	noticeModel.Title = dict[@"Title"];
//	noticeModel.FirstSection = dict[@"FirstSection"];
//	noticeModel.DetailURL = dict[@"DetailURL"];
//	
//	return noticeModel;
//}

@end
