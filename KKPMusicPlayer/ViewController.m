//
//  ViewController.m
//  KKPMusicPlayer
//
//  Created by 刘特风 on 15/4/2.
//  Copyright (c) 2015年 kakapo. All rights reserved.
//

//这个页面拿来测试功能模块



#import "ViewController.h"
#import "KKPAudioTool.h"
#import <ReactiveCocoa.h>

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *song;
    KKPAudioTool *tool;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    song=@[@"黑色柳丁",@"爱很简单"];
    tool=[KKPAudioTool sharedKKPAudioToolManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Abutton:(id)sender {
    [tool pauseMusic];
}

- (IBAction)Bbutton:(id)sender {
    [tool playMusicWithSongName:song[0] andType:typeOfMp3];
}

- (IBAction)cButton:(id)sender {
    [tool stopMusic];
}

- (IBAction)DButton:(id)sender {
    [tool goonPlayMusic];
}

@end
