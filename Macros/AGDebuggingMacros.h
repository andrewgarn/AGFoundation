//
//  AGDebuggingMacros.h
//  AGFoundation
//
//  Created by Andrew Garn on 22/03/2012.
//  Copyright (c) Andrew Garn. All rights reserved.
//

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