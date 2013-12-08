//
//  NSJSONSerialization+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 14/03/2013.
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

#import "NSJSONSerialization+AGCategory.h"

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(NSJSONSerialization_AGCategory);
#endif

@implementation NSJSONSerialization (AGCategory)

+ (id)JSONDictionaryWithData_AG:(NSData *)data options:(NSJSONReadingOptions)options error:(NSError **)error
{
    if (data == nil) return nil;
    
    NSDictionary *object = [self JSONObjectWithData_AG:data options:options error:error];
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        return object;
    } else {
        NSLog(@"[NSJSONSerialization] WARNING: unexpected class from JSON: %@", [object class]);
        return nil;
    }
}

+ (id)JSONObjectWithData_AG:(NSData *)data options:(NSJSONReadingOptions)options error:(NSError **)error
{
    id object = nil;
    
    @try {
        object = [NSJSONSerialization JSONObjectWithData:data options:options error:error];
    }
    @catch (NSException *exception) {
        NSLog(@"[NSJSONSerialization] EXCEPTION deserializing JSON object: %@", exception);
        object = nil;
    }
    
    return object;
}

+ (NSData *)dataWithJSONObject_AG:(id)obj options:(NSJSONWritingOptions)options error:(NSError **)error
{
    if (![NSJSONSerialization isValidJSONObject:obj]) {
        NSLog(@"[NSJSONSerialization] Invalid object: %@", obj);
    }
    
	NSData *data = nil;
    
    @try {
		data = [NSJSONSerialization dataWithJSONObject:obj options:options error:error];
    }
    @catch (NSException *exception) {
        NSLog(@"[NSJSONSerialization] EXCEPTION serializing JSON object: %@", exception);
        data = nil;
    }
    
    return data;
}

@end