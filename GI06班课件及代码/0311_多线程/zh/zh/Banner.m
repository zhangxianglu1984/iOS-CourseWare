//
//  Banner.m
//  zh
//
//  Created by jianfeng on 15/3/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "Banner.h"
#import "Defines.h"

#define kBannerHeight 250

@implementation Banner

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(kScreenWidth, kBannerHeight);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    if (self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kBannerHeight) collectionViewLayout:layout]) {
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}

@end
