//
//  UIGestureRecognizer+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 09/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UIGestureRecognizer+AGCategory.h"
#import "NSObject+AGCategory.h"

static char kUIGestureRecognizerBlockKey;

@implementation UIGestureRecognizer (AGCategory)

#pragma mark -

- (void)addTargetBlock:(UIGestureRecognizerSenderBlock)block
{
    [self associateCopyOfValue:block withKey:&kUIGestureRecognizerBlockKey];
    [self addTarget:self action:@selector(_gestureRecognized:)];
}

- (void)removeTargetBlock
{
    [self associateCopyOfValue:nil withKey:&kUIGestureRecognizerBlockKey];
    [self removeTarget:self action:@selector(_gestureRecognized:)]; 
}

#pragma mark -
     
- (void)_gestureRecognized:(UIBarButtonItem *)sender
{
    UIGestureRecognizerSenderBlock block = [self associatedValueForKey:&kUIGestureRecognizerBlockKey];
    if (block) block (self);
}

@end