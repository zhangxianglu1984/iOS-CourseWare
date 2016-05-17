//
//  YMStepper.m
//  YAMI
//
//  Created by Apple on 14-9-2.
//  Copyright (c) 2014年 Summer. All rights reserved.
//

#import "YMStepper.h"
//#import "UIButton+Util.h"
//#import "ATTextField.h"

@interface YMStepper()
//{
//    ATTextField *countTextField;
//    UIButton *minusButton;
//    UIButton *plusButton;
//}

//@property (weak, nonatomic) IBOutlet UIButton *minusButton;
//@property (weak, nonatomic) IBOutlet ATTextField *countTextField;
//@property (weak, nonatomic) IBOutlet UIButton *plusButton;

@end

@implementation YMStepper

//- (void)awakeFromNib
//{
////    NSLog(@"awake from nib");
//    [super awakeFromNib];
//    [[NSBundle mainBundle] loadNibNamed:@"YMStepper" owner:nil options:nil];
//    [self addSubview:self.contentView];
//    
//    self.countTextField.ATDelegate = self;
//    self.count = 6;
//}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.countTextField.ATDelegate = self;
        self.count = 6;
        
//        minusButton = [UIButton buttonWithFrame:CGRectMake(0, 0, 44, 44)
//                                    normalImage:[UIImage imageNamed:@"order_minusButton"]
//                               highlightedImage:nil
//                                         target:self
//                                      andAction:@selector(minus:)];
//        [minusButton setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
//        [self addSubview:minusButton];
//
//        UIImageView *tfBg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(minusButton.frame)+7, 12, 33, 20)];
//        tfBg.image = [UIImage imageNamed:@"order_stepperTextFieldBg"];
//        [self addSubview:tfBg];
//        
//        countTextField = [[ATTextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(minusButton.frame)+7,
//                                                                 0,
//                                                                 33,
//                                                                 44)];
//        countTextField.font = [UIFont systemFontOfSize:14];
//        countTextField.textAlignment = NSTextAlignmentCenter;
//        countTextField.keyboardType = UIKeyboardTypeNumberPad;
//        countTextField.clearButtonMode = UITextFieldViewModeNever;
//        countTextField.ATDelegate = self;
//        [self addSubview:countTextField];
//        
//        plusButton = [UIButton buttonWithFrame:CGRectMake(CGRectGetMaxX(countTextField.frame)+7, 0, 44, 44)// 21 20
//                                   normalImage:[UIImage imageNamed:@"order_plusButton"]
//                              highlightedImage:nil
//                                        target:self
//                                     andAction:@selector(plus:)];
//        [plusButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
//        [self addSubview:plusButton];
//        
//        self.count = 6;
    }
    return self;
}

- (IBAction)minus:(UIButton *)button
{
    self.count--;
}

- (IBAction)plus:(UIButton *)button
{
    self.count++;
}

//- (void)setCount:(NSInteger)count
//{
//    if (count > 0 && _count != count) {
//        _count = count;
//        self.countTextField.text = [@(_count) stringValue];
//        self.minusButton.enabled = (BOOL)(_count > 1);
//        if (_delegate && [_delegate respondsToSelector:@selector(stepper:valueDidChanged:)]) {
//            [_delegate stepper:self valueDidChanged:_count];
//        }
//    }
//}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.count = [textField.text integerValue];
}

@end
