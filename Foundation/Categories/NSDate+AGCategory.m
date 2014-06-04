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
#import "NSDateFormatter+AGCategory.h"
#import "NSCalendar+AGCategory.h"

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(NSDate_AGCategory);
#endif

@implementation NSDate (AGCategory)

- (NSString *)yearString_AG
{
    return [[NSDateFormatter dateFormatterWithDateFormat_AG:@"yyyy"] stringFromDate:self];
}

- (NSString *)monthString_AG
{
    return [[NSDateFormatter dateFormatterWithDateFormat_AG:@"MMMM"] stringFromDate:self];
}

- (NSString *)dayString_AG
{
    return [[NSDateFormatter dateFormatterWithDateFormat_AG:@"d"] stringFromDate:self];
}

- (NSString *)dayWithSuffixString_AG
{
    return [NSString stringWithFormat:@"%@%@", [self dayString_AG], [self suffixForDay_AG]];
}

- (NSString *)hourString_AG
{
    return [[NSDateFormatter dateFormatterWithDateFormat_AG:@"HH"] stringFromDate:self];
}

- (NSString *)minuteString_AG
{
    return [[NSDateFormatter dateFormatterWithDateFormat_AG:@"mm"] stringFromDate:self];
}

- (NSString *)secondString_AG
{
    return [[NSDateFormatter dateFormatterWithDateFormat_AG:@"ss"] stringFromDate:self];
}

- (NSInteger)year_AG
{
    return [[self yearString_AG] intValue];
}

- (NSInteger)month_AG
{
    return [[self monthString_AG] intValue];
}

- (NSInteger)day_AG
{
    return [[self dayString_AG] intValue];
}

- (NSInteger)hour_AG
{
    return [[self hourString_AG] intValue];
}

- (NSInteger)minute_AG
{
    return [[self minuteString_AG] intValue];
}

- (NSInteger)second_AG
{
    return [[self secondString_AG] intValue];
}

#pragma mark -

- (NSString *)dateString_AG
{    
    NSDateFormatter *dateFormatter = [NSDateFormatter dateFormatterWithDateFormat_AG:@" MMMM yyyy"];
    return [[self dayWithSuffixString_AG] stringByAppendingString:[dateFormatter stringFromDate:self]];
}

- (NSString *)timeString_AG
{
    NSDateFormatter *formatter = [NSDateFormatter dateFormatterWithDateFormat_AG:@"HH:mm"];
    return [formatter stringFromDate:self];
}

- (NSString *)dateTimeString_AG
{
    NSDateFormatter *dateFormatter = [NSDateFormatter dateFormatterWithDateFormat_AG:@" MMMM yyyy HH:mm"];
    return [[self dayWithSuffixString_AG] stringByAppendingString:[dateFormatter stringFromDate:self]];
}

#pragma mark -

- (NSDate *)dateAtMidnight_AG
{
    NSCalendar *gregorianCalendar = [NSCalendar gregorianCalendar_AG];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    
    NSDateComponents *components = [gregorianCalendar components:unitFlags fromDate:self];
	NSDate *dateAtMidnight = [gregorianCalendar dateFromComponents:components];
	return dateAtMidnight;
}

- (NSDate *)dateByAddingDays_AG:(int)days
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:days];
    
    NSCalendar *gregorianCalendar = [NSCalendar gregorianCalendar_AG];
    return [gregorianCalendar dateByAddingComponents:components toDate:self options:0];
}

#pragma mark -

- (BOOL)isToday_AG
{
    NSCalendar *gregorianCalendar = [NSCalendar gregorianCalendar_AG];
    NSUInteger unitFlags = NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit;
    
    NSDateComponents *components1 = [gregorianCalendar components:unitFlags fromDate:self];
	NSDateComponents *components2 = [gregorianCalendar components:unitFlags fromDate:[NSDate date]];
    
	return ((components1.year == components2.year)
            && (components1.month == components2.month)
            && (components1.day == components2.day));
}

- (BOOL)isBeforeDate_AG:(NSDate *)anotherDate
{
    return [self timeIntervalSinceDate:anotherDate] < 0;
}

- (BOOL)isAfterDate_AG:(NSDate *)anotherDate
{
    return [self timeIntervalSinceDate:anotherDate] > 0;
}

#pragma mark -

