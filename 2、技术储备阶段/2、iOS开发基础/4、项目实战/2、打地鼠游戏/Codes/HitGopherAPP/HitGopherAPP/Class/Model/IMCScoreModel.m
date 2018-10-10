//
//  IMCScoreModel.m
//  HitGopherAPP
//
//  Created by xiangluzhang on 16/5/19.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

#import "IMCScoreModel.h"

@implementation IMCScoreModel

- (instancetype)init {
    if (self = [super init]) {
        [self resetScore];
    }
    return self;
}

/*
 *  重置分数
 **/
- (void)resetScore {
    self.score = 0;
}

/*
 *  加分
 **/
- (void)addScore {
    self.score ++;
}

- (void)setScore:(NSInteger)score {
    _score = score;
    
    if ([_delegate respondsToSelector:@selector(scoreModel:scoreChanged:)]) {
        [_delegate scoreModel:self scoreChanged:_score];
    }
}




@end
