//
//  IMCSetPasswordViewController.m
//  Demo_手势解锁
//
//  Created by xiangluzhang on 15/12/15.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCSetPasswordViewController.h"

#import "IMCPasswordPadView.h"

@interface IMCSetPasswordViewController () <IMCPasswordPadViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *tipInfoLabel;

@property(nonatomic,weak) IMCPasswordPadView *passwordPadView;


- (void)p_initTipInfoLabel;

@end

@implementation IMCSetPasswordViewController

- (instancetype)init {
    if (self = [super init]) {
        self.title = @"设置密码";
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:nil forKey:@"password"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    IMCPasswordPadView *passwordPadView = [[IMCPasswordPadView alloc] init];
    
    passwordPadView.delegate = self;

    [self.view addSubview:passwordPadView];
    self.passwordPadView = passwordPadView;
    
    passwordPadView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSString *visualFormat = @"H:|-8-[passwordPadView]-8-|";
    NSArray *passwordPadView_constraints_h = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:@{@"passwordPadView":passwordPadView}];
    [self.view addConstraints:passwordPadView_constraints_h];
    
    visualFormat = @"V:[tipInfoLabel]-20-[passwordPadView]-8-|";
    NSArray *passwordPadView_constraints_v = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:NSLayoutFormatAlignAllCenterX metrics:nil views:@{@"tipInfoLabel":_tipInfoLabel,@"passwordPadView":passwordPadView}];
    [self.view addConstraints:passwordPadView_constraints_v];
    
    [self p_initTipInfoLabel];
}

- (void)p_initTipInfoLabel {
    _tipInfoLabel.text = @"请输入密码";
    _tipInfoLabel.textColor = [UIColor yellowColor];
}

#pragma mark - IMCPasswordPadView Delegate Methods
- (void)passwordPadView:(IMCPasswordPadView *)passwordPadView didFinishInputPassword:(NSString *)password {
    _tipInfoLabel.text = @"请再输入一次";
    
    //数据的本地(手机的沙盒)存储
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *lastInputPassword = [userDefaults objectForKey:@"password"];
    if (lastInputPassword == nil) {
        [userDefaults setObject:password forKey:@"password"];
    }else {
        if (![lastInputPassword isEqualToString:password]) {
            _tipInfoLabel.text = @"两次密码输入不一致，请重新输入";
            _tipInfoLabel.textColor = [UIColor redColor];
            
            [userDefaults setObject:nil forKey:@"password"];
        } else {
            _tipInfoLabel.text = @"恭喜您，密码设置成功";
            _tipInfoLabel.textColor = [UIColor greenColor];
            
            [self.navigationController performSelector:@selector(popViewControllerAnimated:) withObject:@(YES) afterDelay:2];
        }
    }
    
}


@end
