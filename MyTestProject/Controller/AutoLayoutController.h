//
//  AutoLayoutController.h
//  MyTestProject
//
//  Created by 舒永超 on 16/5/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AutoLayoutType) {
    AutoLayoutTypeWithAutoHeight,             // 动态计算高度
    AutoLayoutTypeWithGrid,                   // 格子布局
    AutoLayoutTypeWithCellType                // 多种cell类型
};

@interface AutoLayoutController : UIViewController

@end