- (NSString *)timeDifferenceSinceNowString_AG
{
    NSCalendar *gregorianCalendar = [NSCalendar gregorianCalendar_AG];
    NSTimeInterval timeInterval = [self timeIntervalSinceNow];
    
    NSDate *startDate = nil;
    NSDate *endDate = nil;
    NSString *tense = nil;
    
    if (timeInterval < 0) {
        tense = @"ago";
        startDate = self;
        endDate = [NSDate date];
    } else {
        tense = @"to go";
        startDate = [NSDate date];
        endDate = self;
    }
    
    NSInteger seconds = [[gregorianCalendar components:NSSecondCalendarUnit fromDate:startDate toDate:endDate options:0] second];
    if (seconds < 60) {
        if (seconds == 1) {
            return [NSString stringWithFormat:@"%ld second %@", (long)seconds, tense];
        } else {
            return [NSString stringWithFormat:@"%ld seconds %@", (long)seconds, tense];
        }
    }
    
    NSInteger minutes = [[gregorianCalendar components:NSMinuteCalendarUnit fromDate:startDate toDate:endDate options:0] minute];
    if (minutes < 120) {
        if (minutes == 1) {
            return [NSString stringWithFormat:@"%ld minute %@", (long)minutes, tense];
        } else {
            return [NSString stringWithFormat:@"%ld minutes %@", (long)minutes, tense];
        }
    }
    
    NSInteger hours = [[gregorianCalendar components:NSHourCalendarUnit fromDate:startDate toDate:endDate options:0] hour];
    if (hours < 24) {
        if (hours == 1) {
            return [NSString stringWithFormat:@"%ld hour %@", (long)hours, tense];
        } else {
            return [NSString stringWithFormat:@"%ld hours %@", (long)hours, tense];
        }
    }
    
    NSInteger days = [[gregorianCalendar components:NSDayCalendarUnit fromDate:startDate toDate:endDate options:0] day];
    if (days < 30) {
        if (days == 1) {
            return [NSString stringWithFormat:@"%ld day %@", (long)days, tense];
        } else {
            return [NSString stringWithFormat:@"%ld days %@", (long)days, tense];
        }
    }
    
    NSInteger months = [[gregorianCalendar components:NSMonthCalendarUnit fromDate:startDate toDate:endDate options:0] month];
    if (months < 120) {
        if (months == 1) {
            return [NSString stringWithFormat:@"%ld month %@", (long)months, tense];
        } else {
            return [NSString stringWithFormat:@"%ld months %@", (long)months, tense];
        }
    }
    
    NSInteger years = [[gregorianCalendar components:NSYearCalendarUnit fromDate:startDate toDate:endDate options:0] year];
    if (years == 1) {
        return [NSString stringWithFormat:@"%ld year %@", (long)years, tense];
    } else {
        return [NSString stringWithFormat:@"%ld years %@", (long)years, tense];
    }
}

+ (NSInteger)daysPassedSinceDate_AG:(NSDate *)anotherDate
{
    NSCalendar *gregorianCalendar = [NSCalendar gregorianCalendar_AG];
    NSUInteger unitFlags = NSDayCalendarUnit;
    
    NSDateComponents *components = [gregorianCalendar components:unitFlags fromDate:anotherDate toDate:[NSDate date] options:0];
    NSInteger days = [components day];
    return days;
}

#pragma mark -

+ (NSString *)suffixString_AG
{
    static dispatch_once_t token;
	static NSString *suffixString;
    
	dispatch_once(&token, ^{
		suffixString = @"|st|nd|rd|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|st|nd|rd|th|th|th|th|th|th|th|st";	
	});
	return suffixString;
}

+ (NSArray *)suffixArray_AG
{
    static dispatch_once_t token;
	static NSArray *suffixArray;
    
	dispatch_once(&token, ^{
        suffixArray = [[NSDate suffixString_AG] componentsSeparatedByString:@"|"];
	});
	return suffixArray; 
}

- (NSString *)suffixForDay_AG
{
    NSDateFormatter *dateFormatter = [NSDateFormatter dateFormatterWithDateFormat_AG:@"d"];
    NSUInteger day = [[dateFormatter stringFromDate:self] intValue];
    
    if ([[NSDate suffixArray_AG] count] > day) {
        return [[NSDate suffixArray_AG] objectAtIndex:day];
    }
    
    return @"";
}

@end