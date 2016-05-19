//
//  WXActivityLinkTableViewCell.m
//  MyTestProject
//
//  Created by 舒永超 on 16/5/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "WXActivityLinkTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation WXActivityLinkTableViewCell

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
    .topSpaceToView(self.bgView, 10);

    self.time.sd_layout
    .leftEqualToView(self.title)
    .rightEqualToView(self.title)
    .topSpaceToView(self.title, 5)
    .heightIs(21);

    self.activityImageView.sd_layout
    .topSpaceToView(self.time, 10)
    .leftSpaceToView(self.bgView, 10)
    .rightSpaceToView(self.bgView, 10);

    self.content.sd_layout
    .leftEqualToView(self.title)
    .rightEqualToView(self.title)
    .topSpaceToView(self.activityImageView, 10)
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
    .topSpaceToView(self.line, 10)
    .widthIs(30)
    .heightIs(30);

    self.bgView.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10);

    [self.bgView setupAutoHeightWithBottomView:self.activityDetail bottomMargin:10];

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

    [self.activityImageView sd_setImageWithURL:[NSURL URLWithString:message.imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [self.activityImageView setContentMode:UIViewContentModeScaleAspectFit];
        self.activityImageView.image = image;
        CGFloat scale = 0.5;//image.size.height / image.size.width;
        self.activityImageView.sd_layout.autoHeightRatio(scale);

        [self.bgView setupAutoHeightWithBottomView:self.activityDetail bottomMargin:10];
    }];
}

@end
