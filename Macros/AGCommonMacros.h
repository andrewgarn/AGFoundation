//
//  AGCommonMacros.h
//  AGFoundation
//
//  Created by Andrew Garn on 22/03/2012.
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
#define CLAMP(n, min, max) ((n < min) ? min : (n > max) ? max : n)

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