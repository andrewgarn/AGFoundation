//
//  NSURL+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 04/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "NSURL+AGCategory.h"
#import "NSObject+AGCategory.h"
#include <sys/xattr.h>

@implementation NSURL (AGCategory)

+ (NSURL *)appStoreURLForAppID:(NSString *)identifier
{
    NSString *link = [NSString stringWithFormat:@"itms://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@&mt=8", identifier];
	return [NSURL URLWithString:link];
}

+ (NSURL *)appStoreReviewURLForAppID:(NSString *)identifier
{
    NSString *link = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", identifier];
	return [NSURL URLWithString:link];
}

- (BOOL)isEqualToURL:(NSURL *)otherURL 
{
    if ([[self absoluteURL] isEqual:[otherURL absoluteURL]])
        return YES;
    
    if ([self isFileURL] && [otherURL isFileURL] && ([[self path] isEqual:[otherURL path]]))
        return YES;
        
    return NO;
}

//[version isEqualToString:@"5.0.0"] && [version intValue] >= 5

- (BOOL)addSkipBackupAttribute
{
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];   
    
    if ([systemVersion floatValue] < 5.0 && [systemVersion isEqualToString:@"5.0.0"])
        return YES; // "do not backup" is not yet supported or required
    
    if ([systemVersion isEqualToString:@"5.0.1"])
    {
        const char *filePath = [[self path] fileSystemRepresentation];
        const char *attrName = "com.apple.MobileBackup";
        u_int8_t attrValue = 1;
        
        int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
        return result == 0;
    }
    else 
    {
        NSError *error = nil;
        BOOL success = [self setResourceValue: [NSNumber numberWithBool: YES]
                                      forKey: NSURLIsExcludedFromBackupKey error: &error];
        if(!success)
            NSLog(@"Error excluding %@ from backup %@", [self lastPathComponent], error);
        
        return success;
    }
    return NO;
}

@end