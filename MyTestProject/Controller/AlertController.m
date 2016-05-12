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

    UIButton *alertBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [alertBtn setFrame:CGRectMake(40, 80, CGRectGetWidth(self.view.frame) - 80, 40)];
    [alertBtn setTitle:@"AlertView" forState:UIControlStateNormal];
    [alertBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:alertBtn];

    UIButton *actionSheetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionSheetBtn setFrame:CGRectMake(40, CGRectGetMaxY(alertBtn.frame) + 40, CGRectGetWidth(self.view.frame) - 80, 40)];
    [actionSheetBtn setTitle:@"ActionSheet" forState:UIControlStateNormal];
    [actionSheetBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:actionSheetBtn];

    [alertBtn addTarget:self action:@selector(alertViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [actionSheetBtn addTarget:self action:@selector(actionSheetAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)alertViewAction:(UIButton *)sender{
    [[WXAlertController sharedAlertController] alertControllerWithTitle:@"标题" withMessage:@"message内容" withCancel:@"取消" withItems:@[@"确定"] withShowObj:self withAlertControllerStyle:UIAlertControllerStyleAlert withClickedButtonWithType:^(NSInteger index, UIAlertControllerStyle style) {
        NSLog(@"style:%@  index:%@",@(style),@(index));
    }];
}

- (void)actionSheetAction:(UIButton *)sender{
    [[WXAlertController sharedAlertController] alertControllerWithTitle:@"标题" withMessage:@"message内容" withCancel:@"取消" withItems:@[@"选项1",@"选项2",@"选项3",@"选项4",@"选项5"] withShowObj:self withAlertControllerStyle:UIAlertControllerStyleActionSheet withClickedButtonWithType:^(NSInteger index, UIAlertControllerStyle style) {
        NSLog(@"style:%@  index:%@",@(style),@(index));
    }];
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
