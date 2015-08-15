//
//  BDBNoticeModel.h
//  Demo_AFNetwork
//
//  Created by zhang xianglu on 15/6/23.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	BDBResponseResultSuccess,
	BDBResponseResultError
} BDBResponseResult;

/**
 *  首页->公告响应模型
 */
@interface BDBNoticeResponseModel : NSObject

/**
 *  响应状态
 */
@property(nonatomic,assign) BDBResponseResult Result;

/**
 *  附加消息，存放异常说明
 */
@property(nonatomic,copy) NSString *Msg;

/**
 *  返回的公告数量
 */
@property(nonatomic,assign) NSUInteger NoticeNum;

/**
 *  公告列表(BDBNoticeModel)
 */
@property(nonatomic,copy) NSArray *NoticeList;


//+ (BDBNoticeResponseModel *)modelWithDict:(NSDictionary *)dictionary;







@end
