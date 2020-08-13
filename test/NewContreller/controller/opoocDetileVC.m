//
//  opoocDetileVc.m
//  test
//
//  Created by doushuyao on 2020/8/8.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import "opoocDetileVC.h"
#import <WebKit/WebKit.h>
@interface opoocDetileVC ()<WKNavigationDelegate>
@property (nonatomic, strong, readwrite) WKWebView *webView;
@property (nonatomic, strong, readwrite) UIProgressView *progressView;
@property (nonatomic, strong, readwrite) NSString *articleUrl;
@end

@implementation opoocDetileVC
- (void)dealloc {
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
-(instancetype)initWithUrlString:(NSString *)urlStr{
    self = [super init];
    if (self) {
        _articleUrl = urlStr;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_articleUrl]]];
    _webView.navigationDelegate = self;
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.view addSubview:_webView];

    _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
    [self.view addSubview:_progressView];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    _progressView.hidden = YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context {
    _progressView.progress = _webView.estimatedProgress;
}

@end
