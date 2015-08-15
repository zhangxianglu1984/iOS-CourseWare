//
//  ZXLNetService.h
//  网络服务层，用于发送网络请求(依赖于AFNetworking框架)
//
//  Created by zhang xianglu on 15/7/7.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZXLNetServiceFailureType) {
	ZXLNetServiceFailureXX
};


/**
 *  网络服务层
 */
@interface ZXLNetService : NSObject


@end


@interface ZXLNetService (POSTKeyValueRequestWithJSONResponse)

/**
 *  发送一般 异步POST请求，响应数据为JSON
 */
+ (void)sendAsyncPOSTRequestWithKeyValueParameters:(id)parameters JSONResponseModelClass:(Class)responseModelClass success:(void (^)(id responseModel))success failure:(void (^)(ZXLNetServiceFailureType netServiceFailureType))failure;


@end

@interface ZXLNetService (GETKeyValueRequestWithJSONResponse)

/**
 *  发送一般 异步POST请求，响应数据为JSON
 */
+ (void)sendAsyncGETRequestWithKeyValueParameters:(id)parameters JSONResponseModelClass:(Class)responseModelClass success:(void (^)(id responseModel))success failure:(void (^)(ZXLNetServiceFailureType))failure;


@end


/**
 *  响应数据模型基本协议
 */
@protocol ZXLNetServiceResponseModel <NSObject>

@required
/**
 *  返回接口地址
 */
+ (NSString *)netInterface;


@end

@protocol ZXLNetServiceJSONResponseModel <ZXLNetServiceResponseModel>

@required
/**
 *  将响应对象转化为模型
 */
+ (id)JSONResponseModelTransformedByResponseObject:(id)responseObject;


@end




