//
//  BDBIndexTableHeaderView.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/27.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBIndexTableHeaderView.h"

@interface BDBIndexTableHeaderView ()

@property(nonatomic,weak) FLAnimatedImageView *earthGifImageView;

- (void)p_initEarthGifImageView;

@end

@implementation BDBIndexTableHeaderView

- (instancetype)init {
    if (self = [super init]) {
        [self p_initEarthGifImageView];
    }
    return self;
}

#pragma mark - Private Methods
- (void)p_initEarthGifImageView {
    NSString *earthGifImageFilePath = [[NSBundle mainBundle] pathForResource:@"index_top_adv" ofType:@"gif"];
    
    NSData *earthGifImageData = [NSData dataWithContentsOfFile:earthGifImageFilePath];
    
    FLAnimatedImage *earthGifImage = [FLAnimatedImage animatedImageWithGIFData:earthGifImageData];
    
    FLAnimatedImageView *earthGifImageView = [[FLAnimatedImageView alloc] init];
    earthGifImageView.animatedImage = earthGifImage;
    
    [self addSubview:earthGifImageView];
    self.earthGifImageView = earthGifImageView;
    
    //根据不同的屏幕宽度，计算imageView高度
    CGSize earthGifImageOriginalSize = [earthGifImage size];
    
    CGFloat earthGifImageCalHeight = SCREEN_WIDTH * earthGifImageOriginalSize.height / earthGifImageOriginalSize.width;
    
    [_earthGifImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(earthGifImageCalHeight);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(earthGifImageCalHeight);
    }];
}

@end
