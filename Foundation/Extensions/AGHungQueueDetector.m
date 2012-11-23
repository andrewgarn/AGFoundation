//
//  AGHungQueueDetector.m
//  AGFoundation
//
//  Created by Andrew Garn on 22/10/2012.
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

#import "AGHungQueueDetector.h"

static volatile BOOL AGHungQueueDetectorHeartbeat = YES;
static CGFloat AGHungQueueDetectorDefaultDetectionInterval = 0.5;
static NSString *AGHungQueueDetectorDefaultName = @"AGHungQueueDetectorThread";

@interface AGHungQueueDetector ()
@property (weak, nonatomic) NSTimer *intervalTimer;
@property (strong, nonatomic) NSThread *detectionThread;
@property (assign, nonatomic) dispatch_queue_t targetQueue;
@property (assign, nonatomic) CGFloat detectionInterval;
@property (assign, nonatomic) BOOL cancelled;
@property (copy, nonatomic) NSString *name;
@end

#pragma mark -

@implementation AGHungQueueDetector

#pragma mark -

- (id)initWithMainQueue
{
    return [[AGHungQueueDetector alloc] initWithTargetQueue:dispatch_get_main_queue()];
}

- (id)initWithTargetQueue:(dispatch_queue_t)targetQueue
{
    self = [super init];
    if (self)
    {
        NSAssert(targetQueue != nil, @"targetQueue must not be nil");
        
        _detectionInterval = AGHungQueueDetectorDefaultDetectionInterval;
        _name = AGHungQueueDetectorDefaultName;
        _targetQueue = targetQueue;
    }
    return self;
}

#pragma mark -

- (void)startObservingTargetedQueue
{
#ifdef DEBUG
    if (self.detectionThread == nil) {
        self.detectionThread = [[NSThread alloc] initWithTarget:self selector:@selector(hungQueueDetectorMain) object:nil];
        [self.detectionThread setName:self.name];
        [self.detectionThread start];
    }
#endif
}

- (void)stopObservingTargetedQueue
{
    [self.intervalTimer invalidate];
    [self setCancelled:YES];
}

#pragma mark -

- (void)hungQueueDetectorTick
{
    if (AGHungQueueDetectorHeartbeat == NO) {
        [NSException raise:[NSString stringWithFormat:@"%@Exception", self.name]
                    format:@"Targeted queue did not respond in less than %.2f seconds", self.detectionInterval];
    }
    
    AGHungQueueDetectorHeartbeat = NO;
    dispatch_async(self.targetQueue, ^{
        AGHungQueueDetectorHeartbeat = YES;
    });
}

- (void)hungQueueDetectorMain
{
    @autoreleasepool {
        self.intervalTimer = [NSTimer scheduledTimerWithTimeInterval:self.detectionInterval target:self
                                                            selector:@selector(hungQueueDetectorTick) userInfo:nil repeats:YES];
        
        do {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        } while (self.cancelled == NO);
    }
}

@end