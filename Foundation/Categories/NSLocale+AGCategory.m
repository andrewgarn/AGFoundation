//
//  NSLocale+AGCategory.m
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

#import "NSLocale+AGCategory.h"

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(NSLocale_AGCategory);
#endif

@implementation NSLocale (AGCategory)

+ (NSLocale *)localeWithLocaleIdentifier_AG:(NSString *)string
{
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSString *threadDictionaryKey = [NSString stringWithFormat:@"NSLocaleAGCategoryLocale-%@", string];
    
    NSLocale *locale = [threadDictionary objectForKey:threadDictionaryKey];
    if (locale == nil) {
        locale = [[NSLocale alloc] initWithLocaleIdentifier:string];
		[threadDictionary setObject:locale forKey:threadDictionaryKey];
    }
    
    return locale;
}

+ (NSLocale *)autoupdatingCurrentLocale_AG
{
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSString *threadDictionaryKey = @"NSLocaleAGCategoryAutoUpdatingCurrentLocale";
    
	NSLocale *currentLocale = [threadDictionary objectForKey:threadDictionaryKey];
	if (currentLocale == nil) {
		currentLocale = [NSLocale autoupdatingCurrentLocale];
		[threadDictionary setObject:currentLocale forKey:threadDictionaryKey];
	}
    
    return currentLocale;
}

@end