//
//  ViewController.m
//  QNA
//
//  Created by jianfeng on 15/1/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *questionArry;
    int currentIndex;
    NSString *filePath;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 获取沙盒路径
    NSString *sandboxPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@",sandboxPath);
    
    filePath = [sandboxPath stringByAppendingPathComponent:@"QA.txt"];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL isExists = [manager fileExistsAtPath:filePath];
    if (!isExists) {
        if ([manager createFileAtPath:filePath contents:nil attributes:nil]) {
            NSLog(@"文件创建成功");
        }
        else{
            NSLog(@"文件创建失败");
        }
    }
    
    NSString *fileContentString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    if (fileContentString.length == 0) {
        questionArry = [NSMutableArray array];
    }
    else{
        questionArry = [NSMutableArray arrayWithArray:[fileContentString componentsSeparatedByString:@"\n"]];
    }
    
    currentIndex = 0;
    [self showQuestion];

//    [@"abc" writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];

//    [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
}

- (IBAction)showAnswer:(UIButton *)sender {
    self.answerLabel.hidden = NO;
    
    if (questionArry.count == 0) {
        return;
    }
    NSString *qAndAString = questionArry[currentIndex];
    NSString *aString = [qAndAString componentsSeparatedByString:@"***"][1];
    self.answerLabel.text = aString;
    
}

- (IBAction)nextQuestion:(UIButton *)sender {
    if (questionArry.count == 0) {
        return;
    }
    currentIndex++;
    if (currentIndex == questionArry.count) {
        currentIndex = 0;
    }
    [self showQuestion];
}

- (void)showQuestion
{
    if (questionArry.count == 0) {
        return;
    }
    NSString *qAndAString = questionArry[currentIndex];
    NSString *qString = [qAndAString componentsSeparatedByString:@"***"][0];
    self.questionLabel.text = qString;
    self.answerLabel.hidden = YES;
}
- (IBAction)addQuestion:(UIButton *)sender {
    if (self.addQuestionField.text.length == 0) {
        NSLog(@"问题为空");
        return;
    }
    else if (self.addAnswerField.text.length == 0){
        NSLog(@"答案为空!");
        return;
    }
    NSString *addQuestionString = self.addQuestionField.text;
    NSString *addAnswerString = self.addAnswerField.text;
    NSString *addQAString = [NSString stringWithFormat:@"%@***%@",addQuestionString,addAnswerString];
    
    NSString *fileContentString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSString *stringToWriteString = nil;
    if (fileContentString.length == 0){
        stringToWriteString = addQAString;
    }
    else{
        stringToWriteString = [NSString stringWithFormat:@"%@\n%@",fileContentString,addQAString];
    }
    
    BOOL isSuccess = [stringToWriteString writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (!isSuccess) {
        NSLog(@"写入失败");
    }
    else{
        NSLog(@"写入成功");
        [questionArry addObject:addQAString];
    }
}
@end
