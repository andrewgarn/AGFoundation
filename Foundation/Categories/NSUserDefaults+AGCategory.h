//
//  NSUserDefaults+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 29/05/2012.
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

/** A collection of category extensions for `NSUserDefaults` */
@interface NSUserDefaults (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Getting Default Values
 ---------------------------------------------------------------------------------------
*/ 

/**
 Returns the bool associated with the specified key.
 @param defaultName A key in the current user's defaults database.
 @return The bool associated with the specified key.
 @see setBool:forKey:
*/ 
+ (BOOL)boolForKey:(NSString *)defaultName;

/**
 Returns the float associated with the specified key.
 @param defaultName A key in the current user's defaults database.
 @return The float associated with the specified key.
 @see setFloat:forKey:
*/ 
+ (float)floatForKey:(NSString *)defaultName;

/**
 Returns the double associated with the specified key.
 @param defaultName A key in the current user's defaults database.
 @return The double associated with the specified key.
 @see setDouble:forKey:
*/ 
+ (double)doubleForKey:(NSString *)defaultName;

/**
 Returns the integer associated with the specified key.
 @param defaultName A key in the current user's defaults database.
 @return The integer associated with the specified key.
 @see setInteger:forKey:
*/ 
+ (NSInteger)integerForKey:(NSString *)defaultName;

/**
 Returns the object associated with the first occurrence of the specified default.
 @param defaultName A key in the current user's defaults database.
 @return The object associated with the specified key, or nil if the key was not found.
 @see setObject:forKey:
*/ 
+ (id)objectForKey:(NSString *)defaultName;

/**
 Returns the NSURL instance associated with the specified key.
 @param defaultName A key in the current user's defaults database.
 @return The NSURL instance associated with the specified key, or nil if the key was not found.
 @see setURL:forKey:
*/ 
+ (NSURL *)URLForKey:(NSString *)defaultName;

/**
 Returns the data object associated with the specified key.
 @param defaultName A key in the current user's defaults database.
 @return The data object associated with the specified key, or nil if the key does not exist or its value is not an NSData object.
 @see setData:forKey:
*/
+ (NSData *)dataForKey:(NSString *)defaultName;

/**
 Returns the array associated with the specified key.
 @param defaultName A key in the current user's defaults database.
 @return The array associated with the specified key, or nil if the key does not exist or its value is not an NSArray object.
 @see setArray:forKey:
*/
+ (NSArray *)arrayForKey:(NSString *)defaultName;

/**
 Returns the string associated with the specified key
 @param defaultName A key in the current user's defaults database.
 @return The string associated with the specified key, or nil if the default does not exist or does not contain a string.
 @see setArray:forKey:
*/
+ (NSString *)stringForKey:(NSString *)defaultName;

/**
 Returns the array of strings associated with the specified key.
 @param defaultName A key in the current user's defaults database.
 @return  The array of NSString objects, or nil if the specified default does not exist, the default does not contain an array, or the array does not contain NSString objects.
 @see setStringArray:forKey:
*/
+ (NSArray *)stringArrayForKey:(NSString *)defaultName;

/**
 Returns the dictionary object associated with the specified key.
 @param defaultName A key in the current user's defaults database.
 @return The dictionary object associated with the specified key, or nil if the key does not exist or its value is not an NSDictionary object.
 @see setDictionary:forKey:
*/
+ (NSDictionary *)dictionaryForKey:(NSString *)defaultName;

/**
 Returns the color object associated with the specified key.
 @param defaultName A key in the current user's defaults database.
 @return The color object associated with the specified key, or nil if the key does not exist or its value is not an UIColor object.
 @see setColor:forKey:
*/
+ (UIColor *)colorForKey:(NSString *)defaultName;

/**
 Returns the range associated with the specified key.
 @param defaultName A key in the current user's defaults database.
 @return The range associated with the specified key, or NSMakeRange(0, 0) if the key does not exist or its value is not a NSRange.
 @see setRange:forKey:
*/
+ (NSRange)rangeForKey:(NSString *)defaultName;

/**
 Returns the point associated with the specified key.
 @param defaultName A key in the current user's defaults database.
 @return The point associated with the specified key, or CGPointZero if the key does not exist or its value is not a CGPoint.
 @see setPoint:forKey:
*/
+ (CGPoint)pointForKey:(NSString *)defaultName;

/**
 Returns the size associated with the specified key.
 @param defaultName A key in the current user's defaults database.
 @return The point associated with the specified key, or CGSizeZero if the key does not exist or its value is not a CGSize.
 @see setSize:forKey:
*/
+ (CGSize)sizeForKey:(NSString *)defaultName;

/**
 Returns the rect associated with the specified key.
 @param defaultName A key in the current user's defaults database.
 @return The rect associated with the specified key, or CGRectZero if the key does not exist or its value is not a CGRect.
 @see setRect:forKey:
*/
+ (CGRect)rectForKey:(NSString *)defaultName;

/**-------------------------------------------------------------------------------------
 @name Setting Default Values
 ---------------------------------------------------------------------------------------
*/ 

/**
 Sets the value of the specified default key to the specified Boolean value.
 @param value The Boolean value to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see boolForKey:
*/
+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key to the specified Float value.
 @param value The Float value to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see floatForKey:
*/
+ (void)setFloat:(float)value forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key to the specified Double value.
 @param value The Double value to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see doubleForKey:
*/
+ (void)setDouble:(double)value forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key to the specified Integer value.
 @param value The Integer value to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see integerForKey:
*/
+ (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key in the standard application domain.
 @param object The object to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see objectForKey:
*/
+ (void)setObject:(id)object forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key to the specified URL.
 @param url The NSURL to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see objectForKey:
*/
+ (void)setURL:(NSURL *)url forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key to the specified object.
 @param data The NSData to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see dataForKey:
*/
+ (void)setData:(NSData *)data forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key to the specified object.
 @param array The NSArray to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see arrayForKey:
*/
+ (void)setArray:(NSArray *)array forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key to the specified object.
 @param string The NSString to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see stringForKey:
*/
+ (void)setString:(NSString *)string forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key to the specified object.
 @param stringArray The NSArray containing NSString objects to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see stringArrayForKey:
*/
+ (void)setStringArray:(NSArray *)stringArray forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key to the specified object.
 @param dictionary The NSDictionary to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see dictionaryForKey:
*/
+ (void)setDictionary:(NSDictionary *)dictionary forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key to the specified object.
 @param color The UIColor to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see colorForKey:
*/
+ (void)setColor:(UIColor *)color forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key to the specified object.
 @param range The NSRange to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see rangeForKey:
*/
+ (void)setRange:(NSRange)range forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key to the specified object.
 @param point The CGPoint to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see pointForKey:
*/
+ (void)setPoint:(CGPoint)point forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key to the specified object.
 @param size The CGSize to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see sizeForKey:
*/
+ (void)setSize:(CGSize)size forKey:(NSString *)defaultName;

/**
 Sets the value of the specified default key to the specified object.
 @param rect The CGRect to store in the defaults database.
 @param defaultName The key with which to associate with the value.
 @see rectForKey:
*/
+ (void)setRect:(CGRect)rect forKey:(NSString *)defaultName;

@end