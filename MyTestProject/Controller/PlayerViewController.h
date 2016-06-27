//
//  PlayerViewController.h
//  MyTestProject
//
//  Created by 舒永超 on 16/6/27.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AudioActionType) {
    AudioActionTypePlay,            // 播放
    AudioActionTypePause,           // 暂停
    AudioActionTypeStop,            // 停止
    AudioActionTypeNext,            // 下一首
    AudioActionTypePlaySound,       // 播放声效
    AudioActionTypeDisposeSound,    // 销毁声效
};

@interface PlayerViewController : UIViewController

@end
