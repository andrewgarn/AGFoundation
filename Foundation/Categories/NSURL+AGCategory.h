//
//  NSURL+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 04/05/2012.
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
+ (NSURL *)appStoreURLForAppID_AG:(NSString *)identifier;

/**
 Returns the iTunes App Store Review URL for the given identifier
 @param identifier The iTunes identifier for the application
 @return The iTunes App Store Review URL for a given identifier
*/
+ (NSURL *)appStoreReviewURLForAppID_AG:(NSString *)identifier;

/**-------------------------------------------------------------------------------------
 @name Comparing URLs
 ---------------------------------------------------------------------------------------
*/ 

/**
 Returns a Boolean value that indicates whether the receiver and a given URL are equal.
 @param otherURL The URL with which to compare the receiver.
 @return `YES` if the receiver and otherURL are equal, otherwise `NO`.
*/
- (BOOL)isEqualToURL_AG:(NSURL *)otherURL;

/**-------------------------------------------------------------------------------------
 @name File Backup Prevention
 ---------------------------------------------------------------------------------------
*/ 

/**
 Adds the skip backup extended attribute to the receiver

 This requirement was added by apple with the introduction of iCloud. Files stored in the documents directory that have not been created by the user, or do not contain user data, must not be backed up. For more information see the following: http://developer.apple.com/library/ios/#qa/qa1719/_index.html
 @return `YES` if the operation was successful, otherwise `NO`.
*/
- (BOOL)addSkipBackupAttribute_AG;

@end