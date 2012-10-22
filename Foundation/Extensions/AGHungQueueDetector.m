//
//  AGHungQueueDetector.m
//  AGFoundation
//
//  Created by Andrew Garn on 22/10/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "AGHungQueueDetector.h"

static volatile BOOL AGHungQueueDetectorHeartbeat = YES;
static CGFloat AGHungQueueDetectorDefaultDetectionInterval = 0.5;

@interface AGHungQueueDetector ()
@property (weak, nonatomic) NSTimer *intervalTimer;
@property (assign, nonatomic) dispatch_queue_t targetQueue;
@property (assign, nonatomic) double detectionInterval;
@property (assign, nonatomic) BOOL cancelled;
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
    return [[AGHungQueueDetector alloc] initWithTargetQueue:targetQueue interval:AGHungQueueDetectorDefaultDetectionInterval];
}

- (id)initWithTargetQueue:(dispatch_queue_t)targetQueue interval:(CGFloat)detectionInterval
{
    if ((self = [super init]))
    {
#ifdef DEBUG
        NSAssert(targetQueue != nil, @"targetQueue must not be nil");
        
        _targetQueue = targetQueue;
        _detectionInterval = detectionInterval;
        
        NSThread *detectionThread = [[NSThread alloc] initWithTarget:self selector:@selector(hungQueueDetectorMain) object:nil];
        [detectionThread setName:@"AGHungQueueDetectorThread"];
        [detectionThread start];
#endif
    }
    return self;
}

- (void)stopObservingTargetedQueue
{
    self.cancelled = YES;
    [self.intervalTimer invalidate];
}

#pragma mark -

- (void)hungQueueDetectorTick
{    
    if (AGHungQueueDetectorHeartbeat == NO) {
        [NSException raise:@"AGHungQueueDetectorException" format:@"Queue did not respond in %.1f seconds", self.detectionInterval];
    }
    
    AGHungQueueDetectorHeartbeat = NO;
    dispatch_async(self.targetQueue, ^{
        AGHungQueueDetectorHeartbeat = YES;
    });
}

- (void)hungQueueDetectorMain
{
    @autoreleasepool {
        self.intervalTimer = [NSTimer scheduledTimerWithTimeInterval:self.detectionInterval target:self selector:@selector(hungQueueDetectorTick) userInfo:nil repeats:YES];
    
        do {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        } while (self.cancelled == NO);
    }
}

@end