//
//  NSBundle+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 08/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A collection of category extensions for `NSBundle` */
@interface NSBundle (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Getting Bundle Information
 ---------------------------------------------------------------------------------------
*/ 

/**
 Returns the value associated with the CFBundleName key in the receiver's information property list.
 @return The value associated with CFBundleName key in the receiver's property list (Info.plist).
*/
+ (NSString *)bundleName;

/**
 Returns the value associated with the CFBundleDisplayName key in the receiver's information property list.
 @return The value associated with CFBundleDisplayName key in the receiver's property list (Info.plist).
*/
+ (NSString *)bundleDisplayName;

/**
 Returns the value associated with the CFBundleVersion key in the receiver's information property list.
 @return The value associated with CFBundleVersion key in the receiver's property list (Info.plist).
 */
+ (NSString *)bundleVersion;

/**
 Returns the value associated with the CFBundleShortVersionString key in the receiver's information property list.
 @return The value associated with CFBundleShortVersionString key in the receiver's property list (Info.plist).
 */
+ (NSString *)bundleShortVersionString;

@end