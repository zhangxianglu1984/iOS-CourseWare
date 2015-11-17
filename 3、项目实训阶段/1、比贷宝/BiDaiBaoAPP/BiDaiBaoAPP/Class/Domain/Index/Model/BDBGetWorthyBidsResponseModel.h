//
//  BDBGetWorthyBidsResponseModel.h
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/27.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBBaseResponseModel.h"

@interface BDBGetWorthyBidsResponseModel : BDBBaseResponseModel

/**
 *  所有页的总标的数（条）
 */
@property(nonatomic,copy) NSString *BidCount;

/**
 *  返回当前页的BidListNum中的标的数量（条）
 */
@property(nonatomic,copy) NSString *BidListNum;

/**
 *  标的列表
 */
@property(nonatomic,copy) NSArray *BidList;


@end
