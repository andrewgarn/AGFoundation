//
//  NSMutableArray+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 29/05/2012.
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

#import "NSMutableArray+AGCategory.h"

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(NSMutableArray_AGCategory);
#endif

@implementation NSMutableArray (AGCategory)

#pragma mark - Queueing and Dequeuing

- (void)enqueueObject_AG:(id)anObject 
{
    [self addObject:anObject];
}

- (id)dequeueObject_AG
{
    if ([self count] == 0) {
         return nil;
    }
    
    id headObject = [self objectAtIndex:0];
    if (headObject != nil) {
        [self removeObjectAtIndex:0];
    }

    return headObject;
}

#pragma mark - Pushing and Popping

- (void)pushObject_AG:(id)anObject
{
	[self addObject:anObject];
}

- (id)popObject_AG
{
	id result = [self lastObject];
	[self removeLastObject];
	return result;
}

#pragma mark - Rearranging

- (NSMutableArray *)reverse_AG
{    
    NSUInteger i = 0;
    NSUInteger j = [self count] - 1;
    
    while (i<j) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:j];
        i++;
        j--;
    }
    return self;
}

- (NSMutableArray *)shuffle_AG
{
    NSUInteger i = 0;
    NSUInteger j = [self count] - 1;
    
    while (i<j) {
        NSUInteger randomIndex = arc4random_uniform((uint32_t)([self count] - 1));
        [self exchangeObjectAtIndex:randomIndex withObjectAtIndex:i];
        i++;
        j--;
    }
    return self;
}

@end