//
//  NSDate+AGCategory.m
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

#import "NSDate+AGCategory.h"

@interface NSDate (AGCategory_Private)
+ (NSCalendar *)currentCalendar;
+ (NSDateFormatter *)dateFormatter;
@end

#pragma mark -

@implementation NSDate (AGCategory)

- (NSString *)yearString
{
    NSDateFormatter *dateFormatter = [NSDate dateFormatter];
    [dateFormatter setDateFormat:@"yyyy"];
    return [dateFormatter stringFromDate:self];
}

- (NSString *)monthString
{
    NSDateFormatter *dateFormatter = [NSDate dateFormatter];
    [dateFormatter setDateFormat:@"MMMM"];
    return [dateFormatter stringFromDate:self];
}

- (NSString *)dayString
{
    NSDateFormatter *dateFormatter = [NSDate dateFormatter];
    [dateFormatter setDateFormat:@"d"];
    return [dateFormatter stringFromDate:self];
}

- (NSString *)dayWithSuffixString
{
    return [NSString stringWithFormat:@"%@%@", [self dayString], [self suffixForDay]];
}

- (NSString *)hourString
{
    NSDateFormatter *dateFormatter = [NSDate dateFormatter];
    [dateFormatter setDateFormat:@"HH"];
    return [dateFormatter stringFromDate:self];
}

- (NSString *)minuteString
{
    NSDateFormatter *dateFormatter = [NSDate dateFormatter];
    [dateFormatter setDateFormat:@"mm"];
    return [dateFormatter stringFromDate:self];
}

- (NSString *)secondString
{
    NSDateFormatter *dateFormatter = [NSDate dateFormatter];
    [dateFormatter setDateFormat:@"ss"];
    return [dateFormatter stringFromDate:self];
}

- (NSInteger)year
{
    return [[self yearString] intValue];
}

- (NSInteger)month
{
    return [[self monthString] intValue];
}

- (NSInteger)day
{
    return [[self dayString] intValue];
}

- (NSInteger)hour
{
    return [[self hourString] intValue];
}

- (NSInteger)minute
{
    return [[self minuteString] intValue];
}

- (NSInteger)second
{
    return [[self secondString] intValue];
}

#pragma mark -

- (NSString *)dateString
{    
    NSDateFormatter *dateFormatter = [NSDate dateFormatterWithdateFormat:@" MMMM yyyy"];
    return [[self dayWithSuffixString] stringByAppendingString:[dateFormatter stringFromDate:self]];
}

- (NSString *)timeString
{
    NSDateFormatter *formatter = [NSDate dateFormatterWithdateFormat:@"HH:mm"];
    return [formatter stringFromDate:self];
}

- (NSString *)dateTimeString
{
    NSDateFormatter *dateFormatter = [NSDate dateFormatterWithdateFormat:@" MMMM yyyy HH:mm"];
    return [[self dayWithSuffixString] stringByAppendingString:[dateFormatter stringFromDate:self]];
}

#pragma mark -

