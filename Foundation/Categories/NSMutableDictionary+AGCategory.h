//
//  NSMutableDictionary+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 08/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A collection of category extensions for `NSMutableDictionary` */
@interface NSMutableDictionary (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Setting Dictionary Key-Value Pairs
 ---------------------------------------------------------------------------------------
*/ 

/**
 Adds a given key-value pair to the dictionary.
 @param value The boolean you wish to add to the dictionary
 @param key The key for value. The key must not be nil.
 @see [NSDictionary(AGCategory) boolForKey:]
*/
- (void)setBool:(BOOL)value forKey:(id)key;

/**
 Adds a given key-value pair to the dictionary.
 @param value The int you wish to add to the dictionary
 @param key The key for value. The key must not be nil.
 @see [NSDictionary(AGCategory) intForKey:]
*/
- (void)setInt:(BOOL)value forKey:(id)key;

/**
 Adds a given key-value pair to the dictionary.
 @param value The float you wish to add to the dictionary
 @param key The key for value. The key must not be nil.
 @see [NSDictionary(AGCategory) floatForKey:]
*/
- (void)setFloat:(BOOL)value forKey:(id)key;

/**
 Adds a given key-value pair to the dictionary.
 @param value The double you wish to add to the dictionary
 @param key The key for value. The key must not be nil.
 @see [NSDictionary(AGCategory) doubleForKey:]
*/
- (void)setDouble:(BOOL)value forKey:(id)key;

/**
 Adds a given key-value pair to the dictionary.
 @param value The integer you wish to add to the dictionary
 @param key The key for value. The key must not be nil.
 @see [NSDictionary(AGCategory) integerForKey:]
*/
- (void)setInteger:(BOOL)value forKey:(id)key;

@end