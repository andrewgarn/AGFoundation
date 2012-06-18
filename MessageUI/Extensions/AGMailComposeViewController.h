//
//  AGMailComposeViewController.h
//  AGFoundation
//
//  Created by Andrew Garn on 09/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <MessageUI/MFMailComposeViewController.h>

@class AGMailComposeViewController;
typedef void (^AGMailComposeCompletionBlock)(AGMailComposeViewController *, MFMailComposeResult, NSError *);

/** `MFMailComposeViewController` extended to support block completion */
@interface AGMailComposeViewController : MFMailComposeViewController

/**
 Sets the block to be called when the receiver finishes.
 @param completionBlock The block to execute when the receiver finishes.
*/
- (void)setCompletionBlock:(AGMailComposeCompletionBlock)completionBlock;

@end