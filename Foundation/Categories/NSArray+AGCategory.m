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

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(NSArray_AGCategory);
#endif

@implementation NSArray (AGCategory)

#pragma mark -

- (id)firstObject_AG
{
    if ([self respondsToSelector:@selector(count)] && [self count] > 0) {
        return [self objectAtIndex:0];
    }

    return nil;
}

- (id)randomObject_AG
{
    if ([self respondsToSelector:@selector(count)] && [self count] > 0) {
        return [self objectAtIndex:arc4random() % [self count]];
    }

	return nil;
}

#pragma mark -

- (BOOL)containsObjectOfClass_AG:(Class)aClass
{
    __block BOOL classFound = NO;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:aClass]) {
            classFound = YES;
            *stop = YES;
        }
    }];
    return classFound;
}

- (NSArray *)subarrayWithObjectsOfClass:(Class)aClass
{
    NSMutableArray *subarray = [[NSMutableArray alloc] init];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:aClass]) {
            [subarray addObject:obj];
        }
    }];
	return subarray;
}

#pragma mark -

- (id)objectAtIndex_AG:(NSUInteger)index
{
    if (index < [self count]) {
        return [self objectAtIndex:index];
    }
    return nil;
}

- (BOOL)boolAtIndex_AG:(NSUInteger)index
{
    if (index < [self count]) {
        id object = [self objectAtIndex:index];
        
        if ([object respondsToSelector:@selector(boolValue)]) {
            return [object boolValue];
        }
    }
    return NO;
}

- (int)intAtIndex_AG:(NSUInteger)index
{
    if (index < [self count]) {
        id object = [self objectAtIndex:index];
        
        if ([object respondsToSelector:@selector(intValue)]) {
            return [object intValue];
        }
    }
    return 0;
}

- (NSInteger)integerAtIndex_AG:(NSUInteger)index
{
    if (index < [self count]) {
        id object = [self objectAtIndex:index];
        
        if ([object respondsToSelector:@selector(integerValue)]) {
            return [object integerValue];
        }
    }
    return 0;
}

- (float)floatAtIndex_AG:(NSUInteger)index
{
    if (index < [self count]) {
        id object = [self objectAtIndex:index];
        
        if ([object respondsToSelector:@selector(floatValue)]) {
            return [object floatValue];
        }
    }
    return 0.0f;
}

- (double)doubleAtIndex_AG:(NSUInteger)index
{
    if (index < [self count]) {
        id object = [self objectAtIndex:index];
        
        if ([object respondsToSelector:@selector(doubleValue)]) {
            return [object doubleValue];
        }
    }
    return 0.0f;
}

#pragma mark -

- (NSArray *)sortedArrayUsingSortDescriptorKey_AG:(NSString *)key ascending:(BOOL)ascending
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    return [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

#pragma mark -

- (NSArray *)reversedArray_AG
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [array addObject:element];
    }
    return array;
}

- (NSArray *)shuffledArray_AG
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSMutableArray *mutableCopy = [self mutableCopy];
    while ([self count] > 0) {
        NSUInteger index = arc4random() % [mutableCopy count];
        id objectToMove = [mutableCopy objectAtIndex:index];
        
        [array addObject:objectToMove];
        [mutableCopy removeObjectAtIndex:index];
    }
    return array;
}

@end