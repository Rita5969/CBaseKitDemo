//
//  SFXMLParser.h
//  MicroCaptical
//
//  Created by IOS Dev on 14-1-27.
//  Copyright (c) 2014年 IOS Dev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^XMLParserHandle)(NSDictionary *dict);

@interface SFXMLParser : NSObject

- (id)initWithData:(NSData *)data handle:(XMLParserHandle)handler;

- (void)parse;

@end
