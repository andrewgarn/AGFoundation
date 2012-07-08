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

#include <sys/utsname.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <mach/mach.h>

#ifndef kUTTypeMovie
#define kUTTypeMovie @"public.movie"
#endif

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
    static dispatch_once_t token;
	static NSString *deviceModel;
    
	dispatch_once(&token, ^{
        
        /* Get Platform */
        NSString *platform = [self platform];
        
        /* iPhone */
        if ([platform isEqualToString:@"iPhone1,1"])         deviceModel = @"iPhone";
        else if ([platform isEqualToString:@"iPhone1,2"])    deviceModel = @"iPhone 3G";
        else if ([platform hasPrefix:@"iPhone2"])            deviceModel = @"iPhone 3GS";
        else if ([platform isEqualToString:@"iPhone3,1"])    deviceModel = @"iPhone 4 GSM";
        else if ([platform isEqualToString:@"iPhone3,3"])    deviceModel = @"iPhone 4 CDMA";
        else if ([platform hasPrefix:@"iPhone4"])            deviceModel = @"iPhone 4S";
        
        /* iPod Touch */
        else if ([platform hasPrefix:@"iPod1"])              deviceModel = @"iPod 1G";
        else if ([platform hasPrefix:@"iPod2"])              deviceModel = @"iPod 2G";
        else if ([platform hasPrefix:@"iPod3"])              deviceModel = @"iPod 3G";
        else if ([platform hasPrefix:@"iPod4"])              deviceModel = @"iPod 4G";
        
        /* iPad */
        else if ([platform isEqualToString:@"iPad1,1"])      deviceModel = @"iPad WiFi";
        else if ([platform isEqualToString:@"iPad2,1"])      deviceModel = @"iPad 2 WiFi";
        else if ([platform isEqualToString:@"iPad2,2"])      deviceModel = @"iPad 2 GSM";
        else if ([platform isEqualToString:@"iPad2,3"])      deviceModel = @"iPad 2 CDMAV";
        else if ([platform isEqualToString:@"iPad2,4"])      deviceModel = @"iPad 2 CDMAS";
        else if ([platform isEqualToString:@"iPad3,1"])      deviceModel = @"iPad 3 Wi-Fi";
        else if ([platform isEqualToString:@"iPad3,2"])      deviceModel = @"iPad 3 GSM";
        else if ([platform isEqualToString:@"iPad3,3"])      deviceModel = @"iPad 3 CDMA";
        
        /* Simulator */
        else if ([UIDevice isASimulator])
        {
            if ([[UIScreen mainScreen] bounds].size.width < 768)
            {
                if ([UIDevice hasRetinaDisplay])
                    deviceModel = @"iPhone Simulator (Retina)";
                else
                    deviceModel = @"iPhone Simulator";
            }
            else
            {
                if ([UIDevice hasRetinaDisplay])
                    deviceModel = @"iPad Simulator (Retina)";
                else
                    deviceModel = @"iPad Simulator";
            }
        }
        
        /* Unknown */
        else deviceModel = platform;
        
	});
    return deviceModel;
}

+ (NSString *)deviceFamily
{
    static dispatch_once_t token;
	static NSString *deviceFamily;
    
	dispatch_once(&token, ^{
        if ([UIDevice isAniPhone])
             deviceFamily = @"iPhone";
        else if ([UIDevice isAniPodTouch])
            deviceFamily = @"iPod touch";
        else if ([UIDevice isAniPad])
            deviceFamily = @"iPad";
        else if ([UIDevice isASimulator])
            deviceFamily = @"Simulator";
        else
            deviceFamily = [[UIDevice currentDevice] model];
	});
    return deviceFamily;
}

+ (NSString *)deviceCarrier
{
    id networkInfo = nil;
    id cellularProvider = nil;
    NSString *carrierName = nil;
    
    Class telephonyNetworkInfoClass = NSClassFromString(@"CTTelephonyNetworkInfo");
    Class carrierClass = NSClassFromString(@"CTCarrier.h");
    
    if (!telephonyNetworkInfoClass)
        NSLog(@"[UIDevice deviceCarrier] - You must #import <CoreTelephony/CTTelephonyNetworkInfo.h>!");
    
    if (!carrierClass)
        NSLog(@"[UIDevice deviceCarrier] - You must #import <CoreTelephony/CTCarrier.h>!");
    
    if (telephonyNetworkInfoClass && carrierClass)
    {
        networkInfo = [[telephonyNetworkInfoClass alloc] init];
        cellularProvider = [networkInfo performSelector:@selector(subscriberCellularProvider)];
        carrierName = [cellularProvider performSelector:@selector(carrierName)];
    }
    
    return carrierName;
}

