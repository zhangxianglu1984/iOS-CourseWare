//
//  IMCDialogMessageCellFrameModel.h
//  Demo_QQ聊天界面
//
//  Created by xiangluzhang on 15/12/18.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IMCDialogMessageModel.h"

/*
 *  根据数据模型，计算出Cell内子视图的布局信息
 **/
@interface IMCDialogMessageCellFrameModel : NSObject

/*
 *  时间标签的Frame
 **/
@property(nonatomic,assign) CGRect timeLabelFrame;

/*
 *  消息按钮的Frame
 **/
@property(nonatomic,assign) CGRect textButtonFrame;

/*
 *  头像图片的Frame
 **/
@property(nonatomic,assign) CGRect iconImageFrame;

/*
 *  单元格的高度
 **/
@property(nonatomic,assign) CGFloat dialogMessageCellHeight;


/*
 *  聊天消息模型
 **/
@property(nonatomic,strong) IMCDialogMessageModel *dialogMessageModel;


/*
 *  自定义初始化方法
 **/
+ (instancetype)frameModelWithDialogMessageModel:(IMCDialogMessageModel *)dialogMessageModel;









@end
