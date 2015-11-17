//
//  BDBStatisticsModel.h
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/29.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDBStatisticsModel : NSObject

/**
 *  当前数据日期，格式如：2014-11-02
 */
@property(nonatomic,copy) NSString *Date;

/**
 *  平台名称
 */
@property(nonatomic,copy) NSString *PlatformName;

/**
 *  今日的最高收益
 */
@property(nonatomic,assign) CGFloat EarningsMax;

/**
 *  今日可投金额
 */
@property(nonatomic,copy) NSString *AmountRemain;

/**
 *  今日发标数量
 */
@property(nonatomic,copy) NSString *BidNum;

/**
 *  今日发标金额
 */
@property(nonatomic,copy) NSString *BidAmount;


/**
 *  今日投资者人数
 */
@property(nonatomic,copy) NSString *InvestorNum;

@end
