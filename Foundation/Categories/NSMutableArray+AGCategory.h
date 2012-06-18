//
//  NSMutableArray+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 29/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A collection of category extensions for `NSMutableArray` */
@interface NSMutableArray (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Queueing and Dequeuing Stack Items
 ---------------------------------------------------------------------------------------
*/ 

/**
 Adds the specified object to the end of the receiver array.
 @param anObject The object to add to the end of the receiver array.
*/ 
- (void)enqueue:(id)anObject;

/**
 Removes the first object from the receiver array and returns it.
 @return The object removed from the receiver array, or nil if the array is empty.
*/ 
- (id)dequeue;

/**-------------------------------------------------------------------------------------
 @name Pushing and Popping Stack Items
 ---------------------------------------------------------------------------------------
*/ 

/**
 Adds the specified object to the end of the receiver array.
 @param anObject The object to add to the end of the receiver array.
*/ 
- (void)push:(id)anObject;

/**
 Removes the last object from the receiver array and returns it.
 @return The object removed from the receiver array, or nil if the array is empty.
*/ 
- (id)pop;

/**-------------------------------------------------------------------------------------
 @name Rearranging Content
 ---------------------------------------------------------------------------------------
 */ 

/** Returns the receiver array with the object order reversed
 @return The receiver array with the order reversed
*/
- (NSMutableArray *)reverse;

@end