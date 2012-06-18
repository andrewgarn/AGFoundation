//
//  NSNotificationCenter+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 08/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A collection of category extensions for `NSNotificationCenter` */
@interface NSNotificationCenter (AGCategory)

/** Adds a unique entry to the receiver’s dispatch table with an observer, a notification selector and optional criteria: notification name and sender.
 @param notificationObserver Object registering as an observer. This value must not be nil.
 @param notificationSelector that specifies the message the receiver sends notificationObserver to notify it of the notification posting. The method specified by notificationSelector must have one and only one argument (an instance of NSNotification).
 @param notificationName The name of the notification for which to register the observer; that is, only notifications with this name are delivered to the observer. If you pass nil, the notification center doesn’t use a notification’s name to decide whether to deliver it to the observer.
 @param notificationSender The object whose notifications the observer wants to receive; that is, only notifications sent by this sender are delivered to the observer.
 If you pass nil, the notification center doesn’t use a notification’s sender to decide whether to deliver it to the observer.
*/
+ (void)addUniqueObserver:(id)notificationObserver selector:(SEL)notificationSelector name:(NSString *)notificationName object:(id)notificationSender;

/** Posts a given notification on the main thread to the receiver.
 @param notification The notification to post. This value must not be nil.
 @exception NSException An exception is raised if notification is nil.
*/ 
+ (void)postNotificationOnMainThread:(NSNotification *)notification;

/** Posts a given notification on the main thread to the receiver and can optionally wait until done.
 @param notification The notification to post. This value must not be nil.
 @param wait A Boolean that specifies whether the current thread blocks until after the specified selector is performed on the receiver on the specified thread. Specify `YES` to block this thread; otherwise, specify `NO` to have this method return immediately.
 @exception NSException An exception is raised if notification is nil.
 */ 
+ (void)postNotificationOnMainThread:(NSNotification *)notification waitUntilDone:(BOOL)wait;

@end