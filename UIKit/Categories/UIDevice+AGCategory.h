//
//  UIDevice+AGCategory.h
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

#import <UIKit/UIKit.h>

/** A collection of category extensions for `UIDevice` */
@interface UIDevice (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Identifying the Device and Operating System
 ---------------------------------------------------------------------------------------
*/

/** Returns the model of the device.
 
 Possible examples of model strings are `iPhone 4 (GSM)` and `iPad 2 WiFi`.
 @return The model name identifying the device.
*/ 
+ (NSString *)deviceModel_AG;

/** Returns the model of the device.
 
 Possible examples of model strings are `iPhone 4` and `iPad 2`.
 @return The generic model name identifying the device.
*/
+ (NSString *)deviceModelGeneric_AG;

/** Returns the family of the device.
 
 Possible examples of family strings are @”iPhone” and @”iPod touch”.
 @return The family name identifying the device.
*/ 
+ (NSString *)deviceFamily_AG;

/** Returns the network carrier in use by the device.
 
 Possible examples of carrier strings are @”O2-UK” and @”AT&T”.
 @return The network carrier in use by the device.
*/ 
+ (NSString *)deviceCarrier_AG;

/** Returns the name of the operating system running on the device.
 
 A possible example of an operating system string is @"iPhone OS".
 @return The name of the operating system running on the device.
*/ 
+ (NSString *)systemName_AG; 

/** Returns the current version of the operating system.
 
 Possible examples of version strings are @”3.2” and @”5.1.1”.
 @return The current version of the operating system.
*/  
+ (NSString *)systemVersion_AG;

/**-------------------------------------------------------------------------------------
 @name Querying the Device Family
 ---------------------------------------------------------------------------------------
*/

/** Returns a boolean value that indicates whether the device is an iPhone.
 @return YES if the device is an iPhone, otherwise NO.
*/ 
+ (BOOL)isAniPhone_AG;

/** Returns a boolean value that indicates whether the device is an iPod touch.
 @return YES if the device is an iPod touch, otherwise NO.
*/ 
+ (BOOL)isAniPodTouch_AG;

/** Returns a boolean value that indicates whether the device is an iPad.
 @return YES if the device is an iPad, otherwise NO.
*/ 
+ (BOOL)isAniPad_AG;

/** Returns a boolean value that indicates whether the device is an iOS Simulator.
 @return `YES` if the device is an iOS Simulator, otherwise `NO`.
*/ 
+ (BOOL)isASimulator_AG;

/**-------------------------------------------------------------------------------------
 @name Determining the Available Hardware Features
 ---------------------------------------------------------------------------------------
*/

/** Returns a boolean value that indicates whether the device has a retina display.
 @return `YES` if the device has a retina display, otherwise `NO`.
*/ 
+ (BOOL)hasRetinaDisplay_AG;

/** Returns a boolean value that indicates whether the device has a compass.
 
 This method requires the CoreLocation framework, if the framework is not found, the method returns `NO`.
 @return `YES` if the device has a compass, otherwise `NO`.
*/
+ (BOOL)hasCompass_AG;

/** Returns a boolean value that indicates whether the device has a gyroscrope.
 
 This method requires the CoreMotion framework, if the framework is not found, the method returns `NO`.
 @return `YES` if the device has a gyroscrope, otherwise `NO`.
*/
+ (BOOL)hasGyroscope_AG;

/** Returns a boolean value that indicates whether the device has a camera.
 @return `YES` if the device has a camera, otherwise `NO`.
*/
+ (BOOL)hasCamera_AG;

/** Returns a boolean value that indicates whether the device has a front camera.
 @return `YES` if the device has a front camera, otherwise `NO`.
*/ 
+ (BOOL)hasFrontCamera_AG;

/** Returns a boolean value that indicates whether the device has a back camera.
 @return `YES` if the device has a back camera, otherwise `NO`.
*/ 
+ (BOOL)hasRearCamera_AG;

/** Returns a boolean value that indicates whether the device has a front flash.
 @return `YES` if the device has a front flash, otherwise `NO`.
*/
+ (BOOL)hasFrontFlash_AG;

/** Returns a boolean value that indicates whether the device has a back flash.
 @return `YES` if the device has a back flash, otherwise `NO`.
*/
+ (BOOL)hasRearFlash_AG;

/**-------------------------------------------------------------------------------------
 @name Determining the Available Software Features
 ---------------------------------------------------------------------------------------
*/

/** Returns a boolean value that indicates whether the device is able to send email.
 @return `YES` if the device is configured for sending email, otherwise `NO`. 
*/ 
+ (BOOL)canSendMail_AG;

/** Returns a boolean value that indicates whether the device is able to send text messages.
 @return `YES` if the device can send text messages, otherwise `NO`. 
*/ 
+ (BOOL)canSendText_AG;

/** Returns a boolean value that indicates whether the device is able to send tweets.
 @return `YES` if the device can send tweets, otherwise `NO`.
*/
+ (BOOL)canSendTweet_AG;

/** Returns a boolean value that indicates whether the device is able to make purchases.
 @return `YES` if the device can make purchases, otherwise `NO`.
*/
+ (BOOL)canMakePayments_AG;

/** Returns a boolean value that indicates whether multitasking is supported on the current device.
 @return `YES` if the device supports multitasking, otherwise `NO`.
*/ 
+ (BOOL)supportsMultitasking_AG;

/**-------------------------------------------------------------------------------------
 @name Determining the Device User Interface
 ---------------------------------------------------------------------------------------
*/

/** Returns the style of interface in use on the device.
 @return The style of interface in use on the device.
*/ 
+ (UIUserInterfaceIdiom)userInterfaceIdiom_AG;

/** Returns a boolean value that indicates whether the interface in use is designed for the iPhone and iPod touch.
 @return `YES` if the interface in use is designed for the iPhone and iPod touch, otherwise `NO`.
*/ 
+ (BOOL)userInterfaceIdiomIsPhone_AG;

/** Returns a boolean value that indicates whether the interface in use is designed for the iPad.
 @return `YES` if the interface in use is designed for the iPad, otherwise `NO`.
*/ 
+ (BOOL)userInterfaceIdiomIsPad_AG;

/**-------------------------------------------------------------------------------------
 @name Generating a Unique Device Identifier
 ---------------------------------------------------------------------------------------
 */

/** Returns an alphanumeric string unique to the current device and application.
 @return An alphanumeric string unique to the current device and application.
*/ 
+ (NSString *)uniqueDeviceIdentifier_AG;

/** Returns an alphanumeric string unique to the current device.
 @return An alphanumeric string unique to the current device.
*/  
+ (NSString *)uniqueGlobalDeviceIdentifier_AG;

/**-------------------------------------------------------------------------------------
 @name Determining Device State
 ---------------------------------------------------------------------------------------
*/

/** Returns the battery charge level for the device.
 
 Battery level ranges from 0.0 (fully discharged) to 1.0 (100% charged).
 @return The battery charge level for the device.
*/ 
+ (CGFloat)batteryLevel_AG;

/** Returns a string representation of the current battery state. 
 @return A string representation of the current battery state.
*/ 
+ (NSString *)batteryState_AG;

/** Returns a boolean value that indicates whether the device is jailbroken.
 @return YES if the device is jailbroken, otherwise NO.
*/  
+ (BOOL)isJailbroken_AG;

/** Returns a string representation of the current jailbroken state. 
 @return A string representation of the current jailbroken state.
*/  
+ (NSString *)jailbrokenState_AG;

/** Returns the current cpu frequency of the device.
 @return The current cpu frequency of the device.
*/ 
+ (NSUInteger)cpuFrequency_AG;

/** Returns the current bus frequency of the device.
 @return The current bus frequency of the device.
*/ 
+ (NSUInteger)busFrequency_AG;

/** Returns the total memory of the device.
 @return The total memory of the device.
*/ 
+ (NSUInteger)totalMemory_AG;

/** Returns the non kernel memory of the device.
 @return The non kernel memory of the device.
*/ 
+ (NSUInteger)userMemory_AG;

/** Returns the max socket buffer size of the device.
 @return The max socket buffer size of the device.
*/ 
+ (NSUInteger)maxSocketBufferSize_AG;

/** Returns the number of device number of processors.
 @return The number of device number of processors.
*/ 
+ (NSUInteger)processorCount_AG;

/** Returns the total amount of disk space of the device.
 @return The total amount of disk space of the device.
*/ 
+ (NSNumber *)totalDiskSpace_AG;

/** Returns the free amount of disk space of the device.
 @return The free amount of disk space of the device.
*/ 
+ (NSNumber *)freeDiskSpace_AG;

/** Returns the currently available free memory of the device.
 @return The currently available free memory of the device in bytes.
*/
+ (NSNumber *)freeMemory_AG;

@end