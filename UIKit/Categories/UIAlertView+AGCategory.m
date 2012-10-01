//
//  UIAlertView+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 23/04/2012.
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

#import "UIAlertView+AGCategory.h"

@implementation UIAlertView (AGCategory)

+ (void)showWithTitle_AG:(NSString *)title message:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] init];
    [alertView setTitle:title];
    [alertView setMessage:message];
    [alertView addButtonWithTitle:NSLocalizedString(@"Okay", @"")];
    [alertView show];
}

+ (void)showWithMessage_AG:(NSString *)message
{
    static dispatch_once_t onceToken;
	static NSString *displayName;
    
	dispatch_once(&onceToken, ^{
        displayName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
	});
    
    [UIAlertView showWithTitle_AG:displayName message:message];
}

+ (void)showWithError_AG:(NSError *)error
{
    UIAlertView *alertView = [[UIAlertView alloc] init];
    [alertView setTitle:[error localizedDescription]];
    [alertView setMessage:[error localizedRecoverySuggestion]];
    [alertView addButtonWithTitle:NSLocalizedString(@"Okay", @"")];
    [alertView show];
}
 
@end