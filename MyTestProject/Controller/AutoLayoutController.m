//
//  AutoLayoutController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/5/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "AutoLayoutController.h"
#import "AutoHeightViewController.h"
#import "GridViewController.h"
#import "TypeCellViewController.h"

@interface AutoLayoutController ()

@end

@implementation AutoLayoutController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];

    self.title = @"SDAutoLayout布局";

    [self common];
}

- (void)common{
    UIButton *autoHeightBtn = [self commonBtnWithTitle:@"动态计算高度" withAutoLayoutType:AutoLayoutTypeWithAutoHeight];

    autoHeightBtn.sd_layout
    .leftSpaceToView(self.view, 10)
    .topSpaceToView(self.view,74)
    .widthIs((CGRectGetWidth(self.view.frame) - 30) / 2)
    .heightIs(50);

    UIButton *othreBtn = [self commonBtnWithTitle:@"格子布局" withAutoLayoutType:AutoLayoutTypeWithGrid];
    [self.view addSubview:othreBtn];

    othreBtn.sd_layout
    .leftSpaceToView(autoHeightBtn, 10)
    .rightSpaceToView(self.view, 10)
    .topSpaceToView(self.view,74)
    .widthIs((CGRectGetWidth(self.view.frame) - 30) / 2)
    .heightIs(50);

    UIView *bgView = [UIView new];
    [bgView setBackgroundColor:[UIColor colorWithRed:0.000 green:0.000 blue:1.000 alpha:0.404]];
    [self.view addSubview:bgView];

    UIButton *btn1 = [self commonBtnWithTitle:@"多种cell布局" withAutoLayoutType:AutoLayoutTypeWithCellType];
    UIButton *btn2 = [self commonBtnWithTitle:@"待定" withAutoLayoutType:-1];

    btn1.sd_layout.heightIs(50);
    btn2.sd_layout.heightIs(50);

    [bgView addSubview:btn1];
    [bgView addSubview:btn2];

    bgView.sd_layout.leftSpaceToView(self.view, 10).rightSpaceToView(self.view, 10).topSpaceToView(autoHeightBtn, 10);

    [bgView setupAutoWidthFlowItems:@[btn1,btn2] withPerRowItemsCount:2 verticalMargin:10 horizontalMargin:10];
    //[bgView setupAutoMarginFlowItems:@[btn1,btn2] withPerRowItemsCount:2 itemWidth:100 verticalMargin:10];


}

- (UIButton *)commonBtnWithTitle:(NSString *)title withAutoLayoutType:(AutoLayoutType)type{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = type;
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.500]];
    [self.view addSubview:button];

    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];

    return button;
}

- (void)clickAction:(UIButton *)sender{
    switch (sender.tag) {
        case AutoLayoutTypeWithAutoHeight:
        {
            AutoHeightViewController *controller = [AutoHeightViewController new];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case AutoLayoutTypeWithGrid:
        {
            GridViewController *controller = [GridViewController new];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case AutoLayoutTypeWithCellType:
        {
            TypeCellViewController *controller = [TypeCellViewController new];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