- (NSDate *)dateAtMidnight
{
    NSCalendar *gregorianCalendar = [NSDate gregorianCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    
    NSDateComponents *components = [gregorianCalendar components:unitFlags fromDate:self];
	NSDate *dateAtMidnight = [gregorianCalendar dateFromComponents:components];
	return dateAtMidnight;
}

#pragma mark -

+ (NSInteger)daysPassedSinceDate:(NSDate *)anotherDate;
{
    NSCalendar *gregorianCalendar = [NSDate gregorianCalendar];
    NSUInteger unitFlags = NSDayCalendarUnit;
    
    NSDateComponents *components = [gregorianCalendar components:unitFlags fromDate:anotherDate toDate:[NSDate date] options:0];
    NSInteger days = [components day];
    return days;
}

#pragma mark -

+ (NSString *)suffixString
{
    static dispatch_once_t token;
	static NSString *suffixString;
    
	dispatch_once(&token, ^{
		suffixString = @"|st|nd|rd|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|st|nd|rd|th|th|th|th|th|th|th|st";	
	});
	return suffixString;
}

+ (NSArray *)suffixArray
{
    static dispatch_once_t token;
	static NSArray *suffixArray;
    
	dispatch_once(&token, ^{
        suffixArray = [[NSDate suffixString] componentsSeparatedByString:@"|"];
	});
	return suffixArray; 
}

- (NSString *)suffixForDay
{
    NSDateFormatter *dateFormatter = [NSDate dateFormatterWithdateFormat:@"d"];
    [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    int day = [[dateFormatter stringFromDate:self] intValue];   
    
    if ([[NSDate suffixArray] count] > day)
        return [[NSDate suffixArray] objectAtIndex:day]; 
    
    return @"";
}

#pragma mark - Private Methods

+ (NSCalendar *)gregorianCalendar
{
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
	NSCalendar *gregorianCalendar = [threadDictionary objectForKey:@"AGCategoryGregorianCalendar"];
    if (gregorianCalendar == nil)
	{
		gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
		[threadDictionary setObject:gregorianCalendar forKey:@"AGCategoryGregorianCalendar"];
	}
    return gregorianCalendar;
}

+ (NSCalendar *)currentCalendar
{
	NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
	NSCalendar *currentCalendar = [threadDictionary objectForKey:@"AGCategoryCurrentCalendar"];
	if (currentCalendar == nil)
	{
		currentCalendar = [NSCalendar currentCalendar];
		[threadDictionary setObject:currentCalendar forKey:@"AGCategoryCurrentCalendar"];
	}
    
    // Reset the timeZone that the calendar uses.
    if (![[currentCalendar timeZone] isEqual:[NSTimeZone localTimeZone]])
        [currentCalendar setTimeZone:[NSTimeZone localTimeZone]];
    
    // Reset the locale that the calendar uses.
    if (![[currentCalendar locale] isEqual:[NSLocale currentLocale]])
        [currentCalendar setLocale:[NSLocale currentLocale]];
    
	return currentCalendar;
}

+ (NSCalendar *)autoupdatingCurrentCalendar
{
	NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
	NSCalendar *currentCalendar = [threadDictionary objectForKey:@"AGCategoryAutoUpdatingCurrentCalendar"];
	if (currentCalendar == nil)
	{
		currentCalendar = [NSCalendar autoupdatingCurrentCalendar];
		[threadDictionary setObject:currentCalendar forKey:@"AGCategoryAutoUpdatingCurrentCalendar"];
	}
    
    // Reset the timeZone that the calendar uses.
    if (![[currentCalendar timeZone] isEqual:[NSTimeZone localTimeZone]])
        [currentCalendar setTimeZone:[NSTimeZone localTimeZone]];
    
    // Reset the locale that the calendar uses.
    if (![[currentCalendar locale] isEqual:[NSLocale autoupdatingCurrentLocale]])
        [currentCalendar setLocale:[NSLocale autoupdatingCurrentLocale]];
    
	return currentCalendar;
}

+ (NSDateFormatter *)dateFormatter
{
	NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
	NSDateFormatter *dateFormatter = [threadDictionary objectForKey:@"AGCategoryDateFormatter"];
	if (dateFormatter == nil)
	{
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setCalendar:[self autoupdatingCurrentCalendar]];
		[threadDictionary setObject:dateFormatter forKey:@"AGCategoryDateFormatter"];
	}
	
	// Reset the timeZone that the dateFormatter uses.
    if (![[dateFormatter timeZone] isEqual:[NSTimeZone localTimeZone]])
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    // Reset the locale that the dateFormatter uses.
    if (![[dateFormatter locale] isEqual:[NSLocale autoupdatingCurrentLocale]])
        [dateFormatter setLocale:[NSLocale autoupdatingCurrentLocale]];
    	
	return dateFormatter;
}

+ (NSDateFormatter *)dateFormatterWithdateFormat:(NSString *)dateFormat
{
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSString *threadDictionaryKey = [NSString stringWithFormat:@"AGCategoryDateFormatter-%@", dateFormat];
	NSDateFormatter *dateFormatter = [threadDictionary objectForKey:threadDictionaryKey];
	if (dateFormatter == nil)
	{
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setCalendar:[self autoupdatingCurrentCalendar]];
        [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
		[threadDictionary setObject:dateFormatter forKey:threadDictionaryKey];
	}
    
    // Ensure the dateformatter is using the correct format.
    if (![[dateFormatter dateFormat] isEqualToString:dateFormat])
        [dateFormatter setDateFormat:dateFormat];
	
	// Reset the timeZone that the dateFormatter uses.
    if (![[dateFormatter timeZone] isEqual:[NSTimeZone localTimeZone]])
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    // Reset the locale that the dateFormatter uses.
    if (![[dateFormatter locale] isEqual:[NSLocale autoupdatingCurrentLocale]])
        [dateFormatter setLocale:[NSLocale autoupdatingCurrentLocale]];
    
	return dateFormatter;
}

@end