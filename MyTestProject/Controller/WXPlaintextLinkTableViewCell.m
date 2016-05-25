//
//  WXPlaintextLinkTableViewCell.m
//  MyTestProject
//
//  Created by 舒永超 on 16/5/19.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "WXPlaintextLinkTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface WXPlaintextLinkTableViewCell ()

@property (nonatomic, strong) WXMessage *wxMessage;

@end

@implementation WXPlaintextLinkTableViewCell

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

    self.line.sd_layout
    .leftSpaceToView(self.bgView, 0)
    .rightSpaceToView(self.bgView, 0)
    .topSpaceToView(self.content, 10)
    .heightIs(0.5);

    self.activityDetail.sd_layout
    .leftEqualToView(self.title)
    .rightEqualToView(self.title)
    .topSpaceToView(self.line, 10)
    .heightIs(30);


    self.arrow.sd_layout
    .rightEqualToView(self.title)
    .topSpaceToView(self.line, 10 + 8)
    .widthIs(8)
    .heightIs(15);

    self.bgView.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10);

    [self.bgView setupAutoHeightWithBottomView:self.activityDetail bottomMargin:10];

    [self setupAutoHeightWithBottomView:self.bgView bottomMargin:5];
}

- (void)setMessage:(WXMessage *)message{

    _wxMessage = message;

    self.title.text = message.msgTitle;

    self.time.text = [NSDate stringWithIntervalSince1970:message.submitTime];;

    self.content.text = message.msgContentShort;

    [self.activityDetail addTarget:self action:@selector(activityDetailAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)activityDetailAction:(id)sender{

}

@end
