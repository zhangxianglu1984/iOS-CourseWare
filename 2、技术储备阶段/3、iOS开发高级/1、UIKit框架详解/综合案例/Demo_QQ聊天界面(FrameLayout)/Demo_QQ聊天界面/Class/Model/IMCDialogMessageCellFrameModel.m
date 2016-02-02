//
//  IMCDialogMessageCellFrameModel.m
//  Demo_QQ聊天界面
//
//  Created by xiangluzhang on 15/12/18.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCDialogMessageCellFrameModel.h"

@implementation IMCDialogMessageCellFrameModel

+ (instancetype)frameModelWithDialogMessageModel:(IMCDialogMessageModel *)dialogMessageModel {
    
    IMCDialogMessageCellFrameModel *dialogMessageCellFrameModel = [IMCDialogMessageCellFrameModel new];
    
    dialogMessageCellFrameModel.dialogMessageModel = dialogMessageModel;
    
    return dialogMessageCellFrameModel;
}

- (void)setDialogMessageModel:(IMCDialogMessageModel *)dialogMessageModel {
    _dialogMessageModel = dialogMessageModel;
    
    //计算子视图的Frame
    CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat viewSpacing = 10.0;
    
    //timeLabel Frame
    if (_dialogMessageModel.isDisplayTime) {
        CGFloat timeLabelX = 0.0;
        CGFloat timeLabelY = 0.0;
        CGFloat timeLabelWidth = cellWidth;
        CGFloat timeLabelHeight = 20.0;
        self.timeLabelFrame = CGRectMake(timeLabelX, timeLabelY, timeLabelWidth, timeLabelHeight);
    }
    
    //iconImage Frame
    CGFloat iconImageWidth = 50.0;
    CGFloat iconImageHeight = 50.0;
    CGFloat iconImageY = CGRectGetMaxY(_timeLabelFrame) + viewSpacing;
    CGFloat iconImageX = 0.0;
    if (_dialogMessageModel.type == DialogMessageTypeSend) {
        iconImageX = cellWidth - viewSpacing - iconImageWidth;
    }else if (_dialogMessageModel.type == DialogMessageTypeReceive) {
        iconImageX = viewSpacing;
    }
    self.iconImageFrame = (CGRect){iconImageX,iconImageY,iconImageWidth,iconImageHeight};
    
    //textButton Frame 根据text
    CGFloat textButtonMaxWidth = cellWidth - 3 * viewSpacing - iconImageWidth - 60.0;
    CGSize textButtonMaxSize = (CGSize){textButtonMaxWidth,MAXFLOAT};
    CGRect textButtonBounds = [_dialogMessageModel.text boundingRectWithSize:textButtonMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14.0]} context:nil];
    
    CGFloat textButtonWidth = textButtonBounds.size.width + 50.0;
    CGFloat textButtonHeight = textButtonBounds.size.height + 40.0;
    CGFloat textButtonY = CGRectGetMinY(_iconImageFrame);
    CGFloat textButtonX = 0.0;
    if (_dialogMessageModel.type == DialogMessageTypeReceive) {
        textButtonX = CGRectGetMaxX(_iconImageFrame) + viewSpacing;
    }else if(_dialogMessageModel.type == DialogMessageTypeSend) {
        textButtonX = CGRectGetMinX(_iconImageFrame) - viewSpacing - textButtonWidth;
    }
    self.textButtonFrame = (CGRect){textButtonX,textButtonY,textButtonWidth,textButtonHeight};
    
    //计算整个Cell的高度
    self.dialogMessageCellHeight = MAX(CGRectGetMaxY(_iconImageFrame), CGRectGetMaxY(_textButtonFrame)) + viewSpacing;
}


@end
