//
//  RegularController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/5/13.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "RegularController.h"
#import "UIView+Toast.h"

@interface RegularController ()
@property (nonatomic, strong) UITextField *content; // 验证内容
@end

@implementation RegularController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view setBackgroundColor:[UIColor colorWithRed:0.886 green:0.910 blue:0.836 alpha:1.000]];

    _content = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, CGRectGetWidth(self.view.frame) - 40, 40)];
    [_content setBorderStyle:UITextBorderStyleNone];
    [_content setPlaceholder:@"请输入验证内容"];
    [self.view addSubview:_content];

    CGFloat y = CGRectGetMaxY(_content.frame);
    UIButton *valiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [valiBtn setFrame:CGRectMake(20, y, CGRectGetWidth(_content.frame), 50)];
    [valiBtn.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [valiBtn.titleLabel setNumberOfLines:2];
    [valiBtn setBackgroundColor:[UIColor orangeColor]];
    [valiBtn setTitle:@"验证密码强度 (密码的强度必须是包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间)" forState:UIControlStateNormal];
    [valiBtn addTarget:self action:@selector(valiPwdAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:valiBtn];

    y = CGRectGetMaxY(valiBtn.frame) + 10;
    valiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [valiBtn setFrame:CGRectMake(20, y, CGRectGetWidth(_content.frame), 50)];
    [valiBtn.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [valiBtn.titleLabel setNumberOfLines:2];
    [valiBtn setBackgroundColor:[UIColor orangeColor]];
    [valiBtn setTitle:@"校验金额 (金额校验，精确到2位小数)" forState:UIControlStateNormal];
    [valiBtn addTarget:self action:@selector(valiMoneyAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:valiBtn];

}

- (void)isPassRegular:(NSString *)regular{

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regular];

    BOOL result = [predicate evaluateWithObject:_content.text];

    if (result) {
        [self.view makeToast:[NSString stringWithFormat:@"%@ 验证成功",_content.text] duration:2 position:CSToastPositionCenter];
    }else{
        [self.view makeToast:[NSString stringWithFormat:@"%@ 验证失败",_content.text] duration:2 position:CSToastPositionCenter];
    }
}

- (void)valiPwdAction:(UIButton *)sender{

    NSString *regular = @"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$";

    [self isPassRegular:regular];
}

- (void)valiMoneyAction:(UIButton *)sender{

    NSString *regular = @"^[0-9]+(.[0-9]{2})?$";

    [self isPassRegular:regular];
}

@end
