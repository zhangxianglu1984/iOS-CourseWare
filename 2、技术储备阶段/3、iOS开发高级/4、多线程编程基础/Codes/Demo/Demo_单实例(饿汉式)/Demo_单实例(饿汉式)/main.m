//
//  main.m
//  Demo_单实例(饿汉式)
//
//  Created by zhang xianglu on 15/6/2.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMCPerson.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    IMCPerson *person_1 = [IMCPerson sharedInstance];
		NSLog(@"person_1: %@",person_1);
		
		IMCPerson *person_2 = [IMCPerson sharedInstance];
		NSLog(@"person_2: %@",person_2);
		
		IMCPerson *person_3 = [IMCPerson sharedInstance];
		NSLog(@"person_3: %@",person_3);
	}
    return 0;
}
