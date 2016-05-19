//
//  WXBaseTableViewCell.h
//  MyTestProject
//
//  Created by 舒永超 on 16/5/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXMessage.h"

@interface WXBaseTableViewCell : UITableViewCell

+ (NSString *)cellIdentifierForRow:(WXMessage *)message;

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *time;
@property (nonatomic, strong) UIImageView *activityImageView;
@property (nonatomic, strong) UILabel *content;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIButton *activityDetail;
@property (nonatomic, strong) UIImageView *arrow;

@property (nonatomic, strong) WXMessage *message;

@end
