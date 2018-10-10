//
//  IMCCompany.h
//  Demo_Block
//
//  Created by zhang xianglu on 15/6/1.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

//@protocol  IMCCompanyDelegates;

typedef void (^StockBlock)();


@interface IMCCompany : NSObject

//@property(nonatomic,weak) id<IMCCompanyDelegates> delegate;

@property(nonatomic,copy) StockBlock stockBlock;

- (void)stock;

@end



@protocol IMCCompanyDelegates

/**
 *  必须实现的协议方法
 */
@required

/**
 *  进货协议方法
 */
- (void)stock:(IMCCompany *)company;

@end







