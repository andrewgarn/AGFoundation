//
//  NSObject+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 16/05/2012.
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

/** A collection of category extensions for `NSObject` */
@interface NSObject (AGCategory)

typedef void (^AGVoidBlock)(void);

/**-------------------------------------------------------------------------------------
 @name Force Type or nil
 ---------------------------------------------------------------------------------------
*/ 

/** Forces a given object to the `NSDate` class or nil.
 @param anObject The object to be checked.
 @return Returns the given object if its an `NSDate`, otherwise nil.
*/
+ (NSDate *)forceDateOrNil_AG:(id)anObject;

/** Forces a given object to the `NSString` class or nil.
 @param anObject The object to be checked.
 @return Returns the given object if its an `NSString`, a string representation of the object, or nil if the object cannot be converted to a string.
*/
+ (NSString *)forceStringOrNil_AG:(id)anObject;

/** Forces a given object to the `NSNumber` class or nil.
 @param anObject The object to be checked.
 @return Returns the given object if its an `NSNumber`, otherwise nil.
*/
+ (NSNumber *)forceNumberOrNil_AG:(id)anObject;

/** Forces a given object to the `NSArray` class or nil.
 @param anObject The object to be checked.
 @return Returns the given object if its an `NSArray`, otherwise nil.
*/
+ (NSArray *)forceArrayOrNil_AG:(id)anObject;

/**-------------------------------------------------------------------------------------
 @name Comparison
 ---------------------------------------------------------------------------------------
*/ 

/** Returns a Boolean value that indicates whether the receiver is not empty.
 
 The method first checks that the receiver is not `[NSNull null]`, then if the receiver responds to `length` its length is greater than zero and finally the method checks that if the receiver responds to `count` it has a count greater than zero.
 @return `YES` if the receiver is not empty, otherwise `NO`.
*/
- (BOOL)isNotEmpty_AG;

/**-------------------------------------------------------------------------------------
 @name Perform Selector
 ---------------------------------------------------------------------------------------
 */ 

/** Invokes a method of the receiver on the current thread using the default mode after a delay.
 @param aSelector A selector that identifies the method to invoke. The method should not have a significant return value and should take a single argument of type id, or no arguments.
 @param delay The minimum time before which the message is sent. Specifying a delay of 0 does not necessarily cause the selector to be performed immediately. The selector is still queued on the thread’s run loop and performed as soon as possible.
 */
- (void)performSelector_AG:(SEL)aSelector afterDelay:(NSTimeInterval)delay;

/**-------------------------------------------------------------------------------------
 @name Associated Objects
 ---------------------------------------------------------------------------------------
*/ 
 
/** Strongly associates an object with the reciever.
 
 The associated value is retained as if it were a property
 synthesized with `nonatomic` and `retain`.
 
 Using retained association is strongly recommended for most
 Objective-C object derivative of NSObject, particularly
 when it is subject to being externally released or is in an
 `NSAutoreleasePool`.
 
 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 
 @param value Any object.
 @param key A unique key pointer.
*/
- (void)associateValue_AG:(id)value withKey:(const char *)key;

/** Strongly associates an object with the receiving class.
 
 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param value Any object.
 @param key A unique key pointer.
 @see associateValue_AG:withKey:
*/
+ (void)associateValue_AG:(id)value withKey:(const char *)key;

/** Associates a copy of an object with the reciever.
 
 The associated value is copied as if it were a property
 synthesized with `nonatomic` and `copy`.
 
 Using copied association is recommended for a block or
 otherwise `NSCopying`-compliant instances like NSString.
 
 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 
 @param value Any object, pointer, or value.
 @param key A unique key pointer.
*/
- (void)associateCopyOfValue_AG:(id)value withKey:(const char *)key;

/** Associates a copy of an object with the receiving class.
 
 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param value Any object, pointer, or value.
 @param key A unique key pointer.
 @see associateCopyOfValue_AG:withKey:
*/
+ (void)associateCopyOfValue_AG:(id)value withKey:(const char *)key;

/** Weakly associates an object with the reciever.
 
 A weak association will cause the pointer to be set to zero
 or nil upon the disappearance of what it references;
 in other words, the associated object is not kept alive.
 
 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param value Any object.
 @param key A unique key pointer.
*/
- (void)weaklyAssociateValue_AG:(id)value withKey:(const char *)key;

/** Weakly associates an object with the receiving class.
 
 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param value Any object.
 @param key A unique key pointer.
 @see weaklyAssociateValue_AG:withKey:
*/
+ (void)weaklyAssociateValue_AG:(id)value withKey:(const char *)key;

/** Returns the associated value for a key on the reciever.
 
 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param key A unique key pointer.
 @return The object associated with the key, or `nil` if not found.
*/
- (id)associatedValueForKey_AG:(const char *)key;

/** Returns the associated value for a key on the receiving class.
 
 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param key A unique key pointer.
 @return The object associated with the key, or `nil` if not found.
 @see associatedValueForKey_AG:
*/
+ (id)associatedValueForKey_AG:(const char *)key;

/** Returns the reciever to a clean state by removing all
 associated objects, releasing them if necessary.

 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
*/
- (void)removeAllAssociatedObjects_AG;

/** Returns the recieving class to a clean state by removing
 all associated objects, releasing them if necessary.

 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
*/
+ (void)removeAllAssociatedObjects_AG;

@end