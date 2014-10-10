//
//  MainListViewController.m
//  notificationcenter
//
//  Created by Rita on 14-8-14.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import "MainListViewController.h"
#import "QQList.h"


@implementation MainListViewController
@synthesize tableMain;

- (void) loadQQData
{
	// 定义数据结构
	for (int i=0; i<10; i++) {
		QQList *list = [[QQList alloc] init];
		list.m_nID = i; //  分组依据
		list.m_strName = @"QQGroupName";
		list.m_arrayPersons = [[NSMutableArray alloc] init];
		list.opened = YES; // 默认展开
		for (int j=0; j<arc4random()%20; j++) {
			QQPerson *person = [[QQPerson alloc] init] ;
			person.m_nQQNumber = 10000 + abs(arc4random()%100000000) ; // 随即生成QQ号
			person.m_nListID = i; //  分组依据
			person.m_bIsOnline = arc4random()%10<5 ? YES : NO;	// 是否在线
			person.m_strNickName = @"[小甲]";	// 昵称
			person.m_strRemarkName = arc4random()%10<5 ? @"小乙":@"小丙" ;	// 备注
			person.m_strLongNickInfo = @"这是一个神奇的世界" ; // 个性签名
			person.m_strHeadImageURLString = nil ; // 头像地址
			
			[list.m_arrayPersons addObject:person];
		}
		[lists addObject:list];
	}
}

- (void)loadView {
	[super loadView];
	lists =[[NSMutableArray alloc] init];
	
	[self performSelector:@selector(loadQQData)];
	
    
}

- (void)viewDidLoad {
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
    [[self navigationItem] setTitle:@"NotificationCenter"];
    //标题栏字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:42.0f/255.0f green:192.0f/255.0f blue:161.0f/255.0f alpha:1],UITextAttributeTextColor,[UIColor grayColor],UITextAttributeTextShadowColor, nil]];
    
    //    //数据List初始化
    //    lists = [[NSMutableArray alloc]init];
    //    [self performSelector:@selector(loadQQData)];
    
    //主要列表
    tableMain = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
    tableMain.autoresizingMask = UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    tableMain.backgroundColor = [UIColor whiteColor];
    tableMain.delegate = self;
    tableMain.dataSource = self;
    [self.view addSubview:tableMain];
    [tableMain reloadData];//刷新数据

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
	//return (interfaceOrientation == UIInterfaceOrientationPortrait);
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return HEADER_HEIGHT;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [lists count]; // 分组数
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	QQList *persons = [lists objectAtIndex:section];
	if ([persons opened]) {
		return [persons.m_arrayPersons count]; // 人员数
        
	}else {
		return 0;	// 不展开
	}
}

-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
	QQList *persons = [lists objectAtIndex:section];
	int onlineCount = 0 ;
	for (QQPerson *person in persons.m_arrayPersons) {
		if ([person isOnline]) {
			onlineCount ++; // 统计在线人数,排序 (可以用线程来做,防止UI卡顿)
		}
	}
	NSString *headString = [NSString stringWithFormat:@"%@ [%d/%d] ",persons.m_strName,onlineCount,[persons.m_arrayPersons count]];
	
	QQSectionHeaderView *sectionHeadView = [[QQSectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, tableMain.bounds.size.width, HEADER_HEIGHT)
                                                                                title:headString
                                                                              section:section
                                                                               opened:persons.opened
                                            
                                                                             delegate:self] ;
	return sectionHeadView ;
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
	QQList *persons = [lists objectAtIndex:indexPath.section];
    QQPerson *person = [persons.m_arrayPersons objectAtIndex:indexPath.row];
	if ([person isOnline]) {
		[cell textLabel].text = person.m_strNickName;
	}
	else {
		[cell textLabel].text =[NSString stringWithFormat:@"%@ (Offline)", person.m_strNickName];
		
	}
	[cell textLabel].font = [UIFont boldSystemFontOfSize:14.0];
    
	[cell detailTextLabel].text = person.m_strLongNickInfo;

    return cell;
}


-(void)sectionHeaderView:(QQSectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)section
{
	QQList *persons = [lists objectAtIndex:section];
	persons.opened = !persons.opened;
	
	
	// 收缩+动画 (如果不需要动画直接reloaddata)
	NSInteger countOfRowsToDelete = [tableMain numberOfRowsInSection:section];
    if (countOfRowsToDelete > 0) {
        persons.indexPaths = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [persons.indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:section]];
        }
        [tableMain deleteRowsAtIndexPaths:persons.indexPaths withRowAnimation:UITableViewRowAnimationTop];
    }
}

-(void)sectionHeaderView:(QQSectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)section
{
	QQList *persons = [lists objectAtIndex:section];
	persons.opened = !persons.opened;
	
	// 展开+动画 (如果不需要动画直接reloaddata)
	if(persons.indexPaths){
		[tableMain insertRowsAtIndexPaths:persons.indexPaths withRowAnimation:UITableViewRowAnimationBottom];
	}
	persons.indexPaths = nil;
}

@end
