//
//  AudioTool.m
//  MyTestProject
//
//  Created by 舒永超 on 16/6/27.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "AudioTool.h"

@implementation AudioTool

static NSMutableDictionary *_musices;
+ (NSMutableDictionary *)musices{

    if (_musices == nil) {
        _musices = [NSMutableDictionary dictionary];
    }

    return _musices;
}

static NSMutableDictionary *_sounds;
+ (NSMutableDictionary *)sounds{
    if (_sounds == nil) {
        _sounds = [NSMutableDictionary dictionary];
    }

    return _sounds;
}

+(BOOL)playMusic:(NSString *)fileName{

    if (!fileName) return NO;

    AVAudioPlayer *player = [self musices][fileName];

    if (!player) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        if (!url) return NO;

        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];

        if (![player prepareToPlay]) return NO;

        [self musices][fileName] = player;
    }

    if (![player isPlaying]) {
        return [player play];
    }

    return YES;
}

+(void)pauseMusic:(NSString *)fileName{

    if (!fileName) return;

    AVAudioPlayer *player = [self musices][fileName];

    [player pause];
}

+(void)stopMusic:(NSString *)fileName{
    
    if (!fileName) return;

    AVAudioPlayer *player = [self musices][fileName];

    [player stop];

    [[self musices] removeObjectForKey:fileName];
}

+(void)playSound:(NSString *)fileName{
    if (!fileName) return;
    SystemSoundID soundID = [[self sounds][fileName] unsignedIntValue];
    if (!soundID) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        if (!url) return;

        OSStatus status = AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &soundID);
        NSLog(@"%d",(int)status);

        [self sounds][fileName] = @(soundID);
    }

    AudioServicesPlaySystemSound(soundID);

    
}

+(void)disposeSound:(NSString *)fileName{
    if (!fileName) return;

    SystemSoundID soundID = [[self sounds][fileName] unsignedIntValue];

    if (soundID) {
        AudioServicesDisposeSystemSoundID(soundID);

        [[self sounds] removeObjectForKey:fileName];
    }
}

@end
