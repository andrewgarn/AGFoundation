//
//  NSArray+AGCategory.h
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

/** A collection of category extensions for `NSArray` */
@interface NSArray (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Querying an Array
 ---------------------------------------------------------------------------------------
*/ 

/** Returns the first object in the array
 @return The object in the array with the lowest index value. If the array is empty, returns nil.
*/
- (id)firstObject_AG;

/** Returns a random object in the array
 @return A random object in the array. If the array is empty, returns nil.
*/
- (id)randomObject_AG;

/** Returns a Boolean value that indicates whether an object of the given class is present in the array.
 @param aClass A class object.
 @return `YES` if an object of the given class is present, otherwise `NO`.
*/
- (BOOL)containsObjectOfClass_AG:(Class)aClass;

/** Returns a new array containing the receiving array’s elements which are the kind of the given class.
 @param aClass A class object.
 @return A subarray containing the receiving array’s elements which are the kind of the given class.
*/
- (NSArray *)subarrayWithObjectsOfClass:(Class)aClass;

/** Returns the object located at index, or nil if the index is beyond the end of the array
 @param index An index within the bounds of the array.
 @return The object located at index, or nil.
*/
- (id)objectAtIndex_AG:(NSUInteger)index;

/** Returns the bool value of the object located at the given index.
 @param index An index within the bounds of the array.
 @return The bool value of the object at the given index, or NO if the object cannot be converted into a bool. 
*/
- (BOOL)boolAtIndex_AG:(NSUInteger)index;

/** Returns the int value of the object located at the given index
 @param index An index within the bounds of the array.
 @return The int value of the object at the given index, or zero if the object cannot be converted into an int.
*/
- (int)intAtIndex_AG:(NSUInteger)index;

/** Returns the integer value of the object located at the given index
 @param index An index within the bounds of the array.
 @return The integer value of the object at the given index, or zero if the object cannot be converted into an integer.
*/
- (NSInteger)integerAtIndex_AG:(NSUInteger)index;

/** Returns the float value of the object located at the given index
 @param index An index within the bounds of the array.
 @return The float value of the object at the given index, or zero if the object cannot be converted into an float.
*/
- (float)floatAtIndex_AG:(NSUInteger)index;

/** Returns the double value of the object located at the given index
 @param index An index within the bounds of the array.
 @return The double value of the object at the given index, or zero if the object cannot be converted into an double.
*/
- (double)doubleAtIndex_AG:(NSUInteger)index;

/**-------------------------------------------------------------------------------------
 @name Sorting Content
 ---------------------------------------------------------------------------------------
*/

/** Returns a copy of the receiving array sorted with the specified key and ordering.
 @param key The property key to use when performing a comparison.
 @param ascending `YES` if the receiver specifies sorting in ascending order, otherwise `NO`.
 @return A copy of the receiving array sorted with the specified key and ordering.
*/ 
- (NSArray *)sortedArrayUsingSortDescriptorKey_AG:(NSString *)key ascending:(BOOL)ascending;

/**-------------------------------------------------------------------------------------
 @name Rearranging Content
 ---------------------------------------------------------------------------------------
*/ 

/** Returns a new array with the object order reversed
 @return A new array with the receiver's objects in reverse order.
*/
- (NSArray *)reversedArray_AG;

/** Returns a new array with the object order randomised
 @return A new array with the receiver's objects in random order.
*/
- (NSArray *)shuffledArray_AG;

@end