//
//  UIAlertView+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 23/04/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UIAlertView+AGCategory.h"

@implementation UIAlertView (AGCategory)

+ (void)showWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] init];
    [alertView setTitle:title];
    [alertView setMessage:message];
    [alertView addButtonWithTitle:@"Okay"];
    [alertView show];
}

+ (void)showWithMessage:(NSString *)message
{
    NSString *displayName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    [UIAlertView showWithTitle:displayName message:message];
}
 
@end