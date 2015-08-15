//
//  BDBNoticeModel.h
//  Demo_AFNetwork
//
//  Created by zhang xianglu on 15/6/23.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  首页-公告模型
 */
@interface BDBNoticeModel : NSObject

/**
 *  公告编号
 */
@property(nonatomic,copy) NSString *NewsId;

/**
 *  发布者
 */
@property(nonatomic,copy) NSString *Publisher;

/**
 *  发布时间
 */
@property(nonatomic,copy) NSString *DT;

/**
 *  标题
 */
@property(nonatomic,copy) NSString *Title;

/**
 *  内容简要
 */
@property(nonatomic,copy) NSString *FirstSection;

/**
 *  详细内容地址
 */
@property(nonatomic,copy) NSString *DetailURL;


//+ (BDBNoticeModel *)modelWithDict:(NSDictionary *)dict;

@end










