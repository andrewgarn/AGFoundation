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

#pragma mark -

@implementation NSDate (AGCategory)

- (NSString *)yearString
{
    return [[NSDate dateFormatterWithDateFormat:@"yyyy"] stringFromDate:self];
}

- (NSString *)monthString
{
    return [[NSDate dateFormatterWithDateFormat:@"MMMM"] stringFromDate:self];
}

- (NSString *)dayString
{
    return [[NSDate dateFormatterWithDateFormat:@"d"] stringFromDate:self];
}

- (NSString *)dayWithSuffixString
{
    return [NSString stringWithFormat:@"%@%@", [self dayString], [self suffixForDay]];
}

- (NSString *)hourString
{
    return [[NSDate dateFormatterWithDateFormat:@"HH"] stringFromDate:self];
}

- (NSString *)minuteString
{
    return [[NSDate dateFormatterWithDateFormat:@"mm"] stringFromDate:self];
}

- (NSString *)secondString
{
    return [[NSDate dateFormatterWithDateFormat:@"ss"] stringFromDate:self];
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
    NSDateFormatter *dateFormatter = [NSDate dateFormatterWithDateFormat:@" MMMM yyyy"];
    return [[self dayWithSuffixString] stringByAppendingString:[dateFormatter stringFromDate:self]];
}

- (NSString *)timeString
{
    NSDateFormatter *formatter = [NSDate dateFormatterWithDateFormat:@"HH:mm"];
    return [formatter stringFromDate:self];
}

- (NSString *)dateTimeString
{
    NSDateFormatter *dateFormatter = [NSDate dateFormatterWithDateFormat:@" MMMM yyyy HH:mm"];
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

- (NSDate *)dateByAddingDays:(int)days
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:days];
    
    return [[NSDate gregorianCalendar] dateByAddingComponents:components toDate:self options:0];
}

#pragma mark -

- (BOOL)isToday
{
    NSCalendar *gregorianCalendar = [NSDate gregorianCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit;
    
    NSDateComponents *components1 = [gregorianCalendar components:unitFlags fromDate:self];
	NSDateComponents *components2 = [gregorianCalendar components:unitFlags fromDate:[NSDate date]];
    
	return ((components1.year == components2.year)
            && (components1.month == components2.month)
            && (components1.day == components2.day));
}

- (BOOL)isBefore:(NSDate *)anotherDate
{
    return [self timeIntervalSinceDate:anotherDate] < 0;
}

- (BOOL)isAfter:(NSDate *)anotherDate
{
    return [self timeIntervalSinceDate:anotherDate] > 0;
}

#pragma mark -

- (NSString *)timeDifferenceSinceNowString
{
    NSCalendar *gregorianCalendar = [NSDate gregorianCalendar];
    NSTimeInterval timeInterval = [self timeIntervalSinceNow];
    NSString *tense = timeInterval < 0 ? @"ago" : @"later";
    NSDate *nowDate = [NSDate date];
    
    NSInteger seconds = [[gregorianCalendar components:NSSecondCalendarUnit fromDate:self toDate:nowDate options:0] second];
    if (seconds < 60)
    {
        if (seconds == 1)
            return [NSString stringWithFormat:@"%d second %@", seconds, tense];
        else
            return [NSString stringWithFormat:@"%d seconds %@", seconds, tense];
    }
    
    NSInteger minutes = [[gregorianCalendar components:NSMinuteCalendarUnit fromDate:self toDate:nowDate options:0] minute];
    if (minutes < 120)
    {
        if (minutes == 1)
            return [NSString stringWithFormat:@"%d minute %@", minutes, tense];
        else
            return [NSString stringWithFormat:@"%d minutes %@", minutes, tense];
    }
    
    NSInteger hours = [[gregorianCalendar components:NSHourCalendarUnit fromDate:self toDate:nowDate options:0] hour];
    if (hours < 24)
    {
        if (hours == 1)
            return [NSString stringWithFormat:@"%d hour %@", hours, tense];
        else
            return [NSString stringWithFormat:@"%d hours %@", hours, tense];
    }
    
    NSInteger days = [[gregorianCalendar components:NSDayCalendarUnit fromDate:self toDate:nowDate options:0] day];
    if (days < 30)
    {
        if (days == 1)
            return [NSString stringWithFormat:@"%d day %@", days, tense];
        else
            return [NSString stringWithFormat:@"%d days %@", days, tense];
    }
    
    NSInteger months = [[gregorianCalendar components:NSMonthCalendarUnit fromDate:self toDate:nowDate options:0] month];
    if (months < 120)
    {
        if (months == 1)
            return [NSString stringWithFormat:@"%d month %@", months, tense];
        else
            return [NSString stringWithFormat:@"%d months %@", months, tense];
    }
    
    NSInteger years = [[gregorianCalendar components:NSYearCalendarUnit fromDate:self toDate:nowDate options:0] year];
    if (years == 1)
        return [NSString stringWithFormat:@"%d year %@", years, tense];
    else
        return [NSString stringWithFormat:@"%d years %@", years, tense];
}

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
    NSDateFormatter *dateFormatter = [NSDate dateFormatterWithDateFormat:@"d"];
    int day = [[dateFormatter stringFromDate:self] intValue];   
    
    if ([[NSDate suffixArray] count] > day)
        return [[NSDate suffixArray] objectAtIndex:day]; 
    
    return @"";
}

