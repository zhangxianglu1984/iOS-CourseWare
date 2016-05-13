//
//  StoryListModel.m
//  zh
//
//  Created by jianfeng on 15/3/11.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "StoryListModel.h"

@implementation StoryListModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.title = dic[@"title"];
        self.ID = dic[@"id"];
        if (dic[@"images"]) {
            self.imageUrlString = dic[@"images"][0];
        }
        else if (dic[@"image"]){
            self.imageUrlString = dic[@"image"];
        }
    }
    return self;
}

+ (instancetype)storyListModelWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}

@end
