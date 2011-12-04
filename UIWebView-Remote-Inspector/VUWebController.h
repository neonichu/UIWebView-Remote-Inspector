//
//  VUWebController.h
//  UIWebView-Remote-Inspector
//
//  Created by Boris Bügling on 04.12.11.
//  Copyright (c) 2011 Crocodil.us. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VUWebView;

@interface VUWebController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) VUWebView* webView;

-(void)openURL:(NSURL*)url;

@end
