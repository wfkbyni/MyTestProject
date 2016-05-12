//
//  AnimatioController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/4/25.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "AnimatioController.h"
#import "WXAnimationView.h"

@implementation AnimatioController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [imageView setImage:[UIImage imageNamed:@"guide_0300_04"]];
    [self.view addSubview:imageView];

    WXAnimationView *animationView = [[WXAnimationView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), 200)];

    [self.view addSubview:animationView];
}


@end
