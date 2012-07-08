//
//  AGExceptionHandling.h
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