//
//  ShareViewController.h
//  notificationcenter
//
//  Created by Rita on 14-9-16.
//  Copyright (c) 2014年 Rita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"

@protocol sendMsgToWeChatViewDelegate <NSObject>
-(void) changeScene:(NSInteger)scene;
-(void) sendTextContent;
-(void) sendImageContent;
-(void) sendLinkContent;
-(void) sendMusicContent;
-(void) sendVideoContent;
-(void) sendAppContent;
-(void) sendNonGifContent;
-(void) sendGifContent;
-(void) sendFileContent;

@end


@interface ShareViewController : UIViewController<UITextViewDelegate>
{
    enum WXScene _scene;
}

@property (nonatomic, assign) id<sendMsgToWeChatViewDelegate,NSObject> delegate;

@end
