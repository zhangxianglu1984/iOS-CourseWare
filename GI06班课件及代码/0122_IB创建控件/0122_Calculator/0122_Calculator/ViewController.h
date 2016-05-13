//
//  ViewController.h
//  0122_Calculator
//
//  Created by jianfeng on 15/1/22.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UITextField *num1Field;
@property (weak, nonatomic) IBOutlet UITextField *num2Field;
- (IBAction)calculate:(UIButton *)sender;

@end

