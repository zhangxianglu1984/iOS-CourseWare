//
//  BDBLoadDataIndicateView.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/23.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBLoadDataIndicateView.h"

@interface BDBLoadDataIndicateView ()

- (void)p_initSubViews;

@end

@implementation BDBLoadDataIndicateView

+ (instancetype)showInView:(UIView *)view {
    BDBLoadDataIndicateView *indicateView = [[self alloc] init];

    [view addSubview:indicateView];
    
    [indicateView p_initSubViews];
    
    return indicateView;
}

- (void)p_initSubViews {
    if(!self.superview) return;
    
    self.backgroundColor = UIColorWithName(white);
    
    //地球图片
    NSData *earthPlaneImageData = [NSData dataWithContentsOfFile:FilePathInBundleWithNameAndType(@"global_loaddata_icon", @"gif")];
    FLAnimatedImage *earthPlaneImage = [FLAnimatedImage animatedImageWithGIFData:earthPlaneImageData];
    FLAnimatedImageView *earthPlaneImageView = [[FLAnimatedImageView alloc] init];
    earthPlaneImageView.animatedImage = earthPlaneImage;
    [self addSubview:earthPlaneImageView];
    
    //提示加载文字
    UILabel *indicateTextLabel = [[UILabel alloc] init];
    indicateTextLabel.text = @"网速不给力哦，努力加载中...";
    indicateTextLabel.textColor = UIColorWithRGB(164, 164, 164);
    indicateTextLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:indicateTextLabel];
    
    __weak typeof(self) weakSelf = self;
    //aView.property = bView.property * multiplier + constant
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.superview);
    }];
    
    [earthPlaneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(183.0);
        make.height.mas_equalTo(183.0);
        
        make.center.equalTo(weakSelf).centerOffset((CGPoint){0.0,-92.0});
    }];
    
    [indicateTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf).centerOffset((CGPoint){0.0,80.0});
    }];
    
}

- (void)hide {
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
