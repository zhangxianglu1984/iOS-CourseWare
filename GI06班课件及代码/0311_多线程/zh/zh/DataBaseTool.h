//
//  DataBaseTool.h
//  zh
//
//  Created by jianfeng on 15/3/24.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseTool : NSObject

+ (void)saveStories:(NSDictionary *)stoies;

+ (NSDictionary *)getStories;

@end
