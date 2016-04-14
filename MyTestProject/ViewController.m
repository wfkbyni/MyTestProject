//
//  ViewController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/4/14.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "ViewController.h"
#import "StarsController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)starsAction:(id)sender {
    StarsController *controller = [StarsController new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
