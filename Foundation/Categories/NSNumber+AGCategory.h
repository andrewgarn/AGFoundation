//
//  NSNumber+AGCategory.h
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

/** A collection of category extensions for `NSNumber` */
@interface NSNumber (AGCategory)

/**-------------------------------------------------------------------------------------
 @name String Conversion
 ---------------------------------------------------------------------------------------
*/

/** Returns an `NSNumber` object created by parsing a given string using `NSNumberFormatterDecimalStyle`
 @param string An `NSString` object that is parsed to generate the returned number object.
 @return An `NSNumber` object created by parsing string using the `NSNumberFormatterDecimalStyle`.
*/
+ (NSNumber *)numberFromString_AG:(NSString *)string;

/** Returns an NSNumber object created by parsing a given string using the supplied style
 @param style The NSNumberFormatterStyle the formatter should use when parsing the string
 @return An NSNumber object created by parsing string using the supplied style.
*/ 
- (NSString *)stringWithNumberStyle_AG:(NSNumberFormatterStyle)style;

/**-------------------------------------------------------------------------------------
 @name Byte Conversion
 ---------------------------------------------------------------------------------------
*/

/** Returns an `NSString` description of the byte value represented by the receiver.
 @return An `NSString` description of the byte value represented by the receiver.
*/
- (NSString *)humanReadableBytes_AG;

/** Returns an `NSString` description of the byte value represented by the receiver.
 @param decimalPlaces The decimal place accuracy of the byte description to be returned.
 @return An `NSString` description of the byte value represented by the receiver.
*/
- (NSString *)humanReadableBytesWithDecimalPlaceAccuracy_AG:(NSInteger)decimalPlaces;

@end