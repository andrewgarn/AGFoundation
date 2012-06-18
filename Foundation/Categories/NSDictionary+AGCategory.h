//
//  NSDictionary+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 06/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

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
 @see [NSMutableDictionary(AGCategory) setBool:forKey:]
*/ 
- (BOOL)boolForKey:(id)aKey;

/**
 Returns the int associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The int value associated with the specified key, or zero if the key was not found.
 @see [NSMutableDictionary(AGCategory) setInt:forKey:]
*/
- (int)intForKey:(id)aKey;

/**
 Returns the float associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The float value associated with the specified key, or zero if the key was not found.
 @see [NSMutableDictionary(AGCategory) setFloat:forKey:]
*/
- (float)floatForKey:(id)aKey;

/**
 Returns the double associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The double value associated with the specified key, or zero if the key was not found.
 @see [NSMutableDictionary(AGCategory) setDouble:forKey:]
*/
- (double)doubleForKey:(id)aKey;

/**
 Returns the integer associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The integer value associated with the specified key, or zero if the key was not found.
 @see [NSMutableDictionary(AGCategory) setInteger:forKey:]
*/
- (NSInteger)integerForKey:(id)aKey;

/**
 Returns the date object associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The date object associated with the specified key, or nil if the key does not exist or its value is not an `NSDate` object.
*/
- (NSDate *)dateForKey:(id)aKey;

/**
 Returns the string object associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The string object associated with the specified key, or nil if the key does not exist or its value is not an `NSString` object.
*/
- (NSString *)stringForKey:(id)aKey;

/**
 Returns the number object associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The string object associated with the specified key, or nil if the key does not exist or its value is not an `NSNumber` object.
*/
- (NSNumber *)numberForKey:(id)aKey;

/**
 Returns the array object associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The array associated with the specified key, or nil if the key does not exist or its value is not an `NSArray` object.
*/
- (NSArray *)arrayForKey:(id)aKey;

/**
 Returns the dictionary object associated with the specified key.
 @param aKey The key for which to return the corresponding value.
 @return The dictionary object associated with the specified key, or nil if the key does not exist or its value is not an `NSDictionary` object.
*/
- (NSDictionary *)dictionaryForKey:(id)aKey;

/**-------------------------------------------------------------------------------------
 @name Querying a Dictionary
 ---------------------------------------------------------------------------------------
*/ 

/**
 Returns a boolean value that indicates whether the receiver is empty.
 @return `YES` if the receiver is empty, otherwise `NO`.
*/
- (BOOL)isEmpty;

/**
 Returns a boolean value that indicates whether the receiver is not empty.
 @return `YES` if the receiver is not empty, otherwise `NO`.
*/
- (BOOL)isNotEmpty;

/**
 Returns a boolean value that indicates whether the receiver contains a value associated with aKey
 @param aKey The key for which to check the corresponding value.
 @return `YES` if there is a value associated with aKey, otherwise `NO`.
*/
- (BOOL)containsObjectForKey:(id)aKey;

/**
 Returns a new array containing the dictionary’s keys sorted alphabetically.
 @return A new array containing the dictionary’s keys sorted alphabetically, or an empty array if the dictionary has no entries.
*/
- (NSArray *)allKeysSorted;

@end