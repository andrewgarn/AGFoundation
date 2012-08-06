//
//  URLSchemeManager.h
//  AGFoundation
//
//  Created by Andrew Garn on 31/07/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/** A class to detect and launch other applications using custom URL schemes. */
@interface URLSchemeManager : NSObject

/**-------------------------------------------------------------------------------------
 @name Apple
 ---------------------------------------------------------------------------------------
*/

/** Returns whether the App Store application can be opened.
 @return YES if the application can be opened, otherwise NO.
*/
+ (BOOL)canOpenAppStore;

/** Opens the App Store to view the application with the specified identifier.
 @param appId The application identifier to open the App Store with.
 @return YES if the App Store was successfully opened, otherwise NO.
*/
+ (BOOL)openAppStoreWithAppId:(NSString *)appId;

/** Opens the App Store to gift the application with the specified identifier.
 @param appId The application identifier to open the App Store with.
 @return YES if the App Store was successfully opened, otherwise NO.
*/
+ (BOOL)openAppStoreToGiftAppWithAppId:(NSString *)appId;

/** Opens the App Store to review the application with the specified identifier.
 @param appId The application identifier to open the App Store with.
 @return YES if the App Store was successfully opened, otherwise NO.
*/
+ (BOOL)openAppStoreToReviewAppWithAppId:(NSString *)appId;

/** Returns whether the Safari application can be opened.
 @return YES if the application is available, otherwise NO.
*/
+ (BOOL)canOpenSafari;

/** Opens the Safari application with the specified URL.
 @param url The URL to open inside the Safari application.
 @return YES if an application was successfully opened, otherwise NO.
*/
+ (BOOL)openSafariWithURL:(NSURL *)url;

/**-------------------------------------------------------------------------------------
 @name Third Party
 ---------------------------------------------------------------------------------------
*/

/** Returns whether the Facebook application can be opened.
 @return YES if the application is available, otherwise NO.
*/
+ (BOOL)canOpenFacebook;

/** Opens the Facebook application, or if unavailable opens the App Store to download it.
 @return YES if an application was successfully opened, otherwise NO. 
*/
+ (BOOL)openFacebook;

/** Returns whether the Google Chrome application can be opened.
 @return YES if the application is available, otherwise NO.
*/
+ (BOOL)canOpenGoogleChrome;

/** Opens the Google Chrome application with the specified URL, or if unavailable opens the App Store to download it.
 
 Includes code from documentation by Google: https://developers.google.com/chrome/mobile/docs/ios-links
 @param url The URL to open inside the Google Chrome application.
 @return YES if an application was successfully opened, otherwise NO.
*/
+ (BOOL)openGoogleChromeWithURL:(NSURL *)url;

/** Returns whether the Tweetbot application can be opened.
 @return YES if the application is available, otherwise NO.
*/
+ (BOOL)canOpenTweetbot;

/** Opens the Tweetbot application, or if unavailable opens the App Store to download it.
 @return YES if an application was successfully opened, otherwise NO.
*/
+ (BOOL)openTweetbot;

/** Returns whether the Twitter application can be opened.
 @return YES if the application is available, otherwise NO.
*/
+ (BOOL)canOpenTwitter;

/** Opens the Twitter application, or if unavailable opens the App Store to download it.
 @return YES if an application was successfully opened, otherwise NO.
*/
+ (BOOL)openTwitter;

/**-------------------------------------------------------------------------------------
 @name Generic
 ---------------------------------------------------------------------------------------
*/

/** Returns whether the specified scheme can be used to open an application.
 @param applicationScheme The application scheme to attempt to open
 @return YES if the application scheme is available, otherwise NO.
*/
+ (BOOL)canOpenApplicationWithScheme:(NSString *)applicationScheme;

/** Opens an application with the specified scheme, or if unavailable opens the App Store to view the application with the specified identifier.
 @param applicationScheme The application scheme to attempt to open
 @param appId The application identifier to open the App Store with.
 @return YES if an application was successfully opened, otherwise NO.
*/
+ (BOOL)openApplicationWithScheme:(NSString *)applicationScheme appId:(NSString *)appId;

/** Opens an application with the specified scheme.
 @param applicationScheme The application scheme to attempt to open
 @return YES if an application was successfully opened, otherwise NO.
*/
+ (BOOL)openApplicationWithScheme:(NSString *)applicationScheme;

@end