//
//  UIApplication+AGCategory.m
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

#import "UIApplication+AGCategory.h"
#import "NSNumber+AGCategory.h"
#import "UIDevice+AGCategory.h"
#import "UIScreen+AGCategory.h"
#import "NSDate+AGCategory.h"

#include <mach/machine/vm_types.h>
#include <mach/mach_host.h>
#include <mach/boolean.h>
#include <sys/sysctl.h>
#include <sys/types.h>
#include <sys/cdefs.h>
#include <mach/mach.h>
#include <stdbool.h>
#include <stdint.h>
#include <unistd.h>
#include <assert.h>

@implementation UIApplication (AGCategory)

#pragma mark -

/* Source: How do I determine if I'm being run under the debugger? */
/* http://developer.apple.com/library/mac/#qa/qa1361/_index.html */

+ (BOOL)isBeingDebugged
{
    // Returns true if the current process is being debugged (either 
    // running under the debugger or has a debugger attached post facto).
    int                 junk;
    int                 mib[4];
    struct kinfo_proc   info;
    size_t              size;
    
    // Initialize the flags so that, if sysctl fails for some bizarre 
    // reason, we get a predictable result.
    info.kp_proc.p_flag = 0;
    
    // Initialize mib, which tells sysctl the info we want, in this case
    // we're looking for information about a specific process ID.
    mib[0] = CTL_KERN;
    mib[1] = KERN_PROC;
    mib[2] = KERN_PROC_PID;
    mib[3] = getpid();
    
    // Call sysctl.
    size = sizeof(info);
    junk = sysctl(mib, sizeof(mib) / sizeof(*mib), &info, &size, NULL, 0);
    assert(junk == 0);
    
    // We're being debugged if the P_TRACED flag is set.
    return ( (info.kp_proc.p_flag & P_TRACED) != 0 );
}

+ (BOOL)isNotBeingDebugged
{
    return ![UIApplication isBeingDebugged];
}

+ (BOOL)isPirated
{
	return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"SignerIdentity"] != nil;
}

+ (BOOL)isNotPirated
{
    return ![UIApplication isPirated];
}

#pragma mark -

+ (NSNumber *)usedMemory
{
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kerr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&info, &size);
    vm_size_t vmsize = (kerr == KERN_SUCCESS) ? info.resident_size : 0; // size in bytes
    return [NSNumber numberWithLong:vmsize];
}

+ (void)logMemoryUsage
{
    static long previousMemoryUsage = 0;
    long currentMemoryUsage = [[self usedMemory] longValue];
    long memoryUsageDifference = currentMemoryUsage - previousMemoryUsage;
    
    if (memoryUsageDifference > 100000 || memoryUsageDifference < -100000)
    {
        previousMemoryUsage = currentMemoryUsage;        
        NSString *currentMemoryUsageString = [[NSNumber numberWithLong:currentMemoryUsage] formattedBytes];
        NSString *memoryUsageDifferenceString = [[NSNumber numberWithLong:memoryUsageDifference] formattedBytes];
        NSString *freeMemoryString = [[UIDevice freeMemory] formattedBytes];
        NSLog(@"Memory used %@ (+%@), free %@", currentMemoryUsageString, memoryUsageDifferenceString, freeMemoryString);
    }
}

static NSDate *applicationDidFinishLaunchingDate;
static NSDate *applicationDidEnterBackgroundDate;

+ (void)logApplicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"\n\n**** application:didFinishLaunching: '%@ %@ (%@)' withOptions: ****\n**** applicationLaunchDevice: %@ withSystemVersion: %@ ****\n\n", 
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"], 
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"], 
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"],
          [UIDevice deviceModel], [UIDevice systemVersion]);
    
    applicationDidFinishLaunchingDate = [NSDate date];
}

+ (void)logApplicationDidEnterBackground
{
    NSLog(@"\n\n**** application: '%@ %@ (%@)' applicationDidEnterBackground: ****\n\n",
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"],
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]);
    
    applicationDidEnterBackgroundDate = [NSDate date];
}

+ (void)logApplicationWillEnterForeground
{
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:applicationDidEnterBackgroundDate];
    NSDateFormatter *dateFormatter = [NSDate dateFormatterWithdateFormat:@"EE d MMM 'at' hh:mma"];
    
    NSLog(@"\n\n**** application: '%@ %@ (%@)' willEnterForeground: ****\n**** applicationLaunchDate: %@ timeSinceBackground: %.0f sec ****\n\n",
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"],
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"],
          [dateFormatter stringFromDate:applicationDidFinishLaunchingDate],
          timeInterval);
}

