//
//  CustomScroeView.m
//  TestProject
//
//  Created by 舒永超 on 16/3/30.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "WXCustomScroeView.h"

@interface WXCustomScroeView (){
    float selectValue;

    UIImageView *bgImageView;

}

@end

#define maxValue 10

@implementation WXCustomScroeView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {

        self.isCanScroe = NO;
        _isDecimal = YES;

        bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        [bgImageView setUserInteractionEnabled:NO];

        UIImage *image = [self compressImage:[UIImage imageNamed:@"stars_on"]];
        image = [image resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
        [bgImageView setImage:image];

        [self addSubview:bgImageView];

        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        image = [self compressImage:[UIImage imageNamed:@"stars_off"]];
        image = [image resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
        [imageView setImage:image];
        [imageView setUserInteractionEnabled:NO];

        [self addSubview:imageView];
    }

    return self;
}

/**
 *  把图片压缩成指定的大小
 *
 */
- (UIImage *)compressImage:(UIImage *)imgSrc
{
    float width = CGRectGetWidth(self.frame) / 5;
    CGSize size = {width, CGRectGetHeight(self.frame)};
    UIGraphicsBeginImageContext(size);
    CGRect rect = {{0,0}, size};
    [imgSrc drawInRect:rect];
    UIImage *compressedImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return compressedImg;
}

-(void)setIsCanScroe:(BOOL)isCanScroe{
    if (isCanScroe) {
        [self addTarget:self action:@selector(changeAction:) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [self removeTarget:self action:@selector(changeAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)changeAction:(UISlider *)sender{
    if (_ScroeBlock) {
        _ScroeBlock(selectValue);
    }
    self.scroe = selectValue;
}

- (void)setScroe:(CGFloat)scroe{

    selectValue = CGRectGetWidth(self.frame) / maxValue * scroe;

    [self settingScroe];
}

- (void)settingScroe{

    CGRect frame = bgImageView.frame;
    frame.size.width = selectValue;
    bgImageView.frame = frame;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(nullable UIEvent *)event{
    return NO;
}

- (void)endTrackingWithTouch:(nullable UITouch *)touch withEvent:(nullable UIEvent *)event{
    float x = [touch locationInView:self].x;

    selectValue = x / CGRectGetWidth(self.frame) * 10;

    if (selectValue > maxValue - 1) {
        selectValue = 10;
    }

    if (!_isDecimal) {
        selectValue = ceilf(selectValue);   // 这里因为不需要小数打分，所以直接下上取整
    }
}

@end
