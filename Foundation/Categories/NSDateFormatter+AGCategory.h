//
//  NSDateFormatter+AGCategory.h
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

#import <Foundation/Foundation.h>

@interface NSDateFormatter (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Thread Safe NSDateFormatter
 ---------------------------------------------------------------------------------------
*/

/** Returns a thread safe date formatter with the specified date format set.
 
 The method returns a thread safe `NSDateFormatter` by making use of thread dictionary storage to return a seperate cached instance for each thread.
 @param dateFormat The date format for the receiver.
 @return A thread safe date formatter with the specified date format set.
 */
+ (NSDateFormatter *)dateFormatterWithDateFormat_AG:(NSString *)dateFormat;

/** Returns a thread safe date formatter with the specified date format set.
 
 The method returns a thread safe `NSDateFormatter` by making use of thread dictionary storage to return a seperate cached instance for each thread.
 @param dateFormat The date format for the receiver.
 @param localeIdentifier The identifier for the new locale.
 @return A thread safe date formatter with the specified date format and locale set.
 */
+ (NSDateFormatter *)dateFormatterWithDateFormat_AG:(NSString *)dateFormat withLocaleIdentifier:(NSString *)localeIdentifier;

@end