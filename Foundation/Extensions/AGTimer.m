//
//  AGTimer.m
//  AGFoundation
//
//  Created by Andrew Garn on 05/07/2012.
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

#import "AGTimer.h"
#import "NSObject+AGCategory.h"

@interface AGTimer ()
@property (nonatomic, copy) AGTimerBlock timerBlock;
@end

#pragma mark -

@implementation AGTimer

#pragma mark -

+ (AGTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats targetBlock:(AGTimerBlock)block
{
    return [AGTimer scheduledTimerWithTimeInterval:seconds userInfo:nil repeats:repeats targetBlock:block];
}

+ (AGTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds userInfo:(id)userInfo repeats:(BOOL)repeats targetBlock:(AGTimerBlock)block
{
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:seconds];
    AGTimer *timer = [[AGTimer alloc] initWithFireDate:fireDate interval:seconds target:self selector:@selector(AGTimerFired:) userInfo:userInfo repeats:repeats];
    [timer setTimerBlock:block];
    return timer;
}

#pragma mark -

- (void)AGTimerFired:(NSTimer *)timer
{
    if (_timerBlock) _timerBlock(self);
}

@end