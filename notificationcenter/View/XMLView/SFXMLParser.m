//
//  SFXMLParser.m
//  MicroCaptical
//
//  Created by IOS Dev on 14-1-27.
//  Copyright (c) 2014年 IOS Dev. All rights reserved.
//

#import "SFXMLParser.h"

@interface SFXMLParser ()<NSXMLParserDelegate>
{
    NSXMLParser *_parser;
    NSMutableArray *_marrayKey;
    NSMutableArray *_marrayValue;
    NSMutableDictionary *_mdict;
}

@property(nonatomic, strong)XMLParserHandle handler;

@end

@implementation SFXMLParser

- (id)initWithData:(NSData *)data handle:(XMLParserHandle)handler
{
    if (self = [super init])
    {
        _mdict = [[NSMutableDictionary alloc] init];
        _parser = [[NSXMLParser alloc] initWithData:data];
        _parser.delegate = self;
        self.handler = handler;
    }
    
    return self;
}

- (void)parse
{
    [_parser parse];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    if (!_mdict)
    {
        _mdict = [[NSMutableDictionary alloc] init];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    if (self.handler)
    {
        self.handler([NSDictionary dictionaryWithDictionary:_mdict]);
    }
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [self pushKey:elementName];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSString *strKey = [self popKey];
    NSString *strValue = [self popValue];
    
    if (strKey && strValue)
    {
        [_mdict setObject:strValue forKey:strKey];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    [self pushValue:string];
}

- (NSString *)popKey
{
    NSString *strKey = nil;
    if (_marrayKey && _marrayKey.count)
    {
        strKey = [_marrayKey lastObject];
        [_marrayKey removeLastObject];
    }
    return strKey;
}

- (void)pushKey:(NSString *)strKey
{
    if (!strKey)
        return ;
    
    if (!_marrayKey)
    {
        _marrayKey = [[NSMutableArray alloc] init];
    }
    
    [_marrayKey addObject:strKey];
}

- (NSString *)popValue
{
    NSString *strValue = nil;
    if (_marrayValue && _marrayValue.count)
    {
        strValue = [_marrayValue lastObject];
        [_marrayValue removeLastObject];
    }
    return strValue;
}

- (void)pushValue:(NSString *)strValue
{
    if (!_marrayValue)
    {
        _marrayValue = [[NSMutableArray alloc] init];
    }
    
    [_marrayValue addObject:strValue];
}

@end
