//
//  NSDictionary+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 06/06/2012.
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

#import "NSDictionary+AGCategory.h"

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(NSDictionary_AGCategory);
#endif

@implementation NSDictionary (AGCategory)

- (BOOL)boolForKey_AG:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object respondsToSelector:@selector(boolValue)])
        return [object intValue];
    
    return NO;
}

- (int)intForKey_AG:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object respondsToSelector:@selector(intValue)])
        return [object intValue];
    
    return 0;
}

- (float)floatForKey_AG:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object respondsToSelector:@selector(floatValue)])
        return [object floatValue];
    
    return 0;
}

- (double)doubleForKey_AG:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object respondsToSelector:@selector(doubleValue)])
        return [object doubleValue];
    
    return 0;
}

- (NSInteger)integerForKey_AG:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object respondsToSelector:@selector(integerValue)])
        return [object integerValue];
    
    return 0;
}

#pragma mark -

- (NSDate *)dateForKey_AG:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSDate class]])
        return object;
    
    return nil;
}

- (NSString *)stringForKey_AG:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSString class]])
        return object;
    
    if ([object respondsToSelector:@selector(stringValue)])
        return [object stringValue];
    
    return nil;
}

- (NSNumber *)numberForKey_AG:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSNumber class]])
        return object;
    
    if ([object respondsToSelector:@selector(doubleValue)])
        return [NSNumber numberWithDouble:[object doubleValue]];
    
    return nil;
}

- (NSArray *)arrayForKey_AG:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSArray class]])
        return object;
    
    return nil;
}

- (NSDictionary *)dictionaryForKey_AG:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSDictionary class]])
        return object;
    
    return nil;
}

#pragma mark -

- (BOOL)isNotEmpty_AG
{
	return [self count] == 0 ? YES : NO;
}

- (BOOL)containsObjectForKey_AG:(id)aKey 
{
	return [[self allKeys] containsObject:aKey];
}

- (NSArray *)allKeysSorted_AG
{
    return [[self allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

@end