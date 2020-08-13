//
//  DelectCellView.m
//  test
//
//  Created by doushuyao on 2020/8/8.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import "DelectCellView.h"
@interface DelectCellView()

@property(nonatomic,strong,readwrite)UIView* backgroundView;
@property(nonatomic,strong,readwrite)UIButton* delectBtn;
@property(nonatomic,copy,readwrite)dispatch_block_t deleteBlock;

@end


@implementation DelectCellView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _backgroundView = [[UIView alloc]initWithFrame:self.bounds];
        _backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView.alpha = 0.6;
        UITapGestureRecognizer* backViewGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissDeleteView)];
        [_backgroundView addGestureRecognizer:backViewGes];
        
        [self addSubview:_backgroundView];
        
        _delectBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [_delectBtn addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        _delectBtn.backgroundColor = [UIColor blackColor];
        [self addSubview:_delectBtn];
    }
    return self;
}
-(void)showDeleteViewFromPoint:(CGPoint) point clickBlock:(dispatch_block_t) clickBlock
{
    _delectBtn.frame = CGRectMake(point.x, point.y, 0, 0);
    _deleteBlock = [clickBlock copy];
    
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
//    [UIView animateWithDuration:1.f animations:^{
//        self.delectBtn.frame = CGRectMake((self.bounds.size.width-200)/2, (self.bounds.size.height-200)/2, 200, 200);
//    }];
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
         self.delectBtn.frame = CGRectMake((self.bounds.size.width-200)/2, (self.bounds.size.height-200)/2, 200, 200);
    } completion:^(BOOL finished) {
        
    }];
    
    
    
}
-(void)dismissDeleteView{
    [self removeFromSuperview];
}

-(void)clickButton{
    if (_deleteBlock) {
        _deleteBlock();
    }
    [self removeFromSuperview];
}

@end
