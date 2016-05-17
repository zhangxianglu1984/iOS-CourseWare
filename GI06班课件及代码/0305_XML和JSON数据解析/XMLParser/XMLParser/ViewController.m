//
//  ViewController.m
//  XMLParser
//
//  Created by jianfeng on 15/3/5.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"

@interface ViewController ()<UITableViewDataSource,NSXMLParserDelegate,UITableViewDelegate>
{
    NSMutableArray *productsArray;
    Product *currentPro;
    NSMutableString *currentString;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)setUpData
{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"myXML.xml" ofType:nil];
//    // 方法一: 直接使用全路径初始化数据
//    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    // 方法二:把本地文件的全路径转化成NSURL类型
    NSURL *filePathURL = [NSURL fileURLWithPath:filePath];
    NSData *data = [NSData dataWithContentsOfURL:filePathURL];
    
    // 把data进行XML解析
    // 1.初始化XML解析器
    NSXMLParser *parser = [[NSXMLParser alloc]initWithData:data];
//    NSXMLParser *parser =[[NSXMLParser alloc]initWithContentsOfURL:filePathURL];
    
    // 2.设置解析器的代理
    parser.delegate = self;
    
    // 3.解析
    [parser parse];
}

- (IBAction)xmlParse:(id)sender {
    [self setUpData];
}

#pragma mark - NSXMLParserDelegate

// 开始解析文件
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"开始解析文件");
}

// 开始解析元素(节点)
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"开始解析节点:%@",elementName);
    if ([elementName isEqualToString:@"products"]) {
            productsArray = [NSMutableArray array];
    }
    // 如果节点名称是product
    else if ([elementName isEqualToString:@"product"]) {
        currentPro = [[Product alloc]init];
    }
}

// 文本节点里面存储的数据
// 当数据量比较大的时候,可能会执行多次
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"%@",string);
    if (currentString.length == 0) {
        currentString = [NSMutableString string];
    }
    [currentString appendString:string];
}

// 解析节点结束
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"解析节点结束:%@",elementName);
    if ([elementName isEqualToString:@"product"]) {
        [productsArray addObject:currentPro];
    }
    else if ([elementName isEqualToString:@"name"]){
        currentPro.name = currentString;
    }
    else if ([elementName isEqualToString:@"desc"]){
        currentPro.desc = currentString;
    }
    else if ([elementName isEqualToString:@"pirce"]){
        currentPro.pirce = currentString;
    }
    // 把当前字符串内容清空,避免在foundCharacters..方法中重复追加
    currentString = nil;
}

// 解析文件结束
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"解析文件结束");
    [self.tableView reloadData];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"解析出错");
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return productsArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    Product *prod = productsArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@   %@",prod.name, prod.pirce];
    cell.detailTextLabel.text = prod.desc;
    cell.detailTextLabel.numberOfLines = 0;
    
    return cell;
}

@end
