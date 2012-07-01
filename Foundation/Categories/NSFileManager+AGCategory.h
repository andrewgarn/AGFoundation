//
//  NSFileManager+AGCategory.h
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/** A collection of category extensions for `NSFileManager` */
@interface NSFileManager (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Getting Paths
 ---------------------------------------------------------------------------------------
*/ 

/** Returns the path to the application's cache directory.

 The return value is cached the first time the method is called.
 @return The path to the application's cache directory.
*/
+ (NSString *)cachePath;

/** Returns the path to the application's document directory.
 
 The return value is cached the first time the method is called.
 @return The path to the application's document directory.
*/
+ (NSString *)documentPath;

/** Returns the path to the application's library directory.
 
 The return value is cached the first time the method is called.
 @return The path to the application's library directory.
*/
+ (NSString *)libraryPath;

/** Returns the path to the application's temporary directory.
 
 The return value is cached the first time the method is called.
 @return The path to the application's temporary directory.
*/
+ (NSString *)temporaryPath;

/** Returns the cache path for the specified filename.
 @param filename The name of the resource, including extension.
 @return The cache path for the specified filename.
*/
+ (NSString *)cachePathForFile:(NSString *)filename;

/** Returns the document path for the specified filename.
 @param filename The name of the resource, including extension.
 @return The document path for the specified filename.
*/
+ (NSString *)documentPathForFile:(NSString *)filename;

/** Returns the library path for the specified filename.
 @param filename The name of the resource, including extension.
 @return The library path for the specified filename.
*/
+ (NSString *)libraryPathForFile:(NSString *)filename;

/** Returns the temporary path for the specified filename.
 @param filename The name of the resource, including extension.
 @return The temporary path for the specified filename.
*/
+ (NSString *)temporaryPathForFile:(NSString *)filename;

/** Returns the bundle path for the specified filename.
 @param filename The name of the resource, including extension.
 @return The bundle path for the specified filename.
 */
+ (NSString *)bundlePathForFile:(NSString *)filename;

/**-------------------------------------------------------------------------------------
 @name Getting Contents
 ---------------------------------------------------------------------------------------
*/ 

/** Performs a shallow search of the specified directory and returns the paths of any contained items.
 @param path The path to the directory whose contents you want to enumerate.
 @return An array of `NSString` objects, each of which identifies a file, directory, or symbolic link contained in path. Returns an empty array if the directory exists but has no contents. If an error occurs, this method returns nil.
*/
+ (NSArray *)contentsOfDirectoryAtPath:(NSString *)path;

/** Performs a shallow search of the specified directory and returns the paths of any contained items with the specified extension.
 @param path The path to the directory whose contents you want to enumerate.
 @param extension The file extension. If extension is an empty string or nil, all the paths found are returned.
 @return An array of `NSString` objects, each of which identifies a file, directory, or symbolic link contained in path. Returns an empty array if the directory exists but has no contents. If an error occurs, this method returns nil.
*/
+ (NSArray *)contentsOfDirectoryAtPath:(NSString *)path withType:(NSString *)extension;

/** Performs a shallow search of the cache directory and returns the paths of any contained items.
 @return An array of `NSString` objects, each of which identifies a file, directory, or symbolic link contained in path. Returns an empty array if the directory has no contents. If an error occurs, this method returns nil.
*/
+ (NSArray *)contentsOfCacheDirectory;

/** Performs a shallow search of the document directory and returns the paths of any contained items.
 @return An array of `NSString` objects, each of which identifies a file, directory, or symbolic link contained in path. Returns an empty array if the directory has no contents. If an error occurs, this method returns nil.
*/
+ (NSArray *)contentsOfDocumentDirectory;

/** Performs a shallow search of the library directory and returns the paths of any contained items.
 @return An array of `NSString` objects, each of which identifies a file, directory, or symbolic link contained in path. Returns an empty array if the directory has no contents. If an error occurs, this method returns nil.
*/
+ (NSArray *)contentsOfLibraryDirectory;

/** Performs a shallow search of the temporary directory and returns the paths of any contained items.
 @return An array of `NSString` objects, each of which identifies a file, directory, or symbolic link contained in path. Returns an empty array if the directory has no contents. If an error occurs, this method returns nil.
 */
+ (NSArray *)contentsOfTemporaryDirectory;

@end