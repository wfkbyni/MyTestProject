//
//  AutoHeightViewController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/5/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "AutoHeightViewController.h"

@interface AutoHeightViewController (){
    UILabel *autlHeightLabel;
}

@end

@implementation AutoHeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];

    self.title = @"动态计算label高度";

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backAction:)];

    UILabel *label = [UILabel new];
    [self.view addSubview:label];

    [label setText:@"1.2 > widthRatioToView(self.view, 1)方法名中带有“RatioToView”的方法表示view的宽度或者高度等属性相对于参照view的对应属性值的比例，需要传递2个参数：（UIView）参照view 和 （CGFloat）倍数\n1.3 > topEqualToView(view)方法名中带有“EqualToView”的方法表示view的某一属性等于参照view的对应的属性值，需要传递1个参数：（UIView）参照view方法名中带有“Is”的方法表示view的某一属性值等于参数数值，需要传递1个参数：（CGFloat）数值"];

    label.sd_layout
    .leftSpaceToView(self.view, 10)
    .rightSpaceToView(self.view, 10)
    .topSpaceToView(self.view, 74)
    .autoHeightRatio(0);
}

- (void)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
