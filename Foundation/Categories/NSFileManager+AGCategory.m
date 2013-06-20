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
#import "NSNumber+AGCategory.h"
#import "NSString+AGCategory.h"

#import <sys/types.h>	// for random type definition
#import <sys/dirent.h>	// for struct dirent
#import <dirent.h>	// for getdirentries()
#import <stdlib.h>	// for EXIT_SUCCESS
#import <stdio.h>	// for printf
#import <errno.h>	// for errno
#import <string.h>	// for strerror
#import <fcntl.h>	// for O_RDONLY
#import <sys/stat.h>	// for struct statbuf and stat()
#import <sys/param.h>	// for MAXPATHLEN
#import <sys/attr.h>	// for attrreference_t
#import <unistd.h>	// for getdirentriesattr()

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(NSFileManager_AGCategory);
#endif

@implementation NSFileManager (AGCategory)

#pragma mark -

+ (NSString *)cachePath_AG
{
    static dispatch_once_t token;
	static NSString *cachePath;
    
	dispatch_once(&token, ^{
		cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];	
	});
	return cachePath;
}

+ (NSString *)documentPath_AG
{
    static dispatch_once_t token;
	static NSString *documentPath;
    
	dispatch_once(&token, ^{
		documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];	
	});
	return documentPath;
}

+ (NSString *)libraryPath_AG
{
    static dispatch_once_t token;
	static NSString *libraryPath;
    
	dispatch_once(&token, ^{
		libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];	
	});
	return libraryPath;
}

+ (NSString *)applicationSupportPath_AG
{
    static dispatch_once_t token;
	static NSString *applicationSupportPath;
    
	dispatch_once(&token, ^{
		applicationSupportPath = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) lastObject];
	});
	return applicationSupportPath;
}

+ (NSString *)temporaryPath_AG
{
    static dispatch_once_t token;
	static NSString *tempPath;
    
	dispatch_once(&token, ^{
		tempPath = NSTemporaryDirectory();	
	});
	return tempPath;
}

#pragma mark -

+ (NSString *)cachePathForFile_AG:(NSString *)filename
{
    return [[self cachePath_AG] stringByAppendingPathComponent:filename];
}

+ (NSString *)documentPathForFile_AG:(NSString *)filename
{
    return [[self documentPath_AG] stringByAppendingPathComponent:filename];
}

+ (NSString *)libraryPathForFile_AG:(NSString *)filename
{
    return [[self libraryPath_AG] stringByAppendingPathComponent:filename];
}

+ (NSString *)applicationSupportPathForFile_AG:(NSString *)filename
{
    return [[self applicationSupportPath_AG] stringByAppendingPathComponent:filename];
}

+ (NSString *)temporaryPathForFile_AG:(NSString *)filename
{
    return [[self temporaryPath_AG] stringByAppendingPathComponent:filename];
}

+ (NSString *)bundlePathForFile_AG:(NSString *)filename
{
    return [[NSBundle mainBundle] pathForResource:filename ofType:nil]; 
}

#pragma mark -

+ (NSArray *)contentsOfDirectoryAtPath_AG:(NSString *)path
{
    return [NSFileManager contentsOfDirectoryAtPath_AG:path withExtension:nil];
}
                                  
+ (NSArray *)contentsOfDirectoryAtPath_AG:(NSString *)path withExtension:(NSString *)extension
{
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *fileURL = [NSURL fileURLWithPath:path];
    if (!fileURL) return nil;
    
    NSArray *directoryContents = [fileManager contentsOfDirectoryAtURL:fileURL
                                            includingPropertiesForKeys:[NSArray arrayWithObject:NSURLNameKey]
                                                               options:NSDirectoryEnumerationSkipsHiddenFiles error:&error];
        
    if (directoryContents == nil) {
        NSLog(@"Error occurred searching for the contentsOfDirectoryAtPath: %@\nERROR: %@", path, error);
        return nil;
    }
    
    if ([extension length] > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self ENDSWITH '.%@'", extension];
        NSArray *filteredArray = [directoryContents filteredArrayUsingPredicate:predicate];
        return filteredArray;
    }
    
    return directoryContents;
}

#pragma mark -

