//
//  IMCContactTableViewSectionHeader.m
//  Demo_QQ好友列表
//
//  Created by xiangluzhang on 15/12/16.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCContactTableViewSectionHeader.h"

@interface IMCContactTableViewSectionHeader ()

@property(nonatomic,weak) UIButton *contactTableViewSectionHeaderButton;

- (void)contactTableViewSectionHeaderButtonClickedAction;

- (void)p_initContactTableViewSectionHeaderButton;
- (void)p_layoutContactTableViewSectionHeaderButton;

@end

@implementation IMCContactTableViewSectionHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.buttonArrowType = IMCContactTableViewSectionHeaderButtonArrowTypeRight;
        
        self.contentView.backgroundColor = [UIColor orangeColor];
        
        [self p_initContactTableViewSectionHeaderButton];
    }
    return self;
}

- (void)p_initContactTableViewSectionHeaderButton {
    UIButton *contactTableViewSectionHeaderButton = [[UIButton alloc] initWithFrame:CGRectZero];
    
    //设置按钮图片
    [contactTableViewSectionHeaderButton setImage:[UIImage imageNamed:@"disclosure"] forState:UIControlStateNormal];
    
    [contactTableViewSectionHeaderButton addTarget:self action:@selector(contactTableViewSectionHeaderButtonClickedAction) forControlEvents:UIControlEventTouchUpInside];
    
    contactTableViewSectionHeaderButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
//    contactTableViewSectionHeaderButton.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
//    contactTableViewSectionHeaderButton.tintColor = [UIColor orangeColor];
    
    [self.contentView addSubview:contactTableViewSectionHeaderButton];
    
    self.contactTableViewSectionHeaderButton = contactTableViewSectionHeaderButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self p_layoutContactTableViewSectionHeaderButton];
}

- (void)p_layoutContactTableViewSectionHeaderButton {
    _contactTableViewSectionHeaderButton.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}

- (void)contactTableViewSectionHeaderButtonClickedAction {
    //改变箭头的方向
    switch (_buttonArrowType) {
        case IMCContactTableViewSectionHeaderButtonArrowTypeRight: {
            self.buttonArrowType = IMCContactTableViewSectionHeaderButtonArrowTypeDown;
            
            //视图的旋转
            _contactTableViewSectionHeaderButton.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
            
            break;
        }
            
        case IMCContactTableViewSectionHeaderButtonArrowTypeDown: {
            self.buttonArrowType = IMCContactTableViewSectionHeaderButtonArrowTypeRight;
            
            //视图的旋转
            _contactTableViewSectionHeaderButton.imageView.transform = CGAffineTransformMakeRotation(0.0);
            
            break;
        }
        
        default:
            break;
    }
    
    if ([_delegate respondsToSelector:@selector(contactTableViewSectionHeader:inSection:buttonArrowType:)]) {
        [_delegate contactTableViewSectionHeader:self inSection:_section buttonArrowType:_buttonArrowType];
    }
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    //设置按钮标题
    [_contactTableViewSectionHeaderButton setTitle:title forState:UIControlStateNormal];
}


@end
