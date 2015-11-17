//
//  BDBIndexService.h
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  请求，获取数据，解析数据，封装模型
 */
@interface BDBIndexService : NSObject

/**
 *  获取网站公告信息
 */
+ (void)requestNoticeWithPageIndex:(NSInteger)pageIndex success:(ResponseSuccessBlock)success failure:(ResponseFailureBlock)failure;

/**
 *  获取标的信息
 */
+ (void)requestWorthyBidsAtPageIndex:(NSInteger)pageIndex minAnnualEarnings:(NSString *)minAnnualEarnings maxAnnualEarnings:(NSString *)maxAnnualEarnings
              success:(ResponseSuccessBlock)success
              failure:(ResponseFailureBlock)failure;

/**
 *  统计指定平台名称，今日最高收益率，今日平均收益率，今日可投标金额，今日发标数量，今日发标金额（元），今日投资人数
 */
+ (void)requestStatisticsWithSuccess:(ResponseSuccessBlock)success
failure:(ResponseFailureBlock)failure;

@end
