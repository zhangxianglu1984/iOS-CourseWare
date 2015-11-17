//
//  IMCTableViewRefreshHeader.m
//  Demo_KaoShi
//
//  Created by xiangluzhang on 15/10/16.
//  Copyright (c) 2015年 xiangluzhang. All rights reserved.
//

#import "BDBTableViewRefreshHeader.h"

@interface BDBTableViewRefreshHeader ()

/**
 *  动画图标
 */
@property(nonatomic,weak) FLAnimatedImageView *earthRocketIconImgView;

/**
 *  提示信息
 */
@property(nonatomic,weak) UILabel *indicateLabel;

- (void)initEarthRocketIconImageView;

- (void)initIndicateLabel;

@end


@implementation BDBTableViewRefreshHeader

- (void)prepare {
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 50.0;
    
    //对子控件进行实例化
    [self initEarthRocketIconImageView];
    
    [self initIndicateLabel];
}

- (void)placeSubviews {
    [super placeSubviews];
    
    _earthRocketIconImgView.bounds = CGRectMake(0, 0, 40, 40);
    _earthRocketIconImgView.center = CGPointMake(self.mj_w*0.5-25, self.mj_h*0.5);
    
    _indicateLabel.bounds = CGRectMake(0, 0, 60, 30);
    _indicateLabel.center = CGPointMake(self.mj_w*0.5+25, self.mj_h*0.5);
}

- (void)initEarthRocketIconImageView {
    NSString *earthRocketIconImgPath = [[NSBundle mainBundle] pathForResource:@"global_refreshdata_icon" ofType:@"gif"];
    
    NSData *earthRocketIconImgData = [NSData dataWithContentsOfFile:earthRocketIconImgPath];
    
    FLAnimatedImage *earthRocketIconImg = [FLAnimatedImage animatedImageWithGIFData:earthRocketIconImgData];
    
    FLAnimatedImageView *earthRocketIconImageView = [[FLAnimatedImageView alloc] init];
    earthRocketIconImageView.animatedImage = earthRocketIconImg;
    
    [self addSubview:earthRocketIconImageView];
    
    self.earthRocketIconImgView = earthRocketIconImageView;
}

- (void)initIndicateLabel {
    UILabel *indicateLabel = [[UILabel alloc] init];
    indicateLabel.text = @"松手更新...";
    indicateLabel.font = [UIFont systemFontOfSize:12.0f];
    indicateLabel.textColor = [UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1.0];
    
    [self addSubview:indicateLabel];
    
    self.indicateLabel = indicateLabel;
}


@end
