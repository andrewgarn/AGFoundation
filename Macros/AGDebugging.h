//
//  AGDebugging.h
//  AGFoundation
//
//  Created by Andrew Garn on 19/04/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "FlurryAnalytics.h"
#import "UIDevice+AGCategory.h"

/*
    Uncaught exception handler
*/ 
void uncaughtExceptionHandler(NSException *exception)
{
    // Firstly log the error to the console.
    ALog(@"ERROR: %@", [exception description]);
    
    // Decide on error name
    NSString *errorName = @"Uncaught Exception";
    
    // Correct error name for DEBUG and ADHOC
#ifdef DEBUG
    errorName = @"Uncaught Exception [DEBUG]";
#else
#ifdef ADHOC
    errorName = @"Uncaught Exception [ADHOC]";
#endif
#endif
    
    @try 
    {
        NSMutableString *backtrace = [NSMutableString stringWithUTF8String:""];
        NSArray *backtraceArray = [exception callStackSymbols];

        for (id entry in backtraceArray) 
        {
            NSRange testRange = [entry rangeOfString:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]];
            if (testRange.length)
            {
                NSRange startRange = [entry rangeOfString:@"["];
                NSRange endRange = [entry rangeOfString:@"]"];
                NSRange finalRange = NSMakeRange((startRange.location), ((endRange.location-startRange.location)+1));
                if (finalRange.location != NSNotFound)
                {
                    NSString *stringToAppend = [NSString stringWithFormat:@" %@", [entry substringWithRange:finalRange]];
                    [backtrace appendString:stringToAppend];
                }
            }
        }
        
        NSString *deviceModel = [UIDevice deviceModel];
        NSString *version = [[UIDevice currentDevice] systemVersion];
        if ([backtrace length] == 0) backtrace = [NSMutableString stringWithFormat:@"No backtrace found"];
        NSString *message = [NSString stringWithFormat:@"Device: %@. OS: %@. Backtrace:%@", deviceModel, version, backtrace];
        [FlurryAnalytics logError:errorName message:message exception:exception];
    }
    @catch (NSException *newException) 
    {
        NSString *deviceModel = [UIDevice deviceModel];
        NSString *version = [[UIDevice currentDevice] systemVersion];
        NSString *message = [NSString stringWithFormat:@"Device: %@. OS: %@. [Backtrace Failed]", deviceModel, version];
        [FlurryAnalytics logError:errorName message:message exception:exception];
    }
}

/*
    SignalHandler
*/ 
void SignalHandler(int sig)
{
    // Save application data here
    ALog(@"%i", sig);
}