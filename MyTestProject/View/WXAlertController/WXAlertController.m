//
//  WXAlertController.m
//  netCafe
//
//  Created by 舒永超 on 16/4/18.
//  Copyright © 2016年 Sicent. All rights reserved.
//

#import "WXAlertController.h"
#import "ReactiveCocoa.h"

@interface WXAlertController ()

@end

@implementation WXAlertController

+ (WXAlertController *)sharedAlertController{
    static WXAlertController *alertController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertController = [[self alloc] init];
    });

    return alertController;
}

-(void)alertControllerWithTitle:(NSString *)title
                    withMessage:(NSString *)message
                     withCancel:(NSString *)cancel
                    withItems:(NSArray *)items
                    withShowObj:(UIViewController *)controller
       withAlertControllerStyle:(UIAlertControllerStyle)alertControllerStyle
      withClickedButtonWithType:(ClickedButtonType)clickButtonType{

    if (([UIDevice currentDevice].systemVersion.floatValue > 8.0)) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertControllerStyle];

        if (cancel) {
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                clickButtonType(0,alertControllerStyle);
            }];
            [alertController addAction:cancelAction];
        }

        if (alertControllerStyle == UIAlertControllerStyleActionSheet) {

            NSInteger index = 1;
            for (NSString *title in items) {
                UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    clickButtonType(index,alertControllerStyle);
                }];
                [alertController addAction:action];
                index ++;
            }

        }else if(alertControllerStyle == UIAlertControllerStyleAlert){
            UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:items.firstObject style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                clickButtonType(1,alertControllerStyle);
            }];
            [alertController addAction:confirmAction];
        }

        [controller presentViewController:alertController animated:YES completion:nil];
    }else{
        
        if (alertControllerStyle == UIAlertControllerStyleActionSheet) {
            if (!title) {
                title = message;
            }
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];

            for (NSString *title in items) {
                [actionSheet addButtonWithTitle:title];
            }

            [actionSheet addButtonWithTitle:cancel];
            
            [[actionSheet rac_buttonClickedSignal] subscribeNext:^(id x) {
                clickButtonType([x integerValue] + 1,alertControllerStyle);
            }];
            actionSheet.cancelButtonIndex = items.count;
            [actionSheet showInView:controller.view];
        }else if(alertControllerStyle == UIAlertControllerStyleAlert){
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancel otherButtonTitles:items.firstObject,nil];
            [[alertView rac_buttonClickedSignal] subscribeNext:^(id x) {
                clickButtonType([x integerValue], alertControllerStyle);
            }];

            [alertView show];
        }
    }
}

@end
