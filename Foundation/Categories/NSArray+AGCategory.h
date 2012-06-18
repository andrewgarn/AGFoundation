//
//  NSArray+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 24/04/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A collection of category extensions for `NSArray` */
@interface NSArray (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Querying an Array
 ---------------------------------------------------------------------------------------
*/ 

/** Returns the first object in the array
 @return The object in the array with the lowest index value. If the array is empty, returns nil.
*/
- (id)firstObject;

/** Returns a random object in the array
 @return A random object in the array. If the array is empty, returns nil.
*/
- (id)randomObject;

/**-------------------------------------------------------------------------------------
 @name Rearranging Content
 ---------------------------------------------------------------------------------------
*/ 

/** Returns a new array with the object order reversed
 @return A new array with the receiver's objects in reverse order.
*/
- (NSArray *)reversedArray;

@end