//
//  AGHungQueueDetector.h
//  AGFoundation
//
//  Created by Andrew Garn on 22/10/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/** An `NSObject` subclass that will raise an exception when a targeted dispatch queue is blocked for more than a specified amount of time. */
@interface AGHungQueueDetector : NSObject

/** Initializes a new hung queue detector targeted at the main queue.
 @return The receiver, initialized to observe the main queue.
*/
- (id)initWithMainQueue;

/** Initializes a new hung queue detector targeted at the given dispatch queue.
 @param targetQueue The dispatch queue to observe.
 @return The receiver, initialized to observe the given queue.
*/
- (id)initWithTargetQueue:(dispatch_queue_t)targetQueue;

/** Initializes a new hung queue detector targeted at the given dispatch queue.
 @param targetQueue The dispatch queue to observe.
 @param detectionInterval The interval that the given queue must be blocked for the detector to raise an exception.
 @return The receiver, initialized to observe the given queue.
*/
- (id)initWithTargetQueue:(dispatch_queue_t)targetQueue interval:(CGFloat)detectionInterval;

/** Ends the hung queue detector's observation of the targeted dispatch queue */ 
- (void)stopObservingTargetedQueue;

@end