//
//  LayoutHeaderView.m
//  MyTestProject
//
//  Created by 舒永超 on 16/6/29.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "LayoutHeaderView.h"

@interface LayoutHeaderView()

@property (nonatomic, strong) UIImageView *topicImageView;                      // 话题图片
@property (nonatomic, strong) UIImageView *topicIcon;                           // 话题icon
@property (nonatomic, strong) UILabel *topicName;                               // 标题
@property (nonatomic, strong) UILabel *topicOrReplyCount;                       // 话题数和回复数
@property (nonatomic, strong) UIView *line1;                                    // 分隔线1
@property (nonatomic, strong) UILabel *heroRank;                                // 英雄榜
@property (nonatomic, strong) UIView *line2;                                    // 分隔线2
@property (nonatomic, strong) UIButton *arrowBtn;                               // 英雄榜箭头

@end

#define strValue @"我现在程序中有一个label，宽度固定，高度需要根据获取到的文字的长度来决定，本来是有方法来根据string获取高度的，但是现在获取到的不是一个简单的字符串，而是一串html字符串，那么我就需要NSAttributedString去解析并保存它，可是这样的话就没法用之前那个方法去获取高度了，问下有没有什么好的解决方案。"

@implementation LayoutHeaderView

-(instancetype)initWithData:(id)data{
    // 计算view的高度
    CGFloat heigit = [[self class] heaerViewHeight];

    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, heigit)]) {
        [self setupView];
    }

    return self;
}

- (void)setupView{

    _topicImageView = [UIImageView new];
    _topicIcon = [UIImageView new];
    _topicName = [UILabel new];
    _topicOrReplyCount = [UILabel new];
    _line1 = [UIView new];
    _line2 = [UIView new];
    _heroRank = [UILabel new];
    _arrowBtn = [UIButton new];

    [_topicImageView setBackgroundColor:[UIColor greenColor]];
    [_topicIcon setBackgroundColor:[UIColor blueColor]];
    _topicName.text = @"英雄联盟吧";
    _topicName.font = [UIFont systemFontOfSize:20.0f];

    _topicIcon.layer.cornerRadius = 5;
    _line1.backgroundColor = [UIColor grayColor];
    _line2.backgroundColor = [UIColor grayColor];

    _heroRank.text = @"英雄榜";
    _heroRank.textAlignment = NSTextAlignmentRight;

    _arrowBtn.backgroundColor = [UIColor redColor];

    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"主帖:" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}];
    [attr appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"102万" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName:[UIColor colorWithRed:226.7/255.0 green:136.4/255.0 blue:93.9/255.0 alpha:255.0/255.0]}]];
    [attr appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"  回帖:" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}]];
    [attr appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"5824" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName:[UIColor colorWithRed:226.7/255.0 green:136.4/255.0 blue:93.9/255.0 alpha:255.0/255.0]}]];

    _topicOrReplyCount.textAlignment = NSTextAlignmentRight;
    _topicOrReplyCount.attributedText = attr;

    [self addSubview:_topicImageView];
    [self addSubview:_topicIcon];
    [self addSubview:_topicName];
    [self addSubview:_topicOrReplyCount];
    [self addSubview:_line1];
    [self addSubview:_heroRank];
    [self addSubview:_line2];
    [self addSubview:_arrowBtn];

    [self setupConstraints];

    CGFloat width = [UIScreen mainScreen].bounds.size.width - 105;
    CGFloat count = width / 35;
    UIView *lastView;
    for (NSInteger i = 0; i < count - 1; i++) {
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255.0f) / 255.0f green:arc4random_uniform(255.0f) / 255.0f blue:arc4random_uniform(255.0f) / 255.0f alpha:1];
        imageView.layer.cornerRadius = 15;
        [self addSubview:imageView];

        [imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastView ? lastView.mas_right : _heroRank.mas_right).offset(5);
            make.top.equalTo(_line1).offset(5);
            make.bottom.equalTo(_line2.mas_top).offset(-5);
            make.width.height.equalTo(@30);
            make.left.greaterThanOrEqualTo(_heroRank.mas_right).offset(5);
        }];

        lastView = imageView;
    }
}

- (void)setupConstraints{

    [_topicImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.width * 0.5));
        make.width.equalTo(self);
    }];

    [_topicIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topicImageView).offset(5);
        make.top.equalTo(_topicImageView.mas_bottom).offset(5);
        make.width.equalTo(@60);
        make.height.equalTo(@50);
    }];

    [_topicName mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topicIcon.mas_right).offset(5);
        make.centerY.equalTo(_topicIcon);
    }];

    [_topicOrReplyCount mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-2);
        make.centerY.equalTo(_topicIcon);
        make.right.lessThanOrEqualTo(self.mas_right).offset(-2);
    }];

    [_line1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(_topicIcon.mas_bottom).offset(5);
        make.height.equalTo(@(0.5));
    }];

    [_heroRank mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_line1).offset(10);
        make.width.equalTo(@65);
    }];

    [_line2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(_heroRank.mas_bottom).offset(10);
        make.height.equalTo(@(0.5));
    }];

    [_arrowBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
        make.top.equalTo(_line1);
        make.width.equalTo(@40);
        make.bottom.equalTo(_line2);
    }];

}

+ (CGFloat)heaerViewHeight{
    return [UIScreen mainScreen].bounds.size.width * 0.5 + 60 + 41;
}

@end
