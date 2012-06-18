//
//  AGMailComposeViewController.m
//  AGFoundation
//
//  Created by Andrew Garn on 09/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "AGMailComposeViewController.h"

@interface AGMailComposeViewController () <MFMailComposeViewControllerDelegate>
@property (nonatomic, copy) AGMailComposeCompletionBlock didFinishBlock;
@end

@implementation AGMailComposeViewController
@synthesize didFinishBlock = _didFinishBlock;

#pragma mark -

- (void)setCompletionBlock:(AGMailComposeCompletionBlock)completionBlock
{    
    if (completionBlock)
    {
        [self setDidFinishBlock:completionBlock];
        [self setMailComposeDelegate:self];
    }
    else 
    {
        [self setDidFinishBlock:nil];
        [self setMailComposeDelegate:nil];
    }
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(AGMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if (_didFinishBlock) _didFinishBlock(controller, result, error);
}

@end