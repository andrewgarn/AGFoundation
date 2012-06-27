//
//  NSDate+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 24/04/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

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

/** Returns a formatted date time string from the receiver relative to the current date.
 @return A formatted date time string from the receiver relative to the current date.
*/ 
- (NSString *)relativeDateTimeString;

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

/** Returns a thread safe date formatter.
 
 The method returns a thread safe `NSDateFormatter` by making use of thread dictionary storage to return a seperate cached instance for each thread.  
 @return A thread safe date formatter.
*/ 
+ (NSDateFormatter *)dateFormatter;

/** Returns a thread safe date formatter with the specified date format set.
 
 The method returns a thread safe `NSDateFormatter` by making use of thread dictionary storage to return a seperate cached instance for each thread.  
 @param dateFormat The date format for the receiver.
 @return A thread safe date formatter with the specified date format set.
*/ 
+ (NSDateFormatter *)dateFormatterWithdateFormat:(NSString *)dateFormat;

@end