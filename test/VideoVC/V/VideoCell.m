//
//  VideoCell.m
//  test
//
//  Created by doushuyao on 2020/8/12.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import "VideoCell.h"
#import "VideoPlayer.h"
 
@interface VideoCell()


@property(nonatomic,strong,readwrite)UIImageView* coverView;
@property(nonatomic,strong,readwrite)UIImageView* playbutton;
@property(nonatomic,copy,readwrite)NSString* videoUrl;
@end

@implementation VideoCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _coverView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview: _coverView];
        
        _playbutton = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width -50)/2, (frame.size.height-50)/2,50 ,50 )];
        
        [_coverView addSubview:_playbutton];
        UITapGestureRecognizer* tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGes];
        

        
    
    }
    return self;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];

}
-(void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
        
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
    
    //button图片定死了
    _playbutton.image = [UIImage imageNamed:@"videoPlay"];
    
}


-(void)_tapToPlay{
    [[VideoPlayer Player] playWithrUrl:_videoUrl attachView:_coverView];
    
}

@end
