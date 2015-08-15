//
//  main.m
//  Demo_Block
//
//  Created by zhang xianglu on 15/5/29.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMCCompany.h"

/*
int sum(int a,int b){
	return a + b;
}
*/

/**
 *  给已有的类型定义一个别名
 *	typedef 已有的类型 别名 ;
 */
typedef int (^Sum)(int,int);

typedef NSArray * (^SortArrayBlock)(NSArray *);

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
		NSArray *array = @[@3,@5,@1,@0,@22,@10];
	
		SortArrayBlock sortArrayBlock = ^(NSArray *sortArray){
			NSMutableArray *sortedArray = [sortArray mutableCopy];
			for (NSUInteger i = 0; i < sortArray.count; i ++) {
				for (NSUInteger j = i; j < sortArray.count; j ++) {
					NSInteger numberOfI = [sortArray[i] integerValue];
					NSInteger numberOfJ = [sortArray[j] integerValue];
					
					if (numberOfI > numberOfJ) {
						[sortedArray exchangeObjectAtIndex:i withObjectAtIndex:j];
					}
				}
			}
			return [sortedArray copy];
		};
		
		NSArray *sortedArray = sortArrayBlock(array);
		NSLog(@"sortedArray = %@",sortedArray);
	
		
//		NSArray *array = @[@3,@5,@1,@0,@22,@10];
//		NSArray *sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//			NSComparisonResult comparisonResult = NSOrderedSame;
//			// obj1 obj2 (10,5)
//			if (obj1 > obj2) {
//    			comparisonResult = NSOrderedAscending;
//			}else if(obj1 < obj2){
//				comparisonResult = NSOrderedDescending;
//			}else {
//				comparisonResult = NSOrderedSame;
//			}
//			
//			return comparisonResult;
//		}];
//		
//		NSLog(@"array = %@",sortedArray);
	
	
//		IMCCompany *company = [[IMCCompany alloc] init];
//		
//		company.stockBlock = ^{
//			NSLog(@"外包进货工作...");
//		};
//		
//		[company stock];
	
		
//		__block int a = 100;
//		
//		void (^c)(int) = ^(int b){
//			a = 200;
//			NSLog(@"in a=%d",a);			
//		};
//		
//		NSLog(@"before a=%d",a);
//		
//		c(a);
//		
//		NSLog(@"after a=%d",a);
	
		/**
		 *  块的实例化  [[NSObject alloc] init]
		 */
//		^(int a,int b){
//			return a + b;
//		};
		
		/**
		 *  块变量的定义 NSObject *object =
		 */
//		int (^sum)(int,int) = ^(int a,int b){
//			return a + b;
//		};
		
		/**
		 *  Sum：块变量的类型名
		 *  sumBlock：块变量名
		 *  等号右边：块的实例化
		 */
//		Sum sumBlock = ^(int a,int b){
//			return a + b;
//		};
		
//		int result = sum(100,234);
//		NSLog(@"返回值是: %d",result);
		
	}
    return 0;
}
