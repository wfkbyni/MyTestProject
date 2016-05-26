//
//  WXActivityLinkTableViewCell.m
//  MyTestProject
//
//  Created by 舒永超 on 16/5/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "WXActivityLinkTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface WXActivityLinkTableViewCell ()

@property (nonatomic, strong) WXMessage *wxMessage;

@end

@implementation WXActivityLinkTableViewCell

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

    self.time.text = [NSDate stringWithIntervalSince1970:message.submitTime];

    self.content.text = message.msgContentShort;

    NSString *url = message.imageUrl;

    [self buildImageViewWtihUrl:url];

    [self.activityDetail addTarget:self action:@selector(activityDetailAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void) buildImageViewWtihUrl:(NSString *)url{

    NSURL *urlString = [NSURL URLWithString:url];
    __weak WXActivityLinkTableViewCell *sself = self;
    if (![[SDWebImageManager sharedManager] cachedImageExistsForURL:urlString]) {

        [sself.activityImageView sd_setImageWithURL:urlString completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

            CGSize newSize = image.size;

            if (newSize.height > 0 && !error) {
                if ([sself.theDelegate respondsToSelector:@selector(reloadLoadWithIndexPath:withSize:)]) {
                    [sself.theDelegate reloadLoadWithIndexPath:sself.indexPath withSize:newSize];
                }
            }else if(sself.activityImageView.frame.size.height > 0) {
                if ([sself.theDelegate respondsToSelector:@selector(reloadLoadWithIndexPath:withSize:)]) {
                    [sself.theDelegate reloadLoadWithIndexPath:sself.indexPath withSize:CGSizeZero];
                }
            }
        }];
    }else{
        UIImage *image = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:[urlString absoluteString]];

        CGSize size = image.size;
        CGFloat scale = size.height / size.width;
        self.activityImageView.sd_layout
        .autoHeightRatio(scale);

        sself.activityImageView.image = image;

        [self setViewWidthWithWidth:size.width];

        if ([sself.theDelegate respondsToSelector:@selector(reloadLoadWithIndexPath:withSize:)]) {
            //[sself.theDelegate reloadLoadWithIndexPath:sself.indexPath withSize:CGSizeZero];
        }
    }
}

- (void)setViewWidthWithWidth:(CGFloat)width{
    if (width > [UIScreen mainScreen].bounds.size.width - 40) {
        self.activityImageView.sd_layout.widthIs([UIScreen mainScreen].bounds.size.width - 40);
    }else{
        self.activityImageView.sd_layout.widthIs(width);
    }
}

- (void)activityDetailAction:(id)sender{
}

@end
