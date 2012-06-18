//
//  NSNumber+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 24/04/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A collection of category extensions for `NSNumber` */
@interface NSNumber (AGCategory)

/** Returns an NSNumber object created by parsing a given string using NSNumberFormatterDecimalStyle
 @param string An NSString object that is parsed to generate the returned number object.
 @return An NSNumber object created by parsing string using the NSNumberFormatterDecimalStyle.
*/
+ (NSNumber *)numberFromString:(NSString *)string;

/** Returns an NSNumber object created by parsing a given string using the supplied style
 @param style The NSNumberFormatterStyle the formatter should use when parsing the string
 @return An NSNumber object created by parsing string using the supplied style.
*/ 
- (NSString *)stringWithNumberStyle:(NSNumberFormatterStyle)style;

@end
