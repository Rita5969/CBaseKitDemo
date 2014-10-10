//
//  KeyTableViewController.m
//  notificationcenter
//
//  Created by Rita on 14-9-22.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import "KeyTableViewController.h"

@interface KeyTableViewController ()

@end

@implementation KeyTableViewController
@synthesize tableMain,suoyinCityList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) loadQQData
{
//	定义数据
    for(char c ='A';c<='Z';c++)
        
    {
        //当前字母
        NSString *zimu=[NSString stringWithFormat:@"%c",c];
        if (![zimu
              isEqualToString:@"I"]&&![zimu
                                       isEqualToString:@"O"]&&![zimu
                                                                isEqualToString:@"U"]&&![zimu isEqualToString:@"V"])
            
        {
            [suoyinCityList addObject:[NSString stringWithFormat:@"%c",c]];
        }
    }
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
    
    suoyinCityList = [[NSMutableArray alloc]init];
    [self loadQQData];
    
    //标题栏背景颜色
    if (IOS7_OR_LATER) {
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1];
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    }
    else{
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1];
    }
    
    //标题栏字
    [[self navigationItem] setTitle:@"NotificationCenter"];
    //标题栏字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:42.0f/255.0f green:192.0f/255.0f blue:161.0f/255.0f alpha:1],UITextAttributeTextColor,[UIColor grayColor],UITextAttributeTextShadowColor, nil]];
    
    //主要列表
    tableMain = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
    tableMain.autoresizingMask = UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tableMain.backgroundColor = [UIColor whiteColor];
    tableMain.backgroundView = nil;
    tableMain.allowsSelection = YES;
    tableMain.showsVerticalScrollIndicator = NO;
    tableMain.showsHorizontalScrollIndicator = NO;
    tableMain.sectionIndexColor = [UIColor grayColor];//右侧索引列的文字颜色
    
    tableMain.delegate = self;
    tableMain.dataSource = self;
    [self.view addSubview:tableMain];
//    [tableMain reloadData];//刷新数据
}

// 索引行
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    if (tableMain == self.searchDisplayController.searchResultsTableView) {
        return nil;
    }
    return suoyinCityList;
}

// 索引列单击事件
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    NSLog(@"===%@===%d",title,index);
//    [tableMain scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index+4] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    return index+4;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (tableMain == self.searchDisplayController.searchResultsTableView) {
        return nil;
    }
    UIView *headView = [[UIView alloc]init];
    headView.backgroundColor = [UIColor clearColor];
    if (section != 0) {
        //标题背景
        UIView *biaotiView = [[UIView alloc]init];
        biaotiView.backgroundColor = [UIColor whiteColor];
        biaotiView.frame = CGRectMake(0, 0, 320, 30);
        [headView addSubview:biaotiView];
        
        //标题文字
        UILabel *lblBiaoti = [[UILabel alloc]init];
        lblBiaoti.backgroundColor = [UIColor clearColor];
        lblBiaoti.textAlignment = NSTextAlignmentLeft;
        lblBiaoti.font = [UIFont systemFontOfSize:15];
        lblBiaoti.textColor = [UIColor blackColor];
        lblBiaoti.frame = CGRectMake(15, 7.5, 200, 15);
        lblBiaoti.text = @"123123";
        [biaotiView addSubview:lblBiaoti];
    }
    return headView;
}


#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
