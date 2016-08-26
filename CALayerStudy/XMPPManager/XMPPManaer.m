//
//  XMPPManaer.m
//  CALayerStudy
//
//  Created by Kael on 16/8/24.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "XMPPManaer.h"

static XMPPManaer *manager;

@implementation XMPPManaer

-(XMPPManaer *)shareXMPPManager{
    if (!manager) {
        manager = [[XMPPManaer alloc] init];
        [self initXmpp];
    }
    return manager;
}

-(instancetype)init{
    if (self = [super init]) {
            }
    return self;
}

#pragma mark ------->>:初始化XMPP 的基本数据
-(void)initXmpp  {
    //创建xmppstream
    self.xmppStream = [[XMPPStream alloc]init];
    //获取应用的xmppSteam(通过Application中的单例获取)
    UIApplication *application = [UIApplication sharedApplication];
    id delegate = [application delegate];
    self.xmppStream = [delegate xmppStream];
    //注册回调
    [self.xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
}

#pragma mark ------->>:xmpp尝试连接操作
- (void)connect {
    if (self.xmppStream == nil) {
        self.xmppStream = [[XMPPStream alloc] init];
        [self.xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    }
    if (![self.xmppStream isConnected]) {
        NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
        XMPPJID *jid = [XMPPJID jidWithUser:username domain:@"lizhen" resource:@"Ework"];
        [self.xmppStream setMyJID:jid];
        [self.xmppStream setHostName:@"10.4.125.113"];
        NSError *error = nil;
//        if (![self.xmppStream connect:&error]) {
//        if (![self.xmppStream connect]) {
//
//            NSLog(@"Connect Error: %@", [[error userInfo] description]);
//        }
    }
}
#pragma mark ------->>:xmpp 连接成功
- (void)xmppStream:(XMPPStream *)sender socketDidConnect:(GCDAsyncSocket *)socket{

}
- (void)xmppStreamDidConnect:(XMPPStream *)sender{

}

#pragma mark ------->>:好友上线
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
    XMPPPresence *presence = [XMPPPresence presenceWithType:@"available"];
    [self.xmppStream sendElement:presence];
}
#pragma mark ------->>:退出并断开连接
//退出并断开连接
- (void)disconnect {
    XMPPPresence *presence = [XMPPPresence presenceWithType:@"unavailable"];
    [self.xmppStream sendElement:presence];
    
    [self.xmppStream disconnect];
}

#pragma mark ------->>:好友状态
//好友状态
- (void)xmppStream:(XMPPStream *)sender didReceivePresence:(XMPPPresence *)presence {
    NSString *presenceType = [presence type];
    NSString *presenceFromUser = [[presence from] user];
    if (![presenceFromUser isEqualToString:[[sender myJID] user]]) {
        if ([presenceType isEqualToString:@"available"]) {
            //
        } else if ([presenceType isEqualToString:@"unavailable"]) {
            //
        }
    }
}
#pragma mark ------->>:xmpp 接收消息

//接收消息
- (void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message {
    NSString *messageBody = [[message elementForName:@"body"] stringValue];
}

#pragma mark ------->>:xmpp 发送消息
- (void)sendMessage:(NSString *)messages toUser:(NSString *) user {
    NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
    [body setStringValue:messages];
    NSXMLElement *message = [NSXMLElement elementWithName:@"message"];
    [message addAttributeWithName:@"type" stringValue:@"chat"];
    NSString *to = [NSString stringWithFormat:@"%@@example.com", user];
    [message addAttributeWithName:@"to" stringValue:to];
    [message addChild:body];
    [self.xmppStream sendElement:message];
}

#pragma mark ------->>:xmpp 添加好友

//name为用户账号
- (void)XMPPAddFriendSubscribe:(NSString *)name
{
    //XMPPHOST 就是服务器名，  主机名
//    XMPPJID *jid = [XMPPJID jidWithString:[NSString stringWithFormat:@"%@@%@",name,XMPPHOST]];
    //[presence addAttributeWithName:@"subscription" stringValue:@"好友"];
//    [xmppRoster subscribePresenceToUser:jid];
    
}
#pragma mark ------->>:xmpp 收到添加好友的请求

- (void)xmppRoster:(XMPPRoster *)sender didReceivePresenceSubscriptionRequest:(XMPPPresence *)presence
{
    //取得好友状态
    NSString *presenceType = [NSString stringWithFormat:@"%@", [presence type]]; //online/offline
    //请求的用户
    NSString *presenceFromUser =[NSString stringWithFormat:@"%@", [[presence from] user]];
    NSLog(@"presenceType:%@",presenceType);
    
    NSLog(@"presence2:%@  sender2:%@",presence,sender);
    
    XMPPJID *jid = [XMPPJID jidWithString:presenceFromUser];
    //接收添加好友请求
    [sender acceptPresenceSubscriptionRequestFrom:jid andAddToRoster:YES];
    
}
#pragma mark ------->>: XMPP

//删除好友，name为好友账号
- (void)removeBuddy:(NSString *)name
{
//    XMPPJID *jid = [XMPPJID jidWithString:[NSString stringWithFormat:@"%@@%@",name,XMPPHOST]];
//    
//    [self xmppRoster] removeUser:jid];
}

#pragma mark ------>>:初始化聊天室
-(void)initChatRoom:(XMPPJID *)roomJID{
//    XMPPJID *roomJID = [XMPPJID jidWithString:ROOM_JID];
//    
//    xmppRoom = [[XMPPRoom alloc] initWithRoomStorage:self jid:roomJID];
//    
//    [xmppRoom activate:xmppStream];
//    [xmppRoom addDelegate:self delegateQueue:dispatch_get_main_queue()];
}

- (void)xmppRoomDidJoin:(XMPPRoom *)sender
{
//    [xmppRoom fetchConfigurationForm];
//    [xmppRoom fetchBanList];
//    [xmppRoom fetchMembersList];
//    [xmppRoom fetchModeratorsList];
}

//// 收到禁止名单列表
//- (void)xmppRoom:(XMPPRoom *)sender didFetchBanList:(NSArray *)items;
//// 收到好友名单列表
//- (void)xmppRoom:(XMPPRoom *)sender didFetchMembersList:(NSArray *)items;
//// 收到主持人名单列表
//- (void)xmppRoom:(XMPPRoom *)sender didFetchModeratorsList:(NSArray *)items;

//房间不存在，调用委托
//- (void)xmppRoom:(XMPPRoom *)sender didNotFetchBanList:(XMPPIQ *)iqError;
//- (void)xmppRoom:(XMPPRoom *)sender didNotFetchMembersList:(XMPPIQ *)iqError;
//- (void)xmppRoom:(XMPPRoom *)sender didNotFetchModeratorsList:(XMPPIQ *)iqError;

//离开聊天室
- (void)xmppRoomDidLeave:(XMPPRoom *)sender
{
//    DDLogVerbose(@"%@: %@", THIS_FILE, THIS_METHOD);
}

//新人加入群聊
- (void)xmppRoom:(XMPPRoom *)sender occupantDidJoin:(XMPPJID *)occupantJID
{
//    DDLogVerbose(@"%@: %@", THIS_FILE, THIS_METHOD);
}

//有人退出群聊
- (void)xmppRoom:(XMPPRoom *)sender occupantDidLeave:(XMPPJID *)occupantJID
{
//    DDLogVerbose(@"%@: %@", THIS_FILE, THIS_METHOD);
}

//有人在群里发言
- (void)xmppRoom:(XMPPRoom *)sender didReceiveMessage:(XMPPMessage *)message fromOccupant:(XMPPJID *)occupantJID
{
//    DDLogVerbose(@"%@: %@", THIS_FILE, THIS_METHOD);
}

//
-(void)sendMessage{
    NSString *siID = [XMPPStream generateUUID];
    //发送消息
//    XMPPMessage *message = [XMPPMessage messageWithType:@"chat" to:jid elementID:siID];
    XMPPMessage *message = [XMPPMessage messageWithType:@"chat" to:@"" elementID:@""];

    NSXMLElement *receipt = [NSXMLElement elementWithName:@"request" xmlns:@"urn:xmpp:receipts"];
    [message addChild:receipt];
    [message addBody:@"测试"];
    [self.xmppStream sendElement:message];
}





#pragma mark ------->>: AutoPing
//初始化并启动ping
-(void)autoPingProxyServer:(NSString*)strProxyServer
{
    _xmppAutoPing = [[XMPPAutoPing alloc] init];
    [_xmppAutoPing activate:_xmppStream];
    [_xmppAutoPing addDelegate:self delegateQueue:  dispatch_get_main_queue()];
    _xmppAutoPing.respondsToQueries = YES;
    _xmppAutoPing.pingInterval=2;//ping 间隔时间
    if (nil != strProxyServer)
    {
        _xmppAutoPing.targetJID = [XMPPJID jidWithString: strProxyServer ];//设置ping目标服务器，如果为nil,则监听socketstream当前连接上的那个服务器
    }
}
////卸载监听
//[_xmppAutoPing   deactivate];
//[_xmppAutoPing   removeDelegate:self];
//_xmppAutoPing = nil;
//ping XMPPAutoPingDelegate的委托方法:
- (void)xmppAutoPingDidSendPing:(XMPPAutoPing *)sender
{
    NSLog(@"- (void)xmppAutoPingDidSendPing:(XMPPAutoPing *)sender");
}
- (void)xmppAutoPingDidReceivePong:(XMPPAutoPing *)sender
{
    NSLog(@"- (void)xmppAutoPingDidReceivePong:(XMPPAutoPing *)sender");
}

- (void)xmppAutoPingDidTimeout:(XMPPAutoPing *)sender
{
    NSLog(@"- (void)xmppAutoPingDidTimeout:(XMPPAutoPing *)sender");
}

@end
