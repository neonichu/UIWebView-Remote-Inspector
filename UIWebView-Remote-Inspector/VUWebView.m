//
//  VUWebView.m
//  UIWebView-Remote-Inspector
//
//  Created by Boris Bügling on 04.12.11.
//  Copyright (c) 2011 Crocodil.us. All rights reserved.
//

#import "VUWebView.h"

@implementation VUWebView

@synthesize swipeDelegate;

#pragma mark -

-(UIView*)documentView {
    for (UIView* view in self.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            for (UIView* subview in view.subviews) {
                if ([subview isKindOfClass:NSClassFromString(@"UIWebDocumentView")]) {
                    return subview;
                }
            }
        }
    }
    return nil;
}

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setMultipleTouchEnabled:YES];
        
        UISwipeGestureRecognizer* swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self 
                                                                                    action:@selector(swipeLeft)];
        swipe.direction = UISwipeGestureRecognizerDirectionLeft;
        [self.documentView addGestureRecognizer:swipe];
        
        swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
        swipe.direction = UISwipeGestureRecognizerDirectionRight;
        [self.documentView addGestureRecognizer:swipe];
    }
    return self;
}

-(void)swipeLeft {
    if ([self.swipeDelegate respondsToSelector:@selector(swipedLeftInView:)]) {
        [self.swipeDelegate swipedLeftInView:self];
    }
}

-(void)swipeRight {
    if ([self.swipeDelegate respondsToSelector:@selector(swipedRightInView:)]) {
        [self.swipeDelegate swipedRightInView:self];
    }
}

@end