#pragma mark - System Info

+ (NSString *)systemName
{
    static dispatch_once_t token;
	static NSString *systemName;
    
	dispatch_once(&token, ^{
        systemName = [[UIDevice currentDevice] systemName];
	});
    return systemName;
}

+ (NSString *)systemVersion
{
    static dispatch_once_t token;
	static NSString *systemVersion;
    
	dispatch_once(&token, ^{
        systemVersion = [[UIDevice currentDevice] systemVersion];
	});
    return systemVersion;
}

#pragma mark -

+ (BOOL)isAniPhone
{
    static dispatch_once_t token;
	static BOOL isAniPhone = NO;
    
	dispatch_once(&token, ^{
        NSRange textRange = [[self platform] rangeOfString:@"iPhone"];
        if(textRange.location != NSNotFound)
            isAniPhone = YES;
    });
	return isAniPhone;
}

+ (BOOL)isAniPodTouch
{
    static dispatch_once_t token;
	static BOOL isAniPodTouch = NO;
    
	dispatch_once(&token, ^{
        NSRange textRange = [[self platform] rangeOfString: @"iPod"];
        if(textRange.location != NSNotFound)
            isAniPodTouch = YES;
    });
	return isAniPodTouch;
}

+ (BOOL)isAniPad
{
    static dispatch_once_t token;
	static BOOL isAniPad = NO;
    
	dispatch_once(&token, ^{
        NSRange textRange = [[self platform] rangeOfString:@"iPad"];
        if(textRange.location != NSNotFound)
            isAniPad = YES;
    });
	return isAniPad;
}

+ (BOOL)isASimulator
{
    static dispatch_once_t token;
	static BOOL isASimulator = NO;
    
	dispatch_once(&token, ^{
        NSRange textRange = [[self platform] rangeOfString:@"i386"];
        NSRange textRange2 = [[self platform] rangeOfString:@"x86_64"];
        if (textRange.location != NSNotFound || textRange2.location != NSNotFound)
            isASimulator = YES;
    });
    return isASimulator;
}

#pragma mark -

+ (BOOL)hasRetinaDisplay
{
    static dispatch_once_t token;
	static BOOL hasRetinaDisplay = NO;
    
	dispatch_once(&token, ^{
        if ([UIScreen instancesRespondToSelector:@selector(scale)])
            if ([[UIScreen mainScreen] scale] == 2.0)
                hasRetinaDisplay = YES;
    });
    return hasRetinaDisplay;
}

+ (BOOL)hasCompass
{
    static dispatch_once_t token;
	static BOOL headingAvailable = NO;
    
	dispatch_once(&token, ^{
        Class class = NSClassFromString(@"CLLocationManager");
        if (class != nil) headingAvailable = (BOOL)[class performSelector:@selector(headingAvailable)];
	});
    return headingAvailable;
}

+ (BOOL)hasGyroscope
{
    static dispatch_once_t token;
	static BOOL isGyroAvailable = NO;
    
	dispatch_once(&token, ^{
        Class class = NSClassFromString(@"CMMotionManager");
        if (class != nil) isGyroAvailable = (BOOL)[[[class alloc] init] performSelector:@selector(isGyroAvailable)];
	});
    return isGyroAvailable;
}

+ (BOOL)hasCamera
{
    static dispatch_once_t token;
	static BOOL hasCamera = NO;
    
	dispatch_once(&token, ^{
        hasCamera = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
	});
    return hasCamera;
}

+ (BOOL)hasFrontCamera
{
    static dispatch_once_t token;
	static BOOL hasFrontCamera = NO;
    
	dispatch_once(&token, ^{
        hasFrontCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
	});
    return hasFrontCamera;
}

+ (BOOL)hasRearCamera
{
    static dispatch_once_t token;
	static BOOL hasRearCamera = NO;
    
	dispatch_once(&token, ^{
        hasRearCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
	});
    return hasRearCamera;
}

+ (BOOL)hasFrontFlash
{
    static dispatch_once_t token;
	static BOOL hasFrontFlash = NO;
    
	dispatch_once(&token, ^{
        hasFrontFlash = [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceFront];
	});
    return hasFrontFlash;
}

