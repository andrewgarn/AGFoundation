//
//  AGBlockOperation.m
//  AGFoundation
//
//  Created by Andrew Garn on 24/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "AGBlockOperation.h"

@implementation AGBlockOperation

+ (void)performBlockInBackground:(AGBasicBlock)block completion:(AGBasicBlock)completionBlock waitUntilDone:(BOOL)waitUntilDone
{
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.agnomical.block.operation", NULL);
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    AGBasicBlock operation = [block copy];
    AGBasicBlock completion = [completionBlock copy];
    
    if (completion == nil)
        completion = ^{};
    
    if (operation == nil)
        operation = ^{};
    
    if (waitUntilDone) {
        dispatch_sync(concurrentQueue, operation);
        dispatch_sync(mainQueue, ^{
            completion();
        });
    } else {
        dispatch_async(concurrentQueue, ^{
            operation();
            dispatch_async(mainQueue, ^{
                completion();
            });
        });
    }
    
    dispatch_release(concurrentQueue);
}

+ (void)performBlockInBackground:(AGBasicBlock)block completion:(AGBasicBlock)completionBlock 
{
    [self performBlockInBackground:block completion:completionBlock waitUntilDone:NO];
}

+ (void)performBlockInBackground:(AGBasicBlock)block 
{
    [self performBlockInBackground:block completion:nil];
}

+ (void)performBlockInMainThread:(AGBasicBlock)block waitUntilDone:(BOOL)waitUntilDone 
{
    [self performBlockInBackground:nil completion:block waitUntilDone:waitUntilDone];
}

+ (void)performBlockInMainThread:(AGBasicBlock)block 
{
    [self performBlockInMainThread:block waitUntilDone:NO];
}

@end