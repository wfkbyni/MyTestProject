//
//  StarsController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/4/14.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "StarsController.h"
#import "WXCustomScroeView.h"

@interface StarsController()
@property (nonatomic, strong) WXCustomScroeView *scroeView;
@end

@implementation StarsController

- (void)viewDidLoad{
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];

    _scroeView = [[WXCustomScroeView alloc] initWithFrame:CGRectMake(20, 84, 200, 40)];
    [self.view addSubview:_scroeView];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_scroeView.frame) + 20, CGRectGetMinY(_scroeView.frame), 100, 40)];
    [label setTextColor:[UIColor redColor]];
    [self.view addSubview:label];

    label.text = [NSString stringWithFormat:@"%.2f",8.0f];
    [_scroeView setScroe:8];
    [_scroeView setIsDecimal:YES];
    [_scroeView setIsCanScroe:YES];
    [_scroeView setScroeBlock:^(CGFloat scroe) {
        NSLog(@"%.2f",scroe);
        label.text = [NSString stringWithFormat:@"%.2f",scroe];
    }];


}

@end
