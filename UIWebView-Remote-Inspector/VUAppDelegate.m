//
//  VUAppDelegate.m
//  UIWebView-Remote-Inspector
//
//  Created by Boris Bügling on 04.12.11.
//  Copyright (c) 2011 Crocodil.us. All rights reserved.
//

#import "VUAppDelegate.h"
#import "VUWebController.h"

#define URL_TO_DEBUG        @"http://www.apple.com"

@implementation VUAppDelegate

@synthesize debugWebController;
@synthesize inspectorServer;
@synthesize mainWebController;
@synthesize window;

#pragma mark -

- (void) enableRemoteWebInspector 
{
    self.inspectorServer = [[NSClassFromString(@"WebInspectorServerHTTP") alloc] init];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self.inspectorServer performSelector:NSSelectorFromString(@"start")];
#pragma clang diagnostic pop
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self enableRemoteWebInspector];
    
    self.debugWebController = [[VUWebController alloc] init];
    self.mainWebController = [[VUWebController alloc] init];
    
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.mainWebController;
    
    [self.window makeKeyAndVisible];
    [self.mainWebController performSelector:@selector(openURL:) withObject:[NSURL URLWithString:URL_TO_DEBUG] afterDelay:0.1];
    
    self.mainWebController.webView.swipeDelegate = self;
    
    return YES;
}

#pragma mark -
#pragma mark VUSwipeDelegate methods

-(void)swipedLeftInView:(UIView *)view {
    [self swipedRightInView:view];
}

-(void)swipedRightInView:(UIView *)view {
    if (view == self.mainWebController.webView) {
        [self.window.rootViewController presentModalViewController:self.debugWebController animated:YES];
    } else {
        [self.window.rootViewController dismissModalViewControllerAnimated:YES];
    }
    
    if (!self.debugWebController.webView.swipeDelegate) {
        self.debugWebController.webView.swipeDelegate = self;
        
        [self.debugWebController openURL:[NSURL URLWithString:@"http://localhost:9999"]];
    }
}

@end
