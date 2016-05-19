//
//  WXPlaintextTableViewCell.m
//  MyTestProject
//
//  Created by 舒永超 on 16/5/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "WXPlaintextTableViewCell.h"

@implementation WXPlaintextTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }

    return self;
}

- (void)setup{

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

    self.content.sd_layout
    .leftEqualToView(self.title)
    .rightEqualToView(self.title)
    .topSpaceToView(self.time, 10)
    .autoHeightRatio(0);

    self.bgView.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10);

    [self.bgView setupAutoHeightWithBottomView:self.content bottomMargin:10];

    [self setupAutoHeightWithBottomView:self.bgView bottomMargin:5];
}

- (void)setMessage:(WXMessage *)message{
    self.title.text = message.msgTitle;

    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:message.submitTime];
    NSString *time = [df stringFromDate:date];

    self.time.text = time;

    self.content.text = message.msgContentShort;
}


@end
