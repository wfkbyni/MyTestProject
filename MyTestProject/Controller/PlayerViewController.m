//
//  PlayerViewController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/6/27.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "PlayerViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "AudioTool.h"

@interface PlayerViewController ()

@property (nonatomic, strong) NSArray *musices;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"音乐播放";
    self.view.backgroundColor = [UIColor whiteColor];

    CGSize size = [UIScreen mainScreen].bounds.size;

    CGFloat line = 20;
    CGFloat width = (size.width - 20 * 4) / 3;
    CGFloat height = 50;

    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playButton.frame = CGRectMake(line, 100, width, height);
    playButton.layer.masksToBounds = YES;
    playButton.layer.cornerRadius = 20;
    [playButton setTitle:@"播放" forState:UIControlStateNormal];
    playButton.tag = AudioActionTypePlay;
    playButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:playButton];

    UIButton *pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pauseButton.frame = CGRectMake(line * 2 + width, 100, width, height);
    pauseButton.layer.masksToBounds = YES;
    pauseButton.layer.cornerRadius = 20;
    [pauseButton setTitle:@"暂停" forState:UIControlStateNormal];
    pauseButton.tag = AudioActionTypePause;
    pauseButton.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:pauseButton];

    UIButton *stopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    stopButton.frame = CGRectMake(line * 3 + width * 2, 100, width, height);
    stopButton.layer.masksToBounds = YES;
    stopButton.layer.cornerRadius = 20;
    [stopButton setTitle:@"停止" forState:UIControlStateNormal];
    stopButton.tag = AudioActionTypeStop;
    stopButton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:stopButton];

    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake((size.width - width) / 2, 100 + height + 20, width, height);
    nextButton.layer.masksToBounds = YES;
    nextButton.layer.cornerRadius = 20;
    [nextButton setTitle:@"下一首" forState:UIControlStateNormal];
    nextButton.tag = AudioActionTypeNext;
    nextButton.backgroundColor = [UIColor greenColor];
    [self.view addSubview:nextButton];

    UIButton *playSoundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playSoundButton.frame = CGRectMake(line, 100 + height * 2 + 40, width, height);
    playSoundButton.layer.masksToBounds = YES;
    playSoundButton.layer.cornerRadius = 20;
    [playSoundButton setTitle:@"播放声效" forState:UIControlStateNormal];
    playSoundButton.tag = AudioActionTypePlaySound;
    playSoundButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:playSoundButton];

    UIButton *disposeSoundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    disposeSoundButton.frame = CGRectMake(line * 2 + width, 100 + height * 2 + 40, width, height);
    disposeSoundButton.layer.masksToBounds = YES;
    disposeSoundButton.layer.cornerRadius = 20;
    [disposeSoundButton setTitle:@"销毁声效" forState:UIControlStateNormal];
    disposeSoundButton.tag = AudioActionTypeDisposeSound;
    disposeSoundButton.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:disposeSoundButton];

    SEL var = @selector(buttonAction:);
    [playButton addTarget:self action:var forControlEvents:UIControlEventTouchUpInside];
    [pauseButton addTarget:self action:var forControlEvents:UIControlEventTouchUpInside];
    [stopButton addTarget:self action:var forControlEvents:UIControlEventTouchUpInside];
    [nextButton addTarget:self action:var forControlEvents:UIControlEventTouchUpInside];
    [playSoundButton addTarget:self action:var forControlEvents:UIControlEventTouchUpInside];
    [disposeSoundButton addTarget:self action:var forControlEvents:UIControlEventTouchUpInside];

    _musices = @[@"1.mp3",@"2.mp3",@"3.mp3",@"4.mp3"];
}

- (void)buttonAction:(UIButton *)sender{

    switch (sender.tag) {
        case AudioActionTypePlay: {
            [self play];
            break;
        }
        case AudioActionTypePause: {
            [self pause];
            break;
        }
        case AudioActionTypeStop: {
            [self stop];
            break;
        }
        case AudioActionTypeNext: {
            [self next];
            break;
        }
        case AudioActionTypePlaySound: {
            [self playSound];
            break;
        }
        case AudioActionTypeDisposeSound: {
            [self disposeSound];
            break;
        }
        default:
            break;
    }
}

- (void)next{

    [self stop];

    _currentIndex ++;

    if (_currentIndex >= _musices.count) {
        _currentIndex = 0;
    }

    [self play];
}

- (void)play{
    [AudioTool playMusic:_musices[_currentIndex]];
}

- (void)pause{
    [AudioTool pauseMusic:_musices[_currentIndex]];
}

- (void)stop{
    [AudioTool stopMusic:_musices[_currentIndex]];
}

- (void)playSound{

    NSArray *array = @[@"Audio.wav",@"click.mp3",@"click.wav",@"delete.mp3",@"delete.wav",@"GAudio_Call.wav",
                       @"GAudio_Receive.wav",@"Global.wav",@"meow.mp3",@"msg.wav",@"PaiPaiMsg.wav",@"shake.wav",
                       @"SoundTest.wav",@"system.wav",@"tweet.wav",@"VideoShow_countdown.wav"];
    NSInteger index = arc4random_uniform((int)array.count);
    NSString *fileName = array[index];
    NSLog(@"%ld %@",index, fileName);
    [AudioTool playSound:fileName];
}

- (void)disposeSound{

    [AudioTool disposeSound:@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
