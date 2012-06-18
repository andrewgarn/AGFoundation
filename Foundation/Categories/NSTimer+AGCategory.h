//
//  NSTimer+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 10/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AGTimerBlock)(NSTimer *timer);

/** A collection of category extensions for `NSTimer` */
@interface NSTimer (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Creating a Timer
 ---------------------------------------------------------------------------------------
*/ 

/** Creates and returns a new NSTimer object and schedules it on the current run loop in the default mode.
 @param seconds The number of seconds between firings of the timer. If seconds is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead.
 @param repeats If YES, the timer will repeatedly reschedule itself until invalidated. If NO, the timer will be invalidated after it fires.
 @param block The block to perform when the timer fires.
 @return The newly initialized timer.
*/ 
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats targetBlock:(AGTimerBlock)block;

/** Creates and returns a new NSTimer object and schedules it on the current run loop in the default mode.
 @param seconds The number of seconds between firings of the timer. If seconds is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead.
 @param userInfo The user info for the timer. The object you specify is retained by the timer and released when the timer is invalidated. This parameter may be nil.
 @param repeats If YES, the timer will repeatedly reschedule itself until invalidated. If NO, the timer will be invalidated after it fires.
 @param block The block to perform when the timer fires.
 @return The newly initialized timer.
*/ 
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds userInfo:(id)userInfo repeats:(BOOL)repeats targetBlock:(AGTimerBlock)block;

/** Creates and returns a new NSTimer object initialized with the specified block callback
 @param seconds The number of seconds between firings of the timer. If seconds is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead.
 @param repeats If YES, the timer will repeatedly reschedule itself until invalidated. If NO, the timer will be invalidated after it fires.
 @param block The block to perform when the timer fires.
 @return The newly initialized timer.
*/ 
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats targetBlock:(AGTimerBlock)block;

/** Creates and returns a new NSTimer object initialized with the specified block callback
 @param seconds The number of seconds between firings of the timer. If seconds is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead.
 @param userInfo The user info for the timer. The object you specify is retained by the timer and released when the timer is invalidated. This parameter may be nil.
 @param repeats If YES, the timer will repeatedly reschedule itself until invalidated. If NO, the timer will be invalidated after it fires.
 @param block The block to perform when the timer fires.
 @return The newly initialized timer.
*/ 
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds userInfo:(id)userInfo repeats:(BOOL)repeats targetBlock:(AGTimerBlock)block;

@end