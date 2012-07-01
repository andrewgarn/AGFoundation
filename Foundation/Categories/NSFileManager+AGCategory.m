//
//  NSFileManager+AGCategory.m
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

#import "NSFileManager+AGCategory.h"

@implementation NSFileManager (AGCategory)

+ (NSString *)cachePath
{
    static dispatch_once_t token;
	static NSString *cachePath;
    
	dispatch_once(&token, ^{
		cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];	
	});
	return cachePath;
}

+ (NSString *)documentPath
{
    static dispatch_once_t token;
	static NSString *documentPath;
    
	dispatch_once(&token, ^{
		documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];	
	});
	return documentPath;
}

+ (NSString *)libraryPath
{
    static dispatch_once_t token;
	static NSString *libraryPath;
    
	dispatch_once(&token, ^{
		libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];	
	});
	return libraryPath;
}

+ (NSString *)temporaryPath
{
    static dispatch_once_t token;
	static NSString *tempPath;
    
	dispatch_once(&token, ^{
		tempPath = NSTemporaryDirectory();	
	});
	return tempPath;
}

#pragma mark -

+ (NSString *)cachePathForFile:(NSString *)filename
{
    return [[self cachePath] stringByAppendingPathComponent:filename];
}

+ (NSString *)documentPathForFile:(NSString *)filename
{
    return [[self documentPath] stringByAppendingPathComponent:filename];
}

+ (NSString *)libraryPathForFile:(NSString *)filename
{
    return [[self libraryPath] stringByAppendingPathComponent:filename];
}

+ (NSString *)temporaryPathForFile:(NSString *)filename
{
    return [[self temporaryPath] stringByAppendingPathComponent:filename];
}

+ (NSString *)bundlePathForFile:(NSString *)filename
{
    return [[NSBundle mainBundle] pathForResource:filename ofType:nil]; 
}

#pragma mark -

+ (NSArray *)contentsOfDirectoryAtPath:(NSString *)path
{
    return [NSFileManager contentsOfDirectoryAtPath:path withType:nil];
}
                                  
+ (NSArray *)contentsOfDirectoryAtPath:(NSString *)path withType:(NSString *)extension
{
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *directoryContents = [fileManager contentsOfDirectoryAtPath:path error:&error];
    
    if (directoryContents == nil)
    {
        NSLog(@"Error occured searching for the contentsOfDirectoryAtPath: %@\nERROR: %@", path, error);
        return nil;
    }
    
    if ([extension length] > 0)
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self ENDSWITH '.%@'", extension];
        NSArray *filteredArray = [directoryContents filteredArrayUsingPredicate:predicate];
        return filteredArray;
    }
    return directoryContents;
}

#pragma mark -

+ (NSArray *)contentsOfCacheDirectory
{
    return [self contentsOfDirectoryAtPath:[self cachePath]];
}

+ (NSArray *)contentsOfDocumentDirectory
{
    return [self contentsOfDirectoryAtPath:[self documentPath]];
}

+ (NSArray *)contentsOfLibraryDirectory
{
    return [self contentsOfDirectoryAtPath:[self libraryPath]];
}

+ (NSArray *)contentsOfTemporaryDirectory
{
    return [self contentsOfDirectoryAtPath:[self temporaryPath]];
}

@end