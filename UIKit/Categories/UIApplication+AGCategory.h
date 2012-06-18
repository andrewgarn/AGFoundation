//
//  UIApplication+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 03/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

/** A collection of category extensions for `UIApplication` */
@interface UIApplication (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Debugging
 ---------------------------------------------------------------------------------------
*/ 

/** Indicates whether the application is currently being run under the debugger
 @return YES if the application is being run under the debugger, otherwise NO.
*/ 
+ (BOOL)isBeingDebugged;

/** Indicates whether the application is currently not being run under the debugger
 @return YES if the application is not being run under the debugger, otherwise NO.
 */  
+ (BOOL)isNotBeingDebugged;

/**-------------------------------------------------------------------------------------
 @name Detecting Piracy
 ---------------------------------------------------------------------------------------
*/ 

/** Indicates whether the application has been pirated
 @return YES if the application has been pirated, otherwise NO.
*/ 
+ (BOOL)isPirated;

/**-------------------------------------------------------------------------------------
 @name Console Logging
 ---------------------------------------------------------------------------------------
*/ 

/** Logs the memory currently in use. */ 
+ (void)logMemoryUsage;

/** Logs the application launch to the console along with basic device information.
 @param launchOptions A dictionary indicating the reason the application was launched (if any). The contents of this dictionary may be empty in situations where the user launched the application directly.
*/ 
+ (void)logApplicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

/** Adds an observer to `NSNotificationCenter` to log to the console when the navigation controllers stack changes. */ 
+ (void)observeNavigationControllerStack;

/**-------------------------------------------------------------------------------------
 @name Screenshot
 ---------------------------------------------------------------------------------------
*/

/** Captures an image representation of the application's window and saves it to the camera roll. */ 
+ (void)takeScreenshot;

/**-------------------------------------------------------------------------------------
 @name Interface Orientation
 ---------------------------------------------------------------------------------------
*/ 

/** Returns a string representation of a given interface orientation. 
 @param interfaceOrientation An orientation of the application's user interface.
 @return A string representation of interfaceOrientation.
*/
+ (NSString *)stringFromInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;

/** Returns a boolean to indicate whether a device orientation is supported in the application's information property list.
 @param interfaceOrientation An orientation of the application's user interface.
 @return YES if the application's information property list allows the interfaceOrientation, otherwise NO.
*/ 
+ (BOOL)interfaceOrientationIsSupported:(UIInterfaceOrientation)interfaceOrientation;

/**-------------------------------------------------------------------------------------
 @name Local Notifications
 ---------------------------------------------------------------------------------------
*/ 

/** Returns an array of scheduled local notifications.
 @return An array of scheduled local notifications.
*/ 
+ (NSArray *)scheduledLocalNotifications;

/** Returns an array of scheduled local notifications with the specified ordering.
 @param ascending A boolean to indicate whether the array should be sorted in ascending or not.
 @return An array of scheduled local notifications with the specified ordering.
*/ 
+ (NSArray *)scheduledLocalNotificationsSortedAscending:(BOOL)ascending;

/**-------------------------------------------------------------------------------------
 @name Network Activity Indication
 ---------------------------------------------------------------------------------------
*/ 

/** Increments the number of network activity requests. If this number was zero before incrementing, this will start animating the network activity indicator. */
+ (void)showNetworkActivityIndicator;

/** Decrements the number of network activity requests. If this number becomes zero after incrementing, this will stop animating the network activity indicator. */
+ (void)hideNetworkActivityIndicator;

/** Stops the network activity indicator from animating and sets the number of network activity requests to zero. */ 
+ (void)hideNetworkActivityIndicatorNow;

@end