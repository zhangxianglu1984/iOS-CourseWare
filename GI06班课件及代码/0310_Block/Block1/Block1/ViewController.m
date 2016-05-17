//
//  ViewController.m
//  Block1
//
//  Created by jianfeng on 15/3/10.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

typedef NSString *(^subFunction)(NSString *, int);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 没有参数没有返回值
//    [self blockTest1];
    // 有参数有返回值
//    [self blockTest2];
    // 有参数没有返回值
//    [self blockTest3];
    // block修改外部变量
//    [self blockTest4];
    // 使用typedef定义block类型
    [self blockTest5];
    
    
    
}

- (void)blockTest1
{
    // block的声明有三个部分
    // 返回值类型(^变量名)([形参类型] [形参名], [形参类型] [形参名],...)
    
    // 如果block没有参数,那么后面block赋值的地方表示参数的括号可以省略
    void(^logBlock)() = ^(){
        NSLog(@"*****");
    };
    
    // 这个block和上面的一样
//    void(^logBlock)() = ^{
//        NSLog(@"*****");
//    };
    
    logBlock();
    
    void(^logBlock2)();
    logBlock2 = ^{
        NSLog(@"----====");
    };
    
    logBlock2();

}

- (void)blockTest2
{
    // 声明中如果有形参,形参名可以省略,但是形参类型不能省略
    int(^sum)(int,int) = ^(int a, int b){
        return a + b;
    };
    
    int result = sum(1, 2);
    NSLog(@"%d",result);
}

- (void)blockTest3
{
    void(^printStar)(int) = ^(int n){
        for (int i = 0; i < n; i++) {
            NSLog(@"**********");
        }
    };
    
    printStar(6);
}

- (void)blockTest4
{
    __block int m = 10;
    
    // block可以访问外部变量,但是在默认情况下不能够修改
    // 如果要访问外部变量,需要在变量前加上__block修饰符(block前面两个下划线)
    int(^mul)(int, int) = ^(int a, int b){
        m++;
        NSLog(@"m:%d",m);
        return a*b*m;
    };
    
    NSLog(@"mul:%d",mul(2,3));
}

- (void)blockTest5
{
    // subHeader(block不带*)
    subFunction subHeader = ^(NSString *str, int n){
        return [str substringToIndex:n];
    };
    
    // subTail
    subFunction subTail = ^(NSString *str, int n){
        return [str substringFromIndex:n];
    };
    
    NSString *header = subHeader(@"aaabbbccc",4);
    NSString *tail = subTail(@"aaabbbccc",4);
    
    NSLog(@"%@--%@",header,tail);
}

                             



@end
