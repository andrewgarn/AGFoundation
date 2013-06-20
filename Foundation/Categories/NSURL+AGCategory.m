//
//  NSURL+AGCategory.m
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

#import "NSURL+AGCategory.h"
#include <sys/xattr.h>

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(NSURL_AGCategory);
#endif

@implementation NSURL (AGCategory)

+ (NSURL *)appStoreURLForAppID_AG:(NSString *)identifier
{
    NSString *link = [NSString stringWithFormat:@"itms://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@&mt=8", identifier];
	return [NSURL URLWithString:link];
}

+ (NSURL *)appStoreReviewURLForAppID_AG:(NSString *)identifier
{
    NSString *link = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", identifier];
	return [NSURL URLWithString:link];
}

- (BOOL)isEqualToURL_AG:(NSURL *)otherURL 
{
    if ([[self absoluteURL] isEqual:[otherURL absoluteURL]]) {
        return YES;
    }
    
    if ([self isFileURL] && [otherURL isFileURL] && [[self path] isEqual:[otherURL path]]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)addSkipBackupAttribute_AG
{
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];   
    
    if ([systemVersion floatValue] < 5.0 || [systemVersion isEqualToString:@"5.0"]) {
        return YES; // "do not backup" is not yet supported or required
    }
    
    if ([systemVersion isEqualToString:@"5.0.1"]) {
        const char *filePath = [[self path] fileSystemRepresentation];
        const char *attrName = "com.apple.MobileBackup";
        u_int8_t attrValue = 1;
        
        int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
        return result == 0;
        
    } else {
        
        NSError *error = nil;
        BOOL success = [self setResourceValue:[NSNumber numberWithBool:YES]
                                      forKey:NSURLIsExcludedFromBackupKey error:&error];
        if(!success) {
            NSLog(@"Error excluding %@ from backup %@", [self lastPathComponent], error);
        }
        
        return success;
    }
    return NO;
}

@end