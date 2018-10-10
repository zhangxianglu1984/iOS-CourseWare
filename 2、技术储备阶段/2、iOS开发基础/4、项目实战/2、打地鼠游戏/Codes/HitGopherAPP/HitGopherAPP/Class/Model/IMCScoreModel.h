//
//  IMCScoreModel.h
//  HitGopherAPP
//
//  Created by xiangluzhang on 16/5/19.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IMCScoreModel;

@protocol IMCScoreModelDelegate <NSObject>

@optional

- (void)scoreModel:(IMCScoreModel *)scoreModel scoreChanged:(NSInteger)score;

@end


@interface IMCScoreModel : NSObject

@property(nonatomic, assign) NSInteger score;

@property(nonatomic, weak) id<IMCScoreModelDelegate> delegate;

/*
 *  重置分数
 **/
- (void)resetScore;

/*
 *  加分
 **/
- (void)addScore;


@end
