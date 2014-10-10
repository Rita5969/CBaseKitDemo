//
//  QQList.h
//  notificationcenter
//
//  Created by Rita on 14-8-28.
//  Copyright (c) 2014年 Rita. All rights reserved.
//
// 菜单数据模型

#import <Foundation/Foundation.h>


//cell的数据模型
@interface QQPerson : NSObject{
    int m_nQQNumber;
    int m_nListID;
    BOOL m_bIsOnLine;
    NSString *m_strRemarkName;
    NSString *m_strNickName;
    NSString *m_strLongNickInfo;
    NSString *m_strHeadImageURLString;//图片URL地址
}
@property (nonatomic, assign) int m_nQQNumber;
@property (nonatomic, assign) int m_nListID;
@property (nonatomic, assign, getter=isOnline) BOOL m_bIsOnline; //用isOnline方法代替getM_bIsOnline
@property (nonatomic, retain) NSString *m_strRemarkName;
@property (nonatomic, retain) NSString *m_strNickName;
@property (nonatomic, retain) NSString *m_strLongNickInfo;
@property (nonatomic, retain) NSString *m_strHeadImageURLString;
@end

//list的数据模型
@interface QQListBase : NSObject{
    int m_nID;
    NSString *m_strName;
    NSMutableArray *m_arrayPersons;
}
@property (nonatomic, assign) int m_nID;
@property (nonatomic, retain) NSString *m_strName;
@property (nonatomic, retain) NSMutableArray *m_arrayPersons;

@end

//section的数据模型
@interface QQList : QQListBase{
    BOOL opened;
    NSMutableArray *indexPaths;
}
@property (assign) BOOL opened;
@property (nonatomic,retain) NSMutableArray *indexPaths;
@end













