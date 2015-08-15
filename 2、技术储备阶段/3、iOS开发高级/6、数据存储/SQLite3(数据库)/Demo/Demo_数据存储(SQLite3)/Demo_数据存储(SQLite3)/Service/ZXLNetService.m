//
//  ZXLNetService.m
//  Demo_数据存储(SQLite3)
//
//  Created by zhang xianglu on 15/7/7.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ZXLNetService.h"
#import "AFHTTPRequestOperationManager.h"
#import "MJExtension.h"

/**
 *  网络请求服务器地址
 */
static NSString *const kNetServerURL = @"http://117.25.155.115:8082/GetP2PList";


/**
 *  网络请求超时时间
*/
static const NSTimeInterval kNetRequestTimeoutInterval = 30.0f;

/**
 *  网络请求方式类型
 */
typedef NS_ENUM(NSInteger,ZXLNetServiceNetRequestMethod){
	ZXLNetServiceNetRequestMethodGET,
	ZXLNetServiceNetRequestMethodPOST
};

/**
 *  网络请求参数格式
 */
typedef NS_ENUM(NSInteger, ZXLNetServiceNetRequestDataFormat) {
	ZXLNetServiceNetRequestDataFormatKeyValue,
	ZXLNetServiceNetRequestDataFormatJSON
};

/**
 *  响应数据结构
 */
typedef NS_ENUM(NSInteger, ZXLNetServiceNetResponseDataFormat){
	ZXLNetServiceNetResponseDataFormatJSON,
	ZXLNetServiceNetResponseDataFormatXML,
	ZXLNetServiceNetResponseDataFormatData
};


@interface ZXLNetService ()

+ (void)sendAsyncNetRequestWithServerURL:(NSString *)serverURL interface:(NSString *)interface netRequestMethod:(ZXLNetServiceNetRequestMethod)netRequestMethod netRequestDataFormat:(ZXLNetServiceNetRequestDataFormat)netRequestDataFormat netRequestDatas:(id)netRequestDatas responseDataFormat:(ZXLNetServiceNetResponseDataFormat)netResponseDataFormat success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/**
 *  请求参数整理
 */
//s+ (id)

@end


@implementation ZXLNetService

+ (void)sendAsyncNetRequestWithServerURL:(NSString *)serverURL interface:(NSString *)interface netRequestMethod:(ZXLNetServiceNetRequestMethod)netRequestMethod netRequestDataFormat:(ZXLNetServiceNetRequestDataFormat)netRequestDataFormat netRequestDatas:(id)netRequestDatas responseDataFormat:(ZXLNetServiceNetResponseDataFormat)netResponseDataFormat success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failure{
	//创建manager
	AFHTTPRequestOperationManager *httpRequestOperationManager = [AFHTTPRequestOperationManager manager];
	
	//设置请求超时时间
	httpRequestOperationManager.requestSerializer.timeoutInterval = kNetRequestTimeoutInterval;
	
	//设置请求地址
	NSString *requestURL = [serverURL stringByAppendingPathComponent:interface];
	
	//设置请求数据的格式序列化器
	switch (netRequestDataFormat){
		case ZXLNetServiceNetRequestDataFormatKeyValue: {
			httpRequestOperationManager.requestSerializer = [AFHTTPRequestSerializer serializer];
			break;
		}
		case ZXLNetServiceNetRequestDataFormatJSON: {
			httpRequestOperationManager.requestSerializer = [AFJSONRequestSerializer serializer];
			break;
		}
		default:
			break;
	}
	
	//设置服务器响应数据序列化器
	switch (netResponseDataFormat) {
		case ZXLNetServiceNetResponseDataFormatJSON:{
			httpRequestOperationManager.responseSerializer = [AFJSONResponseSerializer serializer];
			break;
		}
		case ZXLNetServiceNetResponseDataFormatXML:{
			httpRequestOperationManager.responseSerializer = [AFXMLParserResponseSerializer serializer];
			break;
		}
		case ZXLNetServiceNetResponseDataFormatData:{
			httpRequestOperationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
			break;
		}
			
		default:
			break;
	}
	
	//设置网络请求方法
	switch (netRequestMethod) {
		case ZXLNetServiceNetRequestMethodGET:{
			[httpRequestOperationManager GET:requestURL parameters:netRequestDatas success:success failure:failure];
			break;
		}
		case ZXLNetServiceNetRequestMethodPOST:{
			[httpRequestOperationManager POST:requestURL parameters:netRequestDatas success:success failure:failure];
			break;
		}
			
		default:
			break;
	}
	
}

@end



@implementation ZXLNetService (POSTKeyValueRequestWithJSONResponse)

/**
 *  发送一般 异步POST请求，响应数据为JSON
 */
+ (void)sendAsyncPOSTRequestWithKeyValueParameters:(id)parameters JSONResponseModelClass:(Class)responseModelClass success:(void (^)(id responseModel))success failure:(void (^)(ZXLNetServiceFailureType netServiceFailureType))failure; {
	//判断模型是否实现了相关协议
	if (![responseModelClass conformsToProtocol:@protocol(ZXLNetServiceJSONResponseModel)]) {
		failure(ZXLNetServiceFailureXX);
		return;
	}

	//从模型中读取网络接口地址
	NSString *interface = [responseModelClass netInterface];
	
	//发送请求
	[self sendAsyncNetRequestWithServerURL:kNetServerURL interface:interface netRequestMethod:ZXLNetServiceNetRequestMethodPOST netRequestDataFormat:ZXLNetServiceNetRequestDataFormatKeyValue netRequestDatas:parameters responseDataFormat:ZXLNetServiceNetResponseDataFormatJSON success:^(AFHTTPRequestOperation *operation, id responseObject) {
		//从responseObject转化为Model
		success([responseModelClass JSONResponseModelTransformedByResponseObject:responseObject]);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		failure(ZXLNetServiceFailureXX);
	}];
}


@end
