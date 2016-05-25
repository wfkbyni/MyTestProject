//
//  WXBaseTableViewCell.m
//  MyTestProject
//
//  Created by 舒永超 on 16/5/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "WXBaseTableViewCell.h"

@implementation WXBaseTableViewCell

+(NSString *)cellIdentifierForRow:(WXMessage *)message{
    // 有图片有链接的
    if (message.activityUrl && message.activityUrl.length > 0 && message.imageUrl && message.imageUrl.length > 0) {
        return @"WXActivityLinkTableViewCell";
        // 无图片有链接的
    }else if (message.activityUrl && message.activityUrl.length > 0){
        return @"WXPlaintextLinkTableViewCell";
        // 有图片无链接的
    }else if(message.imageUrl && message.imageUrl.length > 0){
        return @"WXMessagePicTableViewCell";
    }
    // 线文字的
    return @"WXPlaintextTableViewCell";
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView setBackgroundColor:[UIColor colorWithWhite:0.549 alpha:0.204]];
        self.bgView = [UIView new];
        [self.contentView addSubview:self.bgView];

        self.title = [UILabel new];

        self.time = [UILabel new];

        self.activityImageView = [UIImageView new];

        self.content = [UILabel new];

        self.line = [UIView new];

        self.activityDetail = [UIButton new];

        self.arrow = [UIImageView new];

        [self.title setFont:[UIFont systemFontOfSize:15.0f]];
        [self.time setFont:[UIFont systemFontOfSize:11.0f]];
        self.time.textColor = [UIColor lightGrayColor];
        [self.content setFont:[UIFont systemFontOfSize:14.0f]];
        self.content.textColor = [UIColor darkGrayColor];
        [self.bgView setBackgroundColor:[UIColor whiteColor]];
        [self.line setBackgroundColor:[UIColor colorWithWhite:0.549 alpha:0.204]];

        [self.activityDetail setTitle:@"活动详情" forState:UIControlStateNormal];
        [self.activityDetail setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [self.activityDetail setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self.arrow setImage:[UIImage imageNamed:@"icon_rightArrow"]];

        self.bgView.sd_cornerRadius = @(4);
        [self.bgView sd_addSubviews:@[self.title,self.time,self.activityImageView,self.content,self.line,self.activityDetail,self.arrow]];

        self.title.sd_layout
        .leftSpaceToView(self.bgView, 10)
        .rightSpaceToView(self.bgView, 10)
        .topSpaceToView(self.bgView, 10)
        .heightIs(21);

        self.time.sd_layout
        .leftEqualToView(self.title)
        .rightEqualToView(self.title)
        .topSpaceToView(self.title, 5)
        .heightIs(21);
        
    }
    return self;
}

@end
