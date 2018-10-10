//
//  ZTCalculatorViewController.m
//  ZTCalculator
//
//  Created by 笨仔 on 16/6/25.
//  Copyright © 2016年 tonyguan. All rights reserved.
//

#import "KRMainViewController.h"

#import "KRBrainModel.h"


@interface KRMainViewController () <KRBrainModelDelegate>

@property (weak, nonatomic) IBOutlet UIButton *oneButton;

@property (weak, nonatomic) IBOutlet UIButton *towButton;

@property (weak, nonatomic) IBOutlet UIButton *threeButton;

@property (weak, nonatomic) IBOutlet UIButton *fourButton;

@property (weak, nonatomic) IBOutlet UIButton *fiveButton;

@property (weak, nonatomic) IBOutlet UIButton *sixButton;

@property (weak, nonatomic) IBOutlet UIButton *sevenButton;

@property (weak, nonatomic) IBOutlet UIButton *eightButton;

@property (weak, nonatomic) IBOutlet UIButton *nineButton;

@property (weak, nonatomic) IBOutlet UIButton *zeroButton;

@property (weak, nonatomic) IBOutlet UIButton *pointButton;

@property (weak, nonatomic) IBOutlet UIButton *clearButton;

@property (weak, nonatomic) IBOutlet UIButton *pomButton;

@property (weak, nonatomic) IBOutlet UIButton *perButton;

@property (weak, nonatomic) IBOutlet UIButton *signButton;

@property (weak, nonatomic) IBOutlet UIButton *multipleButton;

@property (weak, nonatomic) IBOutlet UIButton *minusButton;

@property (weak, nonatomic) IBOutlet UIButton *addButton;

@property (weak, nonatomic) IBOutlet UIButton *equalButton;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property(nonatomic, strong) KRBrainModel *brainModel;

- (void)numberButtonClickedAction:(UIButton *)button;

- (void)clearButtonClickedAction;

- (void)pomButtonClickedAction;

- (void)perButtonClickedAction;

- (void)operatorButtonClickedAction:(UIButton *)button;

- (void)equalButtonClickedAction;

- (void)pointButtonClickedAction;

/*
 * 标识用户是否正在输入中
 **/
@property(nonatomic, assign) BOOL isNumberTyping;

@end

@implementation KRMainViewController

