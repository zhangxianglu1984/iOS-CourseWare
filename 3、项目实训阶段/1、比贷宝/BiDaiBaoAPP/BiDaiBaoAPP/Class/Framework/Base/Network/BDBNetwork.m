//
//  BDBNetwork.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBNetwork.h"

@implementation BDBNetwork

+ (void)sendPOSTRequestWithParameters:(NSDictionary *)parameters
    JSONResponseModel:(Class)JSONResponseModelClass
     success:(ResponseSuccessBlock)success
     failure:(ResponseFailureBlock)failure {
    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
    
    requestManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [requestManager POST:[JSONResponseModelClass requestURL] parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, NSDictionary  * _Nonnull responseObject) {
        //根据字典，创建响应模型对象
        BDBBaseResponseModel *responseModel = [JSONResponseModelClass objectWithKeyValues:responseObject];
        
        ResponseContentStatus responseContentStatus = responseModel.Result;
        switch (responseContentStatus) {
            case ResponseContentStatusAvailable : {
                success([responseModel domainModel]);
                break;
            }
            case ResponseContentStatusUnAvailable : {
                failure(responseModel.Msg);
                break;
            }
            default:
                break;
        }
    
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        failure(@"网络数据传输失败");
    }];
}

@end