+ (void)logApplicationWillResignActive
{
    NSLog(@"\n\n**** application: '%@ %@ (%@)' willResignActive: ****\n\n",
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"],
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]);
}

+ (void)logApplicationDidBecomeActive
{
    NSLog(@"\n\n**** application: '%@ %@ (%@)' didBecomeActive: ****\n\n",
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"],
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]);
}

#pragma mark -

+ (void)observeNavigationControllerStack
{
    UIApplication *application = [UIApplication sharedApplication];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    SEL selector = @selector(navigationControllerStackDidChange:);
    NSString *notificationName = @"UINavigationControllerDidShowViewControllerNotification";
    
    [notificationCenter addObserver:application selector:selector name:notificationName object:nil];
}

- (void)navigationControllerStackDidChange:(NSNotification *)notification 
{
    NSDictionary *userInfo = [notification userInfo];
    UIViewController *fromViewController = [userInfo objectForKey:@"UINavigationControllerLastVisibleViewController"];
    UIViewController *toViewController = [userInfo objectForKey:@"UINavigationControllerNextVisibleViewController"];
    if (!fromViewController && toViewController)
        NSLog(@"**** Displaying \"%@\" ****", [toViewController class]);
    else if (fromViewController && toViewController)
        NSLog(@"**** Switching from \"%@\" to \"%@\" ****", [fromViewController class], [toViewController class]);
}

#pragma mark -

+ (void)takeScreenshot
{
    UIImage *image = [UIScreen screenshot];
    if (NSClassFromString(@"ALAssetsLibrary"))
    {
        ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
        [library writeImageToSavedPhotosAlbum:[image CGImage] orientation:(ALAssetOrientation)[image imageOrientation] completionBlock:^(NSURL *assetURL, NSError *error)
         {
             if (error) 
             {
                 // TODO: error handling
             } 
             else 
             {
                 // TODO: success handling
             }
         }];
    }
    else 
    {
        UIImageWriteToSavedPhotosAlbum(image, nil, NULL, nil);
    } 
}

#pragma mark -

+ (NSString *)stringFromInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    switch (interfaceOrientation)
    {
		case UIInterfaceOrientationPortrait:           return @"UIInterfaceOrientationPortrait";
		case UIInterfaceOrientationPortraitUpsideDown: return @"UIInterfaceOrientationPortraitUpsideDown";
		case UIInterfaceOrientationLandscapeLeft:      return @"UIInterfaceOrientationLandscapeLeft";
		case UIInterfaceOrientationLandscapeRight:     return @"UIInterfaceOrientationLandscapeRight";
	}
	return [NSString stringWithFormat:@"Unhandled Orientation: %i", interfaceOrientation];
}

+ (BOOL)interfaceOrientationIsSupported:(UIInterfaceOrientation)interfaceOrientation
{
    NSString *infoDictKey = @"UISupportedInterfaceOrientations";
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
        infoDictKey = @"UISupportedInterfaceOrientations~ipad";
        
    NSArray *supportedOrientations = [[NSBundle mainBundle] objectForInfoDictionaryKey:infoDictKey];
    NSString *interfaceOrientationString = [UIApplication stringFromInterfaceOrientation:interfaceOrientation];
    
    if ([supportedOrientations indexOfObject:interfaceOrientationString] != NSNotFound)
    {
        return YES;
    }
    return NO;
}

#pragma mark -

+ (NSArray *)scheduledLocalNotifications
{
    return [[UIApplication sharedApplication] scheduledLocalNotifications];
}

+ (NSArray *)scheduledLocalNotificationsSortedAscending:(BOOL)ascending
{
    NSArray *sortDescriptors = [NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"fireDate" ascending:ascending]];
    return [[UIApplication scheduledLocalNotifications] sortedArrayUsingDescriptors:sortDescriptors];
}

#pragma mark -

static NSInteger AGNetworkActivityIndicatorCount = 0;

+ (void)showNetworkActivityIndicator
{
    AGNetworkActivityIndicatorCount++;
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

+ (void)hideNetworkActivityIndicator
{
    AGNetworkActivityIndicatorCount--;
    
    if (AGNetworkActivityIndicatorCount <= 0)
        [UIApplication hideNetworkActivityIndicatorNow];
}

+ (void)hideNetworkActivityIndicatorNow
{
    AGNetworkActivityIndicatorCount = 0;
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end