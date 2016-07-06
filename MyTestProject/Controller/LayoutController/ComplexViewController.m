//
//  ComplexViewController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/7/4.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "ComplexViewController.h"

@interface ComplexViewController ()

@property (nonatomic, strong) UIView *superView;

@property (nonatomic, strong) UIView *view1;    // 红
@property (nonatomic, strong) UIView *view2;    // 绿
@property (nonatomic, strong) UIView *view3;    // 蓝
@property (nonatomic, strong) UIView *view4;    // 紫

@property (nonatomic, strong) MASConstraint *redConstraint;         // 红
@property (nonatomic, strong) MASConstraint *greenConstraint;       // 绿
@property (nonatomic, strong) MASConstraint *blueConstraint;        // 蓝
@property (nonatomic, strong) MASConstraint *purpleConstraint;      // 紫



@end

@implementation ComplexViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];

    [self setupContentView];

    [self setupBottomView];

}

- (void)setupContentView{

    _superView = [UIView new];
    _superView.backgroundColor = [UIColor colorWithRed:0.450 green:0.000 blue:0.000 alpha:1.000];
    [self.view addSubview:_superView];

    [_superView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

    _view1 = [UIView new];
    _view1.backgroundColor = [UIColor colorWithRed:1.000 green:0.899 blue:0.000 alpha:1.000];
    [_superView addSubview:_view1];

    _view2 = [UIView new];
    _view2.backgroundColor = [UIColor greenColor];
    [_superView addSubview:_view2];

    _view3 = [UIView new];
    _view3.backgroundColor = [UIColor blueColor];
    [_superView addSubview:_view3];

    _view4 = [UIView new];
    _view4.backgroundColor = [UIColor purpleColor];
    [_superView addSubview:_view4];

    NSInteger height = 40;
    NSInteger value = 25;
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_superView.mas_top).offset(64);
        make.left.right.equalTo(_superView);
        //make.height.equalTo(@(height));

        _redConstraint = make.height.equalTo(@0).priority(MASLayoutPriorityRequired);
        [_redConstraint deactivate];
    }];
    //_view1.clipsToBounds = YES;

    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view1.mas_bottom);
        make.left.right.equalTo(_superView);
        //make.height.equalTo(@(height + value));

        _greenConstraint = make.height.equalTo(@0).priority(MASLayoutPriorityRequired);
        [_greenConstraint deactivate];
    }];

    [_view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view2.mas_bottom);
        make.left.right.equalTo(_superView);
        //make.height.equalTo(@(height+ value * 2));

        _blueConstraint = make.height.equalTo(@0).priority(MASLayoutPriorityRequired);
        [_blueConstraint deactivate];
    }];

    [_view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view3.mas_bottom);
        make.left.right.equalTo(_superView);
        //make.height.equalTo(@(height + value * 3));

        _purpleConstraint = make.height.equalTo(@0).priority(MASLayoutPriorityRequired);
        [_purpleConstraint deactivate];
    }];

    UIView *view1_left = [UIView new];
    UIView *view1_right = [UIView new];
    view1_left.backgroundColor = [UIColor colorWithRed:1.000 green:0.500 blue:0.446 alpha:1.000];
    view1_right.backgroundColor = [UIColor orangeColor];
    [_view1 addSubview:view1_left];
    [_view1 addSubview:view1_right];

    NSArray *view1Array = @[view1_left,view1_right];

    [view1Array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:10 tailSpacing:10];
    [view1Array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(height));
        make.top.equalTo(_view1.mas_top).offset(10);
    }];

    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view1.mas_bottom);
        make.left.right.equalTo(_superView);
        //make.height.equalTo(@(height + value));

        _greenConstraint = make.height.equalTo(@0).priority(MASLayoutPriorityRequired);
        [_greenConstraint deactivate];
    }];

    UIView *view2_childView = [UIView new];
    view2_childView.backgroundColor = [UIColor colorWithRed:0.000 green:0.441 blue:0.000 alpha:1.000];
    [_view2 addSubview:view2_childView];
    [view2_childView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(height + value));
        make.top.equalTo(_view2.mas_top).offset(30);
        make.left.right.equalTo(_view2);

    }];
    
//
//    UIView *view3_childView = [UIView new];
//    view3_childView.backgroundColor = [UIColor colorWithRed:1.000 green:0.112 blue:0.946 alpha:1.000];
//    [_view3 addSubview:view3_childView];
//    [view3_childView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(_view3).insets(UIEdgeInsetsMake(5, 10, 15, 20));
//        make.height.equalTo(@(height * 2));
//    }];
//
//    UIView *view4_childView = [UIView new];
//    view4_childView.backgroundColor = [UIColor colorWithRed:0.000 green:0.193 blue:0.000 alpha:1.000];
//    [_view4 addSubview:view4_childView];
//    [view4_childView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(_view4).insets(UIEdgeInsetsMake(5, 10, 15, 20));
//        make.height.equalTo(@(height * 3));
//    }];
}

- (void)setupBottomView{
    UIView* bottomView = [UIView new];
    bottomView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bottomView];

    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.equalTo(@60);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];

    NSArray *datas = @[@"添加",@"移除",@"待定"];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:3];
    for (NSInteger i = 0; i < 3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:datas[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:button];
        [array addObject:button];
    }

    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:10 tailSpacing:10];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bottomView);
        make.height.equalTo(@60);
    }];
}

- (void)btnAction:(UIButton *)sender{
    [_redConstraint deactivate];
    [_greenConstraint deactivate];
    [_blueConstraint deactivate];
    [_purpleConstraint deactivate];

    switch (sender.tag) {
        case 0:
            [_blueConstraint activate];
            break;
        case 1:
            [_greenConstraint activate];
            break;
        case 2:
            [_purpleConstraint activate];
            break;
        default:
            break;
    }
}

// 这是在分支上的东西吧。。。。。。

@end
