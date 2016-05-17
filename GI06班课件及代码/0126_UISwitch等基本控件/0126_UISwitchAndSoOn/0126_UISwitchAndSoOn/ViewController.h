//
//  ViewController.h
//  0126_UISwitchAndSoOn
//
//  Created by jianfeng on 15/1/26.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (void)chooseColor:(UISegmentedControl *)sender;
- (IBAction)changeAlpha:(UISlider *)sender;
- (IBAction)changeSex:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UIView *panelBg;

@property (weak, nonatomic) IBOutlet UIButton *butterfly;
@property (weak, nonatomic) IBOutlet UIView *clothes;
@property (strong, nonatomic) UISegmentedControl *segmentControl;
@end

