//
//  XMLParser.h
//  Demo_XML数据解析(NSXMLParser)
//
//  Created by zhang xianglu on 15/6/18.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface XMLParser : NSObject

- (NSArray *)parseXML:(NSString *)xml;


@end
