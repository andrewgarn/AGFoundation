//
//  UIApplication+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 03/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UIApplication+AGCategory.h"
#import "UIDevice+AGCategory.h"
#import "UIScreen+AGCategory.h"

#include <mach/machine/vm_types.h>
#include <mach/mach_host.h>
#include <mach/boolean.h>
#include <sys/sysctl.h>
#include <sys/types.h>
#include <sys/cdefs.h>
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

#pragma mark -

+ (void)logMemoryUsage
{
    static natural_t initialUsed = 0xFFFFFFFF;
    static natural_t previousUsed = 0xFFFFFFFF;
    
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t pagesize;
    vm_statistics_data_t vm_stat;
    
    host_page_size(host_port, &pagesize);
    
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS)
    {
        NSLog(@"Failed to fetch vm statistics");
    }
    
    natural_t memUsed = (vm_stat.active_count + vm_stat.inactive_count + vm_stat.wire_count) * pagesize;
    natural_t memFree = vm_stat.free_count * pagesize;
    natural_t memTotal = memUsed + memFree;
    
    if (initialUsed == 0xFFFFFFFF)
    {
        initialUsed = memUsed;
    }
    if (previousUsed == 0xFFFFFFFF)
    {
        previousUsed = memUsed;
    }
    NSLog(@"Memory usage (KB): app %d, delta %d, used %u/%u",
          ((int)memUsed - (int)initialUsed) / 1024,
          ((int)memUsed - (int)previousUsed) / 1024,
          memUsed / 1024,
          memTotal / 1024);
    previousUsed = memUsed;
}

+ (void)logApplicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"\n\n**** application:didFinishLaunching: '%@ %@ (%@)' withOptions: ****\n**** applicationLaunchDevice: %@ withSystemVersion: %@ ****\n\n", 
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"], 
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"], 
          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"],
          [UIDevice deviceModel], [UIDevice systemVersion]);
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