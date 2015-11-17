//
//  BDBFrameworkTabBarController.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/20.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBFrameworkTabBarController.h"

@interface BDBFrameworkTabBarController ()

@end

@implementation BDBFrameworkTabBarController

- (instancetype)init {
    if (self = [super init]) {
        NSString *modulePlistFilePath = FilePathInBundleWithNameAndType(@"Module", @"plist");
        
        NSArray *modules = [[NSArray alloc] initWithContentsOfFile:modulePlistFilePath];
        
        NSMutableArray *viewControllers = [NSMutableArray array];
        [modules enumerateObjectsUsingBlock:^(NSDictionary  * _Nonnull module, NSUInteger idx, BOOL * _Nonnull stop) {
            //实例化子控制器(让storyboard帮我们创建)
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:module[@"name"] bundle:nil];
            
            UIViewController *viewController = [storyBoard instantiateInitialViewController];
            
            UIImage *iconImage = [UIImageWithName(module[@"icon"]) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UIImage *iconImageHighlighted = [UIImageWithName(module[@"icon_highlighted"]) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:module[@"title"] image:iconImage selectedImage:iconImageHighlighted];
            
            viewController.tabBarItem = tabBarItem;
            
            [viewControllers addObject:viewController];
        }];
        
        self.viewControllers = [viewControllers copy];
    }
    
    return self;
}


@end
