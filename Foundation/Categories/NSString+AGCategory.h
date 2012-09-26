//
//  NSString+AGCategory.h
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
#import <UIKit/UIKit.h>

/** A collection of category extensions for `NSString` */
@interface NSString (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Identifying and Comparing Strings
 ---------------------------------------------------------------------------------------
*/

/** Returns a Boolean value that indicates whether the receiver is not empty.
 
 The receiver is considered empty if its length is zero after removing whitespace.
 @return `YES` if the receiver is considered not empty, otherwise `NO`.
*/ 
- (BOOL)isNotEmpty;

/**-------------------------------------------------------------------------------------
 @name Finding Characters and Substrings
 ---------------------------------------------------------------------------------------
*/

/** Returns a Boolean value that indicates whether the receiver contains a specific string.
 @param aString The string to search for within the receiver.
 @return `YES` if the receiver contains the string, otherwise `NO`.
*/ 
- (BOOL)containsString:(NSString *)aString;

/** Returns a string object containing the characters of the receiver that lie between the first occurrences of the supplied strings
 @param firstString The first string to look for within the receiver.
 @param secondString The second string to look for within the receiver.
 @return A string object containing the characters of the receiver that lie between the first occurrences of the supplied strings, or nil if one or both are not found.
*/
- (NSString *)stringBetweenString:(NSString *)firstString andString:(NSString *)secondString;

/** Returns an array of ranges where the supplied string were found within the receiver.
 @param aString The string to search for within the receiver.
 @return An array of `NSRange` structs, each of which identifies an instance of the string contained within the receiver. If the string is not found an empty array is returned.
*/ 
- (NSArray *)rangesOfString:(NSString *)aString;

/**-------------------------------------------------------------------------------------
 @name Manipulating
 ---------------------------------------------------------------------------------------
*/

/** Returns a new string with the character order reversed.
 @return A new string with the receiver's characters in reverse order.
*/ 
- (NSString *)reversedString;

/**-------------------------------------------------------------------------------------
 @name Trimming
 ---------------------------------------------------------------------------------------
*/

/** Returns a new string made by removing whitespace and new line characters from both ends of the receiver.
 @return A new string made by removing whitespace and new line characters from both ends of the receiver. If the receiver is composed entirely of whitespace and new line characters, an empty string is returned.
*/ 
- (NSString *)stringByTrimmingWhitespaceAndNewlineCharacters;

/** Returns a new string made by removing leading whitespace and new line characters from the receiver.
 @return A new string made by removing leading whitespace and new line characters from the receiver. If the receiver is composed entirely of whitespace and new line characters, an empty string is returned.
*/ 
- (NSString *)stringByTrimmingLeadingWhitespaceAndNewlineCharacters;

/** Returns a new string made by removing trailing whitespace and new line characters from the receiver.
 @return A new string made by removing trailing whitespace and new line characters from the receiver. If the receiver is composed entirely of whitespace and new line characters, an empty string is returned.
*/ 
- (NSString *)stringByTrimmingTrailingWhitespaceAndNewlineCharacters;

/**-------------------------------------------------------------------------------------
 @name URL Encoding
 ---------------------------------------------------------------------------------------
*/ 

/** Returns a url encoded representation of the receiver.
 @return The receiver url encoded to escape unsafe ASCII characters.
*/ 
- (NSString *)urlEncodedString;

/** Returns a url decoded representation of the receiver.
 @return The receiver url decoded to unescape previously escaped ASCII characters.
*/ 
- (NSString *)urlDecodedString;

/**-------------------------------------------------------------------------------------
 @name Text Height
 ---------------------------------------------------------------------------------------
*/ 

/** Returns the height of the string if it were rendered and constrained to the specified width.
 @param font The font to use for computing the string size.
 @param width The maximum acceptable width for the string. This value is used to calculate where line breaks and wrapping would occur.
 @return The height of the resulting string’s bounding box.
*/ 
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

/** Returns the height of the string if it were rendered and constrained to the specified width.
 @param font The font to use for computing the string size.
 @param width The maximum acceptable width for the string. This value is used to calculate where line breaks and wrapping would occur.
 @param minHeight The minimum height the method should return.
 @return The height of the resulting string’s bounding box.
*/
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width min:(CGFloat)minHeight;

/** Returns the height of the string if it were rendered and constrained to the specified width.
 @param font The font to use for computing the string size.
 @param size The maximum acceptable size for the string. This value is used to calculate where line breaks and wrapping would occur.
 @param minHeight The minimum height the method should return.
 @return The height of the resulting string’s bounding box.
*/
- (CGFloat)heightWithFont:(UIFont *)font constrainedToSize:(CGSize)size min:(CGFloat)minHeight;

/** Returns the height of the string if it were rendered and constrained to the specified width.
 @param font The font to use for computing the string size.
 @param width The maximum acceptable width for the string. This value is used to calculate where line breaks and wrapping would occur.
 @param lineBreakMode The line break options for computing the size of the string.
 @return The height of the resulting string’s bounding box.
*/ 
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineBreakMode:(UILineBreakMode)lineBreakMode;

/** Returns the height of the string if it were rendered and constrained to the specified width.
 @param font The font to use for computing the string size.
 @param width The maximum acceptable width for the string. This value is used to calculate where line breaks and wrapping would occur.
 @param lineBreakMode The line break options for computing the size of the string.
 @param minHeight The minimum height the method should return.
 @return The height of the resulting string’s bounding box.
*/
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineBreakMode:(UILineBreakMode)lineBreakMode min:(CGFloat)minHeight;

/** Returns the height of the string if it were rendered and constrained to the specified width.
 @param font The font to use for computing the string size.
 @param size The maximum acceptable size for the string. This value is used to calculate where line breaks and wrapping would occur.
 @param lineBreakMode The line break options for computing the size of the string.
 @param minHeight The minimum height the method should return.
 @return The height of the resulting string’s bounding box.
*/
- (CGFloat)heightWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(UILineBreakMode)lineBreakMode min:(CGFloat)minHeight;

/**-------------------------------------------------------------------------------------
 @name Validation
 ---------------------------------------------------------------------------------------
*/ 

/** Returns a Boolean value that indicates whether the receiver is a valid email address.
 @return `YES` if the receiver is a valid email address, otherwise `NO`.
*/ 
- (BOOL)isValidEmailAddress;

/** Returns a Boolean value that indicates whether the receiver is a valid alphanumeric.
 @return `YES` if the receiver is a alphanumeric, otherwise `NO`.
*/
- (BOOL)isAlphaNumeric;

/**-------------------------------------------------------------------------------------
 @name Generating a Unique Identifier
 ---------------------------------------------------------------------------------------
*/

/** Returns a universally unique identifier string object.
 @return A universally unique identifier string object.
*/
+ (NSString *)UUIDStringCreate;

/**-------------------------------------------------------------------------------------
 @name File Backup Prevention
 ---------------------------------------------------------------------------------------
*/

/** Attempts to construct an NSURL from the receiver and apply the "do not backup" attribute to it.
 @return `YES` if the operation was successful, otherwise `NO`.
*/
- (BOOL)addSkipBackupAttribute;

/**-------------------------------------------------------------------------------------
 @name Cryptographic Hashing
 ---------------------------------------------------------------------------------------
*/

/** Returns the MD5 hash of the receiver.
 @return The MD5 hash of the receiver.
*/
- (NSString *)MD5Hash;

/** Returns the SHA1 hash of the receiver.
 @return The SHA1 hash of the receiver.
*/
- (NSString *)SHA1Hash;

/** Returns the SHA256 hash of the receiver.
 @return The SHA256 hash of the receiver.
*/
- (NSString *)SHA256Hash;

/** Returns the SHA512 hash of the receiver.
 @return The SHA512 hash of the receiver.
*/
- (NSString *)SHA512Hash;

/** Returns a Hash-based Message Authentication Code (HMAC) of the receiver.
 @param secret An `NSString` object to use in conjunction with the receiver to generate the HMAC.
 @return The hash-based message authentication code of the receiver.
*/
- (NSString *)HMACWithSecret:(NSString *)secret;

@end