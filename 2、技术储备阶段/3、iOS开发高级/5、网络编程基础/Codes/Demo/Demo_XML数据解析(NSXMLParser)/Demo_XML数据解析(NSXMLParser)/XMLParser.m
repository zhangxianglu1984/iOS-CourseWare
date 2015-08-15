//
//  XMLParser.m
//  Demo_XML数据解析(NSXMLParser)
//
//  Created by zhang xianglu on 15/6/18.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "XMLParser.h"
#import "Person.h"

@interface XMLParser ()<NSXMLParserDelegate>

@property(nonatomic,strong) NSMutableArray *persons;

@property(nonatomic,strong) Person *person;

@property(nonatomic,copy) NSString *currentElementName;

@end

@implementation XMLParser

- (instancetype)init
{
	self = [super init];
	if (self) {
		
	}
	return self;
}

- (NSArray *)parseXML:(NSString *)xml {
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:[xml dataUsingEncoding:NSUTF8StringEncoding]];
	
	xmlParser.delegate = self;
	
	[xmlParser parse];
	
	return [_persons copy];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
	self.currentElementName = elementName;
	if ([_currentElementName isEqualToString:@"persons"]) {
		self.persons = [NSMutableArray array];
	}else if ([_currentElementName isEqualToString:@"person"]) {
		self.person = [[Person alloc] init];
		_person.id = attributeDict[@"id"];
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	if ([_currentElementName isEqualToString:@"name"]) {
		_person.name = string;
	}else if([_currentElementName isEqualToString:@"age"]){
		_person.age = [string integerValue];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if ([elementName isEqualToString:@"person"]) {
		[_persons addObject:_person];
		self.person = nil;
	}
	
	self.currentElementName = nil;
	
}


@end
