//
//  BDBBaseNavigationController.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/20.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBFrameworkNavigationController.h"
#import "BDBNavigationBar.h"

@interface BDBFrameworkNavigationController () <UINavigationControllerDelegate>

- (void)popViewController;

@end

@implementation BDBFrameworkNavigationController

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self setValue:[BDBNavigationBar new] forKey:@"navigationBar"];
        
        self.delegate = self;
    }
    return self;
}

#pragma mark - UINavigationController Delegate Methods
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if(navigationController.viewControllers.count > 1){
        UIImage *leftBarButtonItemImage = [UIImage imageNamed:@"navigationbar_back"];
        
        leftBarButtonItemImage = [leftBarButtonItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        //UIImageView *leftBarButtonItemImageView =;
        
        UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftBarButtonItemImage style:UIBarButtonItemStylePlain target:self action:@selector(popViewController)];
        
        viewController.navigationItem.leftBarButtonItem = leftBarButtonItem;
    }
    
}

- (void)popViewController {
    [self popViewControllerAnimated:YES];
}


/**
 *  设置状态栏的样式
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}



@end
