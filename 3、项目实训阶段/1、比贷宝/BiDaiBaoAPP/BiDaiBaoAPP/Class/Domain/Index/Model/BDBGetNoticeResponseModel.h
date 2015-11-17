//
//  BDBGetNoticeResponseModel.h
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBBaseResponseModel.h"

@interface BDBGetNoticeResponseModel : BDBBaseResponseModel

/**
 *  返回的公告数量
 */
@property (nonatomic,assign) NSInteger NoticeNum;

@property (nonatomic,copy) NSArray *NoticeList;

@end
