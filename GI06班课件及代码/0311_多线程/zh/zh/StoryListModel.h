//
//  StoryListModel.h
//  zh
//
//  Created by jianfeng on 15/3/11.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoryListModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageUrlString;
@property (nonatomic, copy) NSString *ID;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)storyListModelWithDic:(NSDictionary *)dic;

@end
