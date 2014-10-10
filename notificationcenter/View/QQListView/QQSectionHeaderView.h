//
//  QQSectionHeaderView.h
//  notificationcenter
//
//  Created by Rita on 14-8-29.
//  Copyright (c) 2014年 Rita. All rights reserved.
//  自定义表头SectionView
//

#import <UIKit/UIKit.h>
@protocol QQSectionHeaderViewDelegate;


@interface QQSectionHeaderView : UIView{
}


@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIButton *disclosureButton;
@property (nonatomic, assign) NSInteger section;
@property (nonatomic, assign) BOOL opened;

@property (nonatomic, assign) id <QQSectionHeaderViewDelegate> delegate;
-(id)initWithFrame:(CGRect)frame title:(NSString *)title section:(NSInteger)sectionNumber opened:(BOOL)isOpened delegate:(id<QQSectionHeaderViewDelegate>)delegate;
@end

@protocol QQSectionHeaderViewDelegate <NSObject>
@optional
-(void)sectionHeaderView:(QQSectionHeaderView *)sectionHeadView sectionClosed:(NSInteger)section;
-(void)sectionHeaderView:(QQSectionHeaderView *)sectionHeadView sectionOpened:(NSInteger)section;

@end

