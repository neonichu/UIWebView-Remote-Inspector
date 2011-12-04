//
//  VUAppDelegate.h
//  UIWebView-Remote-Inspector
//
//  Created by Boris Bügling on 04.12.11.
//  Copyright (c) 2011 Crocodil.us. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VUWebView.h"

@class VUWebController;

@interface VUAppDelegate : UIResponder <UIApplicationDelegate, VUSwipeDelegate>

@property (strong, nonatomic) id inspectorServer;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) VUWebController* debugWebController;
@property (strong, nonatomic) VUWebController* mainWebController;

@end
