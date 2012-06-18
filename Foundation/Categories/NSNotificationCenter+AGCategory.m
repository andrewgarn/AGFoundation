//
//  NSNotificationCenter+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 08/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "NSNotificationCenter+AGCategory.h"

@implementation NSNotificationCenter (AGCategory)

+ (void)addUniqueObserver:(id)observer selector:(SEL)selector name:(NSString *)name object:(id)object
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:name object:object];
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:name object:object];
}

+ (void)postNotificationOnMainThread:(NSNotification *)notification
{
    [NSNotificationCenter postNotificationOnMainThread:notification waitUntilDone:NO];
}

+ (void)postNotificationOnMainThread:(NSNotification *)notification waitUntilDone:(BOOL)wait
{
    [[NSNotificationCenter defaultCenter] performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:wait];
}

@end