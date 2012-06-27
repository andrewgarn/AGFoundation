//
//  AGCommonMacros.h
//  AGFoundation
//
//  Created by Andrew Garn on 22/03/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

/**
 *	Application delegate macro definitions.
*/
#define UIAppDelegate (AppDelegate *)[[UIApplication sharedApplication] delegate]

/**
 *	Info plist macro definitions.
*/
#define APP_NAME [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
#define APP_VERSION [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]
#define APP_SHORT_VERSION [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersion"]

/**
 *	Mathematical calculation macro definitions.
*/
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

/**
 *	UIColor and related macro definitions.
*/
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define SAFECOLOR(color) MIN(255, MAX(0, color))

/**
 *	UIAlert macro definitions.
*/
#define DEFAULT_ALERT_TITLE [NSString stringWithFormat:@"%@", APP_NAME]
#define DEFAULT_ALERT_CANCEL_BUTTON_TITLE @"OK"
#define ALERT(message) {UIAlertView *alert = [[UIAlertView alloc] initWithTitle:DEFAULT_ALERT_TITLE message:message delegate:self cancelButtonTitle:DEFAULT_ALERT_CANCEL_BUTTON_TITLE otherButtonTitles:nil];[alert show];}
#define ALERT_TITLE(title, message) {UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:DEFAULT_ALERT_CANCEL_BUTTON_TITLE otherButtonTitles:nil];[alert show];}