+ (BOOL)hasRearFlash
{
    static dispatch_once_t token;
	static BOOL hasRearFlash = NO;
    
	dispatch_once(&token, ^{
        hasRearFlash = [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceRear];
	});
    return hasRearFlash;
}

+ (BOOL)canRecordVideo
{
    static dispatch_once_t token;
	static BOOL canRecordVideo = NO;
    
	dispatch_once(&token, ^{
        NSArray *mediaType = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        if ([mediaType containsObject:(NSString *)kUTTypeMovie])
            canRecordVideo = YES;
	});
    return canRecordVideo;
}

#pragma mark -

+ (BOOL)canSendMail
{
    Class class = NSClassFromString(@"MFMailComposeViewController");
    if (class) return [(id)class canSendMail];
    return NO;
}

+ (BOOL)canSendText
{
    Class class = NSClassFromString(@"MFMessageComposeViewController");
    if (class) return [(id)class canSendText];
    return NO;
}

+ (BOOL)supportsMultitasking
{
    static dispatch_once_t token;
	static BOOL isMultitaskingSupported = NO;
    
	dispatch_once(&token, ^{
        isMultitaskingSupported = [[UIDevice currentDevice] isMultitaskingSupported];
	});
    return isMultitaskingSupported;
}

#pragma mark -

+ (UIUserInterfaceIdiom)userInterfaceIdiom
{
    static dispatch_once_t token;
	static UIUserInterfaceIdiom userInterfaceIdiom;
    
	dispatch_once(&token, ^{
        userInterfaceIdiom = [[UIDevice currentDevice] userInterfaceIdiom];
	});
    return userInterfaceIdiom;
}

+ (BOOL)userInterfaceIdiomIsPhone
{
    static dispatch_once_t token;
	static BOOL userInterfaceIdiomIsPhone = NO;
    
	dispatch_once(&token, ^{
        if ([UIDevice userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            userInterfaceIdiomIsPhone = YES;
	});
    return userInterfaceIdiomIsPhone;
}

+ (BOOL)userInterfaceIdiomIsPad
{
    static dispatch_once_t token;
	static BOOL userInterfaceIdiomIsPad = NO;
    
	dispatch_once(&token, ^{
        if ([UIDevice userInterfaceIdiom] == UIUserInterfaceIdiomPad)
            userInterfaceIdiomIsPad = YES;
	});
    return userInterfaceIdiomIsPad;
}

#pragma mark -

+ (NSString *)uniqueDeviceIdentifier
{
    static dispatch_once_t token;
	static NSString *uniqueDeviceIdentifier;
    
	dispatch_once(&token, ^{
        NSString *macAddress = [UIDevice macAddress];
        NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
        uniqueDeviceIdentifier = [macAddress HMACWithSecret:bundleIdentifier];
	});
    return uniqueDeviceIdentifier;
}

+ (NSString *)uniqueGlobalDeviceIdentifier
{
    static dispatch_once_t token;
	static NSString *uniqueGlobalDeviceIdentifier;
    
	dispatch_once(&token, ^{
        uniqueGlobalDeviceIdentifier = [[UIDevice macAddress] SHA1Hash];
	});
    return uniqueGlobalDeviceIdentifier;
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
    static dispatch_once_t token;
	static BOOL isJailbroken = NO;
    
	dispatch_once(&token, ^{
        NSString *cydiaPath = @"/Applications/Cydia.app";
        NSString *aptPath = @"/private/var/lib/apt/";
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath])
            isJailbroken = YES;
        else if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath])
            isJailbroken = YES;
    });
    return isJailbroken;
}

+ (NSString *)jailbrokenState
{
    static dispatch_once_t token;
	static NSString *jailbrokenState;
    
	dispatch_once(&token, ^{
        
        if ([UIDevice isJailbroken])
            jailbrokenState = @"Jailbroken";
        else
            jailbrokenState = @"Not Jailbroken";
        
    });
    return jailbrokenState;
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
    return [NSNumber numberWithLong:vmsize];
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
    static dispatch_once_t token;
	static NSString *platform;
    
	dispatch_once(&token, ^{
        platform = [UIDevice getSysInfoByName:"hw.machine"];
    });
    return platform;
}

+ (NSString *)model
{
    static dispatch_once_t token;
	static NSString *model;
    
	dispatch_once(&token, ^{
        model = [UIDevice getSysInfoByName:"hw.model"];
    });
    return model;
}

@end