//
//  GridViewController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/5/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "GridViewController.h"

@interface GridViewController ()

@end

@implementation GridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backAction:)];

    self.title = @"格子布局";

    [self gridLayout];
}

- (void)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)gridLayout{
    UIView *bgView = [UIView new];
    [self.view addSubview:bgView];

    NSInteger count = 3;

    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];

    for (NSInteger i = 0; i < count; i++) {
        UIView *childView = [UIView new];
        [bgView addSubview:childView];
        [childView setBackgroundColor:[UIColor colorWithRed:arc4random_uniform(255.0f) / 255.0f green:arc4random_uniform(255.0f) / 255.0f blue:arc4random_uniform(255.0f) / 255.0f alpha:1]];

        childView.sd_layout.topSpaceToView(bgView, 0).heightEqualToWidth();

        [array addObject:childView];
    }

    bgView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topSpaceToView(self.view,80);

    [bgView setupAutoWidthFlowItems:array withPerRowItemsCount:array.count verticalMargin:0 horizontalMargin:1];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
