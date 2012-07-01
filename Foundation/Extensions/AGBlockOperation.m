//
//  AGBlockOperation.m
//  AGFoundation
//
//  Created by Andrew Garn on 24/05/2012.
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