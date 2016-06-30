//
//  ViewController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/4/14.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "ViewController.h"
#import "StarsController.h"
#import "AnimatioController.h"
#import "AlertController.h"
#import "RegularController.h"
#import "AutoLayoutController.h"
#import "IdfaKeyChainViewController.h"
#import "MasonryController.h"
#import "PlayerViewController.h"
#import "LayoutViewController.h"

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

- (IBAction)animationAction:(id)sender {
    AnimatioController *controller = [AnimatioController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)alertControllerAction:(id)sender {
    AlertController *controller = [[AlertController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)regularAction:(id)sender {
    RegularController *controller = [[RegularController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)autolayoutAction:(id)sender {
    AutoLayoutController *controller = [[AutoLayoutController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)keyChainAction:(id)sender {
    IdfaKeyChainViewController *controller = [[IdfaKeyChainViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)masonryAction:(id)sender {
    MasonryController *controller = [MasonryController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)playerAction:(id)sender {
    PlayerViewController *controller = [PlayerViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)layoutAction:(id)sender {
    LayoutViewController *controller = [LayoutViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
