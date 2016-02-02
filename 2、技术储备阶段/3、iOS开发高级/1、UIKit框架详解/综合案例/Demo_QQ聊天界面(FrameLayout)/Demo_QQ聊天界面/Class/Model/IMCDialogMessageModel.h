//
//  IMCDialogMessageModel.h
//  Demo_QQ聊天界面
//
//  Created by xiangluzhang on 15/12/17.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,DialogMessageType) {
    DialogMessageTypeSend,
    DialogMessageTypeReceive
};

@interface IMCDialogMessageModel : NSObject

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;

/*
 *  聊天信息
 **/
@property(nonatomic,copy) NSString *text;

/*
 *  聊天时间
 **/
@property(nonatomic,copy) NSString *time;

/*
 *  是否显示聊天时间
 **/
@property(nonatomic,assign) BOOL isDisplayTime;

/*
 *  聊天信息的类型
 **/
@property(nonatomic,assign) DialogMessageType type;

@end
