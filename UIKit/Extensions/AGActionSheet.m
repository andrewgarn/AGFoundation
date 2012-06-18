//
//  AGActionSheet.m
//  AGFoundation
//
//  Created by Andrew Garn on 09/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "AGActionSheet.h"

@interface AGActionSheet ()
@property (nonatomic, strong) NSMutableArray *blockArray;
@end

@implementation AGActionSheet
@synthesize blockArray = _blockArray;

#pragma mark -

- (AGActionSheet *)initWithTitle:(NSString *)title
{
    if ((self = [super initWithTitle:title delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil]))
    {
        //
    }
    return self;
}

#pragma mark -

- (NSInteger)addButtonWithTitle:(NSString *)title block:(AGActionSheetBlock)block;
{
    if (block)
        [_blockArray addObject:[block copy]];
    else 
        [_blockArray addObject:[NSNull null]];
    
    [self setDelegate:self];
    return [self addButtonWithTitle:title];
}

- (NSInteger)addDestructiveButtonWithTitle:(NSString *)title block:(AGActionSheetBlock)block;
{
    NSInteger buttonIndex = [self addButtonWithTitle:title block:block];
    [self setDestructiveButtonIndex:buttonIndex];
    
    return buttonIndex;
}

- (NSInteger)addCancelButtonWithTitle:(NSString *)title block:(AGActionSheetBlock)block
{
    NSInteger buttonIndex = [self addButtonWithTitle:title block:nil];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && block)
        [self setCancelButtonIndex:buttonIndex];
    
    return buttonIndex;
}

- (NSInteger)addCancelButtonWithTitle:(NSString *)title
{
    return [self addCancelButtonWithTitle:title block:nil];
}

#pragma mark -

- (NSMutableArray *)blockArray
{
    if (!_blockArray)
    {
        _blockArray = [[NSMutableArray alloc] init];
    }
    return _blockArray;
}

- (void)setBlockArray:(NSMutableArray *)blockArray
{
    _blockArray = blockArray;
}

#pragma mark -

- (void)setDelegate:(id<UIActionSheetDelegate>)delegate
{
    NSAssert(delegate != self, @"Delegate must not be set for blocks to function");
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex 
{
    if (buttonIndex >= 0 && buttonIndex < [_blockArray count]) 
    {
        id object = [_blockArray objectAtIndex:buttonIndex];
        if (![object isEqual:[NSNull null]]) 
        {
            ((void (^)())object)();
        }
    }
}

@end