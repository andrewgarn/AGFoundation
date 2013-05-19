//
//  AGActionSheet.m
//  AGFoundation
//
//  Created by Andrew Garn on 09/06/2012.
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

#import "AGActionSheet.h"

@interface AGActionSheet () <UIActionSheetDelegate>
@property (nonatomic, strong) NSMutableArray *blockArray;
@end

#pragma mark -

@implementation AGActionSheet

#pragma mark - Creating Action Sheets

- (AGActionSheet *)init
{
    self = [super init];
    if (self) {
        _blockArray = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - Configuring Buttons

- (NSInteger)addButtonWithTitle:(NSString *)title block:(AGActionSheetBlock)block
{
    if (block) {
        [self.blockArray addObject:[block copy]];
    } else {
        [self.blockArray addObject:[NSNull null]];
    }
    
    return [self addButtonWithTitle:title];
}

- (NSInteger)addDestructiveButtonWithTitle:(NSString *)title block:(AGActionSheetBlock)block
{
    NSInteger buttonIndex = [self addButtonWithTitle:title block:block];
    [self setDestructiveButtonIndex:buttonIndex];
    
    return buttonIndex;
}

- (NSInteger)addCancelButtonWithTitle:(NSString *)title block:(AGActionSheetBlock)block
{
    NSInteger buttonIndex = [self addButtonWithTitle:title block:nil];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self setCancelButtonIndex:buttonIndex];
    }
    
    return buttonIndex;
}

- (NSInteger)addCancelButtonWithTitle:(NSString *)title
{
    return [self addCancelButtonWithTitle:title block:nil];
}

#pragma mark - Presenting the Action Sheet

- (void)showFromTabBar:(UITabBar *)view
{
    [self setDelegate:self];
    [super showFromTabBar:view];
}

- (void)showFromToolbar:(UIToolbar *)view
{
    [self setDelegate:self];
    [super showFromToolbar:view];
}

- (void)showInView:(UIView *)view
{
    [self setDelegate:self];
    [super showInView:view];
}

- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
    [self setDelegate:self];
    [super showFromBarButtonItem:item animated:animated];
}

- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated
{
    [self setDelegate:self];
    [super showFromRect:rect inView:view animated:animated];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex >= 0 && buttonIndex < (NSInteger)[self.blockArray count]) {
        AGActionSheetBlock block = [self.blockArray objectAtIndex:buttonIndex];
        if (![block isEqual:[NSNull null]]) block();
    }
}

@end