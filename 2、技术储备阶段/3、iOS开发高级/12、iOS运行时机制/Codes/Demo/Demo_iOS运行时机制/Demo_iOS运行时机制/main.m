//
//  main.m
//  Demo_iOS运行时机制
//
//  Created by xiangluzhang on 15/9/2.
//  Copyright (c) 2015年 xiangluzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

#import "IMCPerson.h"

static NSUInteger age;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        IMCPerson *person = [[IMCPerson alloc] init];
        
        objc_msgSend(person, @selector(setName:),@"张三");
        NSLog(@"%@",person.name);
        
        objc_setAssociatedObject(person, &age, @20, OBJC_ASSOCIATION_ASSIGN);
        
        id ageObjc = objc_getAssociatedObject(person, &age);
        NSLog(@"%@",ageObjc);
        
        unsigned int varCount = 0;
        Ivar *ivars = class_copyIvarList([IMCPerson class], &varCount);
        
        //便利所有成员变量
        for(NSUInteger i = 0; i < varCount; i ++){
            Ivar ivar = ivars[i];
            //成员变量名
            const char *varName = ivar_getName(ivar);
            NSLog(@"varName: %s",varName);
            
            //成员变量类型
            const char *varType = ivar_getTypeEncoding(ivar);
            NSLog(@"varType: %s",varType);
            
            
        }
        
        
        NSLog(@"varCount: %i",varCount);
    }
    return 0;
}
