//
//  ToastViewController.m
//  notificationcenter
//
//  Created by Rita on 14-9-28.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import "ToastViewController.h"
#import "UIView+Toast.h"

@interface ToastViewController ()

@end

@implementation ToastViewController

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
	
    //iOS7的屏幕适配
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
#endif// #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    
    
    //背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    //标题栏背景颜色
    if (IOS7_OR_LATER) {
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1];
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    }
    else{
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1];
    }

    //标题栏字
    [[self navigationItem] setTitle:@"Toast"];
    //标题栏字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:42.0f/255.0f green:192.0f/255.0f blue:161.0f/255.0f alpha:1],UITextAttributeTextColor,[UIColor grayColor],UITextAttributeTextShadowColor, nil]];
    
    //分享到朋友圈－按钮
    UIButton *btn_y = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn_y setTitle:@"显示基础toast" forState:UIControlStateNormal];
    btn_y.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn_y setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn_y setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [btn_y setFrame:CGRectMake(0 , 0, 200, 40)];
    [btn_y addTarget:self action:@selector(buttonForShowToast) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_y];
}

-(void)buttonForShowToast{
    // toast with duration, title, and position
    [self.view makeToast:@"This is a piece of toast with a title."
                duration:1.0
                position:@"top"
                   title:@"Toast Title"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
