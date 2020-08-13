//
//  meVc.m
//  test
//
//  Created by doushuyao on 2020/8/8.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import "meVc.h"
#import <WebKit/WebKit.h>
@interface meVc ()
@property(nonatomic,strong,readwrite)WKWebView* webView;
@end

@implementation meVc
- (instancetype)init
{
    self = [super init];
    if (self) {
            
        self.tabBarItem.title = @"我的";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSURL *url=[NSURL URLWithString:@"https://blog.csdn.net/opooc"];
//    NSDictionary * dic=[NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:url] options:0 error:Nil];
//
//    NSString *content=[dic objectForKey:@"content"];
//     _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88 )];
    
   NSString *htmlString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"https://blog.csdn.net/opooc"] encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@",htmlString);
    NSLog(@"");
}

@end
