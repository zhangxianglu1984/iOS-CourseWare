//
//  BDBNetwork.h
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

//当数据有效地时候
typedef void  (^ResponseSuccessBlock) (id obj);

typedef void (^ResponseFailureBlock) (id obj);

@interface BDBNetwork : NSObject

/**
 *  发送POST请求,接收JSON数据,解析并封装成对应的响应模型
 */
+ (void)sendPOSTRequestWithParameters:(NSDictionary *)parameters
                    JSONResponseModel:(Class)JSONResponseModelClass
                              success:(ResponseSuccessBlock)success
                              failure:(ResponseFailureBlock)failure;



/**
 *  发送POST请求,接收Data数据
 */



@end
