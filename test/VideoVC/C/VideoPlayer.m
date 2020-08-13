//
//  VideoPlayer.m
//  test
//
//  Created by doushuyao on 2020/8/13.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import "VideoPlayer.h"
#import <AVFoundation/AVFoundation.h>
@interface VideoPlayer()

@property(nonatomic,strong,readonly)AVPlayer* avplayer;
@property(nonatomic,strong,readonly)AVPlayerItem* videoItem;
@property(nonatomic,strong,readonly)AVPlayerLayer* playerLayer;

@end
@implementation VideoPlayer
+(VideoPlayer *)Player{
    static VideoPlayer* player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[VideoPlayer alloc]init];
    });
    return player;
}
-(void)playWithrUrl:(NSString*)videoUrl attachView:(UIView *) attachView{
    [self _stopPlay];
    NSURL* videoURL =[NSURL URLWithString:videoUrl];
     
     AVAsset* asset = [AVAsset assetWithURL:videoURL];
     
     _videoItem = [AVPlayerItem playerItemWithAsset:asset];
     [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
     [_videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
     
     CMTime duration = _videoItem.duration;
     CGFloat videoDuration = CMTimeGetSeconds(duration);
     
     
     _avplayer = [AVPlayer playerWithPlayerItem:_videoItem];
     [_avplayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
         NSLog(@"播放进度 :%f",CMTimeGetSeconds(time));
     }];
     
     
     _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avplayer];
     
     _playerLayer.frame = attachView.bounds;
     [attachView.layer addSublayer:_playerLayer];
     
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
}


-(void)_stopPlay{
     [_playerLayer removeFromSuperlayer];
     _videoItem = nil;
     _avplayer = nil;
   [_videoItem removeObserver:self forKeyPath:@"status"];
   [_videoItem removeObserver:self forKeyPath:@"loadedTimeRange"];
    
}


-(void)_handlePlayEnd{

    [_avplayer seekToTime:CMTimeMake(0, 1)];
    [_avplayer play];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"status"]) {
        if (((NSNumber*)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerStatusReadyToPlay) {
             [_avplayer play];
        }else{
            
        }
    }else if([keyPath isEqualToString:@"loadedTimeRanges"]){
       // NSLog(@" 缓冲 ：%@",[change objectForKey:NSKeyValueChangeNewKey ]);
    }
}
@end
