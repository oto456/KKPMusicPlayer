//
//  KKPAudioTool.m
//  KKPMusicPlayer
//
//  Created by 刘特风 on 15/4/2.
//  Copyright (c) 2015年 kakapo. All rights reserved.
//

#import "KKPAudioTool.h"

//static NSString *const


@implementation KKPAudioTool
{
    //一个音乐就需要使用一个player
    AVAudioPlayer *_player;
}
static NSMutableDictionary *_musices;
/**
 *存放所有的音乐播放器
 */

+(NSMutableDictionary *)musices
{
    if (_musices==nil)
    {
        _musices=[NSMutableDictionary dictionary];
    }
    return _musices;
}


-(instancetype)init
{
    if(self=[super init])
    {
        _playerpan=0;
        _playervolume=1.0;
        _playerrate=1.0;
    }
    return self;
}

+(KKPAudioTool*)sharedKKPAudioToolManager
{
    static KKPAudioTool* singleKKPAM=nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        singleKKPAM = [[self alloc] init];
    });
    return singleKKPAM;
}


#pragma mark - Public Method

/**
 *根据获取的名字播放本地音乐
 */
- (void)playMusicWithSongName:(NSString*)songname andType:(SongType)type
{
    NSAssert(songname, @"songname can not be nil");
    NSString *typestring;
    switch(type)
    {
            case typeOfMp3:
            typestring =@"mp3";
            break;
            case typeOfWam:
            typestring =@"wam";
            break;
            default:
            typestring =@"mp3";
    }
    
    NSString *path=[[NSBundle mainBundle] pathForResource:songname ofType:typestring];
    
    if (_player) {
        [_player stop];
        _player = nil;
    }
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
    [_player play];
}


//设置_player的delegate
-(void)setPlayerDelegate:(id<AVAudioPlayerDelegate>)delegate
{
    if(_player)
    {
        _player.delegate=delegate;
    }
}

-(void)pauseMusic
{
    if (_player) {
        [_player pause];
    }
}

-(void)stopMusic
{
    if (_player) {
        [_player stop];
        _player=nil;
    }
}

-(void)goonPlayMusic
{
    if (_player) {
        [_player play];
    }
}

#pragma mark - Private Method

-(void)setplayerSetting
{
    if (_player) {
        _player.volume=_playervolume;
        _player.pan=_playerpan;
        _player.rate=_playerrate;
    }
}




//这个方法播放结束后的回调

//- (void ) audioPlayerDidFinishPlaying: (AVAudioPlayer *) player successfully: (BOOL ) flag {
//  
//}



@end
