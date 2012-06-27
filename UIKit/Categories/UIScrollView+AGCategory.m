//
//  UIScrollView+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 24/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UIScrollView+AGCategory.h"

@implementation UIScrollView (AGCategory)

#pragma mark -

- (void)scrollToTop
{
    [self scrollToTopAnimated:YES];
}

- (void)scrollToTopAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(0, 0) animated:animated];
}

- (void)scrollToBottom
{
    [self scrollToBottomAnimated:YES];
}

- (void)scrollToBottomAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(0, (self.contentSize.height - self.frame.size.height)) animated:animated];
}

@end