//
//  NSMutableDictionary+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 08/06/2012.
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

#import "NSMutableDictionary+AGCategory.h"

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(NSMutableDictionary_AGCategory);
#endif

@implementation NSMutableDictionary (AGCategory)

#pragma mark -

- (void)setBool_AG:(BOOL)value forKey:(id)key
{
    [self setObject_AG:[NSNumber numberWithBool:value] forKey:key];
}

- (void)setInt_AG:(BOOL)value forKey:(id)key
{
    [self setObject_AG:[NSNumber numberWithInt:value] forKey:key];
}

- (void)setFloat_AG:(BOOL)value forKey:(id)key
{
    [self setObject_AG:[NSNumber numberWithFloat:value] forKey:key];
}

- (void)setDouble_AG:(BOOL)value forKey:(id)key
{
    [self setObject_AG:[NSNumber numberWithDouble:value] forKey:key];
}

- (void)setInteger_AG:(BOOL)value forKey:(id)key
{
    [self setObject_AG:[NSNumber numberWithInteger:value] forKey:key];
}

- (void)setUnsignedInteger_AG:(BOOL)value forKey:(id)key
{
    [self setObject_AG:[NSNumber numberWithUnsignedInteger:value] forKey:key];
}

#pragma mark -

- (void)setObject_AG:(id)anObject forKey:(id)aKey
{
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    }
}

@end