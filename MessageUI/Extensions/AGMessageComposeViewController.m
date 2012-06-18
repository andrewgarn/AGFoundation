//
//  AGMessageComposeViewController.m
//  AGFoundation
//
//  Created by Andrew Garn on 09/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "AGMessageComposeViewController.h"

@interface AGMessageComposeViewController () <MFMessageComposeViewControllerDelegate>
@property (nonatomic, copy) AGMessageComposerCompletionBlock didFinishBlock;
@end

@implementation AGMessageComposeViewController
@synthesize didFinishBlock = _didFinishBlock;

#pragma mark -

- (void)setCompletionBlock:(AGMessageComposerCompletionBlock)completionBlock
{
    if (completionBlock)
    {
        [self setDidFinishBlock:completionBlock];
        [self setMessageComposeDelegate:self]; 
    }
    else 
    {
        [self setDidFinishBlock:nil];
        [self setMessageComposeDelegate:nil]; 
    }
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)messageComposeViewController:(AGMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    if (_didFinishBlock) _didFinishBlock(controller, result);
}

@end