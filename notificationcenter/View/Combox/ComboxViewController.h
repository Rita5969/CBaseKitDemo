//
//  ComboxViewController.h
//  notificationcenter
//
//  Created by Rita on 14-9-25.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRComboxItem.h"
#import "PullDownViewController.h"
#import "PDMoreViewController.h"

@interface ComboxViewController : UIViewController<FRComboxItemDelegate,PDTBLDelegate,PDMoreDelegate>

@end
