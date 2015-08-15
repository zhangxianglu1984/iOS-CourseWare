//
//  main.m
//  Demo_XML数据解析(NSXMLParser)
//
//  Created by zhang xianglu on 15/6/18.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLParser.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	
		NSString *xmlContent = @"<persons><person id=\"1\"><name>张三</name><age>20</age></person><person id=\"2\"><name>王五</name><age>22</age></person><person id=\"3\"><name>赵六</name><age>25</age></person></persons>";
		
		XMLParser *xmlParser = [[XMLParser alloc] init];
		NSArray *persons = [xmlParser parseXML:xmlContent];
		
		NSLog(@"%@",persons);
	   
	}
    return 0;
}
