//
//  PYViewController.m
//  test
//
//  Created by doushuyao on 2020/8/7.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import "PYViewController.h"

@interface PYViewController () <UIScrollViewDelegate>

@end

@implementation PYViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"朋友圈";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor greenColor];
    UIScrollView* scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width*5, self.view.frame.size.height);
    NSArray* colArray = @[[UIColor redColor],[UIColor greenColor],[UIColor blueColor],[UIColor yellowColor],[UIColor grayColor]];
    for (int i = 0; i<5; i++) {
        UIView *nView = [[UIView alloc]initWithFrame:CGRectMake(scrollView.bounds.size.width*i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
        nView.backgroundColor = [colArray objectAtIndex:i];
        [scrollView addSubview:nView];
        
        UIView* tapView = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
        tapView.backgroundColor = [UIColor yellowColor];
        UITapGestureRecognizer* tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapViewClick)];
        tapGes.delegate = self;
        [nView addGestureRecognizer:tapGes];
        [nView addSubview:tapView];
        
        
        
        
    }
    
    [self.view addSubview:scrollView];
    
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return NO;
}

-(void)tapViewClick{
    NSLog(@"sssss");
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll");
}


// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
     NSLog(@"scrollViewWillBeginDragging");
}

// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
     NSLog(@"scrollViewDidEndDragging");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
     NSLog(@"scrollViewWillBeginDecelerating");
}   // called on finger up as we are moving
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
     NSLog(@"scrollViewDidEndDecelerating");
}      // called when scroll view grinds to a halt


@end
