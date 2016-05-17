//
//  main.m
//  Strong_Weak
//
//  Created by jianfeng on 15/2/5.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        // 默认情况下都是强指针
//        Student *stu = [[Student alloc]init];
//        
//        Student *stu2 = [[Student alloc]init];
//        stu2 = stu;
        
        //  不要写成这种方式,因为对象一被创建就被马上销毁了
//        __weak Student *stu3 = [[Student alloc]init];
        
//        // 弱指针需要加上__weak修饰符
//        __weak Student *stu0;
        
        // ARC情况下,如果一个对象没有任何强指针引用它,就会被销毁
        
//        Student *stu4 = [[Student alloc]init];
//        Book *book4 = [[Book alloc]init];
//        stu4.book = book4;
//        book4 = nil;
//        
//        NSLog(@"%@",stu4.book);
        
        // 这样会导致循环引用
        Student *stu5 = [[Student alloc]init];
        Book *book5 = [[Book alloc]init];
        stu5.book = book5;
        book5.owner = stu5;
  
    }
    return 0;
}
