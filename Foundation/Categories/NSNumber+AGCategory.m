//
//  NSNumber+AGCategory.m
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

#import "NSNumber+AGCategory.h"
#import "NSObject+AGCategory.h"

@interface NSNumber (AGCategory_Private)
+ (NSNumberFormatter *)numberFormatter;
@end

#pragma mark -

@implementation NSNumber (AGCategory)

+ (NSNumber *)numberFromString:(NSString *)string
{
    NSNumberFormatter *numberFormatter = [NSNumber numberFormatterWithNumberStyle:NSNumberFormatterDecimalStyle];
    return [numberFormatter numberFromString:string];
}

- (NSString *)stringWithNumberStyle:(NSNumberFormatterStyle)style
{
    NSNumberFormatter *numberFormatter = [NSNumber numberFormatterWithNumberStyle:style];
    return [numberFormatter stringFromNumber:self];
}

- (NSString *)formattedBytes
{
    float bytes = [self longValue];
	NSUInteger unit = 0;

	while(bytes > 1024 && unit < 4) {
		bytes = bytes / 1024.0;
		unit++;
	}
        
	NSString *unitString = [[NSArray arrayWithObjects:@"KB", @"MB", @"GB", @"TB", @"PB", nil] objectAtIndex:unit];
    
	if(unit == 0) {
		return [NSString stringWithFormat:@"%d %@", (int)bytes, unitString];
	} else {
		return [NSString stringWithFormat:@"%.2f %@", (float)bytes, unitString];
	}
}

#pragma mark - Private

+ (NSNumberFormatter *)numberFormatterWithNumberStyle:(NSNumberFormatterStyle)style
{
	NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSString *threadDictionaryKey = [NSString stringWithFormat:@"AGCategoryNumberFormatter-%i", style];
	NSNumberFormatter *numberFormatter = [threadDictionary objectForKey:threadDictionaryKey];
	if (numberFormatter == nil)
	{
		numberFormatter = [[NSNumberFormatter alloc] init];
		[threadDictionary setObject:numberFormatter forKey:threadDictionaryKey];
	}
	
    if (numberFormatter.numberStyle != style)
        numberFormatter.numberStyle = style;
    
	return numberFormatter;
}

@end