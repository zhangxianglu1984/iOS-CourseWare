//
//  IMCGopherButton.h
//  HitGopherAPP
//
//  Created by xiangluzhang on 16/5/19.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

//前向声明(向编译器保证,我后面肯定会定义IMCGopherButton这个类,请通过)
@class IMCGopherButton;

@protocol IMCGopherButtonDelegate <NSObject>

@optional
/*
 *  通知代理，自己在地鼠出现的时候，被点击了
 **/
- (void)gopherButton:(IMCGopherButton *)gopherButton clickedOnGopherAppeared:(BOOL)gopherAppeared;

@end

@interface IMCGopherButton : UIButton

@property(nonatomic, weak) id<IMCGopherButtonDelegate> delegate;

@property(nonatomic, assign) BOOL gopherAppeared;

+ (IMCGopherButton *)buttonWithX:(CGFloat)x y:(CGFloat)y tag:(NSInteger)tag;


@end
