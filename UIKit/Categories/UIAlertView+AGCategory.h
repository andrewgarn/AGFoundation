//
//  UIAlertView+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 23/04/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A collection of category extensions for `UIAlertView` */
@interface UIAlertView (AGCategory)

/** Convenience method for displaying an alert view.
 @param title The string that appears in the receiver’s title bar.
 @param message Descriptive text that provides more details than the title.
*/ 
+ (void)showWithTitle:(NSString *)title message:(NSString *)message;

/** Convenience method for displaying an alert view.
 @param message Descriptive text that provides more details than the title.
*/ 
+ (void)showWithMessage:(NSString *)message;

@end