//
//  XMLViewController.h
//  notificationcenter
//
//  Created by Rita on 14-9-9.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMLViewController : UIViewController<NSXMLParserDelegate>{
    NSArray *keyElements;
    NSArray *rootElements;
}

@end
