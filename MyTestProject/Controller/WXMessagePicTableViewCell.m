//
//  WXMessagePicTableViewCell.m
//  MyTestProject
//
//  Created by 舒永超 on 16/5/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "WXMessagePicTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation WXMessagePicTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }

    return self;
}

- (void)setup{

    self.activityImageView.sd_layout
    .topSpaceToView(self.time, 10)
    .centerXEqualToView(self.bgView);

    self.content.sd_layout
    .leftEqualToView(self.title)
    .rightEqualToView(self.title)
    .topSpaceToView(self.activityImageView, 10)
    .autoHeightRatio(0);

    self.bgView.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10);

    [self.bgView setupAutoHeightWithBottomView:self.content bottomMargin:10];

    [self setupAutoHeightWithBottomView:self.bgView bottomMargin:5];

}

-(void)setMessage:(WXMessage *)message{
    NSLog(@"%@",@"----------------------->>>>>> 3");
    self.title.text = message.msgTitle;

    self.time.text = [NSDate stringWithIntervalSince1970:message.submitTime];;

    self.content.text = message.msgContentShort;

    NSString *url = message.imageUrl;
    [self.activityImageView sd_setImageWithURL:[NSURL URLWithString:url]];

    CGFloat width = self.activityImageView.image.size.width;
    if (width > 0) {

        self.activityImageView.sd_layout
        .autoHeightRatio(self.activityImageView.image.size.height / width)
        .widthIs(width);
    }else{
        //未缓存,根据图片url获取图片尺寸
        CGSize size = [UIImage getImageSizeWithURL:[NSURL URLWithString:message.imageUrl]];
        CGFloat scale = size.height / size.width;
        self.activityImageView.sd_layout
        .autoHeightRatio(scale)
        .widthIs(size.width);
    }
    
}

@end