+ (NSArray *)contentsOfCacheDirectory_AG
{
    return [self contentsOfDirectoryAtPath_AG:[self cachePath_AG]];
}

+ (NSArray *)contentsOfDocumentDirectory_AG
{
    return [self contentsOfDirectoryAtPath_AG:[self documentPath_AG]];
}

+ (NSArray *)contentsOfLibraryDirectory_AG
{
    return [self contentsOfDirectoryAtPath_AG:[self libraryPath_AG]];
}

+ (NSArray *)contentsOfApplicationSupportDirectory_AG
{
    return [self contentsOfDirectoryAtPath_AG:[self applicationSupportPath_AG]];
}

+ (NSArray *)contentsOfTemporaryDirectory_AG
{
    return [self contentsOfDirectoryAtPath_AG:[self temporaryPath_AG]];
}

#pragma mark -

+ (NSString *)humanReadableSizeOfDirectoryAtPath_AG:(NSString *)path
{
    NSNumber *directorySize = [NSFileManager sizeOfDirectoryAtPath_AG:path];
    NSString *humanReadableDirectorySize = [directorySize humanReadableBytesWithDecimalPlaceAccuracy_AG:2];
    return humanReadableDirectorySize;
}

+ (NSNumber *)sizeOfDirectoryAtPath_AG:(NSString *)path
{
    off_t size = 0;
    const char *charPath = [path UTF8String];
    
    DIR *directory = opendir(charPath);
    if (directory == NULL) {
        fprintf (stderr, "could not open directory '%s'\n", charPath);
        fprintf (stderr, "error is %d/%s\n", errno, strerror(errno));
        return [NSNumber numberWithLongLong:size];
    }
    
    struct dirent *entry;
    while ( (entry = readdir(directory)) != NULL) {
        char filename[MAXPATHLEN];
        
        // don't mess with the metadirectories
        if (strcmp(entry->d_name, ".") == 0
            || strcmp(entry->d_name, "..") == 0) {
            continue;
        }
        // rather than changing the cwd each time through the loop,
        // construct the full path relative the given path.
        // since the original path is either absolute, or relative to
        // the current working directory, this should always give us
        // a stat-able path
        snprintf (filename, MAXPATHLEN, "%s/%s", charPath, entry->d_name);
        struct stat statbuf;
        int result;
        
        // use lstat so we don't multiply-coun the sizes of files that
        // are pointed to by symlinks
        result = lstat (filename, &statbuf);
        if (result != 0) {
            //fprintf (stderr, "could not stat '%s': %d/%s\n", entry->d_name, errno, strerror(errno));
            continue;
        }
        
        if (S_ISDIR(statbuf.st_mode)) {
            NSString *filenamePath = [NSString stringWithUTF8String:filename];
            size += [[NSFileManager sizeOfDirectoryAtPath_AG:filenamePath] longLongValue];
        } else {
            size += statbuf.st_size;
        }
    }
    closedir (directory);
    
    NSNumber *sizeNumber = [NSNumber numberWithLongLong:size];
    return sizeNumber;
}

#pragma mark -

+ (void)removeItemAtFileURL_AG:(NSURL *)fileURL
{
    NSString *filePath = [fileURL path];
    [NSFileManager removeItemAtPath_AG:filePath];
}

+ (void)removeItemAtPath_AG:(NSString *)path
{
	NSString *temporaryPath = [[self temporaryPath_AG] stringByAppendingPathComponent:[NSString stringWithUUID_AG]];
    if ([[NSFileManager defaultManager] moveItemAtPath:path toPath:temporaryPath error:NULL]) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
            NSError *error = nil;
            BOOL fileRemoved = [[NSFileManager defaultManager] removeItemAtPath:temporaryPath error:&error];
            if (fileRemoved == NO) {
                NSLog(@"ERROR removing item at path: %@ [%@]", path, error);
            }
        });
    }
}

+ (void)removeItemAtURL_AG:(NSURL *)URL
{
    if ([URL isFileURL]) {
        [NSFileManager removeItemAtPath_AG:[URL path]];
    } else {
        NSLog(@"ERROR: Supplied URL is not a file URL: %@", URL);
    }
}

@end