//storyboard在初始化这个控制器对象时，不是调用该对象的init方法
//- (instancetype)init {
//    if (self = [super init]) {
//        NSLog(@"asdfasdfasdfasdf");
//    }
//    return self;
//}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.isNumberTyping = NO;
        
        self.brainModel = [[KRBrainModel alloc] init];
        _brainModel.delegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _oneButton.layer.borderWidth = 0.4;
    _oneButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_oneButton addTarget:self action:@selector(numberButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _towButton.layer.borderWidth = 0.4;
    _towButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_towButton addTarget:self action:@selector(numberButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _threeButton.layer.borderWidth = 0.4;
    _threeButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_threeButton addTarget:self action:@selector(numberButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _fourButton.layer.borderWidth = 0.4;
    _fourButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_fourButton addTarget:self action:@selector(numberButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _fiveButton.layer.borderWidth = 0.4;
    _fiveButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_fiveButton addTarget:self action:@selector(numberButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _sixButton.layer.borderWidth = 0.4;
    _sixButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_sixButton addTarget:self action:@selector(numberButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _sevenButton.layer.borderWidth = 0.4;
    _sevenButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_sevenButton addTarget:self action:@selector(numberButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _eightButton.layer.borderWidth = 0.4;
    _eightButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_eightButton addTarget:self action:@selector(numberButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _nineButton.layer.borderWidth = 0.4;
    _nineButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_nineButton addTarget:self action:@selector(numberButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _zeroButton.layer.borderWidth = 0.4;
    _zeroButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_zeroButton addTarget:self action:@selector(numberButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _pointButton.layer.borderWidth = 0.4;
    _pointButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_pointButton addTarget:self action:@selector(pointButtonClickedAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    _clearButton.layer.borderWidth = 0.4;
    _clearButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_clearButton addTarget:self action:@selector(clearButtonClickedAction) forControlEvents:UIControlEventTouchUpInside];
    
    _pomButton.layer.borderWidth = 0.4;
    _pomButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_pomButton addTarget:self action:@selector(pomButtonClickedAction) forControlEvents:UIControlEventTouchUpInside];
    
    _perButton.layer.borderWidth = 0.4;
    _perButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_perButton addTarget:self action:@selector(perButtonClickedAction) forControlEvents:UIControlEventTouchUpInside];
    
    _signButton.layer.borderWidth = 0.4;
    _signButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_signButton addTarget:self action:@selector(operatorButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _multipleButton.layer.borderWidth = 0.4;
    _multipleButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_multipleButton addTarget:self action:@selector(operatorButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _minusButton.layer.borderWidth = 0.4;
    _minusButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_minusButton addTarget:self action:@selector(operatorButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _addButton.layer.borderWidth = 0.4;
    _addButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_addButton addTarget:self action:@selector(operatorButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _equalButton.layer.borderWidth = 0.4;
    _equalButton.layer.borderColor = [UIColor blackColor].CGColor;
    [_equalButton addTarget:self action:@selector(equalButtonClickedAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)numberButtonClickedAction:(UIButton *)button {
    if (!_isNumberTyping) {
        _numberLabel.text = [button titleForState:UIControlStateNormal];
        
        if (![@"0" isEqualToString:[button titleForState:UIControlStateNormal]]) {
            self.isNumberTyping = YES;
        }
        
    } else {
        _numberLabel.text = [_numberLabel.text stringByAppendingString:[button titleForState:UIControlStateNormal]];
    }
}

- (void)clearButtonClickedAction {
    _numberLabel.text = @"0";
    _isNumberTyping = NO;
    
    [_brainModel clear];
}

- (void)pomButtonClickedAction {
    if (!_isNumberTyping) {
        return;
    }
    
    NSRange pomRange = [_numberLabel.text rangeOfString:@"-"];
    
    _numberLabel.text = (pomRange.location != NSNotFound)? [_numberLabel.text substringFromIndex:pomRange.location + 1] : [@"-" stringByAppendingString:_numberLabel.text];
}

- (void)perButtonClickedAction {
    if (!_isNumberTyping) {
        return;
    }
    
    _numberLabel.text = [NSString stringWithFormat:@"%lg", [_numberLabel.text doubleValue] * 0.01];
}

- (void)operatorButtonClickedAction:(UIButton *)button {
    if(_isNumberTyping) {
        //将操作数压栈 string -> double -> nsnumber
        NSNumber *operand = [NSNumber numberWithDouble:[_numberLabel.text doubleValue]];
        [_brainModel inputOperand:operand];
        
        //将操作符压栈
        NSString *operator = [button titleForState:UIControlStateNormal];
        [_brainModel inputOperator:operator];
        
        _isNumberTyping = NO;
    }
    
    
}

- (void)equalButtonClickedAction {
    if (_isNumberTyping) {
        //将操作数压栈 string -> double -> nsnumber
        NSNumber *operand = [NSNumber numberWithDouble:[_numberLabel.text doubleValue]];
        
        [_brainModel inputOperand:operand];
        
        [_brainModel inputOperator:@"="];
        
        _isNumberTyping = NO;
    }
}

- (void)pointButtonClickedAction {
    if (!_isNumberTyping) {
        _isNumberTyping = YES;
    }
    
    NSRange pointRange = [_numberLabel.text rangeOfString:@"."];
    if (pointRange.location == NSNotFound) {
        _numberLabel.text = [_numberLabel.text stringByAppendingString:@"."];
    }
}

#pragma mark - KRBrainModel Delegate Methods
/*
 *  计算出结果后，通知代理
 **/
- (void)brainModel:(KRBrainModel *)brainModel calculatedValue:(NSNumber *)value {
    _numberLabel.text = [value stringValue];
}



@end
