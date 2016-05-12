//
//  AlertController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/5/11.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "AlertController.h"
#import "WXAlertController.h"

@interface AlertController ()

@end

@implementation AlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self.view setBackgroundColor:[UIColor whiteColor]];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[WXAlertController sharedAlertController] alertControllerWithTitle:@"标题" withMessage:@"message内容" withCancel:@"取消" withItems:@[@"确定"] withShowObj:self withAlertControllerStyle:UIAlertControllerStyleAlert withClickedButtonWithType:^(NSInteger index, UIAlertControllerStyle style) {
            NSLog(@"style:%@  index:%@",@(style),@(index));
        }];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
