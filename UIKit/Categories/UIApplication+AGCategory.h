//
//  UIApplication+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 03/05/2012.
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

#import <UIKit/UIKit.h>

/** A collection of category extensions for `UIApplication` */
@interface UIApplication (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Debugging
 ---------------------------------------------------------------------------------------
*/ 

/** Indicates whether the application is currently being run under the debugger
 @return `YES` if the application is being run under the debugger, otherwise `NO`.
*/ 
+ (BOOL)isBeingDebugged_AG;

/** Indicates whether the application is currently not being run under the debugger
 @return `YES` if the application is not being run under the debugger, otherwise `NO`.
 */  
+ (BOOL)isNotBeingDebugged_AG;

/**-------------------------------------------------------------------------------------
 @name Detecting Piracy
 ---------------------------------------------------------------------------------------
*/ 

/** Indicates whether the application has been pirated.
 @return `YES` if the application has been pirated, otherwise `NO`.
*/ 
+ (BOOL)isPirated_AG;

/** Indicates whether the application has not been pirated.
 @return `YES` if the application has not been pirated, otherwise `NO`.
*/ 
+ (BOOL)isNotPirated_AG;

/**-------------------------------------------------------------------------------------
 @name Console Logging
 ---------------------------------------------------------------------------------------
*/

/** Returns the application's memory usage.
 @return The application's memory usage in megabytes.
*/
+ (NSNumber *)usedMemory_AG;

/** Logs the application's memory usage to the console. */
+ (void)logMemoryUsage_AG;

/** Logs the application launch to the console along with basic device information.
 @param launchOptions A dictionary indicating the reason the application was launched (if any). The contents of this dictionary may be empty in situations where the user launched the application directly.
*/ 
+ (void)logApplicationDidFinishLaunchingWithOptions_AG:(NSDictionary *)launchOptions;

/** Logs the application entering the background to the console along with basic device information. */ 
+ (void)logApplicationDidEnterBackground_AG;

/** Logs the application entering the foreground to the console along with basic device information. */ 
+ (void)logApplicationWillEnterForeground_AG;

/** Logs the application resigning active to the console along with basic device information. */ 
+ (void)logApplicationWillResignActive_AG;

/** Logs the application becoming active to the console along with basic device information. */ 
+ (void)logApplicationDidBecomeActive_AG;

/** Adds an observer to `NSNotificationCenter` to log to the console when the navigation controllers stack changes. */ 
+ (void)observeNavigationControllerStack_AG;

/**-------------------------------------------------------------------------------------
 @name Interface Orientation
 ---------------------------------------------------------------------------------------
*/ 

/** Returns a string representation of a given interface orientation. 
 @param interfaceOrientation An orientation of the application's user interface.
 @return A string representation of interfaceOrientation.
*/
+ (NSString *)stringFromInterfaceOrientation_AG:(UIInterfaceOrientation)interfaceOrientation;

/** Returns a boolean to indicate whether a device orientation is supported in the application's information property list.
 @param interfaceOrientation An orientation of the application's user interface.
 @return YES if the application's information property list allows the interfaceOrientation, otherwise NO.
*/ 
+ (BOOL)interfaceOrientationIsSupported_AG:(UIInterfaceOrientation)interfaceOrientation;

/** Returns all of the interface orientations that the application's property list supports.
 @return A bit mask specifying which orientations are supported in the application's information property list.
*/
+ (NSUInteger)supportedInterfaceOrientationMask;

/**-------------------------------------------------------------------------------------
 @name Local Notifications
 ---------------------------------------------------------------------------------------
*/ 

/** Returns an array of scheduled local notifications.
 @return An array of scheduled local notifications.
*/ 
+ (NSArray *)scheduledLocalNotifications_AG;

/** Returns an array of scheduled local notifications with the specified ordering.
 @param ascending A boolean to indicate whether the array should be sorted in ascending or not.
 @return An array of scheduled local notifications with the specified ordering.
*/ 
+ (NSArray *)scheduledLocalNotificationsSortedAscending_AG:(BOOL)ascending;

/**-------------------------------------------------------------------------------------
 @name Network Activity Indication
 ---------------------------------------------------------------------------------------
*/ 

/** Increments the number of network activity requests. If this number was zero before incrementing, this will start animating the network activity indicator. */
+ (void)showNetworkActivityIndicator_AG;

/** Decrements the number of network activity requests. If this number becomes zero after incrementing, this will stop animating the network activity indicator. */
+ (void)hideNetworkActivityIndicator_AG;

/** Stops the network activity indicator from animating and sets the number of network activity requests to zero. */ 
+ (void)hideNetworkActivityIndicatorNow_AG;

/**-------------------------------------------------------------------------------------
 @name First Responder
 ---------------------------------------------------------------------------------------
*/

/** Notifies the all receiver's that they have been asked to relinquish their status as first responder in their window. */
+ (void)resignFirstResponder_AG;

/**-------------------------------------------------------------------------------------
 @name URL Scheme Handling
 ---------------------------------------------------------------------------------------
*/

/** Returns whether the App Store application can be opened.
 @return YES if the application can be opened, otherwise NO.
*/
+ (BOOL)canOpenAppStore_AG;

/** Opens the App Store to view the application with the specified identifier.
 @param appId The application identifier to open the App Store with.
 @return YES if the App Store was successfully opened, otherwise NO.
*/
+ (BOOL)openAppStoreWithAppId_AG:(NSString *)appId;

/** Opens the App Store to gift the application with the specified identifier.
 @param appId The application identifier to open the App Store with.
 @return YES if the App Store was successfully opened, otherwise NO.
*/
+ (BOOL)openAppStoreToGiftAppWithAppId_AG:(NSString *)appId;

/** Opens the App Store to review the application with the specified identifier.
 @param appId The application identifier to open the App Store with.
 @return YES if the App Store was successfully opened, otherwise NO.
*/
+ (BOOL)openAppStoreToReviewAppWithAppId_AG:(NSString *)appId;

@end