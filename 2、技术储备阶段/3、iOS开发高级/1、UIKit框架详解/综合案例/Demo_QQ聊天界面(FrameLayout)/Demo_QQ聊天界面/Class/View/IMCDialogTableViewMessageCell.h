//
//  IMCDialogTableViewMessageCell.h
//  Demo_QQ聊天界面
//
//  Created by xiangluzhang on 15/12/18.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IMCDialogMessageCellFrameModel;

@interface IMCDialogTableViewMessageCell : UITableViewCell

@property(nonatomic,strong) IMCDialogMessageCellFrameModel *frameModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
