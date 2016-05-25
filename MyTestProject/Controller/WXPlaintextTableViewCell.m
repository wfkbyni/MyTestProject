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

    self.time.text = [NSDate stringWithIntervalSince1970:message.submitTime];;

    self.content.text = message.msgContentShort;
}


@end
