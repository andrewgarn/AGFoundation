//
//  NSCoder+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 30/11/2013.
//  Copyright (c) 2013 Andrew Garn. All rights reserved.
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

#import "NSCoder+AGCategory.h"

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(NSCoder_AGCategory);
#endif

@implementation NSCoder (AGCategory)

#pragma mark - Encoding

- (void)encodeArray_AG:(NSArray *)array forKey:(NSString *)key
{
    NSAssert([array isKindOfClass:[NSArray class]], @"Expected class: NSArray, got class: %@", [array class]);
    
    if ([array isKindOfClass:[NSArray class]]) {
        [self encodeObject:array forKey:key];
    } else {
        [self encodeObject:nil forKey:key];
    }
}

- (void)encodeDictionary_AG:(NSDictionary *)dictionary forKey:(NSString *)key
{
    NSAssert([dictionary isKindOfClass:[NSDictionary class]], @"Expected class: NSDictionary, got class: %@", [dictionary class]);
    
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        [self encodeObject:dictionary forKey:key];
    } else {
        [self encodeObject:nil forKey:key];
    }
}

- (void)encodeString_AG:(NSString *)string forKey:(NSString *)key
{
    NSAssert([string isKindOfClass:[NSString class]], @"Expected class: NSString, got class: %@", [string class]);
    
    if ([string isKindOfClass:[NSString class]]) {
        [self encodeObject:string forKey:key];
    } else {
        [self encodeObject:nil forKey:key];
    }
}

- (void)encodeDate_AG:(NSDate *)date forKey:(NSString *)key
{
    NSAssert([date isKindOfClass:[NSDate class]], @"Expected class: NSDate, got class: %@", [date class]);
    
    if ([date isKindOfClass:[NSDate class]]) {
        [self encodeObject:date forKey:key];
    } else {
        [self encodeObject:nil forKey:key];
    }
}

#pragma mark - Decoding

- (NSArray *)decodeArrayForKey_AG:(NSString *)key
{
    NSParameterAssert(key);
    if (key == nil) return nil;
    
    id object = [self decodeObjectForKey:key];
    
    if ([object isKindOfClass:[NSArray class]]) {
        return object;
    }
    
    return nil;
}

- (NSMutableArray *)decodeMutableArrayForKey_AG:(NSString *)key
{
    NSArray *array = [self decodeArrayForKey_AG:key];
    if (array != nil) {
        NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:array];
        return mutableArray;
    }
    return nil;
}

- (NSDictionary *)decodeDictionaryForKey_AG:(NSString *)key
{
    NSParameterAssert(key);
    if (key == nil) return nil;
    
    id object = [self decodeObjectForKey:key];
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        return object;
    }
    
    return nil;
}

- (NSMutableDictionary *)decodeMutableDictionaryForKey_AG:(NSString *)key
{
    NSDictionary *dictionary = [self decodeDictionaryForKey_AG:key];
    if (dictionary != nil) {
        NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
        return mutableDictionary;
    }
    return nil;
}

- (NSString *)decodeStringForKey_AG:(NSString *)key
{
    NSParameterAssert(key);
    if (key == nil) return nil;
    
    id object = [self decodeObjectForKey:key];
    
    if ([object isKindOfClass:[NSString class]]) {
        return object;
    }
    
    if ([object respondsToSelector:@selector(stringValue)]) {
        return [object stringValue];
    }
    
    return nil;
}

- (NSDate *)decodeDateForKey_AG:(NSString *)key
{
    NSParameterAssert(key);
    if (key == nil) return nil;
    
    id object = [self decodeObjectForKey:key];
    
    if ([object isKindOfClass:[NSDate class]]) {
        return object;
    }
    
    return nil;
}

@end