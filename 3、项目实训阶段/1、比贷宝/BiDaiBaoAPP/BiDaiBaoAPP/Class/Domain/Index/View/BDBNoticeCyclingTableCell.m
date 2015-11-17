//
//  BDBNoticeCyclingTableCell.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/30.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBNoticeCyclingTableCell.h"
#import "BBCyclingLabel.h"
#import "BDBNoticeModel.h"

@interface BDBNoticeCyclingTableCell ()

@property(nonatomic,weak) BBCyclingLabel *noticeCyclingLabel;

- (void)p_initNoticeCyclingLabel;

- (void)p_changeNoticeCyclingLabelText;

@end

@implementation BDBNoticeCyclingTableCell

+ (BDBNoticeCyclingTableCell *)cellWithTableView:(UITableView *)tableView {
    static NSString *cellIdentifier = @"BDBNoticeCyclingTableCell";
    
    BDBNoticeCyclingTableCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!tableViewCell) {
        tableViewCell = [[BDBNoticeCyclingTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        tableViewCell.backgroundColor = UIColorWithRGB(84.0, 86.0, 91.0);
    }
    
    return tableViewCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.displayingNoticeModelIndex = 0;
        
        [self p_initNoticeCyclingLabel];
    }
    return self;
}

/**
 *  在这个方法中。单元格的frame已经确定了
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    _noticeCyclingLabel.frame = CGRectMake(0, 15.0, SCREEN_WIDTH, 30.0);
}

#pragma mark - Private Methods
- (void)p_initNoticeCyclingLabel {
    BBCyclingLabel *noticeCyclingLabel = [BBCyclingLabel new];
    noticeCyclingLabel.backgroundColor = [UIColor clearColor];
    
    noticeCyclingLabel.textColor = [UIColor whiteColor];
    noticeCyclingLabel.font = UIFontWithSize(12);
    noticeCyclingLabel.textAlignment = NSTextAlignmentCenter;
    
    noticeCyclingLabel.transitionEffect = BBCyclingLabelTransitionEffectScrollUp | BBCyclingLabelTransitionEffectFadeOut;
    noticeCyclingLabel.transitionDuration = 0.3f;
    
    [self.contentView addSubview:noticeCyclingLabel];
    self.noticeCyclingLabel = noticeCyclingLabel;
}

- (void)setNoticeModels:(NSArray *)noticeModels {
    _noticeModels = noticeModels;
    
    BDBNoticeModel *noticeModel = _noticeModels[_displayingNoticeModelIndex];
    [_noticeCyclingLabel setText:noticeModel.Title animated:NO];
    
    //启动定时器，显示不同的文字
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(p_changeNoticeCyclingLabelText) userInfo:nil repeats:YES];
}

#pragma mark - Private Methods
- (void)p_changeNoticeCyclingLabelText {
    self.displayingNoticeModelIndex ++;
    if (_displayingNoticeModelIndex >= _noticeModels.count) {
        self.displayingNoticeModelIndex = 0;
    }
    
    BDBNoticeModel *noticeModel = _noticeModels[_displayingNoticeModelIndex];
    
    _noticeCyclingLabel.text = noticeModel.Title;
    
}

@end
