//
//  BDBNoticeModel.h
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDBNoticeModel : NSObject

/**
 *  公告编号
 */
@property(nonatomic,copy) NSString *NewsID;

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
 *  详细页面内容地址
 */
@property(nonatomic,copy) NSString *DetailURL;

/**
 *  是否已读
 */
@property(nonatomic,copy) NSString *IsRead;

@end
