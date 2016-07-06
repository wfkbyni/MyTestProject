//
//  LayoutCell.m
//  MyTestProject
//
//  Created by 舒永超 on 16/7/1.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "LayoutCell.h"

@interface LayoutCell()

@property (nonatomic, strong) UIView *backgroundView;   // 背景框view


@end

@implementation LayoutCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

    }

    return self;
}



@end
