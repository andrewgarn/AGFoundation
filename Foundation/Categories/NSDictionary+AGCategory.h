//
//  NSDictionary+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 06/06/2012.
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

/** A collection of category extensions for `NSDictionary` */
@interface NSDictionary (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Getting Dictionary Values
 ---------------------------------------------------------------------------------------
*/ 

/**
 Returns the bool associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The boolean value associated with the specified key, or NO if the key was not found.
 @see [NSMutableDictionary(AGCategory) setBool_AG:forKey:]
*/ 
- (BOOL)boolForKey_AG:(id)aKey;

/**
 Returns the int associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The int value associated with the specified key, or zero if the key was not found.
 @see [NSMutableDictionary(AGCategory) setInt_AG:forKey:]
*/
- (int)intForKey_AG:(id)aKey;

/**
 Returns the float associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The float value associated with the specified key, or zero if the key was not found.
 @see [NSMutableDictionary(AGCategory) setFloat_AG:forKey:]
*/
- (float)floatForKey_AG:(id)aKey;

/**
 Returns the double associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The double value associated with the specified key, or zero if the key was not found.
 @see [NSMutableDictionary(AGCategory) setDouble_AG:forKey:]
*/
- (double)doubleForKey_AG:(id)aKey;

/**
 Returns the integer associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The integer value associated with the specified key, or zero if the key was not found.
 @see [NSMutableDictionary(AGCategory) setInteger_AG:forKey:]
*/
- (NSInteger)integerForKey_AG:(id)aKey;

/**
 Returns the date object associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The date object associated with the specified key, or nil if the key does not exist or its value is not an `NSDate` object.
*/
- (NSDate *)dateForKey_AG:(id)aKey;

/**
 Returns the string object associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The string object associated with the specified key, or nil if the key does not exist or its value is not an `NSString` object.
*/
- (NSString *)stringForKey_AG:(id)aKey;

/**
 Returns the number object associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The string object associated with the specified key, or nil if the key does not exist or its value is not an `NSNumber` object.
*/
- (NSNumber *)numberForKey_AG:(id)aKey;

/**
 Returns the array object associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The array associated with the specified key, or nil if the key does not exist or its value is not an `NSArray` object.
*/
- (NSArray *)arrayForKey_AG:(id)aKey;

/**
 Returns the dictionary object associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The dictionary object associated with the specified key, or nil if the key does not exist or its value is not an `NSDictionary` object.
*/
- (NSDictionary *)dictionaryForKey_AG:(id)aKey;

/**-------------------------------------------------------------------------------------
 @name Querying a Dictionary
 ---------------------------------------------------------------------------------------
*/ 

/**
 Returns a boolean value that indicates whether the receiver is not empty.
 @return `YES` if the receiver is not empty, otherwise `NO`.
*/
- (BOOL)isNotEmpty_AG;

/**
 Returns a boolean value that indicates whether the receiver contains a value associated with aKey
 @param aKey The key for which to check the corresponding value.
 @return `YES` if there is a value associated with aKey, otherwise `NO`.
*/
- (BOOL)containsObjectForKey_AG:(id)aKey;

/**
 Returns a new array containing the dictionary’s keys sorted alphabetically.
 @return A new array containing the dictionary’s keys sorted alphabetically, or an empty array if the dictionary has no entries.
*/
- (NSArray *)allKeysSorted_AG;

@end