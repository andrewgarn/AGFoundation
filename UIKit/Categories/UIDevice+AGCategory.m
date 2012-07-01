//
//  UIDevice+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 19/04/2012.
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

#import "UIDevice+AGCategory.h"
#import "NSString+AGCategory.h"

#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>

#import <MobileCoreServices/MobileCoreServices.h>

#include <sys/utsname.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <mach/mach.h>

@interface UIDevice (AGCategory_Private)
+ (NSString *)getSysInfoByName:(char *)typeSpecifier;
+ (NSUInteger)getSysInfo:(uint)typeSpecifier;
+ (NSString *)platform;
@end

#pragma mark -

@implementation UIDevice (AGCategory)

#pragma mark - Device Info

+ (NSString *)deviceName
{
    return [[UIDevice currentDevice] name];
}

+ (NSString *)deviceModel
{
    NSString *platform = [self platform];
    
    /* iPhone */
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform hasPrefix:@"iPhone2"])            return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4 GSM";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 CDMA";
    if ([platform hasPrefix:@"iPhone4"])            return @"iPhone 4S";
    
    /* iPod Touch */
    if ([platform hasPrefix:@"iPod1"])              return @"iPod 1G";
    if ([platform hasPrefix:@"iPod2"])              return @"iPod 2G";
    if ([platform hasPrefix:@"iPod3"])              return @"iPod 3G";
    if ([platform hasPrefix:@"iPod4"])              return @"iPod 4G";
    
    /* iPad */
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad WiFi";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 WiFi";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 GSM";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 CDMAV";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 CDMAS";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 Wi-Fi";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 GSM";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 CDMA";
    
    /* Simulator */
    if ([UIDevice isASimulator])
    {
        if ([[UIScreen mainScreen] bounds].size.width < 768)
        {
            if ([UIDevice hasRetinaDisplay])
                return @"iPhone Simulator (Retina)";
            else
                return @"iPhone Simulator";
        }
        else 
        {
            if ([UIDevice hasRetinaDisplay])
                return @"iPad Simulator (Retina)";
            else
                return @"iPad Simulator";
        }
    }
    
    /* Unknown */
    return platform;
}

+ (NSString *)deviceFamily
{
    if ([UIDevice isAniPhone])
        return @"iPhone";
    
    if ([UIDevice isAniPodTouch])
        return @"iPod touch";
    
    if ([UIDevice isAniPad])
        return @"iPad";
    
    if ([UIDevice isASimulator])
        return @"Simulator";
    
    return @"Unknown";
}

+ (NSString *)deviceCarrier
{
    CTTelephonyNetworkInfo *phoneInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *phoneCarrier = [phoneInfo subscriberCellularProvider];
    NSString *carrierName = [phoneCarrier carrierName];
    
    if (carrierName)
        return carrierName;
    
    return @"None";
}

#pragma mark - System Info

+ (NSString *)systemName
{
    return [[UIDevice currentDevice] systemName];
}

+ (NSString *)systemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

#pragma mark -

+ (BOOL)isAniPhone
{
	NSRange textRange = [[self platform] rangeOfString:@"iPhone"];
	if(textRange.location != NSNotFound)
		return YES;
    
	return NO;
}

+ (BOOL)isAniPodTouch
{
	NSRange textRange = [[self platform] rangeOfString: @"iPod"];
	if(textRange.location != NSNotFound)
		return YES;
    
	return NO;
}

+ (BOOL)isAniPad
{
	NSRange textRange = [[self platform] rangeOfString:@"iPad"];
	if(textRange.location != NSNotFound)
		return YES;
    
	return NO;
}

+ (BOOL)isASimulator
{
	NSRange textRange = [[self platform] rangeOfString:@"i386"];
	if(textRange.location != NSNotFound)
		return YES;
    
    NSRange textRange2 = [[self platform] rangeOfString:@"x86_64"];
	if(textRange2.location != NSNotFound)
		return YES;
    
	return NO;
}

#pragma mark -

+ (BOOL)hasRetinaDisplay
{
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) 
    {
        if ([[UIScreen mainScreen] scale] == 2.0) 
            return YES;
    }
    return NO;
}

+ (BOOL)hasCompass
{
    return [CLLocationManager headingAvailable];
}

+ (BOOL)hasGyroscope
{
    static dispatch_once_t token;
	static CMMotionManager *motionManager;
    
	dispatch_once(&token, ^{
		motionManager = [[CMMotionManager alloc] init];
	});
    return [motionManager isGyroAvailable];
}

