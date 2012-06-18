//
//  NSFileManager+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 03/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

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

+ (NSString *)temporaryPath
{
    static dispatch_once_t token;
	static NSString *tempPath;
    
	dispatch_once(&token, ^{
		tempPath = NSTemporaryDirectory();	
	});
	return tempPath;
}

/*
+ (NSString *)storagePath
{
    static NSString *storagePath = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *version = [[UIDevice currentDevice] systemVersion];
        if (![version isEqualToString:@"5.0.0"] && [version intValue] >= 5)
            storagePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        else 
            storagePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    });
    return storagePath;
}
*/ 

#pragma mark -

+ (NSString *)cachePathForFile:(NSString *)filename
{
    return [[self cachePath] stringByAppendingPathComponent:filename];
}

+ (NSString *)documentPathForFile:(NSString *)filename
{
    return [[self documentPath] stringByAppendingPathComponent:filename];
}

+ (NSString *)temporaryPathForFile:(NSString *)filename
{
    return [[self temporaryPath] stringByAppendingPathComponent:filename];
}

+ (NSString *)bundlePathForFile:(NSString *)filename
{
    return [[NSBundle mainBundle] pathForResource:filename ofType:nil]; 
}

/*
+ (NSString *)storagePathForFile:(NSString *)filename
{
    return [[self storagePath] stringByAppendingPathComponent:filename];
}
*/ 

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

+ (NSArray *)contentsOfTemporaryDirectory
{
    return [self contentsOfDirectoryAtPath:[self temporaryPath]];
}

@end