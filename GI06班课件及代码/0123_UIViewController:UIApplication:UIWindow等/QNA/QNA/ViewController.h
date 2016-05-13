//
//  ViewController.h
//  QNA
//
//  Created by jianfeng on 15/1/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
- (IBAction)showAnswer:(UIButton *)sender;
- (IBAction)nextQuestion:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *addQuestionField;
@property (weak, nonatomic) IBOutlet UITextField *addAnswerField;
- (IBAction)addQuestion:(UIButton *)sender;
@end

