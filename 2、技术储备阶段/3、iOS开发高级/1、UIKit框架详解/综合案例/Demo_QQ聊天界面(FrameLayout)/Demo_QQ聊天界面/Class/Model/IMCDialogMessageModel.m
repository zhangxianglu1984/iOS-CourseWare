//
//  IMCDialogMessageModel.m
//  Demo_QQ聊天界面
//
//  Created by xiangluzhang on 15/12/17.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCDialogMessageModel.h"

@implementation IMCDialogMessageModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary {
    IMCDialogMessageModel *dialogMessageModel = [IMCDialogMessageModel new];
    
    [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
        //KVC
        [dialogMessageModel setValue:obj forKey:key];
    }];
    
    return dialogMessageModel;
}

@end
