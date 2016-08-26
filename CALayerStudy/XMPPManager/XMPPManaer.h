//
//  XMPPManaer.h
//  CALayerStudy
//
//  Created by Kael on 16/8/24.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//******
#import "XMPPFramework.h"
#import "xmppReconnect.h"
#import "XMPPMessageArchivingCoreDataStorage.h"
#import "XMPPRoster.h"
#import "XMPPJID.h"
#import "XMPPRoom.h"
#import "XMPPAutoPing.h"
//******

#define ROOM_JID @"123"

@interface XMPPManaer : NSObject

//XMPP数据流
@property (strong, nonatomic) XMPPStream * xmppStream;
//重连
@property (nonatomic,strong) XMPPReconnect *xmppReconnect;
//创建消息保存策略（规则，规定）
@property (nonatomic,strong) XMPPMessageArchivingCoreDataStorage *messageStorage;
//
@property (nonatomic,strong) NSString *userName;
//
@property (nonatomic,strong) NSString *passWord;

@property (nonatomic,strong) XMPPAutoPing *xmppAutoPing;
-(XMPPManaer *)shareXMPPManager;

@end
