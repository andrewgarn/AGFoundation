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
    if ((self = [super init]))
    {
#ifdef DEBUG
        NSAssert(targetQueue != nil, @"targetQueue must not be nil");
        
        _detectionInterval = AGHungQueueDetectorDefaultDetectionInterval;
        _name = AGHungQueueDetectorDefaultName;
        _targetQueue = targetQueue;
#endif
    }
    return self;
}

#pragma mark -

- (void)startObservingTargetedQueue
{
    if (self.detectionThread == nil) {
        self.detectionThread = [[NSThread alloc] initWithTarget:self selector:@selector(hungQueueDetectorMain) object:nil];
        [self.detectionThread setName:self.name];
        [self.detectionThread start];
    }
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