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
    self.title.text = message.msgTitle;

    self.time.text = [NSDate stringWithIntervalSince1970:message.submitTime];;

    self.content.text = message.msgContentShort;

    //CGFloat width = message.size.width;
    
    [self buildImageViewWtihUrl:message.imageUrl];
    /*
    if (width > 0) {
        self.activityImageView.sd_layout
        .autoHeightRatio(message.size.height / width)
        .widthIs(width);
    }else{
        
        NSString *url = message.imageUrl;
        [self.activityImageView sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            self.activityImageView.image = image;
            //未缓存,根据图片url获取图片尺寸
            CGSize size = [UIImage getImageSizeWithURL:[NSURL URLWithString:message.imageUrl]];
            
            if ([self.theDelegate respondsToSelector:@selector(reloadLoadWithIndexPath:withSize:)]) {
                [self.theDelegate reloadLoadWithIndexPath:self.indexPath withSize:size];
            }
        }];
    }
    */
}

-(void) buildImageViewWtihUrl:(NSString *)url{
    
    NSLog(@"%@",@"row exec.....");
    
    NSURL *urlString = [NSURL URLWithString:url];
    __weak WXMessagePicTableViewCell *sself = self;
    if (![[SDWebImageManager sharedManager] cachedImageExistsForURL:urlString]) {
        
        [sself.activityImageView sd_setImageWithURL:urlString completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            CGSize newSize =  [sself imageCompressForWidth:image targetWidth:sself.contentView.frame.size.width];
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
        CGSize newSize =  [sself imageCompressForWidth:image targetWidth:sself.contentView.frame.size.width];
        sself.activityImageView.image = image;
        
        sself.activityImageView.sd_layout
        .autoHeightRatio(newSize.height / newSize.width).widthIs(newSize.width);
        
        if ([sself.theDelegate respondsToSelector:@selector(reloadLoadWithIndexPath:withSize:)]) {
            [sself.theDelegate reloadLoadWithIndexPath:sself.indexPath withSize:CGSizeZero];
        }
    }
}

//指定宽度按比例缩放
-(CGSize) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth{
    
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = height / (width / targetWidth);
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    
    return size;
}

@end
