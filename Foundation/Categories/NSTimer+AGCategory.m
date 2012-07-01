//
//  NSTimer+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 10/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this
//  list of conditions and the following disclaimer.
//  2. Redistributions in binary form must reproduce the above copyright notice,
//  this list of conditions and the following disclaimer in the documentation
//  and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

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