//
//  WebRequest.m
//  FastRent
//
//  Created by heng chengfei on 14-4-12.
//  Copyright (c) 2014年 cf. All rights reserved.
//

#import "WebRequest.h"


@implementation WebRequest

+(WebRequest *)sharedObj
{
    static WebRequest *instance=nil;
    
    @synchronized(self){
        if (instance==nil) {
            instance = [[self alloc]init];
        }
    }
    return instance;
}

+(NSDictionary *)request:(NSString *)url
{
    url=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:url]];
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [request setTimeoutInterval:120];
    [request setHTTPShouldHandleCookies:false];
    [request setHTTPMethod:@"GET"];
    
    NSError *error1;
    NSHTTPURLResponse *response;
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error1];
    // NSInteger statusCode= response.statusCode;
    if (error1!=nil) {
        return error1.userInfo;
    }
    
    NSDictionary *dictionary=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableContainers error:nil];
    if (dictionary==nil) {
        NSDictionary *errorDict = [NSDictionary dictionaryWithObject:@"Json取得失败" forKey:NSLocalizedDescriptionKey];
        dictionary =errorDict;
    }
    return dictionary;
}

+(ComboxVo *)getComboxVo:(NSString *)url
{
    NSDictionary *dict = [self request:url];
    NSArray *result =   [dict objectForKey:@"result"];
    
    NSMutableArray *dlist = [[NSMutableArray alloc]init];
    //所有下拉框的数据
    for (NSDictionary *data in result) {
        //每个下拉框定义
        ComboxDatas *d = [ComboxDatas new];
        [d setName:data[@"name"]];
        [d setType:data[@"type"]];
        
        //每个下拉框的列表数据
        NSMutableArray *datalist=[[NSMutableArray alloc]init];
        NSArray *datas =[data objectForKey:@"datas"];
        for (NSDictionary *d2 in datas) {
            ComboxData *dd =[ComboxData new];
            [dd setId:[d2 objectForKey:@"id"]];
            [dd setName:[d2 objectForKey:@"name"]];
            [datalist addObject:dd];
        }
        
        [d setDatas:datalist];
        
        [dlist addObject:d];
    }
    
    ComboxVo *vo =[ComboxVo new];
    [vo setStatus:[dict objectForKey:@"status"]];
    [vo setResult:dlist];
    
    return vo;
}

@end
