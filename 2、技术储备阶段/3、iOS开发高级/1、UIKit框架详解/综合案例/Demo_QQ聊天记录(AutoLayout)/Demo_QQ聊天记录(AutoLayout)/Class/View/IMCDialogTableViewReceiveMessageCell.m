//
//  IMCDialogTableViewReceiveMessageCell.m
//  Demo_QQ聊天记录(AutoLayout)
//
//  Created by xiangluzhang on 15/12/18.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//



#import "IMCDialogTableViewReceiveMessageCell.h"

#import "IMCDialogMessageModel.h"

@interface IMCDialogTableViewReceiveMessageCell ()
@property (weak, nonatomic) IBOutlet UIImageView *textImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;





@property(nonatomic,weak) UILabel *label;

@end

@implementation IMCDialogTableViewReceiveMessageCell

+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    IMCDialogTableViewReceiveMessageCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"IMCDialogTableViewReceiveMessageCell" forIndexPath:indexPath];
    
    return tableViewCell;
}

- (void)awakeFromNib {
    
    
    self.backgroundColor = [UIColor redColor];
    
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.textColor = [UIColor grayColor];
    self.timeLabel.font = [UIFont systemFontOfSize:14.0];
    // 设置单元格样式
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //在内容视图上添加点击手势 同时添加点击事件
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textImageViewTappedAction:)];
    [_textImageView addGestureRecognizer:tapGestureRecognizer];
    //在内容视图上添加文本label
    UILabel *label = [UILabel new];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14.0];
    [self.textImageView addSubview:label];
    self.label = label;
    
    //换行配置（文本自动换行）
    label.lineBreakMode = NSLineBreakByCharWrapping;
    label.numberOfLines = 0;
    
    label.translatesAutoresizingMaskIntoConstraints = NO;
    //对文本label进行布局
    NSString *visualFormat = @"H:|-20-[label]-20-|";
    NSArray *constraints_label_h = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:@{@"label":label}];
    [_textImageView addConstraints:constraints_label_h];
    
    visualFormat = @"V:|-15-[label]-15-|";
    NSArray *constraints_label_v = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:@{@"label":label}];
    [_textImageView addConstraints:constraints_label_v];
}

//点击手势单击事件
-(void)textImageViewTappedAction:(UITapGestureRecognizer *)tapGestureRecongnizer{
    
    _textImageView.highlighted = !_textImageView.highlighted;
    if (_textImageView.highlighted) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _textImageView.highlighted = NO;
        });
    }
}
//从数据模型中获取数据
- (void)setDialogMessageModel:(IMCDialogMessageModel *)dialogMessageModel {
    _dialogMessageModel = dialogMessageModel;
    
    _label.text = _dialogMessageModel.text;
    _timeLabel.text = _dialogMessageModel.time;
    
    //NSLog(@"%s",__FUNCTION__);
}



@end