+ (BOOL)hasFrontCamera
{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

+ (BOOL)hasRearCamera
{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

+ (BOOL)hasFrontFlash
{
    return [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceFront];
}

+ (BOOL)hasRearFlash
{
    return [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceRear];
}

+ (BOOL)canRecordVideo
{
    NSArray *mediaType = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    if ([mediaType containsObject:(NSString *)kUTTypeMovie])
        return YES;
	
    return NO;
}

#pragma mark -

+ (BOOL)canSendMail
{
    Class class = NSClassFromString(@"MFMailComposeViewController");
    if (class)
    {
        if ([(id)class canSendMail])
        {
            return YES;
        }
    }
    return NO;
}

+ (BOOL)canSendText
{
    Class class = NSClassFromString(@"MFMessageComposeViewController");
    if (class)
    {
        if ([(id)class canSendText])
        {
            return YES;
        }
    }
    return NO;
}

+ (BOOL)supportsMultitasking
{
    return [[UIDevice currentDevice] isMultitaskingSupported];
}

#pragma mark -

+ (UIUserInterfaceIdiom)idiom
{
    return [[UIDevice currentDevice] userInterfaceIdiom];
}

+ (BOOL)userInterfaceIdiomIsPhone
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        return YES;
    
    return NO;
}

+ (BOOL)userInterfaceIdiomIsPad
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
        return YES;
    
    return NO;
}

#pragma mark -

+ (NSString *)uniqueDeviceIdentifier
{
    NSString *macAddress = [UIDevice macAddress];
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    NSString *uniqueDeviceIdentifier = [macAddress HMACWithSecret:bundleIdentifier];
    return uniqueDeviceIdentifier;
}

+ (NSString *)uniqueGlobalDeviceIdentifier
{
    return [[UIDevice macAddress] SHA1Hash];    
}

#pragma mark -

+ (CGFloat)batteryLevel
{
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    CGFloat currentBatteryLevel = [[UIDevice currentDevice] batteryLevel];
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:NO];
    return currentBatteryLevel;
}

+ (NSString *)batteryState
{
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    
    NSString *batteryStateString = nil;
    UIDeviceBatteryState batteryState = [[UIDevice currentDevice] batteryState];
    switch (batteryState)
    {
        case UIDeviceBatteryStateUnknown:
            batteryStateString = @"Unknown";
            break;
            
        case UIDeviceBatteryStateUnplugged:
            batteryStateString = @"Unplugged";
            break;
            
        case UIDeviceBatteryStateCharging:
            batteryStateString = @"Charging";
            break;
            
        case UIDeviceBatteryStateFull:
            batteryStateString = @"Full";
            break;
            
        default:
            batteryStateString = @"Unknown";
            break;
    }
    
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:NO];
    return batteryStateString;
}

#pragma mark -

+ (BOOL)isJailbroken 
{
	NSString *cydiaPath = @"/Applications/Cydia.app";
	NSString *aptPath = @"/private/var/lib/apt/";
    
	if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) 
        return YES;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) 
        return YES;
    
	return NO;
}

+ (NSString *)jailbrokenState
{
    if ([UIDevice isJailbroken])
        return @"Jailbroken";
    
    return @"Not Jailbroken";
}

#pragma mark -

/**
 *	Reference: https://github.com/erica/uidevice-extension
 */

+ (NSUInteger)cpuFrequency
{
    return [UIDevice getSysInfo:HW_CPU_FREQ];
}

+ (NSUInteger)busFrequency
{
    return [UIDevice getSysInfo:HW_BUS_FREQ];
}

+ (NSUInteger)totalMemory
{
    return [UIDevice getSysInfo:HW_PHYSMEM];
}

+ (NSUInteger)userMemory
{
    return [UIDevice getSysInfo:HW_USERMEM];
}

+ (NSUInteger)maxSocketBufferSize
{
    return [UIDevice getSysInfo:KIPC_MAXSOCKBUF];
}

+ (NSUInteger)processorCount
{
    return [[NSProcessInfo processInfo] processorCount];
}

+ (NSNumber *)totalDiskSpace
{
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [attributes objectForKey:NSFileSystemSize];
}

+ (NSNumber *)freeDiskSpace
{
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [attributes objectForKey:NSFileSystemFreeSize];
}

+ (NSNumber *)freeMemory
{
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t pagesize;
    vm_statistics_data_t vm_stat;
    
    host_page_size(host_port, &pagesize);
    (void) host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    vm_size_t vmsize = vm_stat.free_count * pagesize;
    return [NSNumber numberWithLong:(vmsize / 1024 / 1024)];
}

+ (NSString *)macAddress
{
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) 
    {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) 
    {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) 
    {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) 
    {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X", 
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    return outstring;
}

#pragma mark - Private Methods

+ (NSString *)getSysInfoByName:(char *)typeSpecifier
{
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    free(answer);
    return results;
}

+ (NSUInteger)getSysInfo:(uint)typeSpecifier
{
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

+ (NSString *)platform
{
	return [UIDevice getSysInfoByName:"hw.machine"];
}

+ (NSString *)model
{
    return [UIDevice getSysInfoByName:"hw.model"];
}

@end