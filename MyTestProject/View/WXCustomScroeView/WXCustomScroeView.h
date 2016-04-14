//
//  CustomScroeView.h
//  TestProject
//
//  Created by 舒永超 on 16/3/30.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXCustomScroeView : UIControl

// 当前分数
@property (nonatomic, assign) CGFloat scroe;

// 是否可以打分 默认为不能评分
@property (nonatomic, assign) BOOL isCanScroe;

// 是否支持小数打分，默认为支持
@property (nonatomic, assign) BOOL isDecimal;

// 打分后的block回调
@property (nonatomic, copy) void(^ScroeBlock)(CGFloat);
@end
