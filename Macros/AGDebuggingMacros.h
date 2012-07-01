//
//  AGDebuggingMacros.h
//  AGFoundation
//
//  Created by Andrew Garn on 22/03/2012.
//  Copyright (c) Andrew Garn. All rights reserved.
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
	TestFlight is a service that facilitates adhoc distribution to clients and collection of usage and crash data.
	This macro enables the TestFlightSDK to receive NSLog, DLog and ALog's from your application when TESTFLIGHT is set.
	Reference: https://testflightapp.com/sdk/doc
*/
#ifdef TESTFLIGHT
	#define NSLog TFLog	
#endif

/**
 *  DLog is an advanced replacement for NSLog that will output debug text only if DEBUG or TESTFLIGHT is set.
 *	Reference: http://stackoverflow.com/questions/969130/nslog-tips-and-tricks
 *  Example output: -[ViewController viewDidLoad:] [Line 112] Hello world
*/ 
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d]: " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#ifdef TESTFLIGHT
#   define DLog(fmt, ...) NSLog((@"%s [Line %d]: " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif
#endif

/**
 *  ALog is an advanced replacement for NSLog that will always output debug text.
 *	Reference: http://stackoverflow.com/questions/969130/nslog-tips-and-tricks
 *  Example output: -[ViewController viewDidLoad:] [Line 112] Hello world 
*/ 
#define ALog(fmt, ...) NSLog((@"%s [Line %d]: " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

/**
 *  ULog is a replacement for NSLog that will display a UIAlert with debug text if DEBUG or TESTFLIGHT is set.
 *	Reference: http://stackoverflow.com/questions/969130/nslog-tips-and-tricks
*/ 
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d]: ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]; [alert show]; [alert release]; }
#else
#ifdef TESTFLIGHT
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d]: ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]; [alert show]; [alert release]; }
#else
#   define ULog(...)
#endif
#endif