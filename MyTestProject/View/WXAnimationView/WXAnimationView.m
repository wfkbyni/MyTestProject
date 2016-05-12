//
//  WXAnimationView.m
//  MyTestProject
//
//  Created by 舒永超 on 16/4/25.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "WXAnimationView.h"

@interface WXAnimationView()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIImageView *animationView;


@end

@implementation WXAnimationView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor clearColor]];
        //[self commonView];

    }
    return self;
}

- (void)commonView{
    
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 40)];
    [lineImageView setImage:[UIImage imageNamed:@"line"]];

    CGRect frame = CGRectMake(0, 0, CGRectGetWidth(lineImageView.frame), CGRectGetHeight(lineImageView.frame));
    [self addSubview:[self visualEffectView:frame]];

    [self addSubview:lineImageView];


    UIImage *image = [UIImage imageNamed:@"round"];
    UIImageView *roundImageView = [[UIImageView alloc] initWithImage:image];
    [roundImageView setFrame:CGRectMake((CGRectGetWidth(self.frame) - image.size.width) / 2, CGRectGetMaxY(lineImageView.frame), image.size.width, image.size.height)];

    frame = roundImageView.frame;
    [self addSubview:[self visualEffectView:frame]];

    [self addSubview:roundImageView];

    image = [UIImage imageNamed:@"bg-1"];
    _iconImageView = [[UIImageView alloc] initWithImage:image];
    [_iconImageView setFrame:CGRectMake((CGRectGetWidth(self.frame) - image.size.width / 3) / 2, 10, image.size.width / 3, image.size.height / 3)];
    [self addSubview:_iconImageView];

    image = [UIImage imageNamed:@"animation"];
    _animationView = [[UIImageView alloc] initWithImage:image];
    [_animationView setFrame:CGRectMake(CGRectGetMaxX(_iconImageView.frame) - (image.size.width) / 2 - 1,
                                        CGRectGetHeight(_iconImageView.frame) / 2 - image.size.height / 2,
                                        image.size.width,
                                        image.size.height)];
    [self addSubview:_animationView];

    [self startAnimation];
}

- (UIView *)visualEffectView:(CGRect)frame{
    UIView *bgView = nil;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        bgView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        bgView.frame = frame;
    }else{
        bgView = [[UIView alloc] initWithFrame:frame];
        bgView.alpha = 0.8;
    }

    return bgView;
}

-(void)drawRect:(CGRect)rect{

    [self drawARCPath];
}

#define   kDegreesToRadians(degrees)  ((M_PI * degrees)/ 180)
- (void)drawARCPath {

    CGRect bgframe = CGRectMake(0, 0, CGRectGetWidth(self.frame), 74);
    UIView *bgView = nil;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        bgView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
        bgView.frame = bgframe;
    }else{
        bgView = [[UIView alloc] initWithFrame:bgframe];
        bgView.alpha = 0.8;
    }

    [self addSubview:bgView];

    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.frame.size.width, 40)];

    // 设置填充颜色
    UIColor *fillColor = [UIColor redColor];
    [fillColor set];
    [path fill];

    // 根据我们设置的各个点连线
    [path stroke];

    CGPoint center = CGPointMake(self.frame.size.width / 2, 33);
    path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:40
                                                    startAngle:kDegreesToRadians(10)
                                                      endAngle:kDegreesToRadians(170)
                                                     clockwise:YES];

    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    [path fill];
    
    [path stroke];



    UIImage *image = [UIImage imageNamed:@"bg-1"];
    _iconImageView = [[UIImageView alloc] initWithImage:image];
    [_iconImageView setFrame:CGRectMake((CGRectGetWidth(self.frame) - image.size.width / 2) / 2, 10, image.size.width / 2, image.size.height / 2)];
    [self addSubview:_iconImageView];

    image = [UIImage imageNamed:@"animation"];
    _animationView = [[UIImageView alloc] initWithImage:image];
    [_animationView setFrame:CGRectMake(CGRectGetMaxX(_iconImageView.frame) - (image.size.width) / 2 - 1,
                                        CGRectGetHeight(_iconImageView.frame) / 2 - image.size.height / 2,
                                        image.size.width,
                                        image.size.height)];
    [self addSubview:_animationView];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_iconImageView.frame) + 20, CGRectGetWidth(self.frame), 20)];
    [label setFont:[UIFont systemFontOfSize:14.0f]];
    [label setTextAlignment:NSTextAlignmentCenter];
    //[label setText:@"点击切换到上机状态"];
    [self addSubview:label];

    [self startAnimation];

}

- (void)startAnimation{

    UIBezierPath *bzier = [UIBezierPath bezierPath];
    [bzier addArcWithCenter:CGPointMake(CGRectGetWidth(self.frame) / 2, 10 + CGRectGetHeight(_iconImageView.frame) / 2)
                     radius:CGRectGetWidth(_iconImageView.frame) / 2
                 startAngle:0 endAngle:2 * M_PI
                  clockwise:YES];

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = bzier.CGPath;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
    animation.calculationMode = kCAAnimationPaced;
    animation.duration = 1;
    animation.delegate = self;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    [_animationView.layer addAnimation:animation forKey:@"animation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self startAnimation];
}

@end
