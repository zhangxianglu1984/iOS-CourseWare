//
//  IMCDialogTableViewSendMessageCell.h
//  Demo_QQ聊天记录(AutoLayout)
//
//  Created by xiangluzhang on 15/12/18.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IMCDialogMessageModel;

@interface IMCDialogTableViewSendMessageCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@property(nonatomic,strong) IMCDialogMessageModel *dialogMessageModel;

@end
