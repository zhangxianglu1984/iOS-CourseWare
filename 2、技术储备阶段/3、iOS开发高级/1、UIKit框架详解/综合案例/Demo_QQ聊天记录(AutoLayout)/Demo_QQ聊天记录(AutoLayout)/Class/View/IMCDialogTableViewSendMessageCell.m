//
//  IMCDialogTableViewSendMessageCell.m
//  Demo_QQ聊天记录(AutoLayout)
//
//  Created by xiangluzhang on 15/12/18.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCDialogTableViewSendMessageCell.h"

#import "IMCDialogMessageModel.h"

@interface IMCDialogTableViewSendMessageCell ()

- (void)textImageViewTappedAction:(UITapGestureRecognizer *)sender;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@property (weak, nonatomic) IBOutlet UIImageView *textImageView;

@property(nonatomic,weak) UILabel *subTextLabel;

@end


@implementation IMCDialogTableViewSendMessageCell

+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    IMCDialogTableViewSendMessageCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"IMCDialogTableViewSendMessageCell" forIndexPath:indexPath];
    
    return tableViewCell;
}

- (void)awakeFromNib {
    //self.backgroundColor = [UIColor redColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textImageViewTappedAction:)];
    [_textImageView addGestureRecognizer:tapGestureRecognizer];
    
    UILabel *subTextLabel = [UILabel new];
    subTextLabel.textColor = [UIColor blackColor];
    subTextLabel.font = [UIFont systemFontOfSize:14.0];
    //换行配置
    subTextLabel.lineBreakMode = NSLineBreakByCharWrapping;
    subTextLabel.numberOfLines = 0;
    
    [_textImageView addSubview:subTextLabel];
    self.subTextLabel = subTextLabel;
    
    subTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSString *visualFormat = @"H:|-20-[subTextLabel]-20-|";
    NSArray *constraints_subTextLabel_h = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:@{@"subTextLabel":subTextLabel}];
    [_textImageView addConstraints:constraints_subTextLabel_h];
    
    visualFormat = @"V:|-15-[subTextLabel]-15-|";
    NSArray *constraints_subTextLabel_v = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:@{@"subTextLabel":subTextLabel}];
    [_textImageView addConstraints:constraints_subTextLabel_v];
}

- (void)setDialogMessageModel:(IMCDialogMessageModel *)dialogMessageModel {
    _dialogMessageModel = dialogMessageModel;
    
    _timeLabel.text = dialogMessageModel.time;
    
    _subTextLabel.text = dialogMessageModel.text;
    
    
}


- (void)textImageViewTappedAction:(UITapGestureRecognizer *)sender {
    _textImageView.highlighted = !_textImageView.highlighted;
    if (_textImageView.highlighted) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _textImageView.highlighted = NO;
        });
    }

}
@end
