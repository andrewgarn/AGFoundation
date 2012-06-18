//
//  AGMessageComposeViewController.h
//  AGFoundation
//
//  Created by Andrew Garn on 09/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <MessageUI/MFMessageComposeViewController.h>

@class AGMessageComposeViewController;
typedef void (^AGMessageComposerCompletionBlock)(AGMessageComposeViewController *, MessageComposeResult);

/** `MFMessageComposeViewController` extended to support block completion */
@interface AGMessageComposeViewController : MFMessageComposeViewController 

/**
 Sets the block to be called when the receiver finishes.
 @param completionBlock The block to execute when the receiver finishes.
*/
- (void)setCompletionBlock:(AGMessageComposerCompletionBlock)completionBlock;

@end