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

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(NSNumber_AGCategory);
#endif

@implementation NSNumber (AGCategory)

+ (NSNumber *)numberFromString_AG:(NSString *)string
{
    NSNumberFormatter *numberFormatter = [NSNumber numberFormatterWithNumberStyle_AG:NSNumberFormatterDecimalStyle];
    return [numberFormatter numberFromString:string];
}

- (NSString *)stringWithNumberStyle_AG:(NSNumberFormatterStyle)style
{
    NSNumberFormatter *numberFormatter = [NSNumber numberFormatterWithNumberStyle_AG:style];
    return [numberFormatter stringFromNumber:self];
}

- (NSString *)humanReadableBytes_AG
{
    return [self humanReadableBytesWithDecimalPlaceAccuracy_AG:-1];
}

- (NSString *)humanReadableBytesWithDecimalPlaceAccuracy_AG:(NSInteger)decimalPlaces
{
    static dispatch_once_t onceToken;
    static NSDecimalNumber *unitDecimalNumber;
	static NSArray *unitArray;
    
	dispatch_once(&onceToken, ^{
        unitDecimalNumber = [[NSDecimalNumber alloc] initWithDouble:1024.0f];
		unitArray = [NSArray arrayWithObjects:@"Bytes", @"KB", @"MB", @"GB", @"TB", @"PB", @"EB", @"ZB", @"YB", @"BB", nil];
	});
    
    NSDecimalNumber *decimalNumber = [[NSDecimalNumber alloc] initWithLongLong:[self longLongValue]];
	NSUInteger unit = 0;
    
    while (([decimalNumber compare:unitDecimalNumber] ==  NSOrderedDescending || [decimalNumber compare:unitDecimalNumber] ==  NSOrderedSame) && unit < [unitArray count]) {
        decimalNumber = [decimalNumber decimalNumberByDividingBy:unitDecimalNumber];
		unit++;
    }
    
    NSUInteger scale = 0;
    if (decimalPlaces < 0) {
        if (unit < 2) {
            scale = 0;
        } else if (unit == 2) {
            scale = 1;
        } else {
            scale = 2;
        }
    } else {
        scale = decimalPlaces;
    }
    
    NSDecimalNumberHandler *decimalNumberHandler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:scale
                                                                                               raiseOnExactness:NO raiseOnOverflow:NO
                                                                                               raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    decimalNumber = [decimalNumber decimalNumberByRoundingAccordingToBehavior:decimalNumberHandler];
    return [NSString stringWithFormat:@"%@ %@", [decimalNumber stringValue], [unitArray objectAtIndex:unit]];
}

#pragma mark - Private

+ (NSNumberFormatter *)numberFormatterWithNumberStyle_AG:(NSNumberFormatterStyle)style
{
	NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSString *threadDictionaryKey = [NSString stringWithFormat:@"NSNumberAGCategoryNumberFormatter-%u", style];
    
	NSNumberFormatter *numberFormatter = [threadDictionary objectForKey:threadDictionaryKey];
	if (numberFormatter == nil) {
		numberFormatter = [[NSNumberFormatter alloc] init];
		[threadDictionary setObject:numberFormatter forKey:threadDictionaryKey];
	}
	
    if (numberFormatter.numberStyle != style) {
        numberFormatter.numberStyle = style;
    }
    
	return numberFormatter;
}

@end