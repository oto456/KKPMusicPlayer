//
//  KKPAudioTool.h
//  KKPMusicPlayer
//
//  Created by 刘特风 on 15/4/2.
//  Copyright (c) 2015年 kakapo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


typedef NS_ENUM(NSInteger, SongType)
{
    typeOfMp3,
    typeOfWam
};


@interface KKPAudioTool : NSObject


@property(nonatomic,assign) float playervolume;
@property(nonatomic,assign) float playerpan;
@property(nonatomic,assign) float playerrate;

//获得单例
+(KKPAudioTool *)sharedKKPAudioToolManager;

-(void)setPlayerDelegate:(id<AVAudioPlayerDelegate>)delegate;

-(void)playMusicWithSongName:(NSString*)songname andType:(SongType)type;
-(void)pauseMusic;
-(void)goonPlayMusic;
-(void)stopMusic;

@end
