//
//  TypeSearchViewController.m
//  gomi_alpha
//
//  Created by Naoki on 2014/12/10.
//  Copyright (c) 2014年 vidacomoda. All rights reserved.
//

#import "WebTypeSearchViewController.h"

@interface WebTypeSearchViewController ()

@end


@implementation WebTypeSearchViewController

- (void)loadWeb {
    NSString* strUrl = @"http://google.com";
    NSURLRequest* myRequest = [NSURLRequest requestWithURL: [NSURL URLWithString:strUrl]];
    [_webTypeSearch loadRequest:myRequest];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webTypeSearch.delegate = self;
    //[self loadWeb];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
