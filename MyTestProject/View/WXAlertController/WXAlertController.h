//
//  WXAlertController.h
//  netCafe
//
//  Created by 舒永超 on 16/4/18.
//  Copyright © 2016年 Sicent. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickedButtonType)(NSInteger, UIAlertControllerStyle);

@interface WXAlertController : UIViewController

+ (WXAlertController *)sharedAlertController;

/**
 *  封装WXAlertController,为了兼容UIAlertController在ios7上不兼容问题
 *
 *  @param title                标题
 *  @param message              消息
 *  @param cancel               取消按钮
 *  @param items                确定按钮或选项
 *  @param controller           显示所在的controller
 *  @param alertControllerStyle 显示方式
 *  @param clickButtonType      回调
 */
- (void)alertControllerWithTitle:(NSString *)title
                     withMessage:(NSString *)message
                      withCancel:(NSString *)cancel
                     withItems:(NSArray *)items
                     withShowObj:(UIViewController *)controller
        withAlertControllerStyle:(UIAlertControllerStyle)alertControllerStyle
       withClickedButtonWithType:(ClickedButtonType)clickButtonType;
@end
