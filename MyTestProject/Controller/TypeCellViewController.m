//
//  TypeCellViewController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/5/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "TypeCellViewController.h"
#import "WXBaseTableViewCell.h"
#import "WXMessage.h"
#import "SDImageCache.h"

@interface TypeCellViewController () <UITableViewDelegate,UITableViewDataSource,WXBaseTableViewCellDelegate>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *messageArray;

@end

@implementation TypeCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backAction:)];

    self.myTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.myTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.myTableView setDataSource:self];
    [self.myTableView setDelegate:self];
    [self.view addSubview:self.myTableView];

    [self cacheCountSize];
    [self commonData];
}

- (void)clearCache:(id)sender{

    [[SDImageCache sharedImageCache] clearMemory];
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        [self cacheCountSize];

        [self.navigationController popViewControllerAnimated:YES];
    }];

}

- (void)cacheCountSize{
    NSUInteger size = [[SDImageCache sharedImageCache] getSize] / 1024;
    NSUInteger count = [[SDImageCache sharedImageCache] getDiskCount];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"清除缓存%ldkb/%ld",size,count] style:UIBarButtonItemStyleDone target:self action:@selector(clearCache:)];
}

- (void)commonData{
    _messageArray = [NSMutableArray array];

    NSInteger count = 3;//arc4random_uniform(40);

    for (NSInteger i = 0; i < count; i++) {
        WXMessage *message = [WXMessage new];

        message.msgTitle = @"消息标题";
        message.submitTime = [[NSDate date] timeIntervalSince1970];
        message.msgContentShort = [NSString stringWithFormat:@"message Content message Content message Content message Content message Content ： %ld", i];

        switch (i) {
            case 0:
                message.imageUrl = @"http://cdn.cocimg.com/bbs/attachment/Fid_18/18_298683_9dbfa2ec2abd43d.png";
                break;
            case 1:
                message.imageUrl = @"http://static.googleadsserving.cn/pagead/imgad?id=CICAgKDTj_ascxCsAhj6ATIID0eX9L4BOCE";
                break;
            case 2:
                message.imageUrl = @"http://static.googleadsserving.cn/pagead/imgad?id=CICAgKCzpIG-aBCsAhjYBDIIQ1_nz0UeZoI";
                break;
            case 3:
                message.imageUrl = @"http://pic.fotomore.com/thumb/129348000/isc129348197.jpg";
                message.activityUrl = message.imageUrl;
                break;
            case 4:
                message.imageUrl = @"http://static.googleadsserving.cn/pagead/imgad?id=CICAgKDTj_ascxCsAhj6ATIID0eX9L4BOCE";
                break;
            case 5:
                message.imageUrl = @"http://static.googleadsserving.cn/pagead/imgad?id=CICAgKCzpIG-aBCsAhjYBDIIQ1_nz0UeZoI";
                break;
            case 6:
                message.imageUrl = @"http://pic.fotomore.com/thumb/129392000/isc129392744.jpg";
                message.activityUrl = message.imageUrl;
                break;
            case 7:
            case 10:
                message.activityUrl = @"www.baidu.com";
            default:
                break;
        }

        [_messageArray addObject:message];
    }

    [self.myTableView reloadData];
}

- (void)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    WXMessage *message = self.messageArray[indexPath.row];

    NSString *identifier = [WXBaseTableViewCell cellIdentifierForRow:message];

    Class mClass = NSClassFromString(identifier);

    CGFloat height = [self.myTableView cellHeightForIndexPath:indexPath model:message keyPath:@"message" cellClass:mClass contentViewWidth:[self cellContentViewWith]];
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WXMessage *message = self.messageArray[indexPath.row];

    NSString *identifier = [WXBaseTableViewCell cellIdentifierForRow:message];

    Class mClass = NSClassFromString(identifier);

    WXBaseTableViewCell *cell = nil;

    cell =  [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[mClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.indexPath = indexPath;
    cell.theDelegate = self;
    cell.message = message;

    ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////

    cell.sd_tableView = tableView;
    cell.sd_indexPath = indexPath;

    ///////////////////////////////////////////////////////////////////////

    return cell;
}

- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;

    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

- (void)reloadLoadWithIndexPath:(NSIndexPath *)indexPath withSize:(CGSize)size{
    WXMessage *message = self.messageArray[indexPath.row];
    message.size = size;
    
    NSLog(@"%ld  ---   row:%ld",indexPath.section,indexPath.row);
    [self.myTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
