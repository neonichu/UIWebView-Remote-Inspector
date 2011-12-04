//
//  VUWebView.h
//  UIWebView-Remote-Inspector
//
//  Created by Boris Bügling on 04.12.11.
//  Copyright (c) 2011 Crocodil.us. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VUSwipeDelegate <NSObject>

-(void)swipedLeftInView:(UIView*)view;
-(void)swipedRightInView:(UIView*)view;

@end

#pragma mark -

@interface VUWebView : UIWebView

@property (nonatomic, weak) id<VUSwipeDelegate> swipeDelegate;

@end
