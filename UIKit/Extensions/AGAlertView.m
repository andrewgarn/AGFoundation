//
//  AGAlertView.m
//  AGFoundation
//
//  Created by Andrew Garn on 23/04/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "AGAlertView.h"

@interface AGAlertView () <UIAlertViewDelegate>
@property (nonatomic, strong) NSMutableArray *blockArray;
@end

@implementation AGAlertView
@synthesize blockArray = _blockArray;

#pragma mark -

- (AGAlertView *)initWithTitle:(NSString *)title message:(NSString *)message
{
    if ((self = [super init]))
    {
        [self setTitle:title];
        [self setMessage:message];
    }
    return self;
}

- (void)show
{
    [self setDelegate:self];
    [super show];
}

#pragma mark -

- (NSInteger)addButtonWithTitle:(NSString *)title block:(AGAlertViewBlock)block
{
    if (block)
        [self.blockArray addObject:[block copy]];
    else 
        [self.blockArray addObject:[NSNull null]];
        
    return [self addButtonWithTitle:title];
}

- (NSInteger)addCancelButtonWithTitle:(NSString *)title block:(AGAlertViewBlock)block
{
    NSInteger buttonIndex = [self addButtonWithTitle:title block:block];
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

- (void)setDelegate:(id)delegate
{
    NSAssert(delegate != self, @"Delegate must not be set for blocks to function");
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
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