//
//  AGHungQueueDetector.h
//  AGFoundation
//
//  Created by Andrew Garn on 22/10/2012.
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
#import <UIKit/UIKit.h>

/** An `NSObject` subclass that will raise an exception when the targeted dispatch queue is blocked for longer than a specified time interval.

 Adapted from a GitHub Gist by Peter Steinberger: https://gist.github.com/3933090.
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