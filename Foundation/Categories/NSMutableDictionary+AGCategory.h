//
//  NSMutableDictionary+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 08/06/2012.
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