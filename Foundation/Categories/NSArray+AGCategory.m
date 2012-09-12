//
//  NSArray+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 24/04/2012.
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

#import "NSArray+AGCategory.h"

@implementation NSArray (AGCategory)

- (id)firstObject
{
    if ([self respondsToSelector:@selector(count)] && [self count] > 0)
        return [self objectAtIndex:0];

    return nil;
}

- (id)randomObject
{
    if ([self respondsToSelector:@selector(count)] && [self count] > 0)
        return [self objectAtIndex:arc4random() % [self count]];

	return nil;
}

- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index < [self count])
    {
        return [self objectAtIndex:index];
    }
    return nil;
}

#pragma mark -

- (BOOL)boolAtIndex:(NSUInteger)index
{
    if (index < [self count])
    {
        id object = [self objectAtIndex:index];
        
        if ([object respondsToSelector:@selector(boolValue)])
            return [object boolValue];        
    }
    return NO;
}

- (int)intAtIndex:(NSUInteger)index
{
    if (index < [self count])
    {
        id object = [self objectAtIndex:index];
        
        if ([object respondsToSelector:@selector(intValue)])
            return [object intValue];
    }
    return 0;
}

- (NSInteger)integerAtIndex:(NSUInteger)index
{
    if (index < [self count])
    {
        id object = [self objectAtIndex:index];
        
        if ([object respondsToSelector:@selector(integerValue)])
            return [object integerValue];
    }
    return 0;
}

- (float)floatAtIndex:(NSUInteger)index
{
    if (index < [self count])
    {
        id object = [self objectAtIndex:index];
        
        if ([object respondsToSelector:@selector(floatValue)])
            return [object floatValue];
    }
    return 0.0f;
}

- (double)doubleAtIndex:(NSUInteger)index
{
    if (index < [self count])
    {
        id object = [self objectAtIndex:index];
        
        if ([object respondsToSelector:@selector(doubleValue)])
            return [object doubleValue];
    }
    return 0.0f;
}

#pragma mark -

- (NSArray *)sortedArrayUsingSortDescriptorKey:(NSString *)key ascending:(BOOL)ascending
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    return [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

#pragma mark -

- (NSArray *)reversedArray 
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) 
    {
        [array addObject:element];
    }
    return array;
}

- (NSArray *)shuffledArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSMutableArray *mutableCopy = [self mutableCopy];
    while ([self count] > 0)
    {
        NSUInteger index = arc4random() % [mutableCopy count];
        id objectToMove = [mutableCopy objectAtIndex:index];
        
        [array addObject:objectToMove];
        [mutableCopy removeObjectAtIndex:index];
    }
    return array;
}

@end