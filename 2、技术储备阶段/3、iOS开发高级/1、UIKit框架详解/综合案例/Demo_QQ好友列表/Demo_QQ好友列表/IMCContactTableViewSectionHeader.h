//
//  IMCContactTableViewSectionHeader.h
//  Demo_QQ好友列表
//
//  Created by xiangluzhang on 15/12/16.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,IMCContactTableViewSectionHeaderButtonArrowType){
    IMCContactTableViewSectionHeaderButtonArrowTypeRight = 0,
    IMCContactTableViewSectionHeaderButtonArrowTypeDown
};

@class IMCContactTableViewSectionHeader;

@protocol IMCContactTableViewSectionHeaderDelegate <NSObject>

@optional
- (void)contactTableViewSectionHeader:(IMCContactTableViewSectionHeader *)contactTableViewSectionHeader inSection:(NSInteger)section buttonArrowType:(IMCContactTableViewSectionHeaderButtonArrowType)buttonArrowType;

@end

@interface IMCContactTableViewSectionHeader : UITableViewHeaderFooterView

@property(nonatomic,assign) IMCContactTableViewSectionHeaderButtonArrowType buttonArrowType;

@property(nonatomic,weak) id<IMCContactTableViewSectionHeaderDelegate> delegate;

@property(nonatomic,assign) NSInteger section;

@property(nonatomic,copy) NSString *title;

@end
