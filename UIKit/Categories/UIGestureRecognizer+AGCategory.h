//
//  UIGestureRecognizer+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 09/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIGestureRecognizerSenderBlock)(id sender);

/** A collection of category extensions for `UIGestureRecognizer` */
@interface UIGestureRecognizer (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Adding and Removing Block Actions
 ---------------------------------------------------------------------------------------
*/

/** Adds a target block action to the internal dispatch table.
 @param block The block object called when the gesture is triggered.
 @warning This category currently only supports one block action at a time.
*/ 
- (void)addTargetBlock:(UIGestureRecognizerSenderBlock)block;

/** Removes the target block actions from the internal dispatch table. */ 
- (void)removeTargetBlock;

@end