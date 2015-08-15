//
//  ViewController.m
//  Demo_AFNetwork
//
//  Created by zhang xianglu on 15/6/23.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"
#import "BDBNoticeResponseModel.h"

#import "MJExtension.h"

#import "AFNetworking.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
}

//NSURLConnection
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
	
	//把服务器的响应数据当做JSON格式
	//mgr.responseSerializer = [AFJSONResponseSerializer serializer];
	
	//把服务器的响应数据当做XML格式
	//mgr.responseSerializer = [AFXMLParserResponseSerializer serializer];
	
	//把服务器的响应数据当做NSData格式
	mgr.responseSerializer = [AFHTTPResponseSerializer serializer];

	//封装参数
	NSMutableDictionary *requestParametersDict = [NSMutableDictionary dictionary];
	requestParametersDict[@"PageIndex"] = @1;
	requestParametersDict[@"PageSize"] = @10;
	
	__weak typeof(self) thisInstance = self;
	
	[mgr GET:@"http://117.25.155.115:8082/GetNotice" 
	   parameters:requestParametersDict 
	   success:^(AFHTTPRequestOperation *operation, NSData *datas) {
	   
		   NSError *error;
		   NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingMutableLeaves error:&error];
		  
			BDBNoticeResponseModel *noticeResponseModel = [BDBNoticeResponseModel objectWithKeyValues:jsonResponse];
			
			NSLog(@"sdfasdf");
			
	   }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
			  
		    NSLog(@"响应失败..error: %@",error);
	   }];
		
		//将字典里地数据==>模型中
//		BDBNoticeResponseModel *noticeResponseModel = [BDBNoticeResponseModel objectWithKeyValues:jsonResponse];

		//NSLog(@"result: %@",noticeResponseModel);
		
	
	
	
}

/**
 *  原始POST请求方式
 */
- (void)requestData {
	NSURL *url = [NSURL URLWithString:@"http://117.25.155.115:8082/GetNotice"];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	
	request.HTTPMethod = @"POST";
	
	NSString *requestParameters = @"PageIndex=1&PageSize=10";
	request.HTTPBody = [requestParameters dataUsingEncoding:NSUTF8StringEncoding];
	
	[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
		
		NSError *error;
		NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
	}];
}



@end
