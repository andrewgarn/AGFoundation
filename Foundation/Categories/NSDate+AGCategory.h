//
//  NSDate+AGCategory.h
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

#import <Foundation/Foundation.h>

/** A collection of category extensions for `NSDate` */
@interface NSDate (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Getting Information About an NSDate Object
 ---------------------------------------------------------------------------------------
*/ 

/** Returns a string representing the number of year units for the receiver.
 @return A string representing the number of year units for the receiver.
*/
- (NSString *)yearString;

/** Returns a string representing the number of month units for the receiver.
 @return A string representing the number of month units for the receiver.
*/
- (NSString *)monthString;

/** Returns a string representing the number of day units for the receiver.
 @return A string representing the number of day units for the receiver.
 */
- (NSString *)dayString;

/** Returns a string representing the number of day units for the receiver including its suffix.
 @return A string representing the number of day units for the receiver including its suffix.
*/
- (NSString *)dayWithSuffixString;

/** Returns a string representing the number of hour units for the receiver.
 @return A string representing the number of hour units for the receiver.
 */
- (NSString *)hourString;

/** Returns a string representing the number of minute units for the receiver.
 @return A string representing the number of minute units for the receiver.
 */
- (NSString *)minuteString;

/** Returns a string representing the number of second units for the receiver.
 @return A string representing the number of second units for the receiver.
*/
- (NSString *)secondString;

/** Returns the number of year units for the receiver.
 @return The number of year units for the receiver.
*/ 
- (NSInteger)year;

/** Returns the number of month units for the receiver.
 @return The number of month units for the receiver.
*/ 
- (NSInteger)month;

/** Returns the number of day units for the receiver.
 @return The number of day units for the receiver.
*/ 
- (NSInteger)day;

/** Returns the number of hour units for the receiver.
 @return The number of hour units for the receiver.
*/ 
- (NSInteger)hour;

/** Returns the number of minute units for the receiver.
 @return The number of minute units for the receiver.
*/ 
- (NSInteger)minute;

/** Returns the number of second units for the receiver.
 @return The number of second units for the receiver.
*/ 
- (NSInteger)second;

/**-------------------------------------------------------------------------------------
 @name Representing Dates as Strings
 ---------------------------------------------------------------------------------------
*/ 

/** Returns a formatted date string from the receiver.
 @return A formatted date string from the receiver.
*/ 
- (NSString *)dateString;

/** Returns a formatted time string from the receiver.
 @return A formatted time string from the receiver.
*/ 
- (NSString *)timeString;

/** Returns a formatted date time string from the receiver.
 @return A formatted date time string from the receiver.
*/ 
- (NSString *)dateTimeString;

/**-------------------------------------------------------------------------------------
 @name Modifying Dates
 ---------------------------------------------------------------------------------------
*/

/** Returns a copy of the receiver with the time set to midnight.
 @return A copy of the receiver with the time set to midnight.
*/
- (NSDate *)dateAtMidnight;

/**-------------------------------------------------------------------------------------
 @name Getting Time Intervals
 ---------------------------------------------------------------------------------------
*/ 

/** Returns the number of full days between the current date and another given date.
 @param anotherDate The date with which to compare to the current date.
 @return The number of full days between the current date and anotherDate. If the current date is earlier than anotherDate, the return value is negative.
*/ 
+ (NSInteger)daysPassedSinceDate:(NSDate *)anotherDate;

/** Returns a string with the relative time difference between the receiver and the current date.
 @return A string with the relative time difference between the receiver and the current date.
*/
- (NSString *)timeDifferenceSinceNowString;

/** Returns a bool indicating if the receiver is before the given date.
 @param anotherDate The date with which to compare the receiver.
 @return `YES` if the receiver is before the given date, otherwise `NO`.
*/ 
- (BOOL)isBefore:(NSDate *)anotherDate;

/** Returns a bool indicating if the receiver is after the given date.
 @param anotherDate The date with which to compare the receiver.
 @return `YES` if the receiver is after the given date, otherwise `NO`.
*/ 
- (BOOL)isAfter:(NSDate *)anotherDate;

/**-------------------------------------------------------------------------------------
 @name Suffix
 ---------------------------------------------------------------------------------------
*/ 

/** Returns an array of date day suffix strings. 
 @return An array of date day suffix strings.
*/ 
+ (NSArray *)suffixArray;

/** Returns the suffix for the day represented by the receiver. 
 @return The suffix for the day represented by the receiver, or an empty string if not found.
*/ 
- (NSString *)suffixForDay;

/**-------------------------------------------------------------------------------------
 @name Thread Safe NSCalendar
 ---------------------------------------------------------------------------------------
*/ 

/** Returns a thread safe gregorian calendar for the current user.
 
 The method returns a thread safe gregorian `NSCalendar` by making use of thread dictionary storage to return a seperate cached instance for each thread.  
 @return A thread safe gregorian calendar for the current user.
 */ 
+ (NSCalendar *)gregorianCalendar;

/** Returns a thread safe logical calendar for the current user.
 
 The method returns a thread safe logical `NSCalendar` by making use of thread dictionary storage to return a seperate cached instance for each thread.  
 @return A thread safe logical calendar for the current user.
*/ 
+ (NSCalendar *)currentCalendar;

/** Returns a thread safe autoupdating logical calendar for the current user.
 
 The method returns a thread safe `NSCalendar` by making use of thread dictionary storage to return a seperate cached instance for each thread.
 @return A thread safe autoupdating logical calendar for the current user.
*/ 
+ (NSCalendar *)autoupdatingCurrentCalendar;

/**-------------------------------------------------------------------------------------
 @name Thread Safe NSDateFormatter
 ---------------------------------------------------------------------------------------
*/ 

/** Returns a thread safe date formatter with the specified date format set.
 
 The method returns a thread safe `NSDateFormatter` by making use of thread dictionary storage to return a seperate cached instance for each thread.  
 @param dateFormat The date format for the receiver.
 @return A thread safe date formatter with the specified date format set.
*/ 
+ (NSDateFormatter *)dateFormatterWithDateFormat:(NSString *)dateFormat;

@end