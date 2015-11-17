//
//  BDBNoticeListTableCell.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBNoticeListTableCell.h"

@interface BDBNoticeListTableCell ()

/**
 *  内容标题
 */
@property (nonatomic,weak) UILabel *titleLabel;

/**
 *  发布时间
 */
@property(nonatomic,weak) UILabel *pubTimeLabel;

/**
 *  是否已读
 */
@property (weak, nonatomic) IBOutlet UIImageView *isReadImageView;

/**
 *  背景气泡
 */
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImgView;

/**
 *  闹钟图片
 */
@property(nonatomic,weak) UIImageView *clockImgView;

@end

@implementation BDBNoticeListTableCell

- (void)awakeFromNib {
    /**
     *  内容标题
     */
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    titleLabel.numberOfLines = 2;
    titleLabel.textColor = UIColorWithRGB16Radix(0x444444);
    titleLabel.font = UIFontWithNameAndSize(@"Arial Rounded MT Bold" ,15.0f);
    
    [_backgroundImgView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSString *visualFormat = @"H:|-(19)-[titleLabel]-(18)-|";
    NSArray *titleLabelConstraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:@{@"titleLabel": titleLabel}];
    [titleLabel.superview addConstraints:titleLabelConstraints];
    
    
    /**
     *  闹钟图片
     */
    UIImageView *clockImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"index_notice_item_clock"]];
    [_backgroundImgView addSubview:clockImgView];
    self.clockImgView = clockImgView;
    
    clockImgView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *clockImgViewConstraint_W = [NSLayoutConstraint constraintWithItem:clockImgView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:11.0f];
    
    NSLayoutConstraint *clockImgViewConstraint_H = [NSLayoutConstraint constraintWithItem:clockImgView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:11.0f];
    
    [clockImgView addConstraints:@[clockImgViewConstraint_W,clockImgViewConstraint_H]];
    
    
    /**
     *  发布时间
     */
    UILabel *pubTimeLabel = [[UILabel alloc] init];
    pubTimeLabel.textColor = UIColorWithRGB(164, 164, 164);
    pubTimeLabel.font = UIFontWithSize(12);
    
    [_backgroundImgView addSubview:pubTimeLabel];
    self.pubTimeLabel = pubTimeLabel;
    
    pubTimeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    visualFormat = @"H:|-(13)-[clockImgView]-(7)-[pubTimeLabel]-(18)-|";
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:NSLayoutFormatAlignAllCenterY metrics:nil views:@{@"clockImgView": clockImgView,@"pubTimeLabel": pubTimeLabel}];
    [_backgroundImgView addConstraints:constraints];
    
    
    visualFormat = @"V:|-(14)-[titleLabel]-(13)-[pubTimeLabel]-(12)-|";
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:@{@"titleLabel": titleLabel,@"pubTimeLabel": pubTimeLabel}];
    [_backgroundImgView addConstraints:constraints];
}

- (void)setNoticeModel:(BDBNoticeModel *)noticeModel {
    _noticeModel = noticeModel;
    
    _titleLabel.text = _noticeModel.FirstSection;
    _pubTimeLabel.text = _noticeModel.DT;
}

@end
