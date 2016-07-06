//
//  LayoutViewController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/6/29.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "LayoutViewController.h"
#import "LayoutHeaderView.h"
#import "ComplexViewController.h"

@interface LayoutViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) LayoutHeaderView *layoutHeaderView;
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UISegmentedControl *navSegControl;
@property (nonatomic, strong) UISegmentedControl *secSegControl;

@end

@implementation LayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"填写" style:UIBarButtonItemStyleDone target:self action:@selector(backAction:)];

     _navSegControl = [[UISegmentedControl alloc] initWithItems:@[@"推荐",@"随便找个",@"最新"]];
    self.navigationItem.titleView = _navSegControl;
    [_navSegControl addTarget:self action:@selector(segAction:) forControlEvents:UIControlEventValueChanged];

    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.view.frame) + 20)];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    [self.view addSubview:_myTableView];

    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:backButton];
    [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];

    [backButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(12);
        make.top.equalTo(self.view).offset(25);
        make.width.height.equalTo(@32);
    }];

    UIButton *writeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [writeButton setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:writeButton];

    [writeButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-12);
        make.top.equalTo(self.view).offset(25);
        make.width.height.equalTo(backButton);
    }];

    _layoutHeaderView = [[LayoutHeaderView alloc] initWithData:nil];
    _myTableView.tableHeaderView = _layoutHeaderView;
}

- (void)segAction:(UISegmentedControl *)control{
    _navSegControl.selectedSegmentIndex = control.selectedSegmentIndex;
    _secSegControl.selectedSegmentIndex = control.selectedSegmentIndex;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y > [LayoutHeaderView heaerViewHeight] - 40) {
        [UIView animateWithDuration:0.05 animations:^{
           // self.navigationController.navigationBar.alpha = 1;
        }];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
           // self.navigationController.navigationBar.alpha = 0;
        }];
    }
}

- (void)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.navigationController.navigationBar.alpha = 0;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    self.navigationController.navigationBar.alpha = 1;
    [_navSegControl removeFromSuperview];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 80)];
    sectionView.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:238.5/255.0 blue:237.7/255.0 alpha:255.0/255.0];

    _secSegControl = [[UISegmentedControl alloc] initWithItems:@[@"推荐",@"随便找个",@"最新"]];
    [sectionView addSubview:_secSegControl];
    [_secSegControl addTarget:self action:@selector(segAction:) forControlEvents:UIControlEventValueChanged];
    [_secSegControl mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(sectionView);
    }];

    return sectionView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    ComplexViewController *controller = [ComplexViewController new];
    [self.navigationController pushViewController:controller animated:YES];

}

@end
