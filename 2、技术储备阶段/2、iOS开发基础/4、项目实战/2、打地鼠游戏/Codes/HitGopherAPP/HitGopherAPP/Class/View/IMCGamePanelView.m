//
//  IMCGamePanelView.m
//  HitGopherAPP
//
//  Created by xiangluzhang on 16/5/19.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

#import "IMCGamePanelView.h"

#import "IMCGopherButton.h"

@interface IMCGamePanelView ()

@property(nonatomic, strong) NSMutableArray *gopherButtons;

@property(nonatomic, strong) NSTimer *timer;

- (void)timerStartAction;

- (void)gopherButtonClickedAction:(IMCGopherButton *)gopherButton;

@end

@implementation IMCGamePanelView

- (instancetype)init{
    if (self = [super init]) {
        
        self.gopherButtons = [NSMutableArray arrayWithCapacity:9];
        
        NSInteger tag = 800;
        for (NSInteger i = 1; i <= 3; i ++) {
            for (NSInteger j = 1; j <= 3; j ++) {
                IMCGopherButton *gopherButton = [IMCGopherButton buttonWithX:0.0 y:0.0 tag:tag];
                tag ++;
                
                [gopherButton addTarget:self action:@selector(gopherButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
                
                [self addSubview:gopherButton];
                
                [_gopherButtons addObject:gopherButton];
            }
        }
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat selfWidth = self.bounds.size.width;
    CGFloat selfHeight = self.bounds.size.height;
    
    CGFloat gopherButtonHorizontalMargin = (selfWidth - 72.0 * 3) / 4.0;
    CGFloat gopherButtonVerticalMargin = (selfHeight - 72.0 * 3) / 4.0;
    
    //遍历数组中的按钮，进行布局 0,1,2,3,4,5,6,7,8
    CGFloat gopherButtonY = 0.0;
    for (NSInteger i = 0, j = 0; i < 9; i ++) {
        IMCGopherButton *gopherButton = _gopherButtons[i];
        
        CGRect gopherButtonFrame = gopherButton.frame;
        
        NSInteger index = i % 3;
        
        //计算x坐标
        CGFloat gopherButtonX = gopherButtonHorizontalMargin * (index + 1) + 72.0 * index;
        
        //计算y坐标
        if (index == 0) {
            j ++;
            gopherButtonY = gopherButtonVerticalMargin * j + 72.0 * (j - 1);
        }
        
        gopherButtonFrame.origin = CGPointMake(gopherButtonX, gopherButtonY);
        
        gopherButton.frame = gopherButtonFrame;
    }
}

- (void)startGame{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStartAction) userInfo:nil repeats:YES];
}

- (void)stopGame {
    [_timer invalidate];
}

- (void)pauseGame {
    [_timer invalidate];
}

- (void)timerStartAction{
    [_gopherButtons enumerateObjectsUsingBlock:^(IMCGopherButton *  _Nonnull gopherButton, NSUInteger idx, BOOL * _Nonnull stop) {
        gopherButton.gopherAppeared = NO;
    }];
    
    NSInteger randomGopherButtonIndex = arc4random() % 9;
    
    IMCGopherButton *gopherButton = [_gopherButtons objectAtIndex:randomGopherButtonIndex];
    gopherButton.gopherAppeared = YES;
}

- (void)gopherButtonClickedAction:(IMCGopherButton *)gopherButton {
    if (gopherButton.gopherAppeared) {
        if ([_delegate respondsToSelector:@selector(gopherHitted)]) {
            [_delegate gopherHitted];
        }
    }
}

@end
