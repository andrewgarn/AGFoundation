//
//  UIControl+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 09/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIControlSenderBlock)(id sender);

/** A collection of category extensions for `UIControl` */
@interface UIControl (AGCategory)

/** Adds a target block action for a particular event (or events) to the internal dispatch table.
 @param block The block object called when the bar button is pressed.
 @param controlEvents A bitmask specifying the control events for which the action message is sent.
*/ 
- (void)addTargetBlock:(UIControlSenderBlock)block forControlEvents:(UIControlEvents)controlEvents;
 
/** Removes the target block action for a particular event (or events) from the internal dispatch table.
 @param controlEvents A bitmask specifying the control events for which the action message is sent.
*/ 
- (void)removeTargetBlockForControlEvents:(UIControlEvents)controlEvents;

@end