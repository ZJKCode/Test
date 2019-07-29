//
//  DiceWebViewController.m
//  TEST
//
//  Created by zhangjikuan on 2019/7/15.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "DiceWebViewController.h"

#import <WebKit/WebKit.h>

@interface DiceWebViewController () <WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation DiceWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];

    _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];

    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://22255.pw"]]];

    _webView.navigationDelegate = self;

    [self.view addSubview:_webView];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
}


@end
