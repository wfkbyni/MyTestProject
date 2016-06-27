//
//  AudioTool.h
//  MyTestProject
//
//  Created by 舒永超 on 16/6/27.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioTool : NSObject

/**
 *  播放音乐
 *
 *  @param fileName 音乐路径
 *
 *  @return <#return value description#>
 */
+ (BOOL)playMusic:(NSString *)fileName;

/**
 *  暂停音乐
 *
 *  @param fileName 音乐路径
 *
 *  @return <#return value description#>
 */
+ (void)pauseMusic:(NSString *)fileName;

/**
 *  停止播放音乐
 *
 *  @param fileName 音乐路径
 *
 *  @return <#return value description#>
 */
+ (void)stopMusic:(NSString *)fileName;

/**
 *  播放声效
 *
 *  @param fileName <#fileName description#>
 */
+ (void)playSound:(NSString *)fileName;

/**
 *  销毁声效
 *
 *  @param fileName <#fileName description#>
 */
+ (void)disposeSound:(NSString *)fileName;

@end
