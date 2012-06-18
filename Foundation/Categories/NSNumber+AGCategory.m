//
//  NSNumber+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 24/04/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

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