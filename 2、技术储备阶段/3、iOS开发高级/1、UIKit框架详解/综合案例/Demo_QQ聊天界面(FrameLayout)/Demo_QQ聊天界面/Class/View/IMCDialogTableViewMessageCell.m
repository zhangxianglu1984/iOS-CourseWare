//
//  IMCDialogTableViewMessageCell.m
//  Demo_QQ聊天界面
//
//  Created by xiangluzhang on 15/12/18.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCDialogTableViewMessageCell.h"
#import "IMCDialogMessageCellFrameModel.h"

@interface IMCDialogTableViewMessageCell ()

@property(nonatomic,weak) UILabel *timeLabel;

@property(nonatomic,weak) UIImageView *iconImageView;

@property(nonatomic,weak) UIButton *textButton;

- (void)p_initTimeLabel;

- (void)p_initIconImageView;

- (void)p_initTextButton;

- (UIImage *)p_resizeImage:(UIImage *)originalImage;

@end

@implementation IMCDialogTableViewMessageCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *dialogTableViewMessageCellIdentifier = @"IMCDialogTableViewMessageCell";
    
    IMCDialogTableViewMessageCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:dialogTableViewMessageCellIdentifier];
    if (tableViewCell == nil) {
        tableViewCell = [[IMCDialogTableViewMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:dialogTableViewMessageCellIdentifier];
    }
    
    return tableViewCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        //设置单元格的选中样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self p_initTimeLabel];
        [self p_initIconImageView];
        [self p_initTextButton];
    }
    return self;
}

- (void)p_initTimeLabel {
    UILabel *timeLabel = [UILabel new];
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.font = [UIFont systemFontOfSize:14.0];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    //timeLabel.backgroundColor = [UIColor redColor];
    
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
}

- (void)p_initIconImageView {
    UIImageView *iconImageView = [UIImageView new];
    
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
}

- (void)p_initTextButton {
    UIButton *textButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //让按钮中的文字根据需要自动换行
    textButton.titleLabel.numberOfLines = 0;
    textButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    
    [textButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //[textButton setBackgroundColor:[UIColor redColor]];
    
    textButton.contentEdgeInsets = UIEdgeInsetsMake(20.0, 25.0, 20.0, 25.0);
    
    [self.contentView addSubview:textButton];
    self.textButton = textButton;
}

//根据FrameModel,给子视图设置布局信息
- (void)setFrameModel:(IMCDialogMessageCellFrameModel *)frameModel {
    _frameModel = frameModel;
    
    //1、给子视图设置布局信息
    //2、给子视图设置显示内容
    
    //timeLable
    _timeLabel.frame = frameModel.timeLabelFrame;
    _timeLabel.text = frameModel.dialogMessageModel.time;
    
    //iconImageView
    _iconImageView.frame = frameModel.iconImageFrame;
    if (frameModel.dialogMessageModel.type == DialogMessageTypeReceive) {
        _iconImageView.image = [UIImage imageNamed:@"Gatsby"];
    } else if (frameModel.dialogMessageModel.type == DialogMessageTypeSend) {
        _iconImageView.image = [UIImage imageNamed:@"Jobs"];
    }
    
    //textButton
    _textButton.frame = frameModel.textButtonFrame;
    [_textButton setTitle:frameModel.dialogMessageModel.text forState:UIControlStateNormal];
    if (frameModel.dialogMessageModel.type == DialogMessageTypeReceive) {
        
        UIImage *textButtonBackgrounNormalImage = [UIImage imageNamed:@"chat_recive_nor"];

        [_textButton setBackgroundImage:[self p_resizeImage:textButtonBackgrounNormalImage] forState:UIControlStateNormal];
        
        UIImage *textButtonBackgrounHighlightedImage = [UIImage imageNamed:@"chat_recive_press_pic"];
        
        [_textButton setBackgroundImage:[self p_resizeImage:textButtonBackgrounHighlightedImage] forState:UIControlStateHighlighted];
        
    }else if (frameModel.dialogMessageModel.type == DialogMessageTypeSend) {
        
        UIImage *textButtonBackgrounNormalImage = [UIImage imageNamed:@"chat_send_nor"];
        
        [_textButton setBackgroundImage:[self p_resizeImage:textButtonBackgrounNormalImage] forState:UIControlStateNormal];
        
        UIImage *textButtonBackgrounHighlightedImage = [UIImage imageNamed:@"chat_send_press_pic"];
        [_textButton setBackgroundImage:[self p_resizeImage:textButtonBackgrounHighlightedImage] forState:UIControlStateHighlighted];
    }
}

- (UIImage *)p_resizeImage:(UIImage *)originalImage {
    CGSize originalImageSize = originalImage.size;
    
    CGFloat topEdgeInset = originalImageSize.height * 0.5;
    CGFloat leftEdgeInset = originalImageSize.width * 0.5;
    CGFloat bottomEdgeInset = originalImageSize.height * 0.5;
    CGFloat rightEdgeInset = originalImageSize.width * 0.5;
    
    return [originalImage resizableImageWithCapInsets:UIEdgeInsetsMake(topEdgeInset, leftEdgeInset, bottomEdgeInset, rightEdgeInset) resizingMode:UIImageResizingModeStretch];
}

@end
