//
//  SKProduct+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 10/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "SKProduct+AGCategory.h"

@implementation SKProduct (AGCategory)

#pragma mark -

- (NSString *)localizedPrice
{
    NSNumberFormatter *numberFormatter = [SKProduct numberFormatter];    
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:self.priceLocale];
    
    NSString *formattedString = [numberFormatter stringFromNumber:self.price];
    return formattedString;
}

#pragma mark - Private

+ (NSNumberFormatter *)numberFormatter
{
	NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
	NSNumberFormatter *numberFormatter = [threadDictionary objectForKey:@"AGCategoryProductPriceFormatter"];
	if (numberFormatter == nil)
	{
		numberFormatter = [[NSNumberFormatter alloc] init];
		[threadDictionary setObject:numberFormatter forKey:@"AGCategoryProductPriceFormatter"];
	}
	return numberFormatter;
}

@end