//
//  NSTimer+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 10/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "NSTimer+AGCategory.h"
#import "NSObject+AGCategory.h"

static char kNSTimerBlockKey;

@implementation NSTimer (AGCategory)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats targetBlock:(AGTimerBlock)block
{
    return [NSTimer scheduledTimerWithTimeInterval:seconds userInfo:nil repeats:repeats targetBlock:block];
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds userInfo:(id)userInfo repeats:(BOOL)repeats targetBlock:(AGTimerBlock)block
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(_timerFired:) userInfo:userInfo repeats:repeats];
    [timer associateCopyOfValue:block withKey:&kNSTimerBlockKey];
    return timer;
}

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats targetBlock:(AGTimerBlock)block
{
    return [NSTimer timerWithTimeInterval:seconds userInfo:nil repeats:repeats targetBlock:block];
}

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds userInfo:(id)userInfo repeats:(BOOL)repeats targetBlock:(AGTimerBlock)block
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(_timerFired:) userInfo:userInfo repeats:repeats];
    [timer associateCopyOfValue:block withKey:&kNSTimerBlockKey];
    return timer;
}

#pragma mark -

- (void)_timerFired:(NSTimer *)timer
{
    AGTimerBlock block = [self associatedValueForKey:&kNSTimerBlockKey];
    if (block) block (self);
}

@end