#pragma mark - NSCalendar

+ (NSCalendar *)gregorianCalendar
{
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSString *threadDictionaryKey = @"NSDateAGCategoryGregorianCalendar";

	NSCalendar *gregorianCalendar = [threadDictionary objectForKey:threadDictionaryKey];
    if (gregorianCalendar == nil)
	{
		gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
		[threadDictionary setObject:gregorianCalendar forKey:threadDictionaryKey];
	}
    return gregorianCalendar;
}

+ (NSCalendar *)autoupdatingCurrentCalendar
{
	NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSString *threadDictionaryKey = @"NSDateAGCategoryAutoUpdatingCurrentCalendar";

	NSCalendar *currentCalendar = [threadDictionary objectForKey:threadDictionaryKey];
	if (currentCalendar == nil)
	{
		currentCalendar = [NSCalendar autoupdatingCurrentCalendar];
		[threadDictionary setObject:currentCalendar forKey:threadDictionaryKey];
	} 
	return currentCalendar;
}

#pragma mark - NSLocale

+ (NSLocale *)localeWithLocaleIdentifier:(NSString *)string
{
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSString *threadDictionaryKey = [NSString stringWithFormat:@"NSDateAGCategoryLocale-%@", string];
    
    NSLocale *locale = [threadDictionary objectForKey:threadDictionaryKey];
    if (locale == nil)
    {
        locale = [[NSLocale alloc] initWithLocaleIdentifier:string];
		[threadDictionary setObject:locale forKey:threadDictionaryKey];
    }
    
    return locale;
}

+ (NSLocale *)autoupdatingCurrentLocale
{
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSString *threadDictionaryKey = @"NSDateAGCategoryAutoUpdatingCurrentLocale";
    
	NSLocale *currentLocale = [threadDictionary objectForKey:threadDictionaryKey];
	if (currentLocale == nil)
	{
		currentLocale = [NSLocale autoupdatingCurrentLocale];
		[threadDictionary setObject:currentLocale forKey:threadDictionaryKey];
	}
    
    return currentLocale;
}

#pragma mark - NSDateFormatter

+ (NSDateFormatter *)dateFormatterWithDateFormat:(NSString *)dateFormat
{
    return [NSDate dateFormatterWithDateFormat:dateFormat locale:[NSDate autoupdatingCurrentLocale]];
}

+ (NSDateFormatter *)dateFormatterWithDateFormat:(NSString *)dateFormat withLocaleIdentifier:(NSString *)localeIdentifier
{
    return [NSDate dateFormatterWithDateFormat:dateFormat locale:[NSDate localeWithLocaleIdentifier:localeIdentifier]];
}

+ (NSDateFormatter *)dateFormatterWithDateFormat:(NSString *)dateFormat locale:(NSLocale *)locale
{
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSMutableString *threadDictionaryKey = [NSString stringWithFormat:@"NSDateAGCategoryDateFormatter_%@_%@", dateFormat, locale.localeIdentifier];
    
	NSDateFormatter *dateFormatter = [threadDictionary objectForKey:threadDictionaryKey];
	if (dateFormatter == nil)
	{
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setCalendar:[self gregorianCalendar]];
        [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
		[threadDictionary setObject:dateFormatter forKey:threadDictionaryKey];
	}
    
    if (![[dateFormatter dateFormat] isEqualToString:dateFormat] && dateFormat)
        [dateFormatter setDateFormat:dateFormat];
    
    if (![[dateFormatter locale] isEqual:locale] && locale)
        [dateFormatter setLocale:locale];
    
	return dateFormatter;
}

@end