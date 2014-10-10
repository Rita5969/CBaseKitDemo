//
//  XMLViewController.m
//  notificationcenter
//
//  Created by Rita on 14-9-9.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import "XMLViewController.h"

@interface XMLViewController (){
    NSString * currentElement;
    NSString * currentValue;
    NSMutableDictionary *rootDic;
    NSMutableArray *finalArray;
}

@end

@implementation XMLViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// 遇到节点message和user时作为一个字典存放
    keyElements = [[NSArray alloc] initWithObjects:@"message",@"user", nil];
    // 需要解析的字段
    rootElements = [[NSArray alloc] initWithObjects:@"message",@"name",@"age",@"school", nil];
    // 获取xml文件的路径
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"xml"];
    // 转化为Data
    NSData *data = [[NSData alloc] initWithContentsOfFile:xmlPath];
    
    // 初始化
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
    
    // 代理
    xmlParser.delegate = self;
    // 开始解析
    BOOL flag = [xmlParser parse];
    if (flag) {
        NSLog(@"解析成功");
        NSLog(@"%@",finalArray);
    }
    else{
        NSLog(@"解析出错");
    }

}

#pragma - mark 开始解析时
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    // 用数组存储每一组信息
    finalArray = [[NSMutableArray alloc] init];
    
    
}
#pragma - mark 发现节点时
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    for(NSString *key in keyElements){
        if ([elementName isEqualToString:key]) {
            // 关键节点开始时，初始化一个字典来存放值
            rootDic = nil;
            
            rootDic = [[NSMutableDictionary alloc] initWithCapacity:0];
            
        }
        else {
            for(NSString *element in rootElements){
                if ([element isEqualToString:element]) {
                    currentElement = elementName;
                    currentValue = [NSString string];
                }
            }
        }
    }
    
}
#pragma - mark 发现节点值时

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    if (currentElement) {
        
        currentValue = string;
        [rootDic setObject:string forKey:currentElement];
    }
    
}
#pragma - mark 结束节点时
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (currentElement) {
        [rootDic setObject:currentValue forKey:currentElement];
        currentElement = nil;
        currentValue = nil;
    }
    for(NSString *key in keyElements){
        
        if ([elementName isEqualToString:key]) {
            // 关键节点结束时，将字典存放在数组中
            if (rootDic) {
                
                [finalArray addObject:rootDic];
            }
        }
    }
}
#pragma - mark 结束解析
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
