//
//  NSNotificationCenter+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 08/06/2012.
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

/** A collection of category extensions for `NSNotificationCenter` */
@interface NSNotificationCenter (AGCategory)

/** Adds a unique entry to the receiver’s dispatch table with an observer, a notification selector and optional criteria: notification name and sender.
 @param observer Object registering as an observer. This value must not be nil.
 @param selector that specifies the message the receiver sends notificationObserver to notify it of the notification posting. The method specified by notificationSelector must have one and only one argument (an instance of NSNotification).
 @param notificationName The name of the notification for which to register the observer; that is, only notifications with this name are delivered to the observer. If you pass nil, the notification center doesn’t use a notification’s name to decide whether to deliver it to the observer.
 @param sender The object whose notifications the observer wants to receive; that is, only notifications sent by this sender are delivered to the observer.
 If you pass nil, the notification center doesn’t use a notification’s sender to decide whether to deliver it to the observer.
*/
+ (void)addUniqueObserver:(id)observer selector:(SEL)selector name:(NSString *)notificationName object:(id)sender;

/** Adds a unique entry to the receiver’s dispatch table with an observer, a notification selector and notification name.
 @param observer Object registering as an observer. This value must not be nil.
 @param selector that specifies the message the receiver sends notificationObserver to notify it of the notification posting. The method specified by notificationSelector must have one and only one argument (an instance of NSNotification).
 @param notificationName The name of the notification for which to register the observer; that is, only notifications with this name are delivered to the observer. If you pass nil, the notification center doesn’t use a notification’s name to decide whether to deliver it to the observer.
 If you pass nil, the notification center doesn’t use a notification’s sender to decide whether to deliver it to the observer.
*/
+ (void)addUniqueObserver:(id)observer selector:(SEL)selector name:(NSString *)notificationName;

/** Posts a given notification on the main thread to the receiver.
 @param notification The notification to post. This value must not be nil.
 @exception NSException An exception is raised if notification is nil.
*/ 
+ (void)postNotificationOnMainThread:(NSNotification *)notification;

@end