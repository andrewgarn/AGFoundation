//
//  AGImagePickerController.m
//  AGFoundation
//
//  Created by Andrew Garn on 11/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "AGImagePickerController.h"

@interface AGImagePickerController ()
@property (nonatomic, copy) AGImagePickerControllerCompletionBlock didFinishBlock;
@end

@implementation AGImagePickerController
@synthesize didFinishBlock = _didFinishBlock;

#pragma mark -

- (void)setCompletionBlock:(AGImagePickerControllerCompletionBlock)completionBlock
{
    if (completionBlock)
    {
        [self setDidFinishBlock:completionBlock];
        [self setDelegate:self];
    }
    else 
    {
        [self setDidFinishBlock:nil];
        [self setDelegate:nil];
    }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(AGImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (_didFinishBlock) _didFinishBlock(picker, info, NO);
}

- (void)imagePickerControllerDidCancel:(AGImagePickerController *)picker
{
    if (_didFinishBlock) _didFinishBlock(picker, nil, YES);
}

@end