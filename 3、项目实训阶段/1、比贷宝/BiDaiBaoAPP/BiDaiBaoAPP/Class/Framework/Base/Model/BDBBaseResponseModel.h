//
//  BDBBaseResponseModel.h
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ResponseContentStatus) {
    ResponseContentStatusAvailable = 0,
    ResponseContentStatusUnAvailable,
    ResponseContentStatusError
};

@interface BDBBaseResponseModel : NSObject

/**
 *  返回状态
 */
@property(nonatomic,assign) ResponseContentStatus Result;

/**
 *  附加消息
 */
@property(nonatomic,copy) NSString *Msg;

/**
 *  返回该响应模型对应的请求URL
 */
+ (NSString *)requestURL;

/**
 *  返回对应的模型数据
 */
- (id)domainModel;

@end
