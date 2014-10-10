//
//  QQList.m
//  notificationcenter
//
//  Created by Rita on 14-8-28.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import "QQList.h"

@implementation QQPerson
@synthesize m_nQQNumber;
@synthesize m_nListID;
@synthesize m_bIsOnline;
@synthesize m_strNickName;
@synthesize m_strRemarkName;
@synthesize m_strLongNickInfo;
@synthesize m_strHeadImageURLString;

@end

@implementation QQListBase
@synthesize m_nID;
@synthesize m_strName;
@synthesize m_arrayPersons;

@end

@implementation QQList
@synthesize opened,indexPaths;

@end
