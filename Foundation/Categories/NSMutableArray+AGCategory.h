//
//  NSMutableArray+AGCategory.h
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
- (void)enqueueObject_AG:(id)anObject;

/**
 Removes the first object from the receiver array and returns it.
 @return The object removed from the receiver array, or nil if the array is empty.
*/ 
- (id)dequeueObject_AG;

/**-------------------------------------------------------------------------------------
 @name Pushing and Popping Stack Items
 ---------------------------------------------------------------------------------------
*/ 

/**
 Adds the specified object to the end of the receiver array.
 @param anObject The object to add to the end of the receiver array.
*/ 
- (void)pushObject_AG:(id)anObject;

/**
 Removes the last object from the receiver array and returns it.
 @return The object removed from the receiver array, or nil if the array is empty.
*/ 
- (id)popObject_AG;

/**-------------------------------------------------------------------------------------
 @name Rearranging Content
 ---------------------------------------------------------------------------------------
 */ 

/** Returns the receiver array with the object order reversed.
 @return The receiver array with the order reversed.
*/
- (NSMutableArray *)reverse_AG;

/** Returns the receiver array with the object order randomised.
 @return The receiver array with the order randomised.
*/
- (NSMutableArray *)shuffle_AG;

@end