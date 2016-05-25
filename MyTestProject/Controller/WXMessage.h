//
//  WXMessage.h
//  netCafe
//
//  Created by Valo on 15/4/13.
//  Copyright (c) 2015年 sicent. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, WXMessageType) {
    WXMessageTypeSystem  = 0,
    WXMessageTypeBar,
    WXMessageTypeReply,
    WXMessageTypeOrder,
    WXMessageTypeRecharge
};

/**
 *  消息
 */
@interface WXMessage : NSObject
@property (nonatomic, assign) NSInteger userId;             /**< 用户ID */
@property (nonatomic, copy  ) NSString  *barAvatar;         /**< 网吧头像 */
@property (nonatomic, assign) NSInteger barId;              /**< 网吧ID */
@property (nonatomic, copy  ) NSString  *barName;           /**< 网吧名 */
@property (nonatomic, copy  ) NSString  *msgContentShort;   /**< 消息简介 */
@property (nonatomic, assign) NSInteger msgId;              /**< 消息ID */
@property (nonatomic, copy  ) NSString  *msgTitle;          /**< 消息标题 */
@property (nonatomic, assign) NSInteger orderEndState;      /**< 订单结束状态??? */
@property (nonatomic, assign) NSInteger orderId;            /**< 订单ID */
@property (nonatomic, assign) NSInteger orderState;         /**< 订单状态??? */
@property (nonatomic, assign) NSInteger submitTime;         /**< 提交时间,时间戳 */
@property (nonatomic, copy  ) NSString  *submitTimeFormat;  /**< 提交时间,格式文本 */
@property (nonatomic, assign) NSInteger type;               /**< 消息类型 0-系统,1网吧消息、2-评论消息、 3-订单状态、 4-充值、 5-优惠卷*/
@property (nonatomic, copy  ) NSString  *imageUrl;          /**< 消息图片 */
@property (nonatomic, copy  ) NSString  *activityUrl;       /**< 活动链接 */
@property (nonatomic, assign) NSInteger commentId;          /**< 吧一吧ID */
@property (nonatomic, assign) NSInteger replyId;            /**< 回复吧一吧ID */
@property (nonatomic, assign) BOOL      hasRead;            /**< 消息状态,0-未读,1-已读 */
@property (nonatomic, assign) CGSize size;

@end
