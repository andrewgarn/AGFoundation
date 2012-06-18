//
//  NSURL+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 04/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/** A collection of category extensions for `NSURL` */
@interface NSURL (AGCategory)

/**-------------------------------------------------------------------------------------
 @name iTunes AppStore URLs
 ---------------------------------------------------------------------------------------
*/ 

/**
 Returns the iTunes App Store URL for the given identifier
 @param identifier The iTunes identifier for the application
 @return The iTunes App Store URL for a given identifier
*/
+ (NSURL *)appStoreURLForAppID:(NSString *)identifier;

/**
 Returns the iTunes App Store Review URL for the given identifier
 @param identifier The iTunes identifier for the application
 @return The iTunes App Store Review URL for a given identifier
*/
+ (NSURL *)appStoreReviewURLForAppID:(NSString *)identifier;

/**-------------------------------------------------------------------------------------
 @name Comparing URLs
 ---------------------------------------------------------------------------------------
*/ 

/**
 Returns a Boolean value that indicates whether the receiver and a given URL are equal.
 @param otherURL The URL with which to compare the receiver.
 @return `YES` if the receiver and otherURL are equal, otherwise `NO`.
*/
- (BOOL)isEqualToURL:(NSURL *)otherURL;

/**-------------------------------------------------------------------------------------
 @name File Backup Prevention
 ---------------------------------------------------------------------------------------
*/ 

/**
 Adds the skip backup extended attribute to the receiver

 This requirement was added by apple with the introduction of iCloud. Files stored in the documents directory that have not been created by the user, or do not contain user data, must not be backed up. For more information see the following: http://developer.apple.com/library/ios/#qa/qa1719/_index.html
 @return `YES` if the operation was successful, otherwise `NO`.
*/
- (BOOL)addSkipBackupAttribute;

@end