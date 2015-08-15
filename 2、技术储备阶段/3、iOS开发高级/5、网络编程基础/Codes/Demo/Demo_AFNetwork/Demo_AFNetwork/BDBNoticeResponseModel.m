//
//  BDBNoticeModel.m
//  Demo_AFNetwork
//
//  Created by zhang xianglu on 15/6/23.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "BDBNoticeResponseModel.h"
#import "BDBNoticeModel.h"
#import "MJExtension.h"

@implementation BDBNoticeResponseModel

/**
 *  告诉MJExtension框架,数组里的元素类型
 */
+ (NSDictionary *)objectClassInArray {
	return @{@"NoticeList": [BDBNoticeModel class]};
}

/*
+ (BDBNoticeResponseModel *)modelWithDict:(NSDictionary *)dictionary {
	BDBNoticeResponseModel *noticeResponseModel = [[self alloc] init];
	
	//从字典中获取属性值
	noticeResponseModel.Result = [dictionary[@"Result"] intValue];
	noticeResponseModel.Msg = dictionary[@"Msg"];
	noticeResponseModel.NoticeNum = [dictionary[@"NoticeNum"] integerValue];
	
	NSArray *noticeModelsDictionary = dictionary[@"NoticeList"];
	if (noticeModelsDictionary.count > 0) {
		NSMutableArray *noticeList = [NSMutableArray arrayWithCapacity:noticeModelsDictionary.count];
		
		for (NSDictionary *noticeModelDictionary in noticeModelsDictionary) {
			BDBNoticeModel *noticeModel = [BDBNoticeModel modelWithDict:noticeModelDictionary];
			
			[noticeList addObject:noticeModel];
		}
		
		noticeResponseModel.NoticeList = [noticeList copy];
	}
	
	return noticeResponseModel;
}
*/

@end
