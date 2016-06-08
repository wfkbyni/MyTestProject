//
//  IdfaKeyChainViewController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/6/8.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "IdfaKeyChainViewController.h"
#import <AdSupport/AdSupport.h>

#define ServerName @"com.cn.yourbundleid"

@interface IdfaKeyChainViewController ()

@end

@implementation IdfaKeyChainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];

    self.title = @"idfa+Keychain";
    // Do any additional setup after loading the view.

    NSString *idfa = [SSKeychain passwordForService:ServerName account:ServerName];
    if (!idfa || idfa.length == 0) {
        idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        [SSKeychain setPassword:idfa forService:ServerName account:ServerName];
    }

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 30)];
    [label setFont:[UIFont systemFontOfSize:12.0f]];
    [label setText:[NSString stringWithFormat:@"idfa:%@",idfa]];
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
