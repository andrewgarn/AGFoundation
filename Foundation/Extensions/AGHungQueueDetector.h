//
//  AGHungQueueDetector.h
//  AGFoundation
//
//  Created by Andrew Garn on 22/10/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/** An `NSObject` subclass that will raise an exception when the targeted dispatch queue is blocked for longer than a specified amount of time.

 Adapted from a GitHub Gist by Peter Steinberger: https://gist.github.com/3933090
*/
@interface AGHungQueueDetector : NSObject

/**-------------------------------------------------------------------------------------
 @name Initializing an AGHungQueueDetector Object
 ---------------------------------------------------------------------------------------
*/

/** Initializes a new hung queue detector targeted at the main queue.
 @return The receiver, initialized to observe the main queue.
*/
- (id)initWithMainQueue;

/** Initializes a new hung queue detector targeted at the given dispatch queue.
 @param targetQueue The dispatch queue to observe.
 @return The receiver, initialized to observe the given queue.
*/
- (id)initWithTargetQueue:(dispatch_queue_t)targetQueue;

/**-------------------------------------------------------------------------------------
 @name Starting and Stopping Detection
 ---------------------------------------------------------------------------------------
*/

/** Starts the hung queue detector's observation of the targeted dispatch queue */
- (void)startObservingTargetedQueue;

/** Stops the hung queue detector's observation of the targeted dispatch queue */ 
- (void)stopObservingTargetedQueue;

/**-------------------------------------------------------------------------------------
 @name Working with Thread Properties
 ---------------------------------------------------------------------------------------
*/

/** Returns the name of the receiver. */
- (NSString *)name;

/** Sets the name of the receiver.
 @param name The name for the receiver.
*/
- (void)setName:(NSString *)name;

/** Returns the detection interval in use by the receiver. */
- (CGFloat)detectionInterval;

/** Sets the receiver's detection interval
 @param detectionInterval The detection interval for the receiver to use.
*/
- (void)setDetectionInterval:(CGFloat)detectionInterval;